"""
Translate mouse or modifier state into the corresponding XCB value.
"""
function state_xcb(event::Event)
    event.type in KEY_EVENT && return state_xcb(event.key_event.modifiers)
    event.type in BUTTON_EVENT && return state_xcb(event.mouse_event.state)
    0
end

state_xcb(s::MouseButton) = UInt(s)
state_xcb(s::ModifierState) = xcb_mod_mask_t(UInt8(s))

"""
Translate an action into its corresponding XCB value.
"""
function response_type_xcb(event::Event)
    event.type == KEY_PRESSED && return XCB_KEY_PRESS
    event.type == KEY_RELEASED && return XCB_KEY_RELEASE
    event.type == BUTTON_PRESSED && return XCB_BUTTON_PRESS
    event.type == BUTTON_RELEASED && return XCB_BUTTON_RELEASE
    event.type == POINTER_ENTERED && return XCB_ENTER_NOTIFY
    event.type == POINTER_MOVED && return XCB_MOTION_NOTIFY
    event.type == POINTER_EXITED && return XCB_LEAVE_NOTIFY
    event.type == WINDOW_RESIZED && return XCB_CONFIGURE_NOTIFY
    event.type == WINDOW_EXPOSED && return XCB_EXPOSE
    event.type == WINDOW_GAINED_FOCUS && return XCB_FOCUS_IN
    event.type == WINDOW_LOST_FOCUS && return XCB_FOCUS_OUT
    event.type == WINDOW_CLOSED && return XCB_CLIENT_MESSAGE
    error("No response type corresponding to $(event.type)")
end

function event_type_xcb(event::Event)
    event.type in KEY_EVENT && return xcb_key_press_event_t
    event.type in BUTTON_EVENT && return xcb_button_press_event_t
    event.type == POINTER_MOVED && return xcb_motion_notify_event_t
    event.type in POINTER_EVENT && return xcb_enter_notify_event_t
    event.type == WINDOW_RESIZED && return xcb_configure_notify_event_t
    event.type == WINDOW_EXPOSED && return xcb_expose_event_t
    event.type in WINDOW_GAINED_FOCUS | WINDOW_LOST_FOCUS && return xcb_focus_in_event_t
    event.type == WINDOW_CLOSED && return xcb_client_message_event_t
    error("No event type corresponding to $(event.type)")
end

function button_xcb(button::MouseButton)
  button == BUTTON_LEFT && return XCB_BUTTON_INDEX_1
  button == BUTTON_MIDDLE && return XCB_BUTTON_INDEX_2
  button == BUTTON_RIGHT && return XCB_BUTTON_INDEX_3
  button == BUTTON_SCROLL_UP && return XCB_BUTTON_INDEX_4
  button == BUTTON_SCROLL_DOWN && return XCB_BUTTON_INDEX_5
end

function detail_xcb(wm::XWindowManager, event::Event)
    event.type in BUTTON_EVENT && return xcb_button_t(iszero(event.mouse_event.button) ? 0 : log2(Int(event.mouse_event.button)))
    event.type in KEY_EVENT && return PhysicalKey(wm.keymap, event.key_event.key_name).code
    event.type == POINTER_MOVED && return UInt8(XCB_MOTION_NORMAL)
    event.type == POINTER_ENTERED && return XCB_ENTER_NOTIFY
    event.type == POINTER_EXITED && return XCB_LEAVE_NOTIFY
    0
end

function event_xcb(wm::XWindowManager, e::Event)
    T = event_type_xcb(e)
    wx, wy = extent(e.win)
    x, y = (wx, wy) .* e.location
    x, y = round(Int16, x), round(Int16, y)
    T === xcb_expose_event_t && return T(response_type_xcb(e), 0, 0, e.win.id, x, y, wx, wy, 0, (0, 0))
    T === xcb_configure_notify_event_t && return T(response_type_xcb(e), 0, 0, e.win.id, e.win.id, 0, x, y, wx, wy, 0, 0, 0)
    T === xcb_focus_in_event_t && return T(response_type_xcb(e), detail_xcb(wm, e), 0, e.win.id, 0, (0, 0, 0))
    e.type == WINDOW_CLOSED && return T(response_type_xcb(e), 32, 0, e.win.id, 0x00000183, xcb_client_message_data_t(serialize_delete_request_data(e.win.delete_request)))
    T(response_type_xcb(e), detail_xcb(wm, e), 0, 0, e.win.parent_id, e.win.id, 0, 0, 0, x, y, state_xcb(e), true, false)
end

send_event(wm::XWindowManager, e::Event) = send_event(e.win, event_xcb(wm, e))

function send_event(win::XCBWindow, event)
    ref = Ref(event)
    GC.@preserve ref begin
        event_ptr = Ptr{Cchar}(Base.unsafe_convert(Ptr{typeof(event)}, ref))
        @flush @check :error xcb_send_event(win.conn, false, win.id, 0, event_ptr)
    end
end

hex(x) = "0x$(string(x, base=16))"

function send_event(wm::XWindowManager, win::XCBWindow, event_type::EventType, data = nothing; location = (0.0, 0.0))
    send_event(wm, Event(event_type, data, location, floor(time()), win))
end

send_event(wm::XWindowManager, win::XCBWindow) = (event_type, data = nothing; location = (0.0, 0.0)) -> send_event(wm, win, event_type, data; location)

struct WindowRef <: AbstractWindow
    number::Int64
end

function save_history(wm::XWindowManager, queue::EventQueue{XWindowManager,XCBWindow})
    events = Event{WindowRef}[]
    windows = XCBWindow[]
    for event in queue.history
        i = findfirst(==(event.win), windows)
        isnothing(i) && push!(windows, event.win)
        winref = WindowRef(something(i, lastindex(windows)))
        push!(events, Event(event.type, event.data, event.location, event.time, winref))
    end
    events
end

# FIXME: Events will be triggered multiple times if an event triggers another. How should we tackle that?
function replay_history(wm::XWindowManager, events::AbstractVector{Event{WindowRef}})
    windows = Dict{WindowRef,XCBWindow}()
    all_windows = xcb_window_t[]
    replay_time = nothing
    for event in events
        win = get!(windows, event.win) do
            # Assume that window IDs will be ordered chronologically.
            union!(all_windows, keys(wm.windows))
            @assert issorted(all_windows) "Window IDs do not appear to be sorted chronologically"
            i = event.win.number
            wm.windows[all_windows[i]]
        end
        wait_for(event.time - something(replay_time, event.time))
        replay_time = event.time
        event = Event(event.type, event.data, event.location, time(), win)
        send_event(wm, event)
    end
end

function wait_for(Δt)
    start = time()

    # Sleep if we need to wait for a while, to avoid holding onto CPU resources.
    sleep_time = max(Δt - 0.002, 0)
    if sleep_time > 0
        sleep(sleep_time)
    end

    # Busy wait.
    while time() < start + Δt
        yield()
    end
end
