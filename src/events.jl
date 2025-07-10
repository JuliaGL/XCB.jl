response_type(event) = Int(event.response_type & 0x7f)

enqueue!(queue, wm, window, event) = !isnothing(window) && push!(queue, Event(wm, window, event, time()))

function handle_event!(queue, ptr::Ptr{xcb_generic_event_t})
    (; wm) = queue
    rt = response_type(unsafe_load(ptr))
    if rt in (XCB_KEY_PRESS, XCB_KEY_RELEASE)
        event = unsafe_load(Ptr{xcb_key_press_event_t}(ptr))
        window = get_window(wm, event.event)
        enqueue!(queue, wm, window, event)
    elseif rt in (XCB_BUTTON_PRESS, XCB_BUTTON_RELEASE)
        event = unsafe_load(Ptr{xcb_button_press_event_t}(ptr))
        window = get_window(wm, event.event)
        enqueue!(queue, wm, window, event)
    elseif rt in (XCB_ENTER_NOTIFY, XCB_LEAVE_NOTIFY)
        event = unsafe_load(Ptr{xcb_enter_notify_event_t}(ptr))
        window = get_window(wm, event.event)
        enqueue!(queue, wm, window, event)
    elseif rt == XCB_MOTION_NOTIFY
        event = unsafe_load(Ptr{xcb_motion_notify_event_t}(ptr))
        window = get_window(wm, event.event)
        enqueue!(queue, wm, window, event)
    elseif rt == XCB_EXPOSE
        event = unsafe_load(Ptr{xcb_expose_event_t}(ptr))
        window = get_window(wm, event.window)
        enqueue!(queue, wm, window, event)
    elseif rt == XCB_CLIENT_MESSAGE
        event = unsafe_load(Ptr{xcb_client_message_event_t}(ptr))
        window = get_window(wm, event.window)
        window === nothing && return
        !is_delete_request(event, window) && return
        enqueue!(queue, wm, window, event)
    elseif rt == XCB_CONFIGURE_NOTIFY
        event = unsafe_load(Ptr{xcb_configure_notify_event_t}(ptr))
        window = get_window(wm, event.window)
        window === nothing && return
        changes_geometry_or_position(event, window) || return
        enqueue!(queue, wm, window, event)
    elseif rt == XCB_PROPERTY_NOTIFY
        event = unsafe_load(Ptr{xcb_property_notify_event_t}(ptr))
        window = get_window(wm, event.window)
        window !== nothing && process_property_notify!(window, event)
    elseif rt in (XCB_FOCUS_IN, XCB_FOCUS_OUT)
        event = unsafe_load(Ptr{xcb_focus_in_event_t}(ptr))
        window = get_window(wm, event.event)
        enqueue!(queue, wm, window, event)
    elseif rt == 85 # response type 85 is emitted instead of XCB_XKB_STATE_NOTIFY
        event = unsafe_load(Ptr{xcb_xkb_state_notify_event_t}(ptr))
        xkb_state_update_mask(wm.keymap.state, event.baseMods, event.latchedMods, event.lockedMods, event.baseGroup, event.latchedGroup, event.lockedGroup)
    elseif rt == XCB_KEYMAP_NOTIFY
        wm.keymap = Keymap(wm.conn; setup_xkb = false)
        @debug "Keymap updated"
    elseif rt == XCB_MAP_NOTIFY
        # If we ever need to get the frame, this would be a good place to get it.
        # window.frame = get_frame_window(window)
        # @assert window.frame !== window.id
    elseif rt == XCB_REPARENT_NOTIFY
    else
        @debug "Ignored event $rt"
    end
end

function process_property_notify!(window::XCBWindow, event::xcb_property_notify_event_t)
    @debug "Received property notification: $(get_atom_name!(window, event.atom))"
    if event.atom == get_atom!(window, :_NET_FRAME_EXTENTS)
        window.frame_extents = get_frame_extents(window)
    end
end

