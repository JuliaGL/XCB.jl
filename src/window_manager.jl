mutable struct XWindowManager <: AbstractWindowManager
    conn::Connection
    windows::Dict{xcb_window_t,XCBWindow}
    keymap::Keymap
    callbacks::Dict{XCBWindow, WindowCallbacks}
    function XWindowManager(conn::Connection, windows::Dict{xcb_window_t,XCBWindow}, keymap::Keymap, callbacks::Dict{XCBWindow, WindowCallbacks})
        wm = new(conn, windows, keymap, Dict())
        for (win, cb) ∈ callbacks
            set_callbacks!(wm, win, cb)
        end
        wm
    end
    XWindowManager(conn, windows, keymap, callbacks) = XWindowManager(convert(Connection, conn), convert(Dict{xcb_window_t,XCBWindow}, windows), convert(Keymap, keymap), convert(Dict{XCBWindow,WindowCallbacks}, callbacks))
end

XWindowManager(conn::Connection, windows::AbstractDict) = XWindowManager(conn, windows, Keymap(conn), Dict())
XWindowManager(conn::Connection = Connection(), windows::Vector{XCBWindow} = XCBWindow[]) = XWindowManager(conn, Dict(win.id => win for win in windows))

current_screen(wm::XWindowManager) = current_screen(wm.conn)

function XCBWindow(wm::XWindowManager, title::AbstractString = "Window $(1 + length(wm.windows))"; screen = current_screen(wm), kwargs...)
    win = XCBWindow(wm.conn, screen; window_title = title, kwargs...)
    wm.windows[win.id] = win
    win
end

Base.close(wm::XWindowManager, exc::CloseWindow) = wm.callbacks[win].on_close(exc)
Base.close(wm::XWindowManager, win::XCBWindow) = close(wm, CloseWindow(win))

function set_callbacks!(wm::XWindowManager, win::XCBWindow, callbacks::WindowCallbacks)
    wm.callbacks[win] = callbacks
    set_event_mask(win, callbacks)
end

function poll_for_event(wm::XWindowManager)
    event = xcb_poll_for_event(wm.conn)
    event == C_NULL && return nothing
    unsafe_load_event(event)
end

function wait_for_event(wm::XWindowManager)
    event = xcb_wait_for_event(wm.conn)
    event == C_NULL && return nothing
    unsafe_load_event(event)
end

function terminate_window!(wm::XWindowManager, win::XCBWindow)
    delete!(wm.windows, win.id)
    finalize(win)
end

get_window(wm::XWindowManager, id::Integer) = get(wm.windows, id, nothing)
get_window(wm::XWindowManager, event::xcb_xkb_state_notify_event_t) = nothing
get_window(wm::XWindowManager, event::xcb_keymap_notify_event_t) = nothing
get_window(wm::XWindowManager, event) = get_window(wm, window_id(event))

callbacks(wm::XWindowManager, win::XCBWindow) = get(WindowCallbacks, wm.callbacks, win)

"""
Extract a keycode from an key event.
"""
keycode(wm::XWindowManager, details::EventDetails{<:KeyEvent}) = keycode(wm.keymap, details.data.key_name)

"""
Return condensed information regarding a keystroke as a `String`. Includes key name, keycode, character input and key symbol.
"""
keystroke_info(wm::XWindowManager, event_details::EventDetails) = keystroke_info(wm.keymap, event_details)
