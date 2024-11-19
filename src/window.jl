"""
Window type used with the XCB API.
"""
mutable struct XCBWindow <: AbstractWindow
    conn::Connection
    id::xcb_window_t
    screen::xcb_screen_t
    delete_request::xcb_atom_t
    gc::Union{Nothing,GraphicsContext}
end

"""
Create a new window on the provided `screen`.
"""
function XCBWindow(conn, screen::xcb_screen_t; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, map=true, attributes=[], values=[], with_decorations=true)
    win_id = xcb_generate_id(conn)
    xcb_create_window(
        conn,
        depth,
        win_id,
        screen.root,
        x,
        y,
        width,
        height,
        border_width,
        class,
        screen.root_visual,
        0,
        C_NULL,
    )
    window = XCBWindow(conn, win_id, screen, delete_request(conn, win_id), nothing)
    !with_decorations && XCB.hide_decorations(window)

    set_event_mask(window, keys(event_type_bits))
    set_attributes(window, attributes, values)

    set_title(window, window_title)

    icon_title = something(icon_title, window_title)
    set_icon_title(window, icon_title)

    map && map_window(window)
    Base.finalizer(x -> @check(:error, xcb_destroy_window(x.conn, x.id)), window)
end

"""
Create a new window on the current screen.
"""
XCBWindow(conn::Connection; kwargs...) = XCBWindow(conn, current_screen(conn); kwargs...)

current_screen(conn) = unsafe_load(xcb_setup_roots_iterator(Setup(conn)).data)

Base.:(==)(x::XCBWindow, y::XCBWindow) = x.id == y.id

Base.hash(window::XCBWindow, h::UInt) = hash(window.id, h)

function set_attributes(window::XCBWindow, attributes, values)
    values = values[sortperm(attributes)]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_window_attributes(window.conn, window.id, reduce(|, attributes; init = zero(UInt32)), list)
end

function delete_request(conn, win_id)
    wm_protocols_cookie = xcb_intern_atom(conn, 1, length("WM_PROTOCOLS"), "WM_PROTOCOLS")
    wm_protocols_reply = xcb_intern_atom_reply(conn, wm_protocols_cookie, C_NULL)
    wm_delete_cookie = xcb_intern_atom(conn, 0, length("WM_DELETE_WINDOW"), "WM_DELETE_WINDOW")
    wm_delete_reply = xcb_intern_atom_reply(conn, wm_delete_cookie, C_NULL)
    @check xcb_change_property(conn, XCB_PROP_MODE_REPLACE, win_id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    unsafe_load(wm_delete_reply).atom
end

function extent(window::XCBWindow)
    geometry_cookie = xcb_get_geometry(window.conn, window.id)
    geometry_reply = xcb_get_geometry_reply(window.conn, geometry_cookie, C_NULL)
    geometry_reply == C_NULL && return (zero(UInt16), zero(UInt16))
    data = unsafe_load(geometry_reply)
    data.width, data.height
end

function resize(window::XCBWindow, extent)
    @flush @check xcb_configure_window(window.conn, window.id, XCB_CONFIG_WINDOW_WIDTH | XCB_CONFIG_WINDOW_HEIGHT, UInt32[extent...])
end

map_window(window::XCBWindow) = @flush @check xcb_map_window(window.conn, window.id)

unmap_window(window::XCBWindow) = @flush @check xcb_unmap_window(window.conn, window.id)

function set_title(window::XCBWindow, title)
    GC.@preserve title begin
        @flush @check xcb_change_property(window.conn, XCB_PROP_MODE_REPLACE, window.id, XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8, length(title), pointer(title))
    end
end

function set_icon_title(window::XCBWindow, title)
    title_c = title * "\0"
    @flush @check xcb_change_property(window.conn, XCB_PROP_MODE_REPLACE, window.id, XCB_ATOM_WM_CLASS, XCB_ATOM_STRING, 8, length(title_c) * 2, pointer(title_c^2))
end

const base_event_mask = XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT | XCB_EVENT_MASK_KEYMAP_STATE | XCB_EVENT_MASK_STRUCTURE_NOTIFY

const event_type_bits = Dict(
    KEY_PRESSED => XCB_EVENT_MASK_KEY_PRESS,
    KEY_RELEASED => XCB_EVENT_MASK_KEY_RELEASE,
    BUTTON_PRESSED => XCB_EVENT_MASK_BUTTON_PRESS,
    BUTTON_RELEASED => XCB_EVENT_MASK_BUTTON_RELEASE,
    POINTER_ENTERED => XCB_EVENT_MASK_ENTER_WINDOW,
    POINTER_MOVED => XCB_EVENT_MASK_POINTER_MOTION | XCB_EVENT_MASK_BUTTON_MOTION | XCB_EVENT_MASK_BUTTON_PRESS,
    POINTER_EXITED => XCB_EVENT_MASK_LEAVE_WINDOW,
    WINDOW_EXPOSED => XCB_EVENT_MASK_EXPOSURE,
    WINDOW_RESIZED => XCB_EVENT_MASK_STRUCTURE_NOTIFY,
    WINDOW_GAINED_FOCUS => XCB_EVENT_MASK_FOCUS_CHANGE,
    WINDOW_LOST_FOCUS => XCB_EVENT_MASK_FOCUS_CHANGE,
)

event_bit(event_type::EventType) = event_type_bits[event_type]
event_bits(event_types) = reduce((x, y) -> |(x, event_bit(y)), event_types; init = zero(xcb_event_mask_t))

function set_event_mask(window::XCBWindow, event_types)
    mask = base_event_mask | event_bits(event_types)
    set_attributes(window, [XCB_CW_EVENT_MASK], [mask])
end

attach_graphics_context!(window::XCBWindow, gc::GraphicsContext) = setproperty!(window, :gc, gc)

GraphicsContext(window::XCBWindow; kwargs...) = GraphicsContext(window.conn, window.id; kwargs...)

function hide_decorations(window::XCBWindow)
    name = "_MOTIF_WM_HINTS"
    cookie = xcb_intern_atom(window.conn, 0, length(name), "_MOTIF_WM_HINTS" )
    reply = unsafe_load(xcb_intern_atom_reply(window.conn, cookie, C_NULL))
    data = (; flags = UInt32(2), functions = UInt32(0), decorations = UInt32(0), input_mode = Int32(0), status = UInt32(0))
    @check xcb_change_property(window.conn, XCB_PROP_MODE_REPLACE, window.id, reply.atom, reply.atom, 32, 5, Ref(data))
end
