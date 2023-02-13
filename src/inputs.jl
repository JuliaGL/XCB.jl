# xcb_button_release_event_t is a type alias for xcb_button_press_event_t
# so there is no need to define methods for xcb_button_release_event_t

MouseButton(mouse_event::Union{xcb_button_press_event_t,xcb_motion_notify_event_t}) = MouseButton(((mouse_event.state & UInt32(XCB_BUTTON_MASK_1 | XCB_BUTTON_MASK_2 | XCB_BUTTON_MASK_3 | XCB_BUTTON_MASK_4 | XCB_BUTTON_MASK_5)) >> 8) % UInt8)

MouseEvent(mouse_event::xcb_button_press_event_t) = MouseEvent(MouseButton(1 << (mouse_event.detail - 1)), MouseButton(mouse_event))

PointerState(motion_event::xcb_motion_notify_event_t) = PointerState(MouseButton(motion_event), ModifierState(motion_event))

ModifierState(key_event::Union{xcb_key_press_event_t,xcb_motion_notify_event_t}) = ModifierState(key_event.state % UInt8)

KeyEvent(wm::XWindowManager, data::xcb_key_press_event_t) = KeyEvent(wm.keymap, PhysicalKey(data.detail), ModifierState(data))
