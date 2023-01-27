"""
Window type used with the XCB API.
"""
mutable struct XCBWindow <: AbstractWindow
    conn::Connection
    id::xcb_window_t
    parent_id::xcb_window_t
    visual_id::xcb_visualid_t
    delete_request::xcb_atom_t
    gc::Union{Nothing,GraphicsContext}
end

"""
Create a new window whose parent is given by `parent_id` and visual by `visual_id`.
"""
function XCBWindow(conn, parent_id, visual_id; depth=XCB_COPY_FROM_PARENT, x=0, y=0, width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, map=true, attributes=[], values=[])
    win_id = xcb_generate_id(conn)
    xcb_create_window(
        conn,
        depth,
        win_id,
        parent_id,
        x,
        y,
        width,
        height,
        border_width,
        class,
        visual_id,
        0,
        C_NULL,
    )
    win = XCBWindow(conn, win_id, parent_id, visual_id, delete_request(conn, win_id), nothing)

    set_event_mask(win, keys(event_type_bits))
    set_attributes(win, attributes, values)

    set_title(win, window_title)

    icon_title = something(icon_title, window_title)
    set_icon_title(win, icon_title)

    map && map_window(win)
    Base.finalizer(x -> @check(:error, xcb_destroy_window(x.conn, x.id)), win)
end

"""
Create a new window on the provided `screen`.
"""
XCBWindow(conn::Connection, screen; kwargs...) = XCBWindow(conn, screen.root, screen.root_visual; kwargs...)

"""
Create a new window on the current screen.
"""
XCBWindow(conn::Connection; kwargs...) = XCBWindow(conn, current_screen(conn); kwargs...)

current_screen(conn) = unsafe_load(xcb_setup_roots_iterator(Setup(conn)).data)

Base.:(==)(x::XCBWindow, y::XCBWindow) = x.id == y.id

Base.hash(win::XCBWindow, h::UInt) = hash(win.id, h)

function set_attributes(win::XCBWindow, attributes, values)
    values = values[sortperm(attributes)]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_window_attributes(win.conn, win.id, reduce(|, attributes; init = zero(UInt32)), list)
end

function delete_request(conn, win_id)
    wm_protocols_cookie = xcb_intern_atom(conn, 1, length("WM_PROTOCOLS"), "WM_PROTOCOLS")
    wm_protocols_reply = xcb_intern_atom_reply(conn, wm_protocols_cookie, C_NULL)
    wm_delete_cookie = xcb_intern_atom(conn, 0, length("WM_DELETE_WINDOW"), "WM_DELETE_WINDOW")
    wm_delete_reply = xcb_intern_atom_reply(conn, wm_delete_cookie, C_NULL)
    @check xcb_change_property(conn, XCB_PROP_MODE_REPLACE, win_id, unsafe_load(wm_protocols_reply).atom, 4, 32, 1, Ref(unsafe_load(wm_delete_reply).atom))
    unsafe_load(wm_delete_reply).atom
end

function extent(win::XCBWindow)
    geometry_cookie = xcb_get_geometry(win.conn, win.id)
    geometry_reply = xcb_get_geometry_reply(win.conn, geometry_cookie, C_NULL)
    geometry_reply == C_NULL && throw(InvalidWindow(win))
    getproperty.(Ref(unsafe_load(geometry_reply)), (:width, :height))
end

function resize(win::XCBWindow, extent)
    @flush @check xcb_configure_window(win.conn, win.id, XCB_CONFIG_WINDOW_WIDTH | XCB_CONFIG_WINDOW_HEIGHT, UInt32[extent...])
end

map_window(win::XCBWindow) = @flush @check xcb_map_window(win.conn, win.id)

unmap_window(win::XCBWindow) = @flush @check xcb_unmap_window(win.conn, win.id)

function set_title(win::XCBWindow, title)
    GC.@preserve title begin
        @flush @check xcb_change_property(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_NAME, XCB_ATOM_STRING, 8, length(title), pointer(title))
    end
end

function set_icon_title(win::XCBWindow, title)
    title_c = title * "\0"
    @flush @check xcb_change_property(win.conn, XCB_PROP_MODE_REPLACE, win.id, XCB_ATOM_WM_CLASS, XCB_ATOM_STRING, 8, length(title_c) * 2, pointer(title_c^2))
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

function set_event_mask(win::XCBWindow, event_types)
    mask = base_event_mask | event_bits(event_types)
    set_attributes(win, [XCB_CW_EVENT_MASK], [mask])
end

attach_graphics_context!(win::XCBWindow, gc::GraphicsContext) = setproperty!(win, :gc, gc)

GraphicsContext(win::XCBWindow; kwargs...) = GraphicsContext(win.conn, win.id; kwargs...)
