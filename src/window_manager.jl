mutable struct XWindowManager <: AbstractWindowManager
    conn::Connection
    keymap::Keymap
    windows::Dict{xcb_window_t,XCBWindow}
end
XWindowManager(conn::Connection, keymap::Keymap, windows::AbstractDict) = XWindowManager(conn, keymap, windows)
XWindowManager(conn::Connection, windows::AbstractDict) = XWindowManager(conn, Keymap(conn), windows)
XWindowManager(conn::Connection, windows::Vector{XCBWindow} = XCBWindow[]) = XWindowManager(conn, Dict(window.id => window for window in windows))
XWindowManager(; display = nothing) = XWindowManager(Connection(; display))

window_type(::XWindowManager) = XCBWindow

windows(wm::XWindowManager) = values(wm.windows)
get_window(wm::XWindowManager, id::Integer) = get(wm.windows, id, nothing)

current_screen(wm::XWindowManager) = current_screen(wm.conn)

function XCBWindow(wm::XWindowManager, title::AbstractString = "Window $(1 + length(wm.windows))"; screen = current_screen(wm), kwargs...)
    window = XCBWindow(wm.conn, screen; window_title = title, kwargs...)
    wm.windows[window.id] = window
    window
end

function Base.close(wm::XWindowManager, window::XCBWindow)
    delete!(wm.windows, window.id)
    finalize(window)
end

function Base.show(io::IO, wm::XWindowManager)
    n = length(wm.windows)
    number = iszero(n) ? "no" : n
    print(io, XWindowManager, '(', wm.conn, ", ", n, " active window", n == 1 ? "" : "s", ')')
end
