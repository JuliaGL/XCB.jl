"""
Translate mouse or modifier state into the corresponding XCB value.
"""
function state_xcb(event::Event)
    is_key_event(event) && return state_xcb(event.key_event.modifiers)
    is_button_event(event) && return state_xcb(event.mouse_event.state)
    0
end

state_xcb(s::MouseButton) = UInt(s)
state_xcb(s::KeyModifierState) = sum(Int[XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .* Int[s.shift, s.ctrl, s.alt, s.super])

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
    error("No response type corresponding to $(event.type)")
end

function event_type_xcb(event::Event)
    is_key_event(event) && return xcb_key_press_event_t
    is_button_event(event) && return xcb_button_press_event_t
    event.type == POINTER_MOVED && return xcb_motion_notify_event_t
    is_pointer_event(event) && return xcb_enter_notify_event_t
    event.type == WINDOW_RESIZED && return xcb_configure_notify_event_t
    event.type == WINDOW_EXPOSED && return xcb_expose_event_t
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
    is_button_event(event) && return xcb_button_t(iszero(event.mouse_event.button) ? 0 : log2(Int(event.mouse_event.button)))
    is_key_event(event) && return PhysicalKey(wm.keymap, event.key_event.key_name).code
    event.type == POINTER_MOVED && return UInt8(XCB_MOTION_NORMAL)
    event.type == POINTER_ENTERED && return XCB_ENTER_NOTIFY
    event.type == POINTER_EXITED && return XCB_LEAVE_NOTIFY
    0
end

function event_xcb(wm::XWindowManager, e::Event)
    T = event_type_xcb(e)
    T === xcb_expose_event_t && return T(response_type_xcb(e), 0, 0, e.win.id, e.location..., extent(e.win)..., 0, 0)
    T === xcb_configure_notify_event_t && return T(response_type_xcb(e), 0, 0, e.win.id, e.win.id, 0, e.location..., extent(e.win)..., 0, 0, 0)
    T(response_type_xcb(e), detail_xcb(wm, e), 0, e.time, e.win.parent_id, e.win.id, 0, 0, 0, e.location..., state_xcb(e), true, false)
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
