event_type(::Union{Val{XCB_KEY_PRESS}, Val{XCB_KEY_RELEASE}}) = xcb_key_press_event_t
event_type(::Union{Val{XCB_BUTTON_PRESS}, Val{XCB_BUTTON_RELEASE}}) = xcb_button_press_event_t
event_type(::Union{Val{XCB_ENTER_NOTIFY}, Val{XCB_LEAVE_NOTIFY}}) = xcb_enter_notify_event_t
event_type(::Val{XCB_MOTION_NOTIFY}) = xcb_motion_notify_event_t
event_type(::Val{XCB_EXPOSE}) = xcb_expose_event_t
event_type(::Val{XCB_CLIENT_MESSAGE}) = xcb_client_message_event_t
event_type(::Val{XCB_CONFIGURE_NOTIFY}) = xcb_configure_notify_event_t
event_type(::Val{85}) = xcb.xcb_xkb_state_notify_event_t # very hacky, but response type 85 is emitted instead of XCB_XKB_STATE_NOTIFY...
event_type(::Val{XCB_KEYMAP_NOTIFY}) = xcb_keymap_notify_event_t
event_type(rt) = nothing

response_type(data) = Int(data.response_type & 0x7f)

is_from_send_request(data) = Bool(data.response_type & 0x80)

function unsafe_load_event(xge_ptr)
    xge = unsafe_load(xge_ptr)
    rt = response_type(xge)
    et = event_type(Val(rt))
    if isnothing(et)
        @debug "Unknown event $(rt)"
        nothing
    else
        unsafe_load(convert(Ptr{et}, xge_ptr))
    end
end

window_id_field(event::xcb_button_press_event_t) = :event
window_id_field(event::xcb_key_press_event_t) = :event
window_id_field(event::xcb_enter_notify_event_t) = :event
window_id_field(event::xcb_motion_notify_event_t) = :event
window_id_field(event::xcb_expose_event_t) = :window
window_id_field(event::xcb_client_message_event_t) = :window
window_id_field(event::xcb_configure_notify_event_t) = :window

window_id(event) = getproperty(event, window_id_field(event))

location(event::xcb_button_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_key_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_enter_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_motion_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_expose_event_t) = (event.x, event.y)
location(event::xcb_configure_notify_event_t) = (event.x, event.y)

EventDetails(win::XCBWindow, data::EventData, event, t) =
    EventDetails(data, Int.(location(event)), t, win)
EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_button_press_event_t, t) =
    EventDetails(win, MouseEvent(data), data, t)

function EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_key_press_event_t, t)
    keycode_symbol = key_name(wm.keymap, data.detail)
    key_symbol = KeySymbol(wm.keymap, data.detail)
    input_char = Char(wm.keymap, data.detail)
    event_type = response_type(data) == XCB_KEY_PRESS ? KeyPressed() : KeyReleased()
    EventDetails(win, KeyEvent(keycode_symbol, key_symbol, input_char, KeyModifierState(data), event_type), data, t)
end

EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_enter_notify_event_t, t) =
    EventDetails(win, response_type(data) == XCB_ENTER_NOTIFY ? PointerEntersWindowEvent() : PointerLeavesWindowEvent(), data, t)
EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_motion_notify_event_t, t) =
    EventDetails(win, PointerMovesEvent(data), data, t)
EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_expose_event_t, t) =
    EventDetails(win, ExposeEvent((data.width, data.height), data.count), data, t)
EventDetails(wm::XWindowManager, win::XCBWindow, data::xcb_configure_notify_event_t, t) =
    EventDetails(win, ResizeEvent((data.width, data.height)), data, t)

function handle_event(wm::XWindowManager, event)
    if !isnothing(event) # event is known
        win = get_window(wm, event)
        if event isa xcb_client_message_event_t
            ed_8 = Int.(event.data.data8)
            event_data32_1 = ed_8[1] + ed_8[2] * 2^8 + ed_8[3] * 2^16 + ed_8[4] * 2^24
            event_data32_1 == win.delete_request && return CloseWindow(win, "")
            nothing
        elseif event isa xcb_xkb_state_notify_event_t
            xkb_state_update_mask(wm.keymap.state, event.baseMods, event.latchedMods, event.lockedMods, event.baseGroup, event.latchedGroup, event.lockedGroup)
            nothing
        elseif event isa xcb_keymap_notify_event_t
            wm.keymap = Keymap(wm.conn; setup_xkb=false)
            nothing
        elseif !isnothing(win) # happened on an existing window
            EventDetails(wm, win, event, time())
        else
            nothing
        end
    else
        nothing
    end
end
