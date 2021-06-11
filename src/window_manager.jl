mutable struct XWindowManager <: AbstractWindowManager
    conn::Connection
    windows::Vector{XCBWindow}
    keymap::Keymap
    callbacks::Dict{XCBWindow, WindowCallbacks}
end

XWindowManager(conn::Connection, windows::Vector{XCBWindow}) = XWindowManager(conn, windows, Keymap(conn), Dict())

function XWindowManager(conn::Connection, windows::Vector{XCBWindow}, callbacks::Dict{XCBWindow, WindowCallbacks})
    wm = XWindowManager(conn, windows, Keymap(conn))
    for (win, cb) ∈ callbacks
        set_callbacks!(wm, win, cb)
    end
end

function set_callbacks!(wm::XWindowManager, win::XCBWindow, callbacks::WindowCallbacks)
    wm.callbacks[win] = callbacks
    set_event_mask(win, callbacks)
end

function poll_for_event(wm::XWindowManager)
    while true
        event = xcb_poll_for_event(wm.conn)
        event ≠ C_NULL && return event
        yield()
    end
end

function wait_for_event(wm::XWindowManager)
    event = xcb_wait_for_event(wm.conn)
    event == C_NULL ? nothing : event
end

function terminate_window!(wm::XWindowManager, win::XCBWindow)
    deleteat!(wm.windows, window_index(wm, win))
    finalize(win)
end

window_index(wm::XWindowManager, win::XCBWindow) = findfirst(x -> x.id == win.id, wm.windows)
window_index(wm::XWindowManager, id::Integer) = findfirst(x -> x.id == id, wm.windows)

get_window(wm::XWindowManager, id::Integer) = wm.windows[window_index(wm, id)]
get_window(wm::XWindowManager, event::xcb_xkb_state_notify_event_t) = nothing
get_window(wm::XWindowManager, event::xcb_keymap_notify_event_t) = nothing
get_window(wm::XWindowManager, event) = get_window(wm, window_id(event))

callbacks(wm::XWindowManager, win::XCBWindow) = get(wm.callbacks, win, WindowCallbacks())

"""
Extract a keycode from an key event.
"""
keycode(wm::XWindowManager, details::EventDetails{<:KeyEvent}) = keycode(wm.keymap, details.data.key_name)

"""
Return condensed information regarding a keystroke as a `String`. Includes key name, keycode, character input and key symbol.
"""
keystroke_info(wm::XWindowManager, event_details::EventDetails) = keystroke_info(wm.keymap, event_details)