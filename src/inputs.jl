# xcb_button_release_event_t is a type alias for xcb_button_press_event_t
# so there is no need to define methods for xcb_button_release_event_t

MouseButton(mouse_event::Union{xcb_button_press_event_t,xcb_motion_notify_event_t}) = MouseButton((mouse_event.state & UInt32(XCB_BUTTON_MASK_1 | XCB_BUTTON_MASK_2 | XCB_BUTTON_MASK_3 | XCB_BUTTON_MASK_4 | XCB_BUTTON_MASK_5)) >> 8)

MouseEvent(mouse_event::xcb_button_press_event_t) = MouseEvent(MouseButton(1 << (mouse_event.detail - 1)), MouseButton(mouse_event))

PointerState(motion_event::xcb_motion_notify_event_t) = PointerState(MouseButton(motion_event), KeyModifierState(motion_event))

function KeyContext(key_event::xcb_key_press_event_t)
    (; state) = key_event
    KeyContext((state .| [XCB_MOD_MASK_2, XCB_MOD_MASK_LOCK] .== state)...)
end

function KeyModifierState(key_event::Union{xcb_key_press_event_t,xcb_motion_notify_event_t})
    (; state) = key_event
    KeyModifierState((state .| [XCB_MOD_MASK_SHIFT, XCB_MOD_MASK_CONTROL, XCB_MOD_MASK_1, XCB_MOD_MASK_4] .== state)...)
end

KeyEvent(wm::XWindowManager, data::xcb_key_press_event_t) = KeyEvent(wm.keymap, PhysicalKey(data.detail), KeyModifierState(data))
