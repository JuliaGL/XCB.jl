response_type(event) = Int(event.response_type & 0x7f)

enqueue!(queue, wm, win, event) = !isnothing(win) && push!(queue, Event(wm, win, event, time()))

function handle_event!(queue, ptr::Ptr{xcb_generic_event_t})
    (; wm) = queue
    rt = response_type(unsafe_load(ptr))
    if rt in (XCB_KEY_PRESS, XCB_KEY_RELEASE)
        event = unsafe_load(Ptr{xcb_key_press_event_t}(ptr))
        win = get_window(wm, event.event)
        enqueue!(queue, wm, win, event)
    elseif rt in (XCB_BUTTON_PRESS, XCB_BUTTON_RELEASE)
        event = unsafe_load(Ptr{xcb_button_press_event_t}(ptr))
        win = get_window(wm, event.event)
        enqueue!(queue, wm, win, event)
    elseif rt in (XCB_ENTER_NOTIFY, XCB_LEAVE_NOTIFY)
        event = unsafe_load(Ptr{xcb_enter_notify_event_t}(ptr))
        win = get_window(wm, event.event)
        enqueue!(queue, wm, win, event)
    elseif rt == XCB_MOTION_NOTIFY
        event = unsafe_load(Ptr{xcb_motion_notify_event_t}(ptr))
        win = get_window(wm, event.event)
        enqueue!(queue, wm, win, event)
    elseif rt == XCB_EXPOSE
        event = unsafe_load(Ptr{xcb_expose_event_t}(ptr))
        win = get_window(wm, event.window)
        enqueue!(queue, wm, win, event)
    elseif rt == XCB_CLIENT_MESSAGE
        event = unsafe_load(Ptr{xcb_client_message_event_t}(ptr))
        win = get_window(wm, event.window)
        !is_delete_request(event, win) && return
        enqueue!(queue, wm, win, event)
    elseif rt == XCB_CONFIGURE_NOTIFY
        event = unsafe_load(Ptr{xcb_configure_notify_event_t}(ptr))
        win = get_window(wm, event.window)
        enqueue!(queue, wm, win, event)
    elseif rt in (XCB_FOCUS_IN, XCB_FOCUS_OUT)
        event = unsafe_load(Ptr{xcb_focus_in_event_t}(ptr))
        win = get_window(wm, event.event)
        enqueue!(queue, wm, win, event)
    elseif rt == 85 # very hacky, but response type 85 is emitted instead of XCB_XKB_STATE_NOTIFY...
        event = unsafe_load(Ptr{xcb_xkb_state_notify_event_t}(ptr))
        xkb_state_update_mask(wm.keymap.state, event.baseMods, event.latchedMods, event.lockedMods, event.baseGroup, event.latchedGroup, event.lockedGroup)
    elseif rt == XCB_KEYMAP_NOTIFY
        wm.keymap = Keymap(wm.conn; setup_xkb = false)
        @debug "Keymap updated"
    else
        @debug "Unknown event $rt"
    end
end

location(event::xcb_button_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_key_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_enter_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_motion_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_expose_event_t) = (event.x, event.y)
location(event::xcb_configure_notify_event_t) = (event.x, event.y)
location(::xcb_client_message_event_t) = (0, 0)

location(event, win) = coordinates(location(event), win)
coordinates(xs, win) = Float64.(xs ./ extent(win))

function Event(wm::XWindowManager, win::XCBWindow, event::xcb_button_press_event_t, t)
    data = MouseEvent(event)
    event_type = response_type(event) == XCB_BUTTON_PRESS ? BUTTON_PRESSED : BUTTON_RELEASED
    Event(event_type, data, location(event, win), t, win)
end
function Event(wm::XWindowManager, win::XCBWindow, event::xcb_key_press_event_t, t)
    data = KeyEvent(wm, event)
    event_type = response_type(event) == XCB_KEY_PRESS ? KEY_PRESSED : KEY_RELEASED
    Event(event_type, data, location(event, win), t, win)
end
Event(wm::XWindowManager, win::XCBWindow, event::xcb_client_message_event_t, t) =
    Event(WINDOW_CLOSED, nothing, location(event, win), t, win)
Event(wm::XWindowManager, win::XCBWindow, event::xcb_enter_notify_event_t, t) =
    Event(response_type(event) == XCB_ENTER_NOTIFY ? POINTER_ENTERED : POINTER_EXITED, nothing, location(event, win), t, win)
Event(wm::XWindowManager, win::XCBWindow, event::xcb_motion_notify_event_t, t) =
    Event(POINTER_MOVED, PointerState(event), location(event, win), t, win)
Event(wm::XWindowManager, win::XCBWindow, event::xcb_expose_event_t, t) =
    Event(WINDOW_EXPOSED, coordinates((event.width, event.height), win), location(event, win), t, win)
Event(wm::XWindowManager, win::XCBWindow, event::xcb_configure_notify_event_t, t) =
    Event(WINDOW_RESIZED, Int64.((event.width, event.height)), location(event, win), t, win)
Event(wm::XWindowManager, win::XCBWindow, event::xcb_focus_in_event_t, t) =
    Event(response_type(event) == XCB_FOCUS_IN ? WINDOW_GAINED_FOCUS : WINDOW_LOST_FOCUS, nothing, (0.0, 0.0), t, win)

function is_delete_request(event::xcb_client_message_event_t, win::XCBWindow)
    data = deserialize_delete_request_data(event.data.data8)
    data == win.delete_request
end

serialize_delete_request_data(delete_request::xcb_atom_t) = ntuple(i -> i ≤ 4 ? UInt8((delete_request << 8(4 - i)) >> 24) : 0x00, 20)
deserialize_delete_request_data(bytes) = xcb_atom_t(Int(bytes[1]) + Int(bytes[2]) << 8 + Int(bytes[3]) << 16 + Int(bytes[4]) << 24)

function poll_for_events!(queue::EventQueue{XWindowManager})
    event = xcb_poll_for_event(queue.wm.conn)
    event == C_NULL && return false
    handle_event!(queue, event)
    true
end
