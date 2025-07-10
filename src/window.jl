"""
Window type used with the XCB API.
"""
mutable struct XCBWindow <: AbstractWindow
    const conn::Connection
    const id::xcb_window_t
    const screen::xcb_screen_t
    # frame::Optional{xcb_window_t}
    frame_extents::Optional{NTuple{4,Int64}} # left, right, top, bottom
    gc::Optional{GraphicsContext}
    @atomic position::Tuple{Int64,Int64}
    @atomic extent::Tuple{Int64,Int64}
    @atomic ignore_next_moves::Int64
    atoms::Dict{Symbol,UInt32}
end

"""
Create a new window on the provided `screen`.
"""
function XCBWindow(conn, screen::xcb_screen_t; depth=XCB_COPY_FROM_PARENT, offset = (0, 0), width=512, height=512, border_width=1, class=XCB_WINDOW_CLASS_INPUT_OUTPUT, window_title="", icon_title=nothing, map=true, attributes=[], values=[], with_decorations=true)
    win_id = xcb_generate_id(conn)
    # `x` and `y` arguments may be ignored by the window manager.
    # To make sure we always set the window's position to these coordinates,
    # we use (0, 0) at creation then perform a move operation right after mapping.
    # XXX: we need to do the same for `border_width`.
    xcb_create_window(
        conn,
        depth,
        win_id,
        screen.root,
        0,
        0,
        width,
        height,
        border_width,
        class,
        screen.root_visual,
        0,
        C_NULL,
    )
    window = XCBWindow(conn, win_id, screen, nothing, nothing, (0, 0), (width, height), 1, Dict{Symbol,UInt32}())
    change_property(window, :WM_PROTOCOLS, get_atom!(window, :WM_DELETE_WINDOW), XCB_ATOM_ATOM)

    !with_decorations && hide_decorations!(window)

    set_event_mask(window, keys(event_type_bits))
    set_attributes(window, attributes, values)
    set_title(window, window_title)
    set_icon_title(window, something(icon_title, window_title))
    request_frame_extents(window)
    if map
        map_window(window)
        # Some implementations may not send frame extents while window is unmapped,
        # so we do it right after.
        process_property_notifications!(() -> window.frame_extents !== nothing, window)
    end

    offset = (offset[1], -offset[2]) # remap offset origin from bottom-left to top-left
    position = screen_center(screen, window) .+ offset
    move_window_to(window, position)
    @atomic window.position = position
    Base.finalizer(x -> @check(:error, xcb_destroy_window(x.conn, x.id)), window)
end

"""
Create a new window on the current screen.
"""
XCBWindow(conn::Connection; kwargs...) = XCBWindow(conn, current_screen(conn); kwargs...)

current_screen(conn) = unsafe_load(xcb_setup_roots_iterator(Setup(conn)).data)