function changes_geometry_or_position(event::xcb_configure_notify_event_t, window::XCBWindow)
    window.ignore_next_moves > 0 && @atomic(window.ignore_next_moves -= 1) ≥ 0 && return false
    (; x, y, width, height) = event
    (x, y) ≠ window.position || (width, height) ≠ window.extent
end

location(event::xcb_button_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_key_press_event_t) = (event.event_x, event.event_y)
location(event::xcb_enter_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_motion_notify_event_t) = (event.event_x, event.event_y)
location(event::xcb_expose_event_t) = (event.x, event.y)
location(event::xcb_configure_notify_event_t) = (event.x, event.y)
location(::xcb_client_message_event_t) = (0, 0)

location(event, window) = coordinates(location(event), window)
function coordinates((x, y), window)
    width, height = window.extent
    x = ifelse(iszero(width), 0.0, x/width)
    y = ifelse(iszero(height), 0.0, y/height)
    (x, y)
end

function Event(wm::XWindowManager, window::XCBWindow, event::xcb_button_press_event_t, t)
    data = MouseEvent(event)
    event_type = response_type(event) == XCB_BUTTON_PRESS ? BUTTON_PRESSED : BUTTON_RELEASED
    Event(event_type, data, location(event, window), t, window)
end
function Event(wm::XWindowManager, window::XCBWindow, event::xcb_key_press_event_t, t)
    data = KeyEvent(wm, event)
    event_type = response_type(event) == XCB_KEY_PRESS ? KEY_PRESSED : KEY_RELEASED
    Event(event_type, data, location(event, window), t, window)
end
Event(wm::XWindowManager, window::XCBWindow, event::xcb_client_message_event_t, t) =
    Event(WINDOW_CLOSED, nothing, location(event, window), t, window)
Event(wm::XWindowManager, window::XCBWindow, event::xcb_enter_notify_event_t, t) =
    Event(response_type(event) == XCB_ENTER_NOTIFY ? POINTER_ENTERED : POINTER_EXITED, PointerState(event), location(event, window), t, window)
Event(wm::XWindowManager, window::XCBWindow, event::xcb_motion_notify_event_t, t) =
    Event(POINTER_MOVED, PointerState(event), location(event, window), t, window)
Event(wm::XWindowManager, window::XCBWindow, event::xcb_expose_event_t, t) =
    Event(WINDOW_EXPOSED, coordinates((event.width, event.height), window), location(event, window), t, window)
function Event(wm::XWindowManager, window::XCBWindow, event::xcb_configure_notify_event_t, t)
    extent = Int64.((event.width, event.height))
    (; x, y) = event
    if extent ≠ window.extent
        type = WINDOW_RESIZED
        position = get_position(window)
    else
        type = WINDOW_MOVED
        position = (event.x, event.y)
    end
    movement = position .- window.position
    @atomic window.position = position
    data = movement
    if type === WINDOW_RESIZED
        resize = extent .- window.extent
        @atomic window.extent = extent
        data = (resize..., movement...)
    end
    Event(type, data, location(event, window), t, window)
end
Event(wm::XWindowManager, window::XCBWindow, event::xcb_focus_in_event_t, t) =
    Event(response_type(event) == XCB_FOCUS_IN ? WINDOW_GAINED_FOCUS : WINDOW_LOST_FOCUS, nothing, (0.0, 0.0), t, window)

function is_delete_request(event::xcb_client_message_event_t, window::XCBWindow)
    data = deserialize_delete_request_data(event.data.data8)
    data == window.atoms[:WM_DELETE_WINDOW]
end

serialize_delete_request_data(delete_request::xcb_atom_t) = ntuple(i -> i ≤ 4 ? UInt8((delete_request << 8(4 - i)) >> 24) : 0x00, 20)
deserialize_delete_request_data(bytes) = xcb_atom_t(Int(bytes[1]) + Int(bytes[2]) << 8 + Int(bytes[3]) << 16 + Int(bytes[4]) << 24)

function poll_for_events!(queue::EventQueue{XWindowManager})
    event = xcb_poll_for_event(queue.wm.conn)
    event == C_NULL && return false
    handle_event!(queue, event)
    true
end
