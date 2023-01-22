"""
Translate mouse or modifier state into the corresponding XCB value.
"""
function state_xcb end

state_xcb(s::MouseState) = .&(UInt[s.left, s.middle, s.right, s.scroll_up, s.scroll_down, s.any] .* UInt[XCB_BUTTON_MASK_1, XCB_BUTTON_MASK_2, XCB_BUTTON_MASK_3, XCB_BUTTON_MASK_4, XCB_BUTTON_MASK_5, XCB_BUTTON_MASK_ANY]...)
state_xcb(s::KeyModifierState) = sum(2 .^ (0:3) .* Int[s.shift, s.ctrl, s.alt, s.super])
state_xcb(::Any) = 0

state_xcb(e::MouseEvent) = state_xcb(e.state)
state_xcb(e::KeyEvent) = state_xcb(e.modifiers)

"""
Translate an action into its corresponding XCB value.
"""
function response_type_xcb end

response_type_xcb(::Type{ButtonPressed}) = XCB_BUTTON_PRESS
response_type_xcb(::Type{ButtonReleased}) = XCB_BUTTON_RELEASE
response_type_xcb(::Type{KeyPressed}) = XCB_KEY_PRESS
response_type_xcb(::Type{KeyReleased}) = XCB_KEY_RELEASE
response_type_xcb(::Type{PointerMoves}) = XCB_MOTION_NOTIFY
response_type_xcb(::Type{PointerEntersWindow}) = XCB_ENTER_NOTIFY
response_type_xcb(::Type{PointerLeavesWindow}) = XCB_LEAVE_NOTIFY
response_type_xcb(::Type{Expose}) = XCB_EXPOSE
response_type_xcb(::Type{Resize}) = XCB_CONFIGURE_NOTIFY

event_type_xcb(::Type{<:Union{ButtonPressed, ButtonReleased}}) = xcb_button_press_event_t
event_type_xcb(::Type{<:Union{KeyPressed, KeyReleased}}) = xcb_key_press_event_t
event_type_xcb(::Type{PointerMoves}) = xcb_motion_notify_event_t
event_type_xcb(::Type{<:Union{PointerEntersWindow, PointerLeavesWindow}}) = xcb_enter_notify_event_t
event_type_xcb(::Type{ResizeEvent}) = xcb_configure_notify_event_t
event_type_xcb(::Type{ExposeEvent}) = xcb_expose_event_t

button_xcb(::ButtonLeft) = XCB_BUTTON_INDEX_1
button_xcb(::ButtonMiddle) = XCB_BUTTON_INDEX_2
button_xcb(::ButtonRight) = XCB_BUTTON_INDEX_3
button_xcb(::ButtonScrollUp) = XCB_BUTTON_INDEX_4
button_xcb(::ButtonScrollDown) = XCB_BUTTON_INDEX_5

detail_xcb(wm::XWindowManager, e::MouseEvent) = button_xcb(e.button)
detail_xcb(wm::XWindowManager, e::PointerMovesEvent) = XCB_MOTION_NORMAL
detail_xcb(wm::XWindowManager, e::PointerEntersWindowEvent) = XCB_ENTER_NOTIFY
detail_xcb(wm::XWindowManager, e::PointerLeavesWindowEvent) = XCB_LEAVE_NOTIFY
detail_xcb(wm::XWindowManager, e::EventData) = 0
detail_xcb(wm::XWindowManager, e::EventDetails) = detail_xcb(wm, e.data)
detail_xcb(wm::XWindowManager, e::EventDetails{<:KeyEvent}) = PhysicalKey(wm.keymap, e.data.key_name).code

event_xcb(wm::XWindowManager, e::EventDetails) = event_type_xcb(action(e))(
    response_type_xcb(action(e)),
    detail_xcb(wm, e),
    0,
    e.time,
    e.win.parent_id,
    e.win.id,
    0,
    0,
    0,
    e.location...,
    state_xcb(e.data),
    true,
    false
)

event_xcb(wm::XWindowManager, e::EventDetails{<:ExposeEvent}) = event_type_xcb(action(e))(
    response_type_xcb(action(e)),
    0,
    0,
    e.win.id,
    e.location...,
    extent(e.win)...,
    0,
    0
)

event_xcb(wm::XWindowManager, e::EventDetails{<:ResizeEvent}) = event_type_xcb(action(e))(
    response_type_xcb(action(e)),
    0,
    0,
    e.win.id,
    e.win.id,
    0,
    e.location...,
    extent(e.win)...,
    0,
    0,
    0
)

send_event(wm::XWindowManager, e::EventDetails) = send_event(e.win, event_xcb(wm, e))

function send_event(win::XCBWindow, event)
    ref = Ref(event)
    GC.@preserve ref begin
        event_ptr = Ptr{Cchar}(Base.unsafe_convert(Ptr{typeof(event)}, ref))
        @flush @check :error xcb_send_event(win.conn, false, win.id, 0, event_ptr)
    end
end

hex(x) = "0x$(string(x, base=16))"

function send(wm::XWindowManager, win::XCBWindow; location=(0, 0))
    (event; location=location) -> send_event(wm, EventDetails(event, location, floor(time()), win))
end