function request_frame_extents(window::XCBWindow)
    atom = get_atom!(window, :_NET_REQUEST_FRAME_EXTENTS)
    data = xcb_client_message_data_t(ntuple(_ -> 0, 20))
    event = Ref(xcb_client_message_event_t(XCB_CLIENT_MESSAGE, 32, 0, window.id, atom, data))
    mask = XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY | XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT
    GC.@preserve event begin
        ptr = Ptr{Cchar}(unsafe_convert(Ptr{xcb_client_message_event_t}, event))
        @check xcb_send_event(window.conn, false#=propagate=#, root_window(window), mask, ptr)
        flush(window.conn)
    end
end

function process_property_notifications!(f, window)
    # Note that we are draining EVERY event from the queue,
    # regardless of their type.
    while !f()
        ptr = xcb_poll_for_event(window.conn)
        ptr == C_NULL && (yield(); continue)
        rt = response_type(unsafe_load(ptr))
        rt == XCB_PROPERTY_NOTIFY || continue
        event = unsafe_load(Ptr{xcb_property_notify_event_t}(ptr))
        process_property_notify!(window, event)
    end
end

root_window(window::XCBWindow) = window.screen.root

function get_parent(conn::Connection, window::xcb_window_t)
    cookie = xcb_query_tree_unchecked(conn, window)
    reply = load_and_free(xcb_query_tree_reply(conn, cookie, C_NULL))
    reply === nothing && return nothing
    return reply.parent
end

get_parent(window::XCBWindow) = get_parent(window.conn, window.id)

function screen_center(screen::xcb_screen_t, window::XCBWindow)
    target = Int.((screen.width_in_pixels, screen.height_in_pixels)) .÷ 2
    target .- window.extent .÷ 2
end

Base.:(==)(x::XCBWindow, y::XCBWindow) = x.id == y.id

Base.hash(window::XCBWindow, h::UInt) = hash(window.id, h)

function set_attributes(window::XCBWindow, attributes, values)
    values = values[sortperm(attributes)]
    list = zeros(UInt32, 32)
    setindex!.(Ref(list), values, 1:length(values))
    @flush @check xcb_change_window_attributes(window.conn, window.id, reduce(|, attributes; init = zero(UInt32)), list)
end

get_atom!(window::XCBWindow, name::Symbol) =
    get!(() -> get_atom(window.conn, name), window.atoms, name)

function get_atom_name!(window::XCBWindow, atom::xcb_atom_t)
    name = get_atom_name(window.conn, atom)::String
    window.atoms[Symbol(name)] = atom
    return name
end

function get_atom(conn::Connection, name::Symbol)
    only_if_exists = true
    atom_string = string(name)
    cookie = xcb_intern_atom(conn, only_if_exists, length(atom_string), atom_string)
    reply = load_and_free(xcb_intern_atom_reply(conn, cookie, C_NULL))
    reply === nothing && error("Atom '$atom_string' does not exist")
    return reply.atom
end

function get_atom_name(conn::Connection, atom::xcb_atom_t)
    cookie = xcb_get_atom_name(conn, atom)
    reply = xcb_get_atom_name_reply(conn, cookie, C_NULL)
    ptr = xcb_get_atom_name_name(reply)
    ptr == C_NULL && return nothing
    n = xcb_get_atom_name_name_length(reply)
    str = read_string(ptr, n)
    Libc.free(reply)
    return str
end

read_string(ptr, n) = String(unsafe_wrap(Array, Ptr{UInt8}(ptr), n))

function change_property(window::XCBWindow, name, value, type)
    @assert !ismutable(value) # not handled yet
    isa(name, Symbol) && (name = get_atom!(window, name))
    isa(type, Symbol) && (type = get_atom!(window, type))
    mode = XCB_PROP_MODE_REPLACE
    elsize = property_data_elsize(value)
    @check xcb_change_property(window.conn, XCB_PROP_MODE_REPLACE, window.id, name, type, elsize, property_data_length(value), Ref(value))
end

property_data_length(tuple::Tuple) = length(tuple)
property_data_length(nt::NamedTuple) = length(nt)
property_data_length(value) = 1

property_data_elsize(value) = 8sizeof(value) ÷ property_data_length(value)

delete_property(window::XCBWindow, name, type, ::Type{T}; dst = window.id, offset = 0, length = 1) where {T} = _get_property(window, name, type, T; dst, delete = true, offset, length)
get_property(window::XCBWindow, name, type, ::Type{T}; dst = window.id, offset = 0, length = 1) where {T} = _get_property(window, name, type, T; dst, delete = false, offset, length)
function _get_property(window::XCBWindow, name, type, ::Type{T}; dst = window.id, delete = false, offset = 0, length = 1) where {T}
    isa(name, Symbol) && (name = get_atom!(window, name))
    isa(type, Symbol) && (type = get_atom!(window, type))
    cookie = xcb_get_property(window.conn, delete, dst, name, type, offset, length)
    reply = xcb_get_property_reply(window.conn, cookie, C_NULL)
    reply == C_NULL && return nothing
    try
        load_property_value(T, reply, xcb_get_property_value(reply))
    finally
        Libc.free(reply)
    end
end

function load_property_value(::Type{T}, reply::Ptr{xcb_get_property_reply_t}, value) where {T}
    unsafe_load(Ptr{T}(value))
end

function load_property_value(::Type{Vector{T}}, reply::Ptr{xcb_get_property_reply_t}, value) where {T}
    n = xcb_get_property_value_length(reply)
    unsafe_wrap(Array, Ptr{T}(value), n)
end

function get_extent(id::xcb_window_t, conn)
    geometry_cookie = xcb_get_geometry(conn, id)
    data = load_and_free(xcb_get_geometry_reply(conn, geometry_cookie, C_NULL))
    data === nothing && return (zero(UInt16), zero(UInt16))
    data.width, data.height
end

get_extent(window::XCBWindow) = get_extent(window.id, window.conn)
get_position(window::XCBWindow) = position_from_local_coordinates(window, (0, 0))

function frame_offset(window::XCBWindow)
    window.frame_extents === nothing && return (0, 0)
    left, right, top, bottom = window.frame_extents
    return (-left, -top)
end

function position_from_local_coordinates(window::XCBWindow, (x, y))
    cookie = xcb_translate_coordinates(window.conn, window.id, window.screen.root, x, y)
    (; dst_x, dst_y) = load_and_free(xcb_translate_coordinates_reply(window.conn, cookie, C_NULL))
    Int64.((dst_x, dst_y))
end

@enum WindowCorner begin
    WINDOW_CORNER_BOTTOM_LEFT = 1
    WINDOW_CORNER_BOTTOM_RIGHT = 2
    WINDOW_CORNER_TOP_LEFT = 3
    WINDOW_CORNER_TOP_RIGHT = 4
end

Base.rand(::Type{WindowCorner}) = WindowCorner(rand(1:4))

function resize_window(window::XCBWindow, extent; movement = nothing, corner::Union{Nothing, WindowCorner} = nothing)
    if corner !== nothing
        movement === nothing || throw(ArgumentError("`movement` and `corner` parameters must not be supplied simultaneously"))
        i = Int(corner)
        fac = 2 .- (mod1(i, 2), cld(5 - i, 2))
        new_position = window.position .- fac .* (extent .- window.extent)
    else
        offset = (extent .- window.extent) .÷ 2
        new_position = window.position .- offset .+ something(movement, (0, 0))
    end
    resize_window(window, new_position, extent)
end

apply_frame_offset(window, position) = max.(Int.(position) .+ frame_offset(window), 0)

function resize_window(window::XCBWindow, position, extent)
    mask = XCB_CONFIG_WINDOW_X | XCB_CONFIG_WINDOW_Y | XCB_CONFIG_WINDOW_WIDTH | XCB_CONFIG_WINDOW_HEIGHT
    position = apply_frame_offset(window, position)
    values = UInt32[max.((position..., extent...), 0)...]
    @flush @check xcb_configure_window(window.conn, window.id, mask, values)
end

function move_window_to(window::XCBWindow, position)
    position = apply_frame_offset(window, position)
    @flush @check xcb_configure_window(window.conn, window.id, XCB_CONFIG_WINDOW_X | XCB_CONFIG_WINDOW_Y, UInt32[position...])
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

const base_event_mask = XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT | XCB_EVENT_MASK_KEYMAP_STATE | XCB_EVENT_MASK_STRUCTURE_NOTIFY | XCB_EVENT_MASK_PROPERTY_CHANGE

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
    mask |= XCB_EVENT_MASK_VISIBILITY_CHANGE
    set_attributes(window, [XCB_CW_EVENT_MASK], [mask])
end

attach_graphics_context!(window::XCBWindow, gc::GraphicsContext) = setproperty!(window, :gc, gc)

GraphicsContext(window::XCBWindow; kwargs...) = GraphicsContext(window.conn, window.id; kwargs...)

function hide_decorations!(window::XCBWindow)
    data = (; flags = UInt32(2), functions = UInt32(0), decorations = UInt32(0), input_mode = Int32(0), status = UInt32(0))
    change_property(window, :_MOTIF_WM_HINTS, data, :_MOTIF_WM_HINTS)
    window.frame_extents = nothing # we lose the frame
end

get_frame_extents(window::XCBWindow) =
    get_property(window, :_NET_FRAME_EXTENTS, XCB_ATOM_CARDINAL, NTuple{4,UInt32}, length = 4)

function get_supported_net_atoms(window::XCBWindow)
    get_property(window, :_NET_SUPPORTED, XCB_ATOM_ATOM, Vector{xcb_atom_t}; dst = window.screen.root, length = typemax(UInt16))
end
