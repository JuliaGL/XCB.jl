"""
Translate mouse or modifier state into the corresponding XCB value.
"""
function state_xcb(event::Event)
    event.type == POINTER_MOVED && return state_xcb(event.pointer_state)
    in(event.type, KEY_EVENT) && return state_xcb(event.key_event.modifiers)
    in(event.type, BUTTON_EVENT) && return state_xcb(event.mouse_event.state)
    0
end

state_xcb(s::MouseButton) = xcb_button(s)
state_xcb(s::ModifierState) = xcb_mod_mask_t(UInt8(s))
state_xcb(s::PointerState) = (UInt16(s.state) << 8) + UInt8(s.modifiers)

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
    event.type in (WINDOW_MOVED, WINDOW_RESIZED) && return XCB_CONFIGURE_NOTIFY
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
    event.type in (WINDOW_MOVED, WINDOW_RESIZED) && return xcb_configure_notify_event_t
    event.type == WINDOW_EXPOSED && return xcb_expose_event_t
    event.type in WINDOW_GAINED_FOCUS | WINDOW_LOST_FOCUS && return xcb_focus_in_event_t
    event.type == WINDOW_CLOSED && return xcb_client_message_event_t
    error("No event type corresponding to $(event.type)")
end

function xcb_button_index_t(button::MouseButton)
  button == BUTTON_LEFT && return XCB_BUTTON_INDEX_1
  button == BUTTON_MIDDLE && return XCB_BUTTON_INDEX_2
  button == BUTTON_RIGHT && return XCB_BUTTON_INDEX_3
  button == BUTTON_SCROLL_UP && return XCB_BUTTON_INDEX_4
  button == BUTTON_SCROLL_DOWN && return XCB_BUTTON_INDEX_5
end

function xcb_button(button::MouseButton)::xcb_button_t
    button == BUTTON_NONE && return 0
    button == BUTTON_LEFT && return 1
    button == BUTTON_MIDDLE && return 2
    button == BUTTON_RIGHT && return 3
    button == BUTTON_SCROLL_UP && return 4
    button == BUTTON_SCROLL_DOWN && return 5
    error("Unknown button $button")
end

function detail_xcb(wm::XWindowManager, event::Event)
    in(event.type, BUTTON_EVENT) && return xcb_button(event.mouse_event.button)
    in(event.type, KEY_EVENT) && return PhysicalKey(wm.keymap, event.key_event.key_name).code
    event.type == POINTER_MOVED && return UInt8(XCB_MOTION_NORMAL)
    event.type == POINTER_ENTERED && return XCB_ENTER_NOTIFY
    event.type == POINTER_EXITED && return XCB_LEAVE_NOTIFY
    0
end

function event_xcb(wm::XWindowManager, event::Event)
    (; window) = event
    T = event_type_xcb(event)
    location = round.(Int16, window.extent .* event.location)
    response_type = response_type_xcb(event)
    T === xcb_configure_notify_event_t && return T(response_type_xcb(e), 0, 0, window.id, window.id, 0, location..., window.extent..., 0, 0, 0)
    T === xcb_expose_event_t && return T(response_type, 0, 0, window.id, location..., window.extent..., 0, (0, 0))
    T === xcb_configure_notify_event_t && return T(response_type, 0, 0, window.id, window.id, 0, location..., window.extent..., 0, 0, 0)
    T === xcb_focus_in_event_t && return T(response_type, detail_xcb(wm, event), 0, window.id, 0, (0, 0, 0))
    event.type == WINDOW_CLOSED && return T(response_type, 32, 0, window.id, 0x00000183, xcb_client_message_data_t(serialize_delete_request_data(get_atom!(window, :WM_DELETE_WINDOW))))
    T(response_type, detail_xcb(wm, event), 0, 0, window.screen.root, window.id, 0, 0, 0, location..., state_xcb(event), true, false)
end

function send_event(window::XCBWindow, event)
    ref = Ref(event)
    GC.@preserve ref begin
        event_ptr = Ptr{Cchar}(Base.unsafe_convert(Ptr{typeof(event)}, ref))
        @flush @check :error xcb_send_event(window.conn, false, window.id, 0, event_ptr)
    end
end

hex(x) = "0x$(string(x, base=16))"

function send_event(wm::XWindowManager, window::XCBWindow, event_type::EventType, data = nothing; location = (0.0, 0.0), time = time())
    send_event(wm, Event(event_type, data, location, time, window))
end

function send_event(wm::XWindowManager, window::XCBWindow, event_type::EventType, position, extent, data = nothing; location = (0.0, 0.0), time = time())
    send_event(wm, Event(event_type, data, location, time, window), position, extent)
end

send_event(wm::XWindowManager, window::XCBWindow) = (event_type, data = nothing; location = (0.0, 0.0), time = time()) -> send_event(wm, window, event_type, window.position, window.extent, data; location, time)

struct WindowRef <: AbstractWindow
    number::Int64
end

function save_history(wm::XWindowManager, queue::EventQueue{XWindowManager,XCBWindow})
    events = Event{WindowRef}[]
    windows = XCBWindow[]
    previous_time = 0.0
    for event in queue.history
        i = findfirst(==(event.window), windows)
        isnothing(i) && push!(windows, event.window)
        winref = WindowRef(something(i, lastindex(windows)))
        Δt = previous_time == 0 ? 0.0 : event.time - previous_time
        previous_time = event.time
        push!(events, Event(event.type, event.data, event.location, Δt, winref))
    end
    events
end

# FIXME: Events will be triggered multiple times if an event triggers another. How should we tackle that?
# We might want to have a way to block all client-generated inputs that are not sent by `replay_history`.
# `replay_history` could set a global to disable event sending, while whitelisting itself so that events
# sent by it are still allowed.
function replay_history(wm::XWindowManager, events::AbstractVector{<:Event};
                        time_factor = 1.0, # lower is faster
                        stop = nothing)
    windows = Dict{WindowRef,XCBWindow}()
    positions = Dict{XCBWindow, Tuple{Int,Int}}()
    extents = Dict{XCBWindow, Tuple{Int,Int}}()
    all_windows = xcb_window_t[]
    replay_time = time()
    for event in events
        isa(event.window, WindowRef) || throw(ArgumentError("Events must contain `WindowRef` windows; you can get some with `save_history(::AbstractWindowManager, ::EventQueue)`"))
        stop !== nothing && stop() && return
        window = get!(windows, event.window) do
            # Assume that window IDs will be ordered chronologically.
            union!(all_windows, keys(wm.windows))
            @assert issorted(all_windows) "Window IDs do not appear to be sorted chronologically"
            i = event.window.number
            wm.windows[all_windows[i]]
        end
        Δt = event.time * time_factor
        wait_for(Δt)
        event = Event(event.type, event.data, event.location, replay_time + Δt, window)
        position = get!(positions, window, window.position)
        extent = get!(extents, window, window.extent)
        send_event(wm, event, position, extent)
        if event.type === WINDOW_MOVED
            positions[window] = position .+ event.movement
        elseif event.type === WINDOW_RESIZED
            positions[window] = position .+ event.movement
            extents[window] = extent .+ event.resize
        end
    end
end

send_event(wm::XWindowManager, event::Event) = send_event(event.window, event_xcb(wm, event))
function send_event(wm::XWindowManager, event::Event, position, extent)
    (; type, window) = event
    type === WINDOW_RESIZED && return resize_window(window, position .+ event.movement, extent .+ event.resize)
    type === WINDOW_MOVED && return move_window_to(window, position .+ event.movement)
    send_event(wm, event)
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
