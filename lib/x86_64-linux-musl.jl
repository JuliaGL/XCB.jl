const xcb_connection_t = Cvoid

"""
    xcb_generic_iterator_t

Generic iterator.

A generic iterator structure.

| Field | Note                           |
| :---- | :----------------------------- |
| data  | Data of the current iterator   |
| rem   | remaining elements             |
| index | index of the current iterator  |
"""
struct xcb_generic_iterator_t
    data::Ptr{Cvoid}
    rem::Cint
    index::Cint
end

"""
    xcb_generic_reply_t

Generic reply.

A generic reply structure.

| Field           | Note                    |
| :-------------- | :---------------------- |
| response\\_type | Type of the response    |
| pad0            | Padding                 |
| sequence        | Sequence number         |
| length          | Length of the response  |
"""
struct xcb_generic_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
end

"""
    xcb_generic_event_t

Generic event.

A generic event structure.

| Field           | Note                  |
| :-------------- | :-------------------- |
| response\\_type | Type of the response  |
| pad0            | Padding               |
| sequence        | Sequence number       |
| pad             | Padding               |
| full\\_sequence | full sequence         |
"""
struct xcb_generic_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    pad::NTuple{7, UInt32}
    full_sequence::UInt32
end

"""
    xcb_raw_generic_event_t

Raw Generic event.

A generic event structure as used on the wire, i.e., without the full\\_sequence field

| Field           | Note                  |
| :-------------- | :-------------------- |
| response\\_type | Type of the response  |
| pad0            | Padding               |
| sequence        | Sequence number       |
| pad             | Padding               |
"""
struct xcb_raw_generic_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    pad::NTuple{7, UInt32}
end

"""
    xcb_ge_event_t

GE event

An event as sent by the XGE extension. The length field specifies the number of 4-byte blocks trailing the struct.

\\deprecated Since some fields in this struct have unfortunate names, it is recommended to use [`xcb_ge_generic_event_t`](@ref) instead.

| Field           | Note                  |
| :-------------- | :-------------------- |
| response\\_type | Type of the response  |
| pad0            | Padding               |
| sequence        | Sequence number       |
| pad             | Padding               |
| full\\_sequence | full sequence         |
"""
struct xcb_ge_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    event_type::UInt16
    pad1::UInt16
    pad::NTuple{5, UInt32}
    full_sequence::UInt32
end

"""
    xcb_generic_error_t

Generic error.

A generic error structure.

| Field           | Note                                               |
| :-------------- | :------------------------------------------------- |
| response\\_type | Type of the response                               |
| error\\_code    | Error code                                         |
| sequence        | Sequence number                                    |
| minor\\_code    | < Resource ID for requests with side effects only  |
| major\\_code    | < Minor opcode of the failed request               |
| pad0            | < Major opcode of the failed request               |
| pad             | Padding                                            |
| full\\_sequence | full sequence                                      |
"""
struct xcb_generic_error_t
    response_type::UInt8
    error_code::UInt8
    sequence::UInt16
    resource_id::UInt32
    minor_code::UInt16
    major_code::UInt8
    pad0::UInt8
    pad::NTuple{5, UInt32}
    full_sequence::UInt32
end

"""
    xcb_void_cookie_t

Generic cookie.

A generic cookie structure.

| Field    | Note             |
| :------- | :--------------- |
| sequence | Sequence number  |
"""
struct xcb_void_cookie_t
    sequence::Cuint
end

"""
    xcb_char2b_t

[`xcb_char2b_t`](@ref)
"""
struct xcb_char2b_t
    byte1::UInt8
    byte2::UInt8
end

"""
    xcb_char2b_iterator_t

[`xcb_char2b_iterator_t`](@ref)
"""
struct xcb_char2b_iterator_t
    data::Ptr{xcb_char2b_t}
    rem::Cint
    index::Cint
end

const xcb_window_t = UInt32

"""
    xcb_window_iterator_t

[`xcb_window_iterator_t`](@ref)
"""
struct xcb_window_iterator_t
    data::Ptr{xcb_window_t}
    rem::Cint
    index::Cint
end

const xcb_pixmap_t = UInt32

"""
    xcb_pixmap_iterator_t

[`xcb_pixmap_iterator_t`](@ref)
"""
struct xcb_pixmap_iterator_t
    data::Ptr{xcb_pixmap_t}
    rem::Cint
    index::Cint
end

const xcb_cursor_t = UInt32

"""
    xcb_cursor_iterator_t

[`xcb_cursor_iterator_t`](@ref)
"""
struct xcb_cursor_iterator_t
    data::Ptr{xcb_cursor_t}
    rem::Cint
    index::Cint
end

const xcb_font_t = UInt32

"""
    xcb_font_iterator_t

[`xcb_font_iterator_t`](@ref)
"""
struct xcb_font_iterator_t
    data::Ptr{xcb_font_t}
    rem::Cint
    index::Cint
end

const xcb_gcontext_t = UInt32

"""
    xcb_gcontext_iterator_t

[`xcb_gcontext_iterator_t`](@ref)
"""
struct xcb_gcontext_iterator_t
    data::Ptr{xcb_gcontext_t}
    rem::Cint
    index::Cint
end

const xcb_colormap_t = UInt32

"""
    xcb_colormap_iterator_t

[`xcb_colormap_iterator_t`](@ref)
"""
struct xcb_colormap_iterator_t
    data::Ptr{xcb_colormap_t}
    rem::Cint
    index::Cint
end

const xcb_atom_t = UInt32

"""
    xcb_atom_iterator_t

[`xcb_atom_iterator_t`](@ref)
"""
struct xcb_atom_iterator_t
    data::Ptr{xcb_atom_t}
    rem::Cint
    index::Cint
end

const xcb_drawable_t = UInt32

"""
    xcb_drawable_iterator_t

[`xcb_drawable_iterator_t`](@ref)
"""
struct xcb_drawable_iterator_t
    data::Ptr{xcb_drawable_t}
    rem::Cint
    index::Cint
end

const xcb_fontable_t = UInt32

"""
    xcb_fontable_iterator_t

[`xcb_fontable_iterator_t`](@ref)
"""
struct xcb_fontable_iterator_t
    data::Ptr{xcb_fontable_t}
    rem::Cint
    index::Cint
end

const xcb_bool32_t = UInt32

"""
    xcb_bool32_iterator_t

[`xcb_bool32_iterator_t`](@ref)
"""
struct xcb_bool32_iterator_t
    data::Ptr{xcb_bool32_t}
    rem::Cint
    index::Cint
end

const xcb_visualid_t = UInt32

"""
    xcb_visualid_iterator_t

[`xcb_visualid_iterator_t`](@ref)
"""
struct xcb_visualid_iterator_t
    data::Ptr{xcb_visualid_t}
    rem::Cint
    index::Cint
end

const xcb_timestamp_t = UInt32

"""
    xcb_timestamp_iterator_t

[`xcb_timestamp_iterator_t`](@ref)
"""
struct xcb_timestamp_iterator_t
    data::Ptr{xcb_timestamp_t}
    rem::Cint
    index::Cint
end

const xcb_keysym_t = UInt32

"""
    xcb_keysym_iterator_t

[`xcb_keysym_iterator_t`](@ref)
"""
struct xcb_keysym_iterator_t
    data::Ptr{xcb_keysym_t}
    rem::Cint
    index::Cint
end

const xcb_keycode_t = UInt8

"""
    xcb_keycode_iterator_t

[`xcb_keycode_iterator_t`](@ref)
"""
struct xcb_keycode_iterator_t
    data::Ptr{xcb_keycode_t}
    rem::Cint
    index::Cint
end

const xcb_keycode32_t = UInt32

"""
    xcb_keycode32_iterator_t

[`xcb_keycode32_iterator_t`](@ref)
"""
struct xcb_keycode32_iterator_t
    data::Ptr{xcb_keycode32_t}
    rem::Cint
    index::Cint
end

const xcb_button_t = UInt8

"""
    xcb_button_iterator_t

[`xcb_button_iterator_t`](@ref)
"""
struct xcb_button_iterator_t
    data::Ptr{xcb_button_t}
    rem::Cint
    index::Cint
end

"""
    xcb_point_t

[`xcb_point_t`](@ref)
"""
struct xcb_point_t
    x::Int16
    y::Int16
end

"""
    xcb_point_iterator_t

[`xcb_point_iterator_t`](@ref)
"""
struct xcb_point_iterator_t
    data::Ptr{xcb_point_t}
    rem::Cint
    index::Cint
end

"""
    xcb_rectangle_t

[`xcb_rectangle_t`](@ref)
"""
struct xcb_rectangle_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
end

"""
    xcb_rectangle_iterator_t

[`xcb_rectangle_iterator_t`](@ref)
"""
struct xcb_rectangle_iterator_t
    data::Ptr{xcb_rectangle_t}
    rem::Cint
    index::Cint
end

"""
    xcb_arc_t

[`xcb_arc_t`](@ref)
"""
struct xcb_arc_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    angle1::Int16
    angle2::Int16
end

"""
    xcb_arc_iterator_t

[`xcb_arc_iterator_t`](@ref)
"""
struct xcb_arc_iterator_t
    data::Ptr{xcb_arc_t}
    rem::Cint
    index::Cint
end

"""
    xcb_format_t

[`xcb_format_t`](@ref)
"""
struct xcb_format_t
    depth::UInt8
    bits_per_pixel::UInt8
    scanline_pad::UInt8
    pad0::NTuple{5, UInt8}
end

"""
    xcb_format_iterator_t

[`xcb_format_iterator_t`](@ref)
"""
struct xcb_format_iterator_t
    data::Ptr{xcb_format_t}
    rem::Cint
    index::Cint
end

@enum xcb_visual_class_t::UInt32 begin
    XCB_VISUAL_CLASS_STATIC_GRAY = 0
    XCB_VISUAL_CLASS_GRAY_SCALE = 1
    XCB_VISUAL_CLASS_STATIC_COLOR = 2
    XCB_VISUAL_CLASS_PSEUDO_COLOR = 3
    XCB_VISUAL_CLASS_TRUE_COLOR = 4
    XCB_VISUAL_CLASS_DIRECT_COLOR = 5
end

"""
    xcb_visualtype_t

[`xcb_visualtype_t`](@ref)
"""
struct xcb_visualtype_t
    visual_id::xcb_visualid_t
    _class::UInt8
    bits_per_rgb_value::UInt8
    colormap_entries::UInt16
    red_mask::UInt32
    green_mask::UInt32
    blue_mask::UInt32
    pad0::NTuple{4, UInt8}
end

"""
    xcb_visualtype_iterator_t

[`xcb_visualtype_iterator_t`](@ref)
"""
struct xcb_visualtype_iterator_t
    data::Ptr{xcb_visualtype_t}
    rem::Cint
    index::Cint
end

"""
    xcb_depth_t

[`xcb_depth_t`](@ref)
"""
struct xcb_depth_t
    depth::UInt8
    pad0::UInt8
    visuals_len::UInt16
    pad1::NTuple{4, UInt8}
end

"""
    xcb_depth_iterator_t

[`xcb_depth_iterator_t`](@ref)
"""
struct xcb_depth_iterator_t
    data::Ptr{xcb_depth_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_event_mask_t::UInt32 begin
    XCB_EVENT_MASK_NO_EVENT = 0
    XCB_EVENT_MASK_KEY_PRESS = 1
    XCB_EVENT_MASK_KEY_RELEASE = 2
    XCB_EVENT_MASK_BUTTON_PRESS = 4
    XCB_EVENT_MASK_BUTTON_RELEASE = 8
    XCB_EVENT_MASK_ENTER_WINDOW = 16
    XCB_EVENT_MASK_LEAVE_WINDOW = 32
    XCB_EVENT_MASK_POINTER_MOTION = 64
    XCB_EVENT_MASK_POINTER_MOTION_HINT = 128
    XCB_EVENT_MASK_BUTTON_1_MOTION = 256
    XCB_EVENT_MASK_BUTTON_2_MOTION = 512
    XCB_EVENT_MASK_BUTTON_3_MOTION = 1024
    XCB_EVENT_MASK_BUTTON_4_MOTION = 2048
    XCB_EVENT_MASK_BUTTON_5_MOTION = 4096
    XCB_EVENT_MASK_BUTTON_MOTION = 8192
    XCB_EVENT_MASK_KEYMAP_STATE = 16384
    XCB_EVENT_MASK_EXPOSURE = 32768
    XCB_EVENT_MASK_VISIBILITY_CHANGE = 65536
    XCB_EVENT_MASK_STRUCTURE_NOTIFY = 131072
    XCB_EVENT_MASK_RESIZE_REDIRECT = 262144
    XCB_EVENT_MASK_SUBSTRUCTURE_NOTIFY = 524288
    XCB_EVENT_MASK_SUBSTRUCTURE_REDIRECT = 1048576
    XCB_EVENT_MASK_FOCUS_CHANGE = 2097152
    XCB_EVENT_MASK_PROPERTY_CHANGE = 4194304
    XCB_EVENT_MASK_COLOR_MAP_CHANGE = 8388608
    XCB_EVENT_MASK_OWNER_GRAB_BUTTON = 16777216
end

@enum xcb_backing_store_t::UInt32 begin
    XCB_BACKING_STORE_NOT_USEFUL = 0
    XCB_BACKING_STORE_WHEN_MAPPED = 1
    XCB_BACKING_STORE_ALWAYS = 2
end

"""
    xcb_screen_t

[`xcb_screen_t`](@ref)
"""
struct xcb_screen_t
    root::xcb_window_t
    default_colormap::xcb_colormap_t
    white_pixel::UInt32
    black_pixel::UInt32
    current_input_masks::UInt32
    width_in_pixels::UInt16
    height_in_pixels::UInt16
    width_in_millimeters::UInt16
    height_in_millimeters::UInt16
    min_installed_maps::UInt16
    max_installed_maps::UInt16
    root_visual::xcb_visualid_t
    backing_stores::UInt8
    save_unders::UInt8
    root_depth::UInt8
    allowed_depths_len::UInt8
end

"""
    xcb_screen_iterator_t

[`xcb_screen_iterator_t`](@ref)
"""
struct xcb_screen_iterator_t
    data::Ptr{xcb_screen_t}
    rem::Cint
    index::Cint
end

"""
    xcb_setup_request_t

[`xcb_setup_request_t`](@ref)
"""
struct xcb_setup_request_t
    byte_order::UInt8
    pad0::UInt8
    protocol_major_version::UInt16
    protocol_minor_version::UInt16
    authorization_protocol_name_len::UInt16
    authorization_protocol_data_len::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_setup_request_iterator_t

[`xcb_setup_request_iterator_t`](@ref)
"""
struct xcb_setup_request_iterator_t
    data::Ptr{xcb_setup_request_t}
    rem::Cint
    index::Cint
end

"""
    xcb_setup_failed_t

[`xcb_setup_failed_t`](@ref)
"""
struct xcb_setup_failed_t
    status::UInt8
    reason_len::UInt8
    protocol_major_version::UInt16
    protocol_minor_version::UInt16
    length::UInt16
end

"""
    xcb_setup_failed_iterator_t

[`xcb_setup_failed_iterator_t`](@ref)
"""
struct xcb_setup_failed_iterator_t
    data::Ptr{xcb_setup_failed_t}
    rem::Cint
    index::Cint
end

"""
    xcb_setup_authenticate_t

[`xcb_setup_authenticate_t`](@ref)
"""
struct xcb_setup_authenticate_t
    status::UInt8
    pad0::NTuple{5, UInt8}
    length::UInt16
end

"""
    xcb_setup_authenticate_iterator_t

[`xcb_setup_authenticate_iterator_t`](@ref)
"""
struct xcb_setup_authenticate_iterator_t
    data::Ptr{xcb_setup_authenticate_t}
    rem::Cint
    index::Cint
end

@enum xcb_image_order_t::UInt32 begin
    XCB_IMAGE_ORDER_LSB_FIRST = 0
    XCB_IMAGE_ORDER_MSB_FIRST = 1
end

"""
    xcb_setup_t

[`xcb_setup_t`](@ref)
"""
struct xcb_setup_t
    status::UInt8
    pad0::UInt8
    protocol_major_version::UInt16
    protocol_minor_version::UInt16
    length::UInt16
    release_number::UInt32
    resource_id_base::UInt32
    resource_id_mask::UInt32
    motion_buffer_size::UInt32
    vendor_len::UInt16
    maximum_request_length::UInt16
    roots_len::UInt8
    pixmap_formats_len::UInt8
    image_byte_order::UInt8
    bitmap_format_bit_order::UInt8
    bitmap_format_scanline_unit::UInt8
    bitmap_format_scanline_pad::UInt8
    min_keycode::xcb_keycode_t
    max_keycode::xcb_keycode_t
    pad1::NTuple{4, UInt8}
end

"""
    xcb_setup_iterator_t

[`xcb_setup_iterator_t`](@ref)
"""
struct xcb_setup_iterator_t
    data::Ptr{xcb_setup_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_mod_mask_t::UInt32 begin
    XCB_MOD_MASK_SHIFT = 1
    XCB_MOD_MASK_LOCK = 2
    XCB_MOD_MASK_CONTROL = 4
    XCB_MOD_MASK_1 = 8
    XCB_MOD_MASK_2 = 16
    XCB_MOD_MASK_3 = 32
    XCB_MOD_MASK_4 = 64
    XCB_MOD_MASK_5 = 128
    XCB_MOD_MASK_ANY = 32768
end

@bitmask xcb_key_but_mask_t::UInt32 begin
    XCB_KEY_BUT_MASK_SHIFT = 1
    XCB_KEY_BUT_MASK_LOCK = 2
    XCB_KEY_BUT_MASK_CONTROL = 4
    XCB_KEY_BUT_MASK_MOD_1 = 8
    XCB_KEY_BUT_MASK_MOD_2 = 16
    XCB_KEY_BUT_MASK_MOD_3 = 32
    XCB_KEY_BUT_MASK_MOD_4 = 64
    XCB_KEY_BUT_MASK_MOD_5 = 128
    XCB_KEY_BUT_MASK_BUTTON_1 = 256
    XCB_KEY_BUT_MASK_BUTTON_2 = 512
    XCB_KEY_BUT_MASK_BUTTON_3 = 1024
    XCB_KEY_BUT_MASK_BUTTON_4 = 2048
    XCB_KEY_BUT_MASK_BUTTON_5 = 4096
end

@enum xcb_window_enum_t::UInt32 begin
    XCB_WINDOW_NONE = 0
end

"""
    xcb_key_press_event_t

[`xcb_key_press_event_t`](@ref)
"""
struct xcb_key_press_event_t
    response_type::UInt8
    detail::xcb_keycode_t
    sequence::UInt16
    time::xcb_timestamp_t
    root::xcb_window_t
    event::xcb_window_t
    child::xcb_window_t
    root_x::Int16
    root_y::Int16
    event_x::Int16
    event_y::Int16
    state::UInt16
    same_screen::UInt8
    pad0::UInt8
end

"""
[`xcb_key_press_event_t`](@ref)
"""
const xcb_key_release_event_t = xcb_key_press_event_t

@bitmask xcb_button_mask_t::UInt32 begin
    XCB_BUTTON_MASK_1 = 256
    XCB_BUTTON_MASK_2 = 512
    XCB_BUTTON_MASK_3 = 1024
    XCB_BUTTON_MASK_4 = 2048
    XCB_BUTTON_MASK_5 = 4096
    XCB_BUTTON_MASK_ANY = 32768
end

"""
    xcb_button_press_event_t

[`xcb_button_press_event_t`](@ref)
"""
struct xcb_button_press_event_t
    response_type::UInt8
    detail::xcb_button_t
    sequence::UInt16
    time::xcb_timestamp_t
    root::xcb_window_t
    event::xcb_window_t
    child::xcb_window_t
    root_x::Int16
    root_y::Int16
    event_x::Int16
    event_y::Int16
    state::UInt16
    same_screen::UInt8
    pad0::UInt8
end

"""
[`xcb_button_press_event_t`](@ref)
"""
const xcb_button_release_event_t = xcb_button_press_event_t

@enum xcb_motion_t::UInt32 begin
    XCB_MOTION_NORMAL = 0
    XCB_MOTION_HINT = 1
end

"""
    xcb_motion_notify_event_t

[`xcb_motion_notify_event_t`](@ref)
"""
struct xcb_motion_notify_event_t
    response_type::UInt8
    detail::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    root::xcb_window_t
    event::xcb_window_t
    child::xcb_window_t
    root_x::Int16
    root_y::Int16
    event_x::Int16
    event_y::Int16
    state::UInt16
    same_screen::UInt8
    pad0::UInt8
end

@enum xcb_notify_detail_t::UInt32 begin
    XCB_NOTIFY_DETAIL_ANCESTOR = 0
    XCB_NOTIFY_DETAIL_VIRTUAL = 1
    XCB_NOTIFY_DETAIL_INFERIOR = 2
    XCB_NOTIFY_DETAIL_NONLINEAR = 3
    XCB_NOTIFY_DETAIL_NONLINEAR_VIRTUAL = 4
    XCB_NOTIFY_DETAIL_POINTER = 5
    XCB_NOTIFY_DETAIL_POINTER_ROOT = 6
    XCB_NOTIFY_DETAIL_NONE = 7
end

@enum xcb_notify_mode_t::UInt32 begin
    XCB_NOTIFY_MODE_NORMAL = 0
    XCB_NOTIFY_MODE_GRAB = 1
    XCB_NOTIFY_MODE_UNGRAB = 2
    XCB_NOTIFY_MODE_WHILE_GRABBED = 3
end

"""
    xcb_enter_notify_event_t

[`xcb_enter_notify_event_t`](@ref)
"""
struct xcb_enter_notify_event_t
    response_type::UInt8
    detail::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    root::xcb_window_t
    event::xcb_window_t
    child::xcb_window_t
    root_x::Int16
    root_y::Int16
    event_x::Int16
    event_y::Int16
    state::UInt16
    mode::UInt8
    same_screen_focus::UInt8
end

"""
[`xcb_enter_notify_event_t`](@ref)
"""
const xcb_leave_notify_event_t = xcb_enter_notify_event_t

"""
    xcb_focus_in_event_t

[`xcb_focus_in_event_t`](@ref)
"""
struct xcb_focus_in_event_t
    response_type::UInt8
    detail::UInt8
    sequence::UInt16
    event::xcb_window_t
    mode::UInt8
    pad0::NTuple{3, UInt8}
end

"""
[`xcb_focus_in_event_t`](@ref)
"""
const xcb_focus_out_event_t = xcb_focus_in_event_t

"""
    xcb_keymap_notify_event_t

[`xcb_keymap_notify_event_t`](@ref)
"""
struct xcb_keymap_notify_event_t
    response_type::UInt8
    keys::NTuple{31, UInt8}
end

"""
    xcb_expose_event_t

[`xcb_expose_event_t`](@ref)
"""
struct xcb_expose_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    window::xcb_window_t
    x::UInt16
    y::UInt16
    width::UInt16
    height::UInt16
    count::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_graphics_exposure_event_t

[`xcb_graphics_exposure_event_t`](@ref)
"""
struct xcb_graphics_exposure_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    drawable::xcb_drawable_t
    x::UInt16
    y::UInt16
    width::UInt16
    height::UInt16
    minor_opcode::UInt16
    count::UInt16
    major_opcode::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_no_exposure_event_t

[`xcb_no_exposure_event_t`](@ref)
"""
struct xcb_no_exposure_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    drawable::xcb_drawable_t
    minor_opcode::UInt16
    major_opcode::UInt8
    pad1::UInt8
end

@enum xcb_visibility_t::UInt32 begin
    XCB_VISIBILITY_UNOBSCURED = 0
    XCB_VISIBILITY_PARTIALLY_OBSCURED = 1
    XCB_VISIBILITY_FULLY_OBSCURED = 2
end

"""
    xcb_visibility_notify_event_t

[`xcb_visibility_notify_event_t`](@ref)
"""
struct xcb_visibility_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    window::xcb_window_t
    state::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_create_notify_event_t

[`xcb_create_notify_event_t`](@ref)
"""
struct xcb_create_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    parent::xcb_window_t
    window::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    border_width::UInt16
    override_redirect::UInt8
    pad1::UInt8
end

"""
    xcb_destroy_notify_event_t

[`xcb_destroy_notify_event_t`](@ref)
"""
struct xcb_destroy_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
end

"""
    xcb_unmap_notify_event_t

[`xcb_unmap_notify_event_t`](@ref)
"""
struct xcb_unmap_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    from_configure::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_map_notify_event_t

[`xcb_map_notify_event_t`](@ref)
"""
struct xcb_map_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    override_redirect::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_map_request_event_t

[`xcb_map_request_event_t`](@ref)
"""
struct xcb_map_request_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    parent::xcb_window_t
    window::xcb_window_t
end

"""
    xcb_reparent_notify_event_t

[`xcb_reparent_notify_event_t`](@ref)
"""
struct xcb_reparent_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    parent::xcb_window_t
    x::Int16
    y::Int16
    override_redirect::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_configure_notify_event_t

[`xcb_configure_notify_event_t`](@ref)
"""
struct xcb_configure_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    above_sibling::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    border_width::UInt16
    override_redirect::UInt8
    pad1::UInt8
end

"""
    xcb_configure_request_event_t

[`xcb_configure_request_event_t`](@ref)
"""
struct xcb_configure_request_event_t
    response_type::UInt8
    stack_mode::UInt8
    sequence::UInt16
    parent::xcb_window_t
    window::xcb_window_t
    sibling::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    border_width::UInt16
    value_mask::UInt16
end

"""
    xcb_gravity_notify_event_t

[`xcb_gravity_notify_event_t`](@ref)
"""
struct xcb_gravity_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    x::Int16
    y::Int16
end

"""
    xcb_resize_request_event_t

[`xcb_resize_request_event_t`](@ref)
"""
struct xcb_resize_request_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    window::xcb_window_t
    width::UInt16
    height::UInt16
end

@enum xcb_place_t::UInt32 begin
    XCB_PLACE_ON_TOP = 0
    XCB_PLACE_ON_BOTTOM = 1
end

"""
    xcb_circulate_notify_event_t

[`xcb_circulate_notify_event_t`](@ref)
"""
struct xcb_circulate_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    event::xcb_window_t
    window::xcb_window_t
    pad1::NTuple{4, UInt8}
    place::UInt8
    pad2::NTuple{3, UInt8}
end

"""
[`xcb_circulate_notify_event_t`](@ref)
"""
const xcb_circulate_request_event_t = xcb_circulate_notify_event_t

@enum xcb_property_t::UInt32 begin
    XCB_PROPERTY_NEW_VALUE = 0
    XCB_PROPERTY_DELETE = 1
end

"""
    xcb_property_notify_event_t

[`xcb_property_notify_event_t`](@ref)
"""
struct xcb_property_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    window::xcb_window_t
    atom::xcb_atom_t
    time::xcb_timestamp_t
    state::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_selection_clear_event_t

[`xcb_selection_clear_event_t`](@ref)
"""
struct xcb_selection_clear_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    owner::xcb_window_t
    selection::xcb_atom_t
end

@enum xcb_time_t::UInt32 begin
    XCB_TIME_CURRENT_TIME = 0
end

@enum xcb_atom_enum_t::UInt32 begin
    XCB_ATOM_NONE = 0
    # XCB_ATOM_ANY = 0
    XCB_ATOM_PRIMARY = 1
    XCB_ATOM_SECONDARY = 2
    XCB_ATOM_ARC = 3
    XCB_ATOM_ATOM = 4
    XCB_ATOM_BITMAP = 5
    XCB_ATOM_CARDINAL = 6
    XCB_ATOM_COLORMAP = 7
    XCB_ATOM_CURSOR = 8
    XCB_ATOM_CUT_BUFFER0 = 9
    XCB_ATOM_CUT_BUFFER1 = 10
    XCB_ATOM_CUT_BUFFER2 = 11
    XCB_ATOM_CUT_BUFFER3 = 12
    XCB_ATOM_CUT_BUFFER4 = 13
    XCB_ATOM_CUT_BUFFER5 = 14
    XCB_ATOM_CUT_BUFFER6 = 15
    XCB_ATOM_CUT_BUFFER7 = 16
    XCB_ATOM_DRAWABLE = 17
    XCB_ATOM_FONT = 18
    XCB_ATOM_INTEGER = 19
    XCB_ATOM_PIXMAP = 20
    XCB_ATOM_POINT = 21
    XCB_ATOM_RECTANGLE = 22
    XCB_ATOM_RESOURCE_MANAGER = 23
    XCB_ATOM_RGB_COLOR_MAP = 24
    XCB_ATOM_RGB_BEST_MAP = 25
    XCB_ATOM_RGB_BLUE_MAP = 26
    XCB_ATOM_RGB_DEFAULT_MAP = 27
    XCB_ATOM_RGB_GRAY_MAP = 28
    XCB_ATOM_RGB_GREEN_MAP = 29
    XCB_ATOM_RGB_RED_MAP = 30
    XCB_ATOM_STRING = 31
    XCB_ATOM_VISUALID = 32
    XCB_ATOM_WINDOW = 33
    XCB_ATOM_WM_COMMAND = 34
    XCB_ATOM_WM_HINTS = 35
    XCB_ATOM_WM_CLIENT_MACHINE = 36
    XCB_ATOM_WM_ICON_NAME = 37
    XCB_ATOM_WM_ICON_SIZE = 38
    XCB_ATOM_WM_NAME = 39
    XCB_ATOM_WM_NORMAL_HINTS = 40
    XCB_ATOM_WM_SIZE_HINTS = 41
    XCB_ATOM_WM_ZOOM_HINTS = 42
    XCB_ATOM_MIN_SPACE = 43
    XCB_ATOM_NORM_SPACE = 44
    XCB_ATOM_MAX_SPACE = 45
    XCB_ATOM_END_SPACE = 46
    XCB_ATOM_SUPERSCRIPT_X = 47
    XCB_ATOM_SUPERSCRIPT_Y = 48
    XCB_ATOM_SUBSCRIPT_X = 49
    XCB_ATOM_SUBSCRIPT_Y = 50
    XCB_ATOM_UNDERLINE_POSITION = 51
    XCB_ATOM_UNDERLINE_THICKNESS = 52
    XCB_ATOM_STRIKEOUT_ASCENT = 53
    XCB_ATOM_STRIKEOUT_DESCENT = 54
    XCB_ATOM_ITALIC_ANGLE = 55
    XCB_ATOM_X_HEIGHT = 56
    XCB_ATOM_QUAD_WIDTH = 57
    XCB_ATOM_WEIGHT = 58
    XCB_ATOM_POINT_SIZE = 59
    XCB_ATOM_RESOLUTION = 60
    XCB_ATOM_COPYRIGHT = 61
    XCB_ATOM_NOTICE = 62
    XCB_ATOM_FONT_NAME = 63
    XCB_ATOM_FAMILY_NAME = 64
    XCB_ATOM_FULL_NAME = 65
    XCB_ATOM_CAP_HEIGHT = 66
    XCB_ATOM_WM_CLASS = 67
    XCB_ATOM_WM_TRANSIENT_FOR = 68
end

"""
    xcb_selection_request_event_t

[`xcb_selection_request_event_t`](@ref)
"""
struct xcb_selection_request_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    owner::xcb_window_t
    requestor::xcb_window_t
    selection::xcb_atom_t
    target::xcb_atom_t
    property::xcb_atom_t
end

"""
    xcb_selection_notify_event_t

[`xcb_selection_notify_event_t`](@ref)
"""
struct xcb_selection_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    requestor::xcb_window_t
    selection::xcb_atom_t
    target::xcb_atom_t
    property::xcb_atom_t
end

@enum xcb_colormap_state_t::UInt32 begin
    XCB_COLORMAP_STATE_UNINSTALLED = 0
    XCB_COLORMAP_STATE_INSTALLED = 1
end

@enum xcb_colormap_enum_t::UInt32 begin
    XCB_COLORMAP_NONE = 0
end

"""
    xcb_colormap_notify_event_t

[`xcb_colormap_notify_event_t`](@ref)
"""
struct xcb_colormap_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    window::xcb_window_t
    colormap::xcb_colormap_t
    _new::UInt8
    state::UInt8
    pad1::NTuple{2, UInt8}
end

"""
    xcb_client_message_data_t

[`xcb_client_message_data_t`](@ref)
"""
struct xcb_client_message_data_t
    data::NTuple{20, UInt8}
end

function Base.getproperty(x::Ptr{xcb_client_message_data_t}, f::Symbol)
    f === :data8 && return Ptr{NTuple{20, UInt8}}(x + 0)
    f === :data16 && return Ptr{NTuple{10, UInt16}}(x + 0)
    f === :data32 && return Ptr{NTuple{5, UInt32}}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::xcb_client_message_data_t, f::Symbol)
    r = Ref{xcb_client_message_data_t}(x)
    ptr = Base.unsafe_convert(Ptr{xcb_client_message_data_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{xcb_client_message_data_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const __U_xcb_client_message_data_t = Union{NTuple{20, UInt8}, NTuple{10, UInt16}, NTuple{5, UInt32}}

function xcb_client_message_data_t(val::__U_xcb_client_message_data_t)
    ref = Ref{xcb_client_message_data_t}()
    ptr = Base.unsafe_convert(Ptr{xcb_client_message_data_t}, ref)
    if val isa NTuple{20, UInt8}
        ptr.data8 = val
    elseif val isa NTuple{10, UInt16}
        ptr.data16 = val
    elseif val isa NTuple{5, UInt32}
        ptr.data32 = val
    end
    ref[]
end

"""
    xcb_client_message_data_iterator_t

[`xcb_client_message_data_iterator_t`](@ref)
"""
struct xcb_client_message_data_iterator_t
    data::Ptr{xcb_client_message_data_t}
    rem::Cint
    index::Cint
end

"""
    xcb_client_message_event_t

[`xcb_client_message_event_t`](@ref)
"""
struct xcb_client_message_event_t
    response_type::UInt8
    format::UInt8
    sequence::UInt16
    window::xcb_window_t
    type::xcb_atom_t
    data::xcb_client_message_data_t
end

@enum xcb_mapping_t::UInt32 begin
    XCB_MAPPING_MODIFIER = 0
    XCB_MAPPING_KEYBOARD = 1
    XCB_MAPPING_POINTER = 2
end

"""
    xcb_mapping_notify_event_t

[`xcb_mapping_notify_event_t`](@ref)
"""
struct xcb_mapping_notify_event_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    request::UInt8
    first_keycode::xcb_keycode_t
    count::UInt8
    pad1::UInt8
end

"""
    xcb_ge_generic_event_t

[`xcb_ge_generic_event_t`](@ref)
"""
struct xcb_ge_generic_event_t
    response_type::UInt8
    extension::UInt8
    sequence::UInt16
    length::UInt32
    event_type::UInt16
    pad0::NTuple{22, UInt8}
    full_sequence::UInt32
end

"""
    xcb_request_error_t

[`xcb_request_error_t`](@ref)
"""
struct xcb_request_error_t
    response_type::UInt8
    error_code::UInt8
    sequence::UInt16
    bad_value::UInt32
    minor_opcode::UInt16
    major_opcode::UInt8
    pad0::UInt8
end

"""
    xcb_value_error_t

[`xcb_value_error_t`](@ref)
"""
struct xcb_value_error_t
    response_type::UInt8
    error_code::UInt8
    sequence::UInt16
    bad_value::UInt32
    minor_opcode::UInt16
    major_opcode::UInt8
    pad0::UInt8
end

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_window_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_pixmap_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_atom_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_cursor_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_font_error_t = xcb_value_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_match_error_t = xcb_request_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_drawable_error_t = xcb_value_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_access_error_t = xcb_request_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_alloc_error_t = xcb_request_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_colormap_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_g_context_error_t = xcb_value_error_t

"""
[`xcb_value_error_t`](@ref)
"""
const xcb_id_choice_error_t = xcb_value_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_name_error_t = xcb_request_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_length_error_t = xcb_request_error_t

"""
[`xcb_request_error_t`](@ref)
"""
const xcb_implementation_error_t = xcb_request_error_t

@enum xcb_window_class_t::UInt32 begin
    XCB_WINDOW_CLASS_COPY_FROM_PARENT = 0
    XCB_WINDOW_CLASS_INPUT_OUTPUT = 1
    XCB_WINDOW_CLASS_INPUT_ONLY = 2
end

@bitmask xcb_cw_t::UInt32 begin
    XCB_CW_BACK_PIXMAP = 1
    XCB_CW_BACK_PIXEL = 2
    XCB_CW_BORDER_PIXMAP = 4
    XCB_CW_BORDER_PIXEL = 8
    XCB_CW_BIT_GRAVITY = 16
    XCB_CW_WIN_GRAVITY = 32
    XCB_CW_BACKING_STORE = 64
    XCB_CW_BACKING_PLANES = 128
    XCB_CW_BACKING_PIXEL = 256
    XCB_CW_OVERRIDE_REDIRECT = 512
    XCB_CW_SAVE_UNDER = 1024
    XCB_CW_EVENT_MASK = 2048
    XCB_CW_DONT_PROPAGATE = 4096
    XCB_CW_COLORMAP = 8192
    XCB_CW_CURSOR = 16384
end

@enum xcb_back_pixmap_t::UInt32 begin
    XCB_BACK_PIXMAP_NONE = 0
    XCB_BACK_PIXMAP_PARENT_RELATIVE = 1
end

@enum xcb_gravity_t::UInt32 begin
    XCB_GRAVITY_BIT_FORGET = 0
    # XCB_GRAVITY_WIN_UNMAP = 0
    XCB_GRAVITY_NORTH_WEST = 1
    XCB_GRAVITY_NORTH = 2
    XCB_GRAVITY_NORTH_EAST = 3
    XCB_GRAVITY_WEST = 4
    XCB_GRAVITY_CENTER = 5
    XCB_GRAVITY_EAST = 6
    XCB_GRAVITY_SOUTH_WEST = 7
    XCB_GRAVITY_SOUTH = 8
    XCB_GRAVITY_SOUTH_EAST = 9
    XCB_GRAVITY_STATIC = 10
end

"""
    xcb_create_window_value_list_t

[`xcb_create_window_value_list_t`](@ref)
"""
struct xcb_create_window_value_list_t
    background_pixmap::xcb_pixmap_t
    background_pixel::UInt32
    border_pixmap::xcb_pixmap_t
    border_pixel::UInt32
    bit_gravity::UInt32
    win_gravity::UInt32
    backing_store::UInt32
    backing_planes::UInt32
    backing_pixel::UInt32
    override_redirect::xcb_bool32_t
    save_under::xcb_bool32_t
    event_mask::UInt32
    do_not_propogate_mask::UInt32
    colormap::xcb_colormap_t
    cursor::xcb_cursor_t
end

"""
    xcb_create_window_request_t

[`xcb_create_window_request_t`](@ref)
"""
struct xcb_create_window_request_t
    major_opcode::UInt8
    depth::UInt8
    length::UInt16
    wid::xcb_window_t
    parent::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    border_width::UInt16
    _class::UInt16
    visual::xcb_visualid_t
    value_mask::UInt32
end

"""
    xcb_change_window_attributes_value_list_t

[`xcb_change_window_attributes_value_list_t`](@ref)
"""
struct xcb_change_window_attributes_value_list_t
    background_pixmap::xcb_pixmap_t
    background_pixel::UInt32
    border_pixmap::xcb_pixmap_t
    border_pixel::UInt32
    bit_gravity::UInt32
    win_gravity::UInt32
    backing_store::UInt32
    backing_planes::UInt32
    backing_pixel::UInt32
    override_redirect::xcb_bool32_t
    save_under::xcb_bool32_t
    event_mask::UInt32
    do_not_propogate_mask::UInt32
    colormap::xcb_colormap_t
    cursor::xcb_cursor_t
end

"""
    xcb_change_window_attributes_request_t

[`xcb_change_window_attributes_request_t`](@ref)
"""
struct xcb_change_window_attributes_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    value_mask::UInt32
end

@enum xcb_map_state_t::UInt32 begin
    XCB_MAP_STATE_UNMAPPED = 0
    XCB_MAP_STATE_UNVIEWABLE = 1
    XCB_MAP_STATE_VIEWABLE = 2
end

"""
    xcb_get_window_attributes_cookie_t

[`xcb_get_window_attributes_cookie_t`](@ref)
"""
struct xcb_get_window_attributes_cookie_t
    sequence::Cuint
end

"""
    xcb_get_window_attributes_request_t

[`xcb_get_window_attributes_request_t`](@ref)
"""
struct xcb_get_window_attributes_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_get_window_attributes_reply_t

[`xcb_get_window_attributes_reply_t`](@ref)
"""
struct xcb_get_window_attributes_reply_t
    response_type::UInt8
    backing_store::UInt8
    sequence::UInt16
    length::UInt32
    visual::xcb_visualid_t
    _class::UInt16
    bit_gravity::UInt8
    win_gravity::UInt8
    backing_planes::UInt32
    backing_pixel::UInt32
    save_under::UInt8
    map_is_installed::UInt8
    map_state::UInt8
    override_redirect::UInt8
    colormap::xcb_colormap_t
    all_event_masks::UInt32
    your_event_mask::UInt32
    do_not_propagate_mask::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_destroy_window_request_t

[`xcb_destroy_window_request_t`](@ref)
"""
struct xcb_destroy_window_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_destroy_subwindows_request_t

[`xcb_destroy_subwindows_request_t`](@ref)
"""
struct xcb_destroy_subwindows_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

@enum xcb_set_mode_t::UInt32 begin
    XCB_SET_MODE_INSERT = 0
    XCB_SET_MODE_DELETE = 1
end

"""
    xcb_change_save_set_request_t

[`xcb_change_save_set_request_t`](@ref)
"""
struct xcb_change_save_set_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_reparent_window_request_t

[`xcb_reparent_window_request_t`](@ref)
"""
struct xcb_reparent_window_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    parent::xcb_window_t
    x::Int16
    y::Int16
end

"""
    xcb_map_window_request_t

[`xcb_map_window_request_t`](@ref)
"""
struct xcb_map_window_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_map_subwindows_request_t

[`xcb_map_subwindows_request_t`](@ref)
"""
struct xcb_map_subwindows_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_unmap_window_request_t

[`xcb_unmap_window_request_t`](@ref)
"""
struct xcb_unmap_window_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_unmap_subwindows_request_t

[`xcb_unmap_subwindows_request_t`](@ref)
"""
struct xcb_unmap_subwindows_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

@bitmask xcb_config_window_t::UInt32 begin
    XCB_CONFIG_WINDOW_X = 1
    XCB_CONFIG_WINDOW_Y = 2
    XCB_CONFIG_WINDOW_WIDTH = 4
    XCB_CONFIG_WINDOW_HEIGHT = 8
    XCB_CONFIG_WINDOW_BORDER_WIDTH = 16
    XCB_CONFIG_WINDOW_SIBLING = 32
    XCB_CONFIG_WINDOW_STACK_MODE = 64
end

@enum xcb_stack_mode_t::UInt32 begin
    XCB_STACK_MODE_ABOVE = 0
    XCB_STACK_MODE_BELOW = 1
    XCB_STACK_MODE_TOP_IF = 2
    XCB_STACK_MODE_BOTTOM_IF = 3
    XCB_STACK_MODE_OPPOSITE = 4
end

"""
    xcb_configure_window_value_list_t

[`xcb_configure_window_value_list_t`](@ref)
"""
struct xcb_configure_window_value_list_t
    x::Int32
    y::Int32
    width::UInt32
    height::UInt32
    border_width::UInt32
    sibling::xcb_window_t
    stack_mode::UInt32
end

"""
    xcb_configure_window_request_t

[`xcb_configure_window_request_t`](@ref)
"""
struct xcb_configure_window_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    value_mask::UInt16
    pad1::NTuple{2, UInt8}
end

@enum xcb_circulate_t::UInt32 begin
    XCB_CIRCULATE_RAISE_LOWEST = 0
    XCB_CIRCULATE_LOWER_HIGHEST = 1
end

"""
    xcb_circulate_window_request_t

[`xcb_circulate_window_request_t`](@ref)
"""
struct xcb_circulate_window_request_t
    major_opcode::UInt8
    direction::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_get_geometry_cookie_t

[`xcb_get_geometry_cookie_t`](@ref)
"""
struct xcb_get_geometry_cookie_t
    sequence::Cuint
end

"""
    xcb_get_geometry_request_t

[`xcb_get_geometry_request_t`](@ref)
"""
struct xcb_get_geometry_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
end

"""
    xcb_get_geometry_reply_t

[`xcb_get_geometry_reply_t`](@ref)
"""
struct xcb_get_geometry_reply_t
    response_type::UInt8
    depth::UInt8
    sequence::UInt16
    length::UInt32
    root::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    border_width::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_query_tree_cookie_t

[`xcb_query_tree_cookie_t`](@ref)
"""
struct xcb_query_tree_cookie_t
    sequence::Cuint
end

"""
    xcb_query_tree_request_t

[`xcb_query_tree_request_t`](@ref)
"""
struct xcb_query_tree_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_query_tree_reply_t

[`xcb_query_tree_reply_t`](@ref)
"""
struct xcb_query_tree_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    root::xcb_window_t
    parent::xcb_window_t
    children_len::UInt16
    pad1::NTuple{14, UInt8}
end

"""
    xcb_intern_atom_cookie_t

[`xcb_intern_atom_cookie_t`](@ref)
"""
struct xcb_intern_atom_cookie_t
    sequence::Cuint
end

"""
    xcb_intern_atom_request_t

[`xcb_intern_atom_request_t`](@ref)
"""
struct xcb_intern_atom_request_t
    major_opcode::UInt8
    only_if_exists::UInt8
    length::UInt16
    name_len::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_intern_atom_reply_t

[`xcb_intern_atom_reply_t`](@ref)
"""
struct xcb_intern_atom_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    atom::xcb_atom_t
end

"""
    xcb_get_atom_name_cookie_t

[`xcb_get_atom_name_cookie_t`](@ref)
"""
struct xcb_get_atom_name_cookie_t
    sequence::Cuint
end

"""
    xcb_get_atom_name_request_t

[`xcb_get_atom_name_request_t`](@ref)
"""
struct xcb_get_atom_name_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    atom::xcb_atom_t
end

"""
    xcb_get_atom_name_reply_t

[`xcb_get_atom_name_reply_t`](@ref)
"""
struct xcb_get_atom_name_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    name_len::UInt16
    pad1::NTuple{22, UInt8}
end

@enum xcb_prop_mode_t::UInt32 begin
    XCB_PROP_MODE_REPLACE = 0
    XCB_PROP_MODE_PREPEND = 1
    XCB_PROP_MODE_APPEND = 2
end

"""
    xcb_change_property_request_t

[`xcb_change_property_request_t`](@ref)
"""
struct xcb_change_property_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
    window::xcb_window_t
    property::xcb_atom_t
    type::xcb_atom_t
    format::UInt8
    pad0::NTuple{3, UInt8}
    data_len::UInt32
end

"""
    xcb_delete_property_request_t

[`xcb_delete_property_request_t`](@ref)
"""
struct xcb_delete_property_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    property::xcb_atom_t
end

@enum xcb_get_property_type_t::UInt32 begin
    XCB_GET_PROPERTY_TYPE_ANY = 0
end

"""
    xcb_get_property_cookie_t

[`xcb_get_property_cookie_t`](@ref)
"""
struct xcb_get_property_cookie_t
    sequence::Cuint
end

"""
    xcb_get_property_request_t

[`xcb_get_property_request_t`](@ref)
"""
struct xcb_get_property_request_t
    major_opcode::UInt8
    _delete::UInt8
    length::UInt16
    window::xcb_window_t
    property::xcb_atom_t
    type::xcb_atom_t
    long_offset::UInt32
    long_length::UInt32
end

"""
    xcb_get_property_reply_t

[`xcb_get_property_reply_t`](@ref)
"""
struct xcb_get_property_reply_t
    response_type::UInt8
    format::UInt8
    sequence::UInt16
    length::UInt32
    type::xcb_atom_t
    bytes_after::UInt32
    value_len::UInt32
    pad0::NTuple{12, UInt8}
end

"""
    xcb_list_properties_cookie_t

[`xcb_list_properties_cookie_t`](@ref)
"""
struct xcb_list_properties_cookie_t
    sequence::Cuint
end

"""
    xcb_list_properties_request_t

[`xcb_list_properties_request_t`](@ref)
"""
struct xcb_list_properties_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_list_properties_reply_t

[`xcb_list_properties_reply_t`](@ref)
"""
struct xcb_list_properties_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    atoms_len::UInt16
    pad1::NTuple{22, UInt8}
end

"""
    xcb_set_selection_owner_request_t

[`xcb_set_selection_owner_request_t`](@ref)
"""
struct xcb_set_selection_owner_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    owner::xcb_window_t
    selection::xcb_atom_t
    time::xcb_timestamp_t
end

"""
    xcb_get_selection_owner_cookie_t

[`xcb_get_selection_owner_cookie_t`](@ref)
"""
struct xcb_get_selection_owner_cookie_t
    sequence::Cuint
end

"""
    xcb_get_selection_owner_request_t

[`xcb_get_selection_owner_request_t`](@ref)
"""
struct xcb_get_selection_owner_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    selection::xcb_atom_t
end

"""
    xcb_get_selection_owner_reply_t

[`xcb_get_selection_owner_reply_t`](@ref)
"""
struct xcb_get_selection_owner_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    owner::xcb_window_t
end

"""
    xcb_convert_selection_request_t

[`xcb_convert_selection_request_t`](@ref)
"""
struct xcb_convert_selection_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    requestor::xcb_window_t
    selection::xcb_atom_t
    target::xcb_atom_t
    property::xcb_atom_t
    time::xcb_timestamp_t
end

@enum xcb_send_event_dest_t::UInt32 begin
    XCB_SEND_EVENT_DEST_POINTER_WINDOW = 0
    XCB_SEND_EVENT_DEST_ITEM_FOCUS = 1
end

"""
    xcb_send_event_request_t

[`xcb_send_event_request_t`](@ref)
"""
struct xcb_send_event_request_t
    major_opcode::UInt8
    propagate::UInt8
    length::UInt16
    destination::xcb_window_t
    event_mask::UInt32
    event::NTuple{32, Cchar}
end

@enum xcb_grab_mode_t::UInt32 begin
    XCB_GRAB_MODE_SYNC = 0
    XCB_GRAB_MODE_ASYNC = 1
end

@enum xcb_grab_status_t::UInt32 begin
    XCB_GRAB_STATUS_SUCCESS = 0
    XCB_GRAB_STATUS_ALREADY_GRABBED = 1
    XCB_GRAB_STATUS_INVALID_TIME = 2
    XCB_GRAB_STATUS_NOT_VIEWABLE = 3
    XCB_GRAB_STATUS_FROZEN = 4
end

@enum xcb_cursor_enum_t::UInt32 begin
    XCB_CURSOR_NONE = 0
end

"""
    xcb_grab_pointer_cookie_t

[`xcb_grab_pointer_cookie_t`](@ref)
"""
struct xcb_grab_pointer_cookie_t
    sequence::Cuint
end

"""
    xcb_grab_pointer_request_t

[`xcb_grab_pointer_request_t`](@ref)
"""
struct xcb_grab_pointer_request_t
    major_opcode::UInt8
    owner_events::UInt8
    length::UInt16
    grab_window::xcb_window_t
    event_mask::UInt16
    pointer_mode::UInt8
    keyboard_mode::UInt8
    confine_to::xcb_window_t
    cursor::xcb_cursor_t
    time::xcb_timestamp_t
end

"""
    xcb_grab_pointer_reply_t

[`xcb_grab_pointer_reply_t`](@ref)
"""
struct xcb_grab_pointer_reply_t
    response_type::UInt8
    status::UInt8
    sequence::UInt16
    length::UInt32
end

"""
    xcb_ungrab_pointer_request_t

[`xcb_ungrab_pointer_request_t`](@ref)
"""
struct xcb_ungrab_pointer_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    time::xcb_timestamp_t
end

@enum xcb_button_index_t::UInt32 begin
    XCB_BUTTON_INDEX_ANY = 0
    XCB_BUTTON_INDEX_1 = 1
    XCB_BUTTON_INDEX_2 = 2
    XCB_BUTTON_INDEX_3 = 3
    XCB_BUTTON_INDEX_4 = 4
    XCB_BUTTON_INDEX_5 = 5
end

"""
    xcb_grab_button_request_t

[`xcb_grab_button_request_t`](@ref)
"""
struct xcb_grab_button_request_t
    major_opcode::UInt8
    owner_events::UInt8
    length::UInt16
    grab_window::xcb_window_t
    event_mask::UInt16
    pointer_mode::UInt8
    keyboard_mode::UInt8
    confine_to::xcb_window_t
    cursor::xcb_cursor_t
    button::UInt8
    pad0::UInt8
    modifiers::UInt16
end

"""
    xcb_ungrab_button_request_t

[`xcb_ungrab_button_request_t`](@ref)
"""
struct xcb_ungrab_button_request_t
    major_opcode::UInt8
    button::UInt8
    length::UInt16
    grab_window::xcb_window_t
    modifiers::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_change_active_pointer_grab_request_t

[`xcb_change_active_pointer_grab_request_t`](@ref)
"""
struct xcb_change_active_pointer_grab_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cursor::xcb_cursor_t
    time::xcb_timestamp_t
    event_mask::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_grab_keyboard_cookie_t

[`xcb_grab_keyboard_cookie_t`](@ref)
"""
struct xcb_grab_keyboard_cookie_t
    sequence::Cuint
end

"""
    xcb_grab_keyboard_request_t

[`xcb_grab_keyboard_request_t`](@ref)
"""
struct xcb_grab_keyboard_request_t
    major_opcode::UInt8
    owner_events::UInt8
    length::UInt16
    grab_window::xcb_window_t
    time::xcb_timestamp_t
    pointer_mode::UInt8
    keyboard_mode::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_grab_keyboard_reply_t

[`xcb_grab_keyboard_reply_t`](@ref)
"""
struct xcb_grab_keyboard_reply_t
    response_type::UInt8
    status::UInt8
    sequence::UInt16
    length::UInt32
end

"""
    xcb_ungrab_keyboard_request_t

[`xcb_ungrab_keyboard_request_t`](@ref)
"""
struct xcb_ungrab_keyboard_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    time::xcb_timestamp_t
end

@enum xcb_grab_t::UInt32 begin
    XCB_GRAB_ANY = 0
end

"""
    xcb_grab_key_request_t

[`xcb_grab_key_request_t`](@ref)
"""
struct xcb_grab_key_request_t
    major_opcode::UInt8
    owner_events::UInt8
    length::UInt16
    grab_window::xcb_window_t
    modifiers::UInt16
    key::xcb_keycode_t
    pointer_mode::UInt8
    keyboard_mode::UInt8
    pad0::NTuple{3, UInt8}
end

"""
    xcb_ungrab_key_request_t

[`xcb_ungrab_key_request_t`](@ref)
"""
struct xcb_ungrab_key_request_t
    major_opcode::UInt8
    key::xcb_keycode_t
    length::UInt16
    grab_window::xcb_window_t
    modifiers::UInt16
    pad0::NTuple{2, UInt8}
end

@enum xcb_allow_t::UInt32 begin
    XCB_ALLOW_ASYNC_POINTER = 0
    XCB_ALLOW_SYNC_POINTER = 1
    XCB_ALLOW_REPLAY_POINTER = 2
    XCB_ALLOW_ASYNC_KEYBOARD = 3
    XCB_ALLOW_SYNC_KEYBOARD = 4
    XCB_ALLOW_REPLAY_KEYBOARD = 5
    XCB_ALLOW_ASYNC_BOTH = 6
    XCB_ALLOW_SYNC_BOTH = 7
end

"""
    xcb_allow_events_request_t

[`xcb_allow_events_request_t`](@ref)
"""
struct xcb_allow_events_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
    time::xcb_timestamp_t
end

"""
    xcb_grab_server_request_t

[`xcb_grab_server_request_t`](@ref)
"""
struct xcb_grab_server_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_ungrab_server_request_t

[`xcb_ungrab_server_request_t`](@ref)
"""
struct xcb_ungrab_server_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_query_pointer_cookie_t

[`xcb_query_pointer_cookie_t`](@ref)
"""
struct xcb_query_pointer_cookie_t
    sequence::Cuint
end

"""
    xcb_query_pointer_request_t

[`xcb_query_pointer_request_t`](@ref)
"""
struct xcb_query_pointer_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_query_pointer_reply_t

[`xcb_query_pointer_reply_t`](@ref)
"""
struct xcb_query_pointer_reply_t
    response_type::UInt8
    same_screen::UInt8
    sequence::UInt16
    length::UInt32
    root::xcb_window_t
    child::xcb_window_t
    root_x::Int16
    root_y::Int16
    win_x::Int16
    win_y::Int16
    mask::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_timecoord_t

[`xcb_timecoord_t`](@ref)
"""
struct xcb_timecoord_t
    time::xcb_timestamp_t
    x::Int16
    y::Int16
end

"""
    xcb_timecoord_iterator_t

[`xcb_timecoord_iterator_t`](@ref)
"""
struct xcb_timecoord_iterator_t
    data::Ptr{xcb_timecoord_t}
    rem::Cint
    index::Cint
end

"""
    xcb_get_motion_events_cookie_t

[`xcb_get_motion_events_cookie_t`](@ref)
"""
struct xcb_get_motion_events_cookie_t
    sequence::Cuint
end

"""
    xcb_get_motion_events_request_t

[`xcb_get_motion_events_request_t`](@ref)
"""
struct xcb_get_motion_events_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    start::xcb_timestamp_t
    stop::xcb_timestamp_t
end

"""
    xcb_get_motion_events_reply_t

[`xcb_get_motion_events_reply_t`](@ref)
"""
struct xcb_get_motion_events_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    events_len::UInt32
    pad1::NTuple{20, UInt8}
end

"""
    xcb_translate_coordinates_cookie_t

[`xcb_translate_coordinates_cookie_t`](@ref)
"""
struct xcb_translate_coordinates_cookie_t
    sequence::Cuint
end

"""
    xcb_translate_coordinates_request_t

[`xcb_translate_coordinates_request_t`](@ref)
"""
struct xcb_translate_coordinates_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    src_window::xcb_window_t
    dst_window::xcb_window_t
    src_x::Int16
    src_y::Int16
end

"""
    xcb_translate_coordinates_reply_t

[`xcb_translate_coordinates_reply_t`](@ref)
"""
struct xcb_translate_coordinates_reply_t
    response_type::UInt8
    same_screen::UInt8
    sequence::UInt16
    length::UInt32
    child::xcb_window_t
    dst_x::Int16
    dst_y::Int16
end

"""
    xcb_warp_pointer_request_t

[`xcb_warp_pointer_request_t`](@ref)
"""
struct xcb_warp_pointer_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    src_window::xcb_window_t
    dst_window::xcb_window_t
    src_x::Int16
    src_y::Int16
    src_width::UInt16
    src_height::UInt16
    dst_x::Int16
    dst_y::Int16
end

@enum xcb_input_focus_t::UInt32 begin
    XCB_INPUT_FOCUS_NONE = 0
    XCB_INPUT_FOCUS_POINTER_ROOT = 1
    XCB_INPUT_FOCUS_PARENT = 2
    XCB_INPUT_FOCUS_FOLLOW_KEYBOARD = 3
end

"""
    xcb_set_input_focus_request_t

[`xcb_set_input_focus_request_t`](@ref)
"""
struct xcb_set_input_focus_request_t
    major_opcode::UInt8
    revert_to::UInt8
    length::UInt16
    focus::xcb_window_t
    time::xcb_timestamp_t
end

"""
    xcb_get_input_focus_cookie_t

[`xcb_get_input_focus_cookie_t`](@ref)
"""
struct xcb_get_input_focus_cookie_t
    sequence::Cuint
end

"""
    xcb_get_input_focus_request_t

[`xcb_get_input_focus_request_t`](@ref)
"""
struct xcb_get_input_focus_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_input_focus_reply_t

[`xcb_get_input_focus_reply_t`](@ref)
"""
struct xcb_get_input_focus_reply_t
    response_type::UInt8
    revert_to::UInt8
    sequence::UInt16
    length::UInt32
    focus::xcb_window_t
end

"""
    xcb_query_keymap_cookie_t

[`xcb_query_keymap_cookie_t`](@ref)
"""
struct xcb_query_keymap_cookie_t
    sequence::Cuint
end

"""
    xcb_query_keymap_request_t

[`xcb_query_keymap_request_t`](@ref)
"""
struct xcb_query_keymap_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_query_keymap_reply_t

[`xcb_query_keymap_reply_t`](@ref)
"""
struct xcb_query_keymap_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    keys::NTuple{32, UInt8}
end

"""
    xcb_open_font_request_t

[`xcb_open_font_request_t`](@ref)
"""
struct xcb_open_font_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    fid::xcb_font_t
    name_len::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_close_font_request_t

[`xcb_close_font_request_t`](@ref)
"""
struct xcb_close_font_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    font::xcb_font_t
end

@enum xcb_font_draw_t::UInt32 begin
    XCB_FONT_DRAW_LEFT_TO_RIGHT = 0
    XCB_FONT_DRAW_RIGHT_TO_LEFT = 1
end

"""
    xcb_fontprop_t

[`xcb_fontprop_t`](@ref)
"""
struct xcb_fontprop_t
    name::xcb_atom_t
    value::UInt32
end

"""
    xcb_fontprop_iterator_t

[`xcb_fontprop_iterator_t`](@ref)
"""
struct xcb_fontprop_iterator_t
    data::Ptr{xcb_fontprop_t}
    rem::Cint
    index::Cint
end

"""
    xcb_charinfo_t

[`xcb_charinfo_t`](@ref)
"""
struct xcb_charinfo_t
    left_side_bearing::Int16
    right_side_bearing::Int16
    character_width::Int16
    ascent::Int16
    descent::Int16
    attributes::UInt16
end

"""
    xcb_charinfo_iterator_t

[`xcb_charinfo_iterator_t`](@ref)
"""
struct xcb_charinfo_iterator_t
    data::Ptr{xcb_charinfo_t}
    rem::Cint
    index::Cint
end

"""
    xcb_query_font_cookie_t

[`xcb_query_font_cookie_t`](@ref)
"""
struct xcb_query_font_cookie_t
    sequence::Cuint
end

"""
    xcb_query_font_request_t

[`xcb_query_font_request_t`](@ref)
"""
struct xcb_query_font_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    font::xcb_fontable_t
end

"""
    xcb_query_font_reply_t

[`xcb_query_font_reply_t`](@ref)
"""
struct xcb_query_font_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    min_bounds::xcb_charinfo_t
    pad1::NTuple{4, UInt8}
    max_bounds::xcb_charinfo_t
    pad2::NTuple{4, UInt8}
    min_char_or_byte2::UInt16
    max_char_or_byte2::UInt16
    default_char::UInt16
    properties_len::UInt16
    draw_direction::UInt8
    min_byte1::UInt8
    max_byte1::UInt8
    all_chars_exist::UInt8
    font_ascent::Int16
    font_descent::Int16
    char_infos_len::UInt32
end

"""
    xcb_query_text_extents_cookie_t

[`xcb_query_text_extents_cookie_t`](@ref)
"""
struct xcb_query_text_extents_cookie_t
    sequence::Cuint
end

"""
    xcb_query_text_extents_request_t

[`xcb_query_text_extents_request_t`](@ref)
"""
struct xcb_query_text_extents_request_t
    major_opcode::UInt8
    odd_length::UInt8
    length::UInt16
    font::xcb_fontable_t
end

"""
    xcb_query_text_extents_reply_t

[`xcb_query_text_extents_reply_t`](@ref)
"""
struct xcb_query_text_extents_reply_t
    response_type::UInt8
    draw_direction::UInt8
    sequence::UInt16
    length::UInt32
    font_ascent::Int16
    font_descent::Int16
    overall_ascent::Int16
    overall_descent::Int16
    overall_width::Int32
    overall_left::Int32
    overall_right::Int32
end

"""
    xcb_str_t

[`xcb_str_t`](@ref)
"""
struct xcb_str_t
    name_len::UInt8
end

"""
    xcb_str_iterator_t

[`xcb_str_iterator_t`](@ref)
"""
struct xcb_str_iterator_t
    data::Ptr{xcb_str_t}
    rem::Cint
    index::Cint
end

"""
    xcb_list_fonts_cookie_t

[`xcb_list_fonts_cookie_t`](@ref)
"""
struct xcb_list_fonts_cookie_t
    sequence::Cuint
end

"""
    xcb_list_fonts_request_t

[`xcb_list_fonts_request_t`](@ref)
"""
struct xcb_list_fonts_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    max_names::UInt16
    pattern_len::UInt16
end

"""
    xcb_list_fonts_reply_t

[`xcb_list_fonts_reply_t`](@ref)
"""
struct xcb_list_fonts_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    names_len::UInt16
    pad1::NTuple{22, UInt8}
end

"""
    xcb_list_fonts_with_info_cookie_t

[`xcb_list_fonts_with_info_cookie_t`](@ref)
"""
struct xcb_list_fonts_with_info_cookie_t
    sequence::Cuint
end

"""
    xcb_list_fonts_with_info_request_t

[`xcb_list_fonts_with_info_request_t`](@ref)
"""
struct xcb_list_fonts_with_info_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    max_names::UInt16
    pattern_len::UInt16
end

"""
    xcb_list_fonts_with_info_reply_t

[`xcb_list_fonts_with_info_reply_t`](@ref)
"""
struct xcb_list_fonts_with_info_reply_t
    response_type::UInt8
    name_len::UInt8
    sequence::UInt16
    length::UInt32
    min_bounds::xcb_charinfo_t
    pad0::NTuple{4, UInt8}
    max_bounds::xcb_charinfo_t
    pad1::NTuple{4, UInt8}
    min_char_or_byte2::UInt16
    max_char_or_byte2::UInt16
    default_char::UInt16
    properties_len::UInt16
    draw_direction::UInt8
    min_byte1::UInt8
    max_byte1::UInt8
    all_chars_exist::UInt8
    font_ascent::Int16
    font_descent::Int16
    replies_hint::UInt32
end

"""
    xcb_set_font_path_request_t

[`xcb_set_font_path_request_t`](@ref)
"""
struct xcb_set_font_path_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    font_qty::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_get_font_path_cookie_t

[`xcb_get_font_path_cookie_t`](@ref)
"""
struct xcb_get_font_path_cookie_t
    sequence::Cuint
end

"""
    xcb_get_font_path_request_t

[`xcb_get_font_path_request_t`](@ref)
"""
struct xcb_get_font_path_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_font_path_reply_t

[`xcb_get_font_path_reply_t`](@ref)
"""
struct xcb_get_font_path_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    path_len::UInt16
    pad1::NTuple{22, UInt8}
end

"""
    xcb_create_pixmap_request_t

[`xcb_create_pixmap_request_t`](@ref)
"""
struct xcb_create_pixmap_request_t
    major_opcode::UInt8
    depth::UInt8
    length::UInt16
    pid::xcb_pixmap_t
    drawable::xcb_drawable_t
    width::UInt16
    height::UInt16
end

"""
    xcb_free_pixmap_request_t

[`xcb_free_pixmap_request_t`](@ref)
"""
struct xcb_free_pixmap_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    pixmap::xcb_pixmap_t
end

@bitmask xcb_gc_t::UInt32 begin
    XCB_GC_FUNCTION = 1
    XCB_GC_PLANE_MASK = 2
    XCB_GC_FOREGROUND = 4
    XCB_GC_BACKGROUND = 8
    XCB_GC_LINE_WIDTH = 16
    XCB_GC_LINE_STYLE = 32
    XCB_GC_CAP_STYLE = 64
    XCB_GC_JOIN_STYLE = 128
    XCB_GC_FILL_STYLE = 256
    XCB_GC_FILL_RULE = 512
    XCB_GC_TILE = 1024
    XCB_GC_STIPPLE = 2048
    XCB_GC_TILE_STIPPLE_ORIGIN_X = 4096
    XCB_GC_TILE_STIPPLE_ORIGIN_Y = 8192
    XCB_GC_FONT = 16384
    XCB_GC_SUBWINDOW_MODE = 32768
    XCB_GC_GRAPHICS_EXPOSURES = 65536
    XCB_GC_CLIP_ORIGIN_X = 131072
    XCB_GC_CLIP_ORIGIN_Y = 262144
    XCB_GC_CLIP_MASK = 524288
    XCB_GC_DASH_OFFSET = 1048576
    XCB_GC_DASH_LIST = 2097152
    XCB_GC_ARC_MODE = 4194304
end

@enum xcb_gx_t::UInt32 begin
    XCB_GX_CLEAR = 0
    XCB_GX_AND = 1
    XCB_GX_AND_REVERSE = 2
    XCB_GX_COPY = 3
    XCB_GX_AND_INVERTED = 4
    XCB_GX_NOOP = 5
    XCB_GX_XOR = 6
    XCB_GX_OR = 7
    XCB_GX_NOR = 8
    XCB_GX_EQUIV = 9
    XCB_GX_INVERT = 10
    XCB_GX_OR_REVERSE = 11
    XCB_GX_COPY_INVERTED = 12
    XCB_GX_OR_INVERTED = 13
    XCB_GX_NAND = 14
    XCB_GX_SET = 15
end

@enum xcb_line_style_t::UInt32 begin
    XCB_LINE_STYLE_SOLID = 0
    XCB_LINE_STYLE_ON_OFF_DASH = 1
    XCB_LINE_STYLE_DOUBLE_DASH = 2
end

@enum xcb_cap_style_t::UInt32 begin
    XCB_CAP_STYLE_NOT_LAST = 0
    XCB_CAP_STYLE_BUTT = 1
    XCB_CAP_STYLE_ROUND = 2
    XCB_CAP_STYLE_PROJECTING = 3
end

@enum xcb_join_style_t::UInt32 begin
    XCB_JOIN_STYLE_MITER = 0
    XCB_JOIN_STYLE_ROUND = 1
    XCB_JOIN_STYLE_BEVEL = 2
end

@enum xcb_fill_style_t::UInt32 begin
    XCB_FILL_STYLE_SOLID = 0
    XCB_FILL_STYLE_TILED = 1
    XCB_FILL_STYLE_STIPPLED = 2
    XCB_FILL_STYLE_OPAQUE_STIPPLED = 3
end

@enum xcb_fill_rule_t::UInt32 begin
    XCB_FILL_RULE_EVEN_ODD = 0
    XCB_FILL_RULE_WINDING = 1
end

@enum xcb_subwindow_mode_t::UInt32 begin
    XCB_SUBWINDOW_MODE_CLIP_BY_CHILDREN = 0
    XCB_SUBWINDOW_MODE_INCLUDE_INFERIORS = 1
end

@enum xcb_arc_mode_t::UInt32 begin
    XCB_ARC_MODE_CHORD = 0
    XCB_ARC_MODE_PIE_SLICE = 1
end

"""
    xcb_create_gc_value_list_t

[`xcb_create_gc_value_list_t`](@ref)
"""
struct xcb_create_gc_value_list_t
    _function::UInt32
    plane_mask::UInt32
    foreground::UInt32
    background::UInt32
    line_width::UInt32
    line_style::UInt32
    cap_style::UInt32
    join_style::UInt32
    fill_style::UInt32
    fill_rule::UInt32
    tile::xcb_pixmap_t
    stipple::xcb_pixmap_t
    tile_stipple_x_origin::Int32
    tile_stipple_y_origin::Int32
    font::xcb_font_t
    subwindow_mode::UInt32
    graphics_exposures::xcb_bool32_t
    clip_x_origin::Int32
    clip_y_origin::Int32
    clip_mask::xcb_pixmap_t
    dash_offset::UInt32
    dashes::UInt32
    arc_mode::UInt32
end

"""
    xcb_create_gc_request_t

[`xcb_create_gc_request_t`](@ref)
"""
struct xcb_create_gc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cid::xcb_gcontext_t
    drawable::xcb_drawable_t
    value_mask::UInt32
end

"""
    xcb_change_gc_value_list_t

[`xcb_change_gc_value_list_t`](@ref)
"""
struct xcb_change_gc_value_list_t
    _function::UInt32
    plane_mask::UInt32
    foreground::UInt32
    background::UInt32
    line_width::UInt32
    line_style::UInt32
    cap_style::UInt32
    join_style::UInt32
    fill_style::UInt32
    fill_rule::UInt32
    tile::xcb_pixmap_t
    stipple::xcb_pixmap_t
    tile_stipple_x_origin::Int32
    tile_stipple_y_origin::Int32
    font::xcb_font_t
    subwindow_mode::UInt32
    graphics_exposures::xcb_bool32_t
    clip_x_origin::Int32
    clip_y_origin::Int32
    clip_mask::xcb_pixmap_t
    dash_offset::UInt32
    dashes::UInt32
    arc_mode::UInt32
end

"""
    xcb_change_gc_request_t

[`xcb_change_gc_request_t`](@ref)
"""
struct xcb_change_gc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    gc::xcb_gcontext_t
    value_mask::UInt32
end

"""
    xcb_copy_gc_request_t

[`xcb_copy_gc_request_t`](@ref)
"""
struct xcb_copy_gc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    src_gc::xcb_gcontext_t
    dst_gc::xcb_gcontext_t
    value_mask::UInt32
end

"""
    xcb_set_dashes_request_t

[`xcb_set_dashes_request_t`](@ref)
"""
struct xcb_set_dashes_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    gc::xcb_gcontext_t
    dash_offset::UInt16
    dashes_len::UInt16
end

@enum xcb_clip_ordering_t::UInt32 begin
    XCB_CLIP_ORDERING_UNSORTED = 0
    XCB_CLIP_ORDERING_Y_SORTED = 1
    XCB_CLIP_ORDERING_YX_SORTED = 2
    XCB_CLIP_ORDERING_YX_BANDED = 3
end

"""
    xcb_set_clip_rectangles_request_t

[`xcb_set_clip_rectangles_request_t`](@ref)
"""
struct xcb_set_clip_rectangles_request_t
    major_opcode::UInt8
    ordering::UInt8
    length::UInt16
    gc::xcb_gcontext_t
    clip_x_origin::Int16
    clip_y_origin::Int16
end

"""
    xcb_free_gc_request_t

[`xcb_free_gc_request_t`](@ref)
"""
struct xcb_free_gc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    gc::xcb_gcontext_t
end

"""
    xcb_clear_area_request_t

[`xcb_clear_area_request_t`](@ref)
"""
struct xcb_clear_area_request_t
    major_opcode::UInt8
    exposures::UInt8
    length::UInt16
    window::xcb_window_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
end

"""
    xcb_copy_area_request_t

[`xcb_copy_area_request_t`](@ref)
"""
struct xcb_copy_area_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    src_drawable::xcb_drawable_t
    dst_drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    src_x::Int16
    src_y::Int16
    dst_x::Int16
    dst_y::Int16
    width::UInt16
    height::UInt16
end

"""
    xcb_copy_plane_request_t

[`xcb_copy_plane_request_t`](@ref)
"""
struct xcb_copy_plane_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    src_drawable::xcb_drawable_t
    dst_drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    src_x::Int16
    src_y::Int16
    dst_x::Int16
    dst_y::Int16
    width::UInt16
    height::UInt16
    bit_plane::UInt32
end

@enum xcb_coord_mode_t::UInt32 begin
    XCB_COORD_MODE_ORIGIN = 0
    XCB_COORD_MODE_PREVIOUS = 1
end

"""
    xcb_poly_point_request_t

[`xcb_poly_point_request_t`](@ref)
"""
struct xcb_poly_point_request_t
    major_opcode::UInt8
    coordinate_mode::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

"""
    xcb_poly_line_request_t

[`xcb_poly_line_request_t`](@ref)
"""
struct xcb_poly_line_request_t
    major_opcode::UInt8
    coordinate_mode::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

"""
    xcb_segment_t

[`xcb_segment_t`](@ref)
"""
struct xcb_segment_t
    x1::Int16
    y1::Int16
    x2::Int16
    y2::Int16
end

"""
    xcb_segment_iterator_t

[`xcb_segment_iterator_t`](@ref)
"""
struct xcb_segment_iterator_t
    data::Ptr{xcb_segment_t}
    rem::Cint
    index::Cint
end

"""
    xcb_poly_segment_request_t

[`xcb_poly_segment_request_t`](@ref)
"""
struct xcb_poly_segment_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

"""
    xcb_poly_rectangle_request_t

[`xcb_poly_rectangle_request_t`](@ref)
"""
struct xcb_poly_rectangle_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

"""
    xcb_poly_arc_request_t

[`xcb_poly_arc_request_t`](@ref)
"""
struct xcb_poly_arc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

@enum xcb_poly_shape_t::UInt32 begin
    XCB_POLY_SHAPE_COMPLEX = 0
    XCB_POLY_SHAPE_NONCONVEX = 1
    XCB_POLY_SHAPE_CONVEX = 2
end

"""
    xcb_fill_poly_request_t

[`xcb_fill_poly_request_t`](@ref)
"""
struct xcb_fill_poly_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    shape::UInt8
    coordinate_mode::UInt8
    pad1::NTuple{2, UInt8}
end

"""
    xcb_poly_fill_rectangle_request_t

[`xcb_poly_fill_rectangle_request_t`](@ref)
"""
struct xcb_poly_fill_rectangle_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

"""
    xcb_poly_fill_arc_request_t

[`xcb_poly_fill_arc_request_t`](@ref)
"""
struct xcb_poly_fill_arc_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
end

@enum xcb_image_format_t::UInt32 begin
    XCB_IMAGE_FORMAT_XY_BITMAP = 0
    XCB_IMAGE_FORMAT_XY_PIXMAP = 1
    XCB_IMAGE_FORMAT_Z_PIXMAP = 2
end

"""
    xcb_put_image_request_t

[`xcb_put_image_request_t`](@ref)
"""
struct xcb_put_image_request_t
    major_opcode::UInt8
    format::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    width::UInt16
    height::UInt16
    dst_x::Int16
    dst_y::Int16
    left_pad::UInt8
    depth::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_get_image_cookie_t

[`xcb_get_image_cookie_t`](@ref)
"""
struct xcb_get_image_cookie_t
    sequence::Cuint
end

"""
    xcb_get_image_request_t

[`xcb_get_image_request_t`](@ref)
"""
struct xcb_get_image_request_t
    major_opcode::UInt8
    format::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    x::Int16
    y::Int16
    width::UInt16
    height::UInt16
    plane_mask::UInt32
end

"""
    xcb_get_image_reply_t

[`xcb_get_image_reply_t`](@ref)
"""
struct xcb_get_image_reply_t
    response_type::UInt8
    depth::UInt8
    sequence::UInt16
    length::UInt32
    visual::xcb_visualid_t
    pad0::NTuple{20, UInt8}
end

"""
    xcb_poly_text_8_request_t

[`xcb_poly_text_8_request_t`](@ref)
"""
struct xcb_poly_text_8_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    x::Int16
    y::Int16
end

"""
    xcb_poly_text_16_request_t

[`xcb_poly_text_16_request_t`](@ref)
"""
struct xcb_poly_text_16_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    x::Int16
    y::Int16
end

"""
    xcb_image_text_8_request_t

[`xcb_image_text_8_request_t`](@ref)
"""
struct xcb_image_text_8_request_t
    major_opcode::UInt8
    string_len::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    x::Int16
    y::Int16
end

"""
    xcb_image_text_16_request_t

[`xcb_image_text_16_request_t`](@ref)
"""
struct xcb_image_text_16_request_t
    major_opcode::UInt8
    string_len::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    gc::xcb_gcontext_t
    x::Int16
    y::Int16
end

@enum xcb_colormap_alloc_t::UInt32 begin
    XCB_COLORMAP_ALLOC_NONE = 0
    XCB_COLORMAP_ALLOC_ALL = 1
end

"""
    xcb_create_colormap_request_t

[`xcb_create_colormap_request_t`](@ref)
"""
struct xcb_create_colormap_request_t
    major_opcode::UInt8
    alloc::UInt8
    length::UInt16
    mid::xcb_colormap_t
    window::xcb_window_t
    visual::xcb_visualid_t
end

"""
    xcb_free_colormap_request_t

[`xcb_free_colormap_request_t`](@ref)
"""
struct xcb_free_colormap_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
end

"""
    xcb_copy_colormap_and_free_request_t

[`xcb_copy_colormap_and_free_request_t`](@ref)
"""
struct xcb_copy_colormap_and_free_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    mid::xcb_colormap_t
    src_cmap::xcb_colormap_t
end

"""
    xcb_install_colormap_request_t

[`xcb_install_colormap_request_t`](@ref)
"""
struct xcb_install_colormap_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
end

"""
    xcb_uninstall_colormap_request_t

[`xcb_uninstall_colormap_request_t`](@ref)
"""
struct xcb_uninstall_colormap_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
end

"""
    xcb_list_installed_colormaps_cookie_t

[`xcb_list_installed_colormaps_cookie_t`](@ref)
"""
struct xcb_list_installed_colormaps_cookie_t
    sequence::Cuint
end

"""
    xcb_list_installed_colormaps_request_t

[`xcb_list_installed_colormaps_request_t`](@ref)
"""
struct xcb_list_installed_colormaps_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
end

"""
    xcb_list_installed_colormaps_reply_t

[`xcb_list_installed_colormaps_reply_t`](@ref)
"""
struct xcb_list_installed_colormaps_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    cmaps_len::UInt16
    pad1::NTuple{22, UInt8}
end

"""
    xcb_alloc_color_cookie_t

[`xcb_alloc_color_cookie_t`](@ref)
"""
struct xcb_alloc_color_cookie_t
    sequence::Cuint
end

"""
    xcb_alloc_color_request_t

[`xcb_alloc_color_request_t`](@ref)
"""
struct xcb_alloc_color_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    red::UInt16
    green::UInt16
    blue::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_alloc_color_reply_t

[`xcb_alloc_color_reply_t`](@ref)
"""
struct xcb_alloc_color_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    red::UInt16
    green::UInt16
    blue::UInt16
    pad1::NTuple{2, UInt8}
    pixel::UInt32
end

"""
    xcb_alloc_named_color_cookie_t

[`xcb_alloc_named_color_cookie_t`](@ref)
"""
struct xcb_alloc_named_color_cookie_t
    sequence::Cuint
end

"""
    xcb_alloc_named_color_request_t

[`xcb_alloc_named_color_request_t`](@ref)
"""
struct xcb_alloc_named_color_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    name_len::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_alloc_named_color_reply_t

[`xcb_alloc_named_color_reply_t`](@ref)
"""
struct xcb_alloc_named_color_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    pixel::UInt32
    exact_red::UInt16
    exact_green::UInt16
    exact_blue::UInt16
    visual_red::UInt16
    visual_green::UInt16
    visual_blue::UInt16
end

"""
    xcb_alloc_color_cells_cookie_t

[`xcb_alloc_color_cells_cookie_t`](@ref)
"""
struct xcb_alloc_color_cells_cookie_t
    sequence::Cuint
end

"""
    xcb_alloc_color_cells_request_t

[`xcb_alloc_color_cells_request_t`](@ref)
"""
struct xcb_alloc_color_cells_request_t
    major_opcode::UInt8
    contiguous::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    colors::UInt16
    planes::UInt16
end

"""
    xcb_alloc_color_cells_reply_t

[`xcb_alloc_color_cells_reply_t`](@ref)
"""
struct xcb_alloc_color_cells_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    pixels_len::UInt16
    masks_len::UInt16
    pad1::NTuple{20, UInt8}
end

"""
    xcb_alloc_color_planes_cookie_t

[`xcb_alloc_color_planes_cookie_t`](@ref)
"""
struct xcb_alloc_color_planes_cookie_t
    sequence::Cuint
end

"""
    xcb_alloc_color_planes_request_t

[`xcb_alloc_color_planes_request_t`](@ref)
"""
struct xcb_alloc_color_planes_request_t
    major_opcode::UInt8
    contiguous::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    colors::UInt16
    reds::UInt16
    greens::UInt16
    blues::UInt16
end

"""
    xcb_alloc_color_planes_reply_t

[`xcb_alloc_color_planes_reply_t`](@ref)
"""
struct xcb_alloc_color_planes_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    pixels_len::UInt16
    pad1::NTuple{2, UInt8}
    red_mask::UInt32
    green_mask::UInt32
    blue_mask::UInt32
    pad2::NTuple{8, UInt8}
end

"""
    xcb_free_colors_request_t

[`xcb_free_colors_request_t`](@ref)
"""
struct xcb_free_colors_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    plane_mask::UInt32
end

@bitmask xcb_color_flag_t::UInt32 begin
    XCB_COLOR_FLAG_RED = 1
    XCB_COLOR_FLAG_GREEN = 2
    XCB_COLOR_FLAG_BLUE = 4
end

"""
    xcb_coloritem_t

[`xcb_coloritem_t`](@ref)
"""
struct xcb_coloritem_t
    pixel::UInt32
    red::UInt16
    green::UInt16
    blue::UInt16
    flags::UInt8
    pad0::UInt8
end

"""
    xcb_coloritem_iterator_t

[`xcb_coloritem_iterator_t`](@ref)
"""
struct xcb_coloritem_iterator_t
    data::Ptr{xcb_coloritem_t}
    rem::Cint
    index::Cint
end

"""
    xcb_store_colors_request_t

[`xcb_store_colors_request_t`](@ref)
"""
struct xcb_store_colors_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
end

"""
    xcb_store_named_color_request_t

[`xcb_store_named_color_request_t`](@ref)
"""
struct xcb_store_named_color_request_t
    major_opcode::UInt8
    flags::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    pixel::UInt32
    name_len::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_rgb_t

[`xcb_rgb_t`](@ref)
"""
struct xcb_rgb_t
    red::UInt16
    green::UInt16
    blue::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_rgb_iterator_t

[`xcb_rgb_iterator_t`](@ref)
"""
struct xcb_rgb_iterator_t
    data::Ptr{xcb_rgb_t}
    rem::Cint
    index::Cint
end

"""
    xcb_query_colors_cookie_t

[`xcb_query_colors_cookie_t`](@ref)
"""
struct xcb_query_colors_cookie_t
    sequence::Cuint
end

"""
    xcb_query_colors_request_t

[`xcb_query_colors_request_t`](@ref)
"""
struct xcb_query_colors_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
end

"""
    xcb_query_colors_reply_t

[`xcb_query_colors_reply_t`](@ref)
"""
struct xcb_query_colors_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    colors_len::UInt16
    pad1::NTuple{22, UInt8}
end

"""
    xcb_lookup_color_cookie_t

[`xcb_lookup_color_cookie_t`](@ref)
"""
struct xcb_lookup_color_cookie_t
    sequence::Cuint
end

"""
    xcb_lookup_color_request_t

[`xcb_lookup_color_request_t`](@ref)
"""
struct xcb_lookup_color_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cmap::xcb_colormap_t
    name_len::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_lookup_color_reply_t

[`xcb_lookup_color_reply_t`](@ref)
"""
struct xcb_lookup_color_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    exact_red::UInt16
    exact_green::UInt16
    exact_blue::UInt16
    visual_red::UInt16
    visual_green::UInt16
    visual_blue::UInt16
end

@enum xcb_pixmap_enum_t::UInt32 begin
    XCB_PIXMAP_NONE = 0
end

"""
    xcb_create_cursor_request_t

[`xcb_create_cursor_request_t`](@ref)
"""
struct xcb_create_cursor_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cid::xcb_cursor_t
    source::xcb_pixmap_t
    mask::xcb_pixmap_t
    fore_red::UInt16
    fore_green::UInt16
    fore_blue::UInt16
    back_red::UInt16
    back_green::UInt16
    back_blue::UInt16
    x::UInt16
    y::UInt16
end

@enum xcb_font_enum_t::UInt32 begin
    XCB_FONT_NONE = 0
end

"""
    xcb_create_glyph_cursor_request_t

[`xcb_create_glyph_cursor_request_t`](@ref)
"""
struct xcb_create_glyph_cursor_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cid::xcb_cursor_t
    source_font::xcb_font_t
    mask_font::xcb_font_t
    source_char::UInt16
    mask_char::UInt16
    fore_red::UInt16
    fore_green::UInt16
    fore_blue::UInt16
    back_red::UInt16
    back_green::UInt16
    back_blue::UInt16
end

"""
    xcb_free_cursor_request_t

[`xcb_free_cursor_request_t`](@ref)
"""
struct xcb_free_cursor_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cursor::xcb_cursor_t
end

"""
    xcb_recolor_cursor_request_t

[`xcb_recolor_cursor_request_t`](@ref)
"""
struct xcb_recolor_cursor_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    cursor::xcb_cursor_t
    fore_red::UInt16
    fore_green::UInt16
    fore_blue::UInt16
    back_red::UInt16
    back_green::UInt16
    back_blue::UInt16
end

@enum xcb_query_shape_of_t::UInt32 begin
    XCB_QUERY_SHAPE_OF_LARGEST_CURSOR = 0
    XCB_QUERY_SHAPE_OF_FASTEST_TILE = 1
    XCB_QUERY_SHAPE_OF_FASTEST_STIPPLE = 2
end

"""
    xcb_query_best_size_cookie_t

[`xcb_query_best_size_cookie_t`](@ref)
"""
struct xcb_query_best_size_cookie_t
    sequence::Cuint
end

"""
    xcb_query_best_size_request_t

[`xcb_query_best_size_request_t`](@ref)
"""
struct xcb_query_best_size_request_t
    major_opcode::UInt8
    _class::UInt8
    length::UInt16
    drawable::xcb_drawable_t
    width::UInt16
    height::UInt16
end

"""
    xcb_query_best_size_reply_t

[`xcb_query_best_size_reply_t`](@ref)
"""
struct xcb_query_best_size_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    width::UInt16
    height::UInt16
end

"""
    xcb_query_extension_cookie_t

[`xcb_query_extension_cookie_t`](@ref)
"""
struct xcb_query_extension_cookie_t
    sequence::Cuint
end

"""
    xcb_query_extension_request_t

[`xcb_query_extension_request_t`](@ref)
"""
struct xcb_query_extension_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    name_len::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_query_extension_reply_t

[`xcb_query_extension_reply_t`](@ref)
"""
struct xcb_query_extension_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    present::UInt8
    major_opcode::UInt8
    first_event::UInt8
    first_error::UInt8
end

"""
    xcb_list_extensions_cookie_t

[`xcb_list_extensions_cookie_t`](@ref)
"""
struct xcb_list_extensions_cookie_t
    sequence::Cuint
end

"""
    xcb_list_extensions_request_t

[`xcb_list_extensions_request_t`](@ref)
"""
struct xcb_list_extensions_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_list_extensions_reply_t

[`xcb_list_extensions_reply_t`](@ref)
"""
struct xcb_list_extensions_reply_t
    response_type::UInt8
    names_len::UInt8
    sequence::UInt16
    length::UInt32
    pad0::NTuple{24, UInt8}
end

"""
    xcb_change_keyboard_mapping_request_t

[`xcb_change_keyboard_mapping_request_t`](@ref)
"""
struct xcb_change_keyboard_mapping_request_t
    major_opcode::UInt8
    keycode_count::UInt8
    length::UInt16
    first_keycode::xcb_keycode_t
    keysyms_per_keycode::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_get_keyboard_mapping_cookie_t

[`xcb_get_keyboard_mapping_cookie_t`](@ref)
"""
struct xcb_get_keyboard_mapping_cookie_t
    sequence::Cuint
end

"""
    xcb_get_keyboard_mapping_request_t

[`xcb_get_keyboard_mapping_request_t`](@ref)
"""
struct xcb_get_keyboard_mapping_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    first_keycode::xcb_keycode_t
    count::UInt8
end

"""
    xcb_get_keyboard_mapping_reply_t

[`xcb_get_keyboard_mapping_reply_t`](@ref)
"""
struct xcb_get_keyboard_mapping_reply_t
    response_type::UInt8
    keysyms_per_keycode::UInt8
    sequence::UInt16
    length::UInt32
    pad0::NTuple{24, UInt8}
end

@bitmask xcb_kb_t::UInt32 begin
    XCB_KB_KEY_CLICK_PERCENT = 1
    XCB_KB_BELL_PERCENT = 2
    XCB_KB_BELL_PITCH = 4
    XCB_KB_BELL_DURATION = 8
    XCB_KB_LED = 16
    XCB_KB_LED_MODE = 32
    XCB_KB_KEY = 64
    XCB_KB_AUTO_REPEAT_MODE = 128
end

@enum xcb_led_mode_t::UInt32 begin
    XCB_LED_MODE_OFF = 0
    XCB_LED_MODE_ON = 1
end

@enum xcb_auto_repeat_mode_t::UInt32 begin
    XCB_AUTO_REPEAT_MODE_OFF = 0
    XCB_AUTO_REPEAT_MODE_ON = 1
    XCB_AUTO_REPEAT_MODE_DEFAULT = 2
end

"""
    xcb_change_keyboard_control_value_list_t

[`xcb_change_keyboard_control_value_list_t`](@ref)
"""
struct xcb_change_keyboard_control_value_list_t
    key_click_percent::Int32
    bell_percent::Int32
    bell_pitch::Int32
    bell_duration::Int32
    led::UInt32
    led_mode::UInt32
    key::xcb_keycode32_t
    auto_repeat_mode::UInt32
end

"""
    xcb_change_keyboard_control_request_t

[`xcb_change_keyboard_control_request_t`](@ref)
"""
struct xcb_change_keyboard_control_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    value_mask::UInt32
end

"""
    xcb_get_keyboard_control_cookie_t

[`xcb_get_keyboard_control_cookie_t`](@ref)
"""
struct xcb_get_keyboard_control_cookie_t
    sequence::Cuint
end

"""
    xcb_get_keyboard_control_request_t

[`xcb_get_keyboard_control_request_t`](@ref)
"""
struct xcb_get_keyboard_control_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_keyboard_control_reply_t

[`xcb_get_keyboard_control_reply_t`](@ref)
"""
struct xcb_get_keyboard_control_reply_t
    response_type::UInt8
    global_auto_repeat::UInt8
    sequence::UInt16
    length::UInt32
    led_mask::UInt32
    key_click_percent::UInt8
    bell_percent::UInt8
    bell_pitch::UInt16
    bell_duration::UInt16
    pad0::NTuple{2, UInt8}
    auto_repeats::NTuple{32, UInt8}
end

"""
    xcb_bell_request_t

[`xcb_bell_request_t`](@ref)
"""
struct xcb_bell_request_t
    major_opcode::UInt8
    percent::Int8
    length::UInt16
end

"""
    xcb_change_pointer_control_request_t

[`xcb_change_pointer_control_request_t`](@ref)
"""
struct xcb_change_pointer_control_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    acceleration_numerator::Int16
    acceleration_denominator::Int16
    threshold::Int16
    do_acceleration::UInt8
    do_threshold::UInt8
end

"""
    xcb_get_pointer_control_cookie_t

[`xcb_get_pointer_control_cookie_t`](@ref)
"""
struct xcb_get_pointer_control_cookie_t
    sequence::Cuint
end

"""
    xcb_get_pointer_control_request_t

[`xcb_get_pointer_control_request_t`](@ref)
"""
struct xcb_get_pointer_control_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_pointer_control_reply_t

[`xcb_get_pointer_control_reply_t`](@ref)
"""
struct xcb_get_pointer_control_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    acceleration_numerator::UInt16
    acceleration_denominator::UInt16
    threshold::UInt16
    pad1::NTuple{18, UInt8}
end

@enum xcb_blanking_t::UInt32 begin
    XCB_BLANKING_NOT_PREFERRED = 0
    XCB_BLANKING_PREFERRED = 1
    XCB_BLANKING_DEFAULT = 2
end

@enum xcb_exposures_t::UInt32 begin
    XCB_EXPOSURES_NOT_ALLOWED = 0
    XCB_EXPOSURES_ALLOWED = 1
    XCB_EXPOSURES_DEFAULT = 2
end

"""
    xcb_set_screen_saver_request_t

[`xcb_set_screen_saver_request_t`](@ref)
"""
struct xcb_set_screen_saver_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    timeout::Int16
    interval::Int16
    prefer_blanking::UInt8
    allow_exposures::UInt8
end

"""
    xcb_get_screen_saver_cookie_t

[`xcb_get_screen_saver_cookie_t`](@ref)
"""
struct xcb_get_screen_saver_cookie_t
    sequence::Cuint
end

"""
    xcb_get_screen_saver_request_t

[`xcb_get_screen_saver_request_t`](@ref)
"""
struct xcb_get_screen_saver_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_screen_saver_reply_t

[`xcb_get_screen_saver_reply_t`](@ref)
"""
struct xcb_get_screen_saver_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    timeout::UInt16
    interval::UInt16
    prefer_blanking::UInt8
    allow_exposures::UInt8
    pad1::NTuple{18, UInt8}
end

@enum xcb_host_mode_t::UInt32 begin
    XCB_HOST_MODE_INSERT = 0
    XCB_HOST_MODE_DELETE = 1
end

@enum xcb_family_t::UInt32 begin
    XCB_FAMILY_INTERNET = 0
    XCB_FAMILY_DECNET = 1
    XCB_FAMILY_CHAOS = 2
    XCB_FAMILY_SERVER_INTERPRETED = 5
    XCB_FAMILY_INTERNET_6 = 6
end

"""
    xcb_change_hosts_request_t

[`xcb_change_hosts_request_t`](@ref)
"""
struct xcb_change_hosts_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
    family::UInt8
    pad0::UInt8
    address_len::UInt16
end

"""
    xcb_host_t

[`xcb_host_t`](@ref)
"""
struct xcb_host_t
    family::UInt8
    pad0::UInt8
    address_len::UInt16
end

"""
    xcb_host_iterator_t

[`xcb_host_iterator_t`](@ref)
"""
struct xcb_host_iterator_t
    data::Ptr{xcb_host_t}
    rem::Cint
    index::Cint
end

"""
    xcb_list_hosts_cookie_t

[`xcb_list_hosts_cookie_t`](@ref)
"""
struct xcb_list_hosts_cookie_t
    sequence::Cuint
end

"""
    xcb_list_hosts_request_t

[`xcb_list_hosts_request_t`](@ref)
"""
struct xcb_list_hosts_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_list_hosts_reply_t

[`xcb_list_hosts_reply_t`](@ref)
"""
struct xcb_list_hosts_reply_t
    response_type::UInt8
    mode::UInt8
    sequence::UInt16
    length::UInt32
    hosts_len::UInt16
    pad0::NTuple{22, UInt8}
end

@enum xcb_access_control_t::UInt32 begin
    XCB_ACCESS_CONTROL_DISABLE = 0
    XCB_ACCESS_CONTROL_ENABLE = 1
end

"""
    xcb_set_access_control_request_t

[`xcb_set_access_control_request_t`](@ref)
"""
struct xcb_set_access_control_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
end

@enum xcb_close_down_t::UInt32 begin
    XCB_CLOSE_DOWN_DESTROY_ALL = 0
    XCB_CLOSE_DOWN_RETAIN_PERMANENT = 1
    XCB_CLOSE_DOWN_RETAIN_TEMPORARY = 2
end

"""
    xcb_set_close_down_mode_request_t

[`xcb_set_close_down_mode_request_t`](@ref)
"""
struct xcb_set_close_down_mode_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
end

@enum xcb_kill_t::UInt32 begin
    XCB_KILL_ALL_TEMPORARY = 0
end

"""
    xcb_kill_client_request_t

[`xcb_kill_client_request_t`](@ref)
"""
struct xcb_kill_client_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    resource::UInt32
end

"""
    xcb_rotate_properties_request_t

[`xcb_rotate_properties_request_t`](@ref)
"""
struct xcb_rotate_properties_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
    window::xcb_window_t
    atoms_len::UInt16
    delta::Int16
end

@enum xcb_screen_saver_t::UInt32 begin
    XCB_SCREEN_SAVER_RESET = 0
    XCB_SCREEN_SAVER_ACTIVE = 1
end

"""
    xcb_force_screen_saver_request_t

[`xcb_force_screen_saver_request_t`](@ref)
"""
struct xcb_force_screen_saver_request_t
    major_opcode::UInt8
    mode::UInt8
    length::UInt16
end

@enum xcb_mapping_status_t::UInt32 begin
    XCB_MAPPING_STATUS_SUCCESS = 0
    XCB_MAPPING_STATUS_BUSY = 1
    XCB_MAPPING_STATUS_FAILURE = 2
end

"""
    xcb_set_pointer_mapping_cookie_t

[`xcb_set_pointer_mapping_cookie_t`](@ref)
"""
struct xcb_set_pointer_mapping_cookie_t
    sequence::Cuint
end

"""
    xcb_set_pointer_mapping_request_t

[`xcb_set_pointer_mapping_request_t`](@ref)
"""
struct xcb_set_pointer_mapping_request_t
    major_opcode::UInt8
    map_len::UInt8
    length::UInt16
end

"""
    xcb_set_pointer_mapping_reply_t

[`xcb_set_pointer_mapping_reply_t`](@ref)
"""
struct xcb_set_pointer_mapping_reply_t
    response_type::UInt8
    status::UInt8
    sequence::UInt16
    length::UInt32
end

"""
    xcb_get_pointer_mapping_cookie_t

[`xcb_get_pointer_mapping_cookie_t`](@ref)
"""
struct xcb_get_pointer_mapping_cookie_t
    sequence::Cuint
end

"""
    xcb_get_pointer_mapping_request_t

[`xcb_get_pointer_mapping_request_t`](@ref)
"""
struct xcb_get_pointer_mapping_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_pointer_mapping_reply_t

[`xcb_get_pointer_mapping_reply_t`](@ref)
"""
struct xcb_get_pointer_mapping_reply_t
    response_type::UInt8
    map_len::UInt8
    sequence::UInt16
    length::UInt32
    pad0::NTuple{24, UInt8}
end

@enum xcb_map_index_t::UInt32 begin
    XCB_MAP_INDEX_SHIFT = 0
    XCB_MAP_INDEX_LOCK = 1
    XCB_MAP_INDEX_CONTROL = 2
    XCB_MAP_INDEX_1 = 3
    XCB_MAP_INDEX_2 = 4
    XCB_MAP_INDEX_3 = 5
    XCB_MAP_INDEX_4 = 6
    XCB_MAP_INDEX_5 = 7
end

"""
    xcb_set_modifier_mapping_cookie_t

[`xcb_set_modifier_mapping_cookie_t`](@ref)
"""
struct xcb_set_modifier_mapping_cookie_t
    sequence::Cuint
end

"""
    xcb_set_modifier_mapping_request_t

[`xcb_set_modifier_mapping_request_t`](@ref)
"""
struct xcb_set_modifier_mapping_request_t
    major_opcode::UInt8
    keycodes_per_modifier::UInt8
    length::UInt16
end

"""
    xcb_set_modifier_mapping_reply_t

[`xcb_set_modifier_mapping_reply_t`](@ref)
"""
struct xcb_set_modifier_mapping_reply_t
    response_type::UInt8
    status::UInt8
    sequence::UInt16
    length::UInt32
end

"""
    xcb_get_modifier_mapping_cookie_t

[`xcb_get_modifier_mapping_cookie_t`](@ref)
"""
struct xcb_get_modifier_mapping_cookie_t
    sequence::Cuint
end

"""
    xcb_get_modifier_mapping_request_t

[`xcb_get_modifier_mapping_request_t`](@ref)
"""
struct xcb_get_modifier_mapping_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_get_modifier_mapping_reply_t

[`xcb_get_modifier_mapping_reply_t`](@ref)
"""
struct xcb_get_modifier_mapping_reply_t
    response_type::UInt8
    keycodes_per_modifier::UInt8
    sequence::UInt16
    length::UInt32
    pad0::NTuple{24, UInt8}
end

"""
    xcb_no_operation_request_t

[`xcb_no_operation_request_t`](@ref)
"""
struct xcb_no_operation_request_t
    major_opcode::UInt8
    pad0::UInt8
    length::UInt16
end

"""
    xcb_char2b_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_char2b_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_char2b_iterator_t`](@ref)
"""
function xcb_char2b_next(i)
    ccall((:xcb_char2b_next, libxcb), Cvoid, (Ptr{xcb_char2b_iterator_t},), i)
end

"""
    xcb_char2b_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_char2b_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_char2b_end(i)
    ccall((:xcb_char2b_end, libxcb), xcb_generic_iterator_t, (xcb_char2b_iterator_t,), i)
end

"""
    xcb_window_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_window_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_window_iterator_t`](@ref)
"""
function xcb_window_next(i)
    ccall((:xcb_window_next, libxcb), Cvoid, (Ptr{xcb_window_iterator_t},), i)
end

"""
    xcb_window_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_window_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_window_end(i)
    ccall((:xcb_window_end, libxcb), xcb_generic_iterator_t, (xcb_window_iterator_t,), i)
end

"""
    xcb_pixmap_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_pixmap_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_pixmap_iterator_t`](@ref)
"""
function xcb_pixmap_next(i)
    ccall((:xcb_pixmap_next, libxcb), Cvoid, (Ptr{xcb_pixmap_iterator_t},), i)
end

"""
    xcb_pixmap_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_pixmap_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_pixmap_end(i)
    ccall((:xcb_pixmap_end, libxcb), xcb_generic_iterator_t, (xcb_pixmap_iterator_t,), i)
end

"""
    xcb_cursor_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_cursor_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_cursor_iterator_t`](@ref)
"""
function xcb_cursor_next(i)
    ccall((:xcb_cursor_next, libxcb), Cvoid, (Ptr{xcb_cursor_iterator_t},), i)
end

"""
    xcb_cursor_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_cursor_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_cursor_end(i)
    ccall((:xcb_cursor_end, libxcb), xcb_generic_iterator_t, (xcb_cursor_iterator_t,), i)
end

"""
    xcb_font_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_font_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_font_iterator_t`](@ref)
"""
function xcb_font_next(i)
    ccall((:xcb_font_next, libxcb), Cvoid, (Ptr{xcb_font_iterator_t},), i)
end

"""
    xcb_font_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_font_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_font_end(i)
    ccall((:xcb_font_end, libxcb), xcb_generic_iterator_t, (xcb_font_iterator_t,), i)
end

"""
    xcb_gcontext_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_gcontext_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_gcontext_iterator_t`](@ref)
"""
function xcb_gcontext_next(i)
    ccall((:xcb_gcontext_next, libxcb), Cvoid, (Ptr{xcb_gcontext_iterator_t},), i)
end

"""
    xcb_gcontext_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_gcontext_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_gcontext_end(i)
    ccall((:xcb_gcontext_end, libxcb), xcb_generic_iterator_t, (xcb_gcontext_iterator_t,), i)
end

"""
    xcb_colormap_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_colormap_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_colormap_iterator_t`](@ref)
"""
function xcb_colormap_next(i)
    ccall((:xcb_colormap_next, libxcb), Cvoid, (Ptr{xcb_colormap_iterator_t},), i)
end

"""
    xcb_colormap_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_colormap_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_colormap_end(i)
    ccall((:xcb_colormap_end, libxcb), xcb_generic_iterator_t, (xcb_colormap_iterator_t,), i)
end

"""
    xcb_atom_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_atom_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_atom_iterator_t`](@ref)
"""
function xcb_atom_next(i)
    ccall((:xcb_atom_next, libxcb), Cvoid, (Ptr{xcb_atom_iterator_t},), i)
end

"""
    xcb_atom_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_atom_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_atom_end(i)
    ccall((:xcb_atom_end, libxcb), xcb_generic_iterator_t, (xcb_atom_iterator_t,), i)
end

"""
    xcb_drawable_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_drawable_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_drawable_iterator_t`](@ref)
"""
function xcb_drawable_next(i)
    ccall((:xcb_drawable_next, libxcb), Cvoid, (Ptr{xcb_drawable_iterator_t},), i)
end

"""
    xcb_drawable_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_drawable_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_drawable_end(i)
    ccall((:xcb_drawable_end, libxcb), xcb_generic_iterator_t, (xcb_drawable_iterator_t,), i)
end

"""
    xcb_fontable_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_fontable_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_fontable_iterator_t`](@ref)
"""
function xcb_fontable_next(i)
    ccall((:xcb_fontable_next, libxcb), Cvoid, (Ptr{xcb_fontable_iterator_t},), i)
end

"""
    xcb_fontable_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_fontable_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_fontable_end(i)
    ccall((:xcb_fontable_end, libxcb), xcb_generic_iterator_t, (xcb_fontable_iterator_t,), i)
end

"""
    xcb_bool32_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_bool32_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_bool32_iterator_t`](@ref)
"""
function xcb_bool32_next(i)
    ccall((:xcb_bool32_next, libxcb), Cvoid, (Ptr{xcb_bool32_iterator_t},), i)
end

"""
    xcb_bool32_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_bool32_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_bool32_end(i)
    ccall((:xcb_bool32_end, libxcb), xcb_generic_iterator_t, (xcb_bool32_iterator_t,), i)
end

"""
    xcb_visualid_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_visualid_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_visualid_iterator_t`](@ref)
"""
function xcb_visualid_next(i)
    ccall((:xcb_visualid_next, libxcb), Cvoid, (Ptr{xcb_visualid_iterator_t},), i)
end

"""
    xcb_visualid_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_visualid_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_visualid_end(i)
    ccall((:xcb_visualid_end, libxcb), xcb_generic_iterator_t, (xcb_visualid_iterator_t,), i)
end

"""
    xcb_timestamp_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_timestamp_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_timestamp_iterator_t`](@ref)
"""
function xcb_timestamp_next(i)
    ccall((:xcb_timestamp_next, libxcb), Cvoid, (Ptr{xcb_timestamp_iterator_t},), i)
end

"""
    xcb_timestamp_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_timestamp_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_timestamp_end(i)
    ccall((:xcb_timestamp_end, libxcb), xcb_generic_iterator_t, (xcb_timestamp_iterator_t,), i)
end

"""
    xcb_keysym_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_keysym_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_keysym_iterator_t`](@ref)
"""
function xcb_keysym_next(i)
    ccall((:xcb_keysym_next, libxcb), Cvoid, (Ptr{xcb_keysym_iterator_t},), i)
end

"""
    xcb_keysym_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_keysym_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_keysym_end(i)
    ccall((:xcb_keysym_end, libxcb), xcb_generic_iterator_t, (xcb_keysym_iterator_t,), i)
end

"""
    xcb_keycode_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_keycode_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_keycode_iterator_t`](@ref)
"""
function xcb_keycode_next(i)
    ccall((:xcb_keycode_next, libxcb), Cvoid, (Ptr{xcb_keycode_iterator_t},), i)
end

"""
    xcb_keycode_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_keycode_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_keycode_end(i)
    ccall((:xcb_keycode_end, libxcb), xcb_generic_iterator_t, (xcb_keycode_iterator_t,), i)
end

"""
    xcb_keycode32_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_keycode32_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_keycode32_iterator_t`](@ref)
"""
function xcb_keycode32_next(i)
    ccall((:xcb_keycode32_next, libxcb), Cvoid, (Ptr{xcb_keycode32_iterator_t},), i)
end

"""
    xcb_keycode32_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_keycode32_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_keycode32_end(i)
    ccall((:xcb_keycode32_end, libxcb), xcb_generic_iterator_t, (xcb_keycode32_iterator_t,), i)
end

"""
    xcb_button_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_button_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_button_iterator_t`](@ref)
"""
function xcb_button_next(i)
    ccall((:xcb_button_next, libxcb), Cvoid, (Ptr{xcb_button_iterator_t},), i)
end

"""
    xcb_button_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_button_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_button_end(i)
    ccall((:xcb_button_end, libxcb), xcb_generic_iterator_t, (xcb_button_iterator_t,), i)
end

"""
    xcb_point_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_point_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_point_iterator_t`](@ref)
"""
function xcb_point_next(i)
    ccall((:xcb_point_next, libxcb), Cvoid, (Ptr{xcb_point_iterator_t},), i)
end

"""
    xcb_point_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_point_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_point_end(i)
    ccall((:xcb_point_end, libxcb), xcb_generic_iterator_t, (xcb_point_iterator_t,), i)
end

"""
    xcb_rectangle_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_rectangle_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_rectangle_iterator_t`](@ref)
"""
function xcb_rectangle_next(i)
    ccall((:xcb_rectangle_next, libxcb), Cvoid, (Ptr{xcb_rectangle_iterator_t},), i)
end

"""
    xcb_rectangle_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_rectangle_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_rectangle_end(i)
    ccall((:xcb_rectangle_end, libxcb), xcb_generic_iterator_t, (xcb_rectangle_iterator_t,), i)
end

"""
    xcb_arc_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_arc_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_arc_iterator_t`](@ref)
"""
function xcb_arc_next(i)
    ccall((:xcb_arc_next, libxcb), Cvoid, (Ptr{xcb_arc_iterator_t},), i)
end

"""
    xcb_arc_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_arc_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_arc_end(i)
    ccall((:xcb_arc_end, libxcb), xcb_generic_iterator_t, (xcb_arc_iterator_t,), i)
end

"""
    xcb_format_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_format_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_format_iterator_t`](@ref)
"""
function xcb_format_next(i)
    ccall((:xcb_format_next, libxcb), Cvoid, (Ptr{xcb_format_iterator_t},), i)
end

"""
    xcb_format_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_format_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_format_end(i)
    ccall((:xcb_format_end, libxcb), xcb_generic_iterator_t, (xcb_format_iterator_t,), i)
end

"""
    xcb_visualtype_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_visualtype_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_visualtype_iterator_t`](@ref)
"""
function xcb_visualtype_next(i)
    ccall((:xcb_visualtype_next, libxcb), Cvoid, (Ptr{xcb_visualtype_iterator_t},), i)
end

"""
    xcb_visualtype_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_visualtype_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_visualtype_end(i)
    ccall((:xcb_visualtype_end, libxcb), xcb_generic_iterator_t, (xcb_visualtype_iterator_t,), i)
end

function xcb_depth_sizeof(_buffer)
    ccall((:xcb_depth_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_depth_visuals(R)
    ccall((:xcb_depth_visuals, libxcb), Ptr{xcb_visualtype_t}, (Ptr{xcb_depth_t},), R)
end

function xcb_depth_visuals_length(R)
    ccall((:xcb_depth_visuals_length, libxcb), Cint, (Ptr{xcb_depth_t},), R)
end

function xcb_depth_visuals_iterator(R)
    ccall((:xcb_depth_visuals_iterator, libxcb), xcb_visualtype_iterator_t, (Ptr{xcb_depth_t},), R)
end

"""
    xcb_depth_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_depth_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_depth_iterator_t`](@ref)
"""
function xcb_depth_next(i)
    ccall((:xcb_depth_next, libxcb), Cvoid, (Ptr{xcb_depth_iterator_t},), i)
end

"""
    xcb_depth_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_depth_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_depth_end(i)
    ccall((:xcb_depth_end, libxcb), xcb_generic_iterator_t, (xcb_depth_iterator_t,), i)
end

function xcb_screen_sizeof(_buffer)
    ccall((:xcb_screen_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_screen_allowed_depths_length(R)
    ccall((:xcb_screen_allowed_depths_length, libxcb), Cint, (Ptr{xcb_screen_t},), R)
end

function xcb_screen_allowed_depths_iterator(R)
    ccall((:xcb_screen_allowed_depths_iterator, libxcb), xcb_depth_iterator_t, (Ptr{xcb_screen_t},), R)
end

"""
    xcb_screen_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_screen_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_screen_iterator_t`](@ref)
"""
function xcb_screen_next(i)
    ccall((:xcb_screen_next, libxcb), Cvoid, (Ptr{xcb_screen_iterator_t},), i)
end

"""
    xcb_screen_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_screen_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_screen_end(i)
    ccall((:xcb_screen_end, libxcb), xcb_generic_iterator_t, (xcb_screen_iterator_t,), i)
end

function xcb_setup_request_sizeof(_buffer)
    ccall((:xcb_setup_request_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_setup_request_authorization_protocol_name(R)
    ccall((:xcb_setup_request_authorization_protocol_name, libxcb), Ptr{Cchar}, (Ptr{xcb_setup_request_t},), R)
end

function xcb_setup_request_authorization_protocol_name_length(R)
    ccall((:xcb_setup_request_authorization_protocol_name_length, libxcb), Cint, (Ptr{xcb_setup_request_t},), R)
end

function xcb_setup_request_authorization_protocol_name_end(R)
    ccall((:xcb_setup_request_authorization_protocol_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_setup_request_t},), R)
end

function xcb_setup_request_authorization_protocol_data(R)
    ccall((:xcb_setup_request_authorization_protocol_data, libxcb), Ptr{Cchar}, (Ptr{xcb_setup_request_t},), R)
end

function xcb_setup_request_authorization_protocol_data_length(R)
    ccall((:xcb_setup_request_authorization_protocol_data_length, libxcb), Cint, (Ptr{xcb_setup_request_t},), R)
end

function xcb_setup_request_authorization_protocol_data_end(R)
    ccall((:xcb_setup_request_authorization_protocol_data_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_setup_request_t},), R)
end

"""
    xcb_setup_request_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_setup_request_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_setup_request_iterator_t`](@ref)
"""
function xcb_setup_request_next(i)
    ccall((:xcb_setup_request_next, libxcb), Cvoid, (Ptr{xcb_setup_request_iterator_t},), i)
end

"""
    xcb_setup_request_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_setup_request_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_setup_request_end(i)
    ccall((:xcb_setup_request_end, libxcb), xcb_generic_iterator_t, (xcb_setup_request_iterator_t,), i)
end

function xcb_setup_failed_sizeof(_buffer)
    ccall((:xcb_setup_failed_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_setup_failed_reason(R)
    ccall((:xcb_setup_failed_reason, libxcb), Ptr{Cchar}, (Ptr{xcb_setup_failed_t},), R)
end

function xcb_setup_failed_reason_length(R)
    ccall((:xcb_setup_failed_reason_length, libxcb), Cint, (Ptr{xcb_setup_failed_t},), R)
end

function xcb_setup_failed_reason_end(R)
    ccall((:xcb_setup_failed_reason_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_setup_failed_t},), R)
end

"""
    xcb_setup_failed_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_setup_failed_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_setup_failed_iterator_t`](@ref)
"""
function xcb_setup_failed_next(i)
    ccall((:xcb_setup_failed_next, libxcb), Cvoid, (Ptr{xcb_setup_failed_iterator_t},), i)
end

"""
    xcb_setup_failed_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_setup_failed_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_setup_failed_end(i)
    ccall((:xcb_setup_failed_end, libxcb), xcb_generic_iterator_t, (xcb_setup_failed_iterator_t,), i)
end

function xcb_setup_authenticate_sizeof(_buffer)
    ccall((:xcb_setup_authenticate_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_setup_authenticate_reason(R)
    ccall((:xcb_setup_authenticate_reason, libxcb), Ptr{Cchar}, (Ptr{xcb_setup_authenticate_t},), R)
end

function xcb_setup_authenticate_reason_length(R)
    ccall((:xcb_setup_authenticate_reason_length, libxcb), Cint, (Ptr{xcb_setup_authenticate_t},), R)
end

function xcb_setup_authenticate_reason_end(R)
    ccall((:xcb_setup_authenticate_reason_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_setup_authenticate_t},), R)
end

"""
    xcb_setup_authenticate_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_setup_authenticate_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_setup_authenticate_iterator_t`](@ref)
"""
function xcb_setup_authenticate_next(i)
    ccall((:xcb_setup_authenticate_next, libxcb), Cvoid, (Ptr{xcb_setup_authenticate_iterator_t},), i)
end

"""
    xcb_setup_authenticate_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_setup_authenticate_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_setup_authenticate_end(i)
    ccall((:xcb_setup_authenticate_end, libxcb), xcb_generic_iterator_t, (xcb_setup_authenticate_iterator_t,), i)
end

function xcb_setup_sizeof(_buffer)
    ccall((:xcb_setup_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_setup_vendor(R)
    ccall((:xcb_setup_vendor, libxcb), Ptr{Cchar}, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_vendor_length(R)
    ccall((:xcb_setup_vendor_length, libxcb), Cint, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_vendor_end(R)
    ccall((:xcb_setup_vendor_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_pixmap_formats(R)
    ccall((:xcb_setup_pixmap_formats, libxcb), Ptr{xcb_format_t}, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_pixmap_formats_length(R)
    ccall((:xcb_setup_pixmap_formats_length, libxcb), Cint, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_pixmap_formats_iterator(R)
    ccall((:xcb_setup_pixmap_formats_iterator, libxcb), xcb_format_iterator_t, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_roots_length(R)
    ccall((:xcb_setup_roots_length, libxcb), Cint, (Ptr{xcb_setup_t},), R)
end

function xcb_setup_roots_iterator(R)
    ccall((:xcb_setup_roots_iterator, libxcb), xcb_screen_iterator_t, (Ptr{xcb_setup_t},), R)
end

"""
    xcb_setup_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_setup_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_setup_iterator_t`](@ref)
"""
function xcb_setup_next(i)
    ccall((:xcb_setup_next, libxcb), Cvoid, (Ptr{xcb_setup_iterator_t},), i)
end

"""
    xcb_setup_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_setup_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_setup_end(i)
    ccall((:xcb_setup_end, libxcb), xcb_generic_iterator_t, (xcb_setup_iterator_t,), i)
end

"""
    xcb_client_message_data_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_client_message_data_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_client_message_data_iterator_t`](@ref)
"""
function xcb_client_message_data_next(i)
    ccall((:xcb_client_message_data_next, libxcb), Cvoid, (Ptr{xcb_client_message_data_iterator_t},), i)
end

"""
    xcb_client_message_data_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_client_message_data_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_client_message_data_end(i)
    ccall((:xcb_client_message_data_end, libxcb), xcb_generic_iterator_t, (xcb_client_message_data_iterator_t,), i)
end

function xcb_create_window_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_create_window_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt32, Ptr{xcb_create_window_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_create_window_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_create_window_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt32, Ptr{xcb_create_window_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_create_window_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_create_window_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, value_mask)
end

function xcb_create_window_sizeof(_buffer)
    ccall((:xcb_create_window_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_create_window_checked(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)

Creates a window

Creates an unmapped window as child of the specified *parent* window. A CreateNotify event will be generated. The new window is placed on top in the stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms of pixels, and coincide with pixel centers. Each window and pixmap has its own coordinate system. For a window, the origin is inside the border at the inside, upper-left corner.

The created window is not yet displayed (mapped), call [`xcb_map_window`](@ref) to display it.

The created window will initially use the same cursor as its parent.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `depth`: Specifies the new window's depth (TODO: what unit?).  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the depth is taken from the *parent* window.
* `wid`: The ID with which you will refer to the new window, created by [`xcb_generate_id`](@ref).
* `parent`: The parent window of the new window.
* `x`: The X coordinate of the new window.
* `y`: The Y coordinate of the new window.
* `width`: The width of the new window.
* `height`: The height of the new window.
* `border_width`: TODO:  Must be zero if the `class` is `InputOnly` or a [`xcb_match_error_t`](@ref) occurs.
* `_class`: A bitmask of #[`xcb_window_class_t`](@ref) values.
* `_class`:
* `visual`: Specifies the id for the new window's visual.  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the visual is taken from the *parent* window.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
### Returns
A cookie
"""
function xcb_create_window_checked(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
    ccall((:xcb_create_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, UInt16, UInt16, xcb_visualid_t, UInt32, Ptr{Cvoid}), c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
end

"""
    xcb_create_window(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)

Creates a window

Creates an unmapped window as child of the specified *parent* window. A CreateNotify event will be generated. The new window is placed on top in the stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms of pixels, and coincide with pixel centers. Each window and pixmap has its own coordinate system. For a window, the origin is inside the border at the inside, upper-left corner.

The created window is not yet displayed (mapped), call [`xcb_map_window`](@ref) to display it.

The created window will initially use the same cursor as its parent.

### Parameters
* `c`: The connection
* `depth`: Specifies the new window's depth (TODO: what unit?).  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the depth is taken from the *parent* window.
* `wid`: The ID with which you will refer to the new window, created by [`xcb_generate_id`](@ref).
* `parent`: The parent window of the new window.
* `x`: The X coordinate of the new window.
* `y`: The Y coordinate of the new window.
* `width`: The width of the new window.
* `height`: The height of the new window.
* `border_width`: TODO:  Must be zero if the `class` is `InputOnly` or a [`xcb_match_error_t`](@ref) occurs.
* `_class`: A bitmask of #[`xcb_window_class_t`](@ref) values.
* `_class`:
* `visual`: Specifies the id for the new window's visual.  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the visual is taken from the *parent* window.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
### Returns
A cookie
"""
function xcb_create_window(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
    ccall((:xcb_create_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, UInt16, UInt16, xcb_visualid_t, UInt32, Ptr{Cvoid}), c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
end

"""
    xcb_create_window_aux_checked(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)

Creates a window

Creates an unmapped window as child of the specified *parent* window. A CreateNotify event will be generated. The new window is placed on top in the stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms of pixels, and coincide with pixel centers. Each window and pixmap has its own coordinate system. For a window, the origin is inside the border at the inside, upper-left corner.

The created window is not yet displayed (mapped), call [`xcb_map_window`](@ref) to display it.

The created window will initially use the same cursor as its parent.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `depth`: Specifies the new window's depth (TODO: what unit?).  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the depth is taken from the *parent* window.
* `wid`: The ID with which you will refer to the new window, created by [`xcb_generate_id`](@ref).
* `parent`: The parent window of the new window.
* `x`: The X coordinate of the new window.
* `y`: The Y coordinate of the new window.
* `width`: The width of the new window.
* `height`: The height of the new window.
* `border_width`: TODO:  Must be zero if the `class` is `InputOnly` or a [`xcb_match_error_t`](@ref) occurs.
* `_class`: A bitmask of #[`xcb_window_class_t`](@ref) values.
* `_class`:
* `visual`: Specifies the id for the new window's visual.  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the visual is taken from the *parent* window.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
### Returns
A cookie
"""
function xcb_create_window_aux_checked(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
    ccall((:xcb_create_window_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, UInt16, UInt16, xcb_visualid_t, UInt32, Ptr{xcb_create_window_value_list_t}), c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
end

"""
    xcb_create_window_aux(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)

Creates a window

Creates an unmapped window as child of the specified *parent* window. A CreateNotify event will be generated. The new window is placed on top in the stacking order with respect to siblings.

The coordinate system has the X axis horizontal and the Y axis vertical with the origin [0, 0] at the upper-left corner. Coordinates are integral, in terms of pixels, and coincide with pixel centers. Each window and pixmap has its own coordinate system. For a window, the origin is inside the border at the inside, upper-left corner.

The created window is not yet displayed (mapped), call [`xcb_map_window`](@ref) to display it.

The created window will initially use the same cursor as its parent.

### Parameters
* `c`: The connection
* `depth`: Specifies the new window's depth (TODO: what unit?).  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the depth is taken from the *parent* window.
* `wid`: The ID with which you will refer to the new window, created by [`xcb_generate_id`](@ref).
* `parent`: The parent window of the new window.
* `x`: The X coordinate of the new window.
* `y`: The Y coordinate of the new window.
* `width`: The width of the new window.
* `height`: The height of the new window.
* `border_width`: TODO:  Must be zero if the `class` is `InputOnly` or a [`xcb_match_error_t`](@ref) occurs.
* `_class`: A bitmask of #[`xcb_window_class_t`](@ref) values.
* `_class`:
* `visual`: Specifies the id for the new window's visual.  The special value [`XCB_COPY_FROM_PARENT`](@ref) means the visual is taken from the *parent* window.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
### Returns
A cookie
"""
function xcb_create_window_aux(c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
    ccall((:xcb_create_window_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, UInt16, UInt16, xcb_visualid_t, UInt32, Ptr{xcb_create_window_value_list_t}), c, depth, wid, parent, x, y, width, height, border_width, _class, visual, value_mask, value_list)
end

function xcb_create_window_value_list(R)
    ccall((:xcb_create_window_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_create_window_request_t},), R)
end

function xcb_change_window_attributes_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_change_window_attributes_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt32, Ptr{xcb_change_window_attributes_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_window_attributes_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_change_window_attributes_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt32, Ptr{xcb_change_window_attributes_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_window_attributes_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_change_window_attributes_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, value_mask)
end

function xcb_change_window_attributes_sizeof(_buffer)
    ccall((:xcb_change_window_attributes_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_window_attributes_checked(c, window, value_mask, value_list)

change window attributes

Changes the attributes specified by *value_mask* for the specified *window*.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to change.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the attributes specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_window_attributes_checked(c, window, value_mask, value_list)
    ccall((:xcb_change_window_attributes_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt32, Ptr{Cvoid}), c, window, value_mask, value_list)
end

"""
    xcb_change_window_attributes(c, window, value_mask, value_list)

change window attributes

Changes the attributes specified by *value_mask* for the specified *window*.

### Parameters
* `c`: The connection
* `window`: The window to change.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the attributes specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_window_attributes(c, window, value_mask, value_list)
    ccall((:xcb_change_window_attributes, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt32, Ptr{Cvoid}), c, window, value_mask, value_list)
end

"""
    xcb_change_window_attributes_aux_checked(c, window, value_mask, value_list)

change window attributes

Changes the attributes specified by *value_mask* for the specified *window*.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to change.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the attributes specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_window_attributes_aux_checked(c, window, value_mask, value_list)
    ccall((:xcb_change_window_attributes_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt32, Ptr{xcb_change_window_attributes_value_list_t}), c, window, value_mask, value_list)
end

"""
    xcb_change_window_attributes_aux(c, window, value_mask, value_list)

change window attributes

Changes the attributes specified by *value_mask* for the specified *window*.

### Parameters
* `c`: The connection
* `window`: The window to change.
* `value_mask`: A bitmask of #[`xcb_cw_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the attributes specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_window_attributes_aux(c, window, value_mask, value_list)
    ccall((:xcb_change_window_attributes_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt32, Ptr{xcb_change_window_attributes_value_list_t}), c, window, value_mask, value_list)
end

function xcb_change_window_attributes_value_list(R)
    ccall((:xcb_change_window_attributes_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_change_window_attributes_request_t},), R)
end

"""
    xcb_get_window_attributes(c, window)

Gets window attributes

Gets the current attributes for the specified *window*.

### Parameters
* `c`: The connection
* `window`: The window to get the attributes from.
### Returns
A cookie
"""
function xcb_get_window_attributes(c, window)
    ccall((:xcb_get_window_attributes, libxcb), xcb_get_window_attributes_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_get_window_attributes_unchecked(c, window)

Gets window attributes

Gets the current attributes for the specified *window*.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `window`: The window to get the attributes from.
### Returns
A cookie
"""
function xcb_get_window_attributes_unchecked(c, window)
    ccall((:xcb_get_window_attributes_unchecked, libxcb), xcb_get_window_attributes_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_get_window_attributes_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_window_attributes_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_window_attributes_reply(c, cookie, e)
    ccall((:xcb_get_window_attributes_reply, libxcb), Ptr{xcb_get_window_attributes_reply_t}, (Ptr{xcb_connection_t}, xcb_get_window_attributes_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_destroy_window_checked(c, window)

Destroys a window

Destroys the specified window and all of its subwindows. A DestroyNotify event is generated for each destroyed window (a DestroyNotify event is first generated for any given window's inferiors). If the window was mapped, it will be automatically unmapped before destroying.

Calling DestroyWindow on the root window will do nothing.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to destroy.
### Returns
A cookie
"""
function xcb_destroy_window_checked(c, window)
    ccall((:xcb_destroy_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_destroy_window(c, window)

Destroys a window

Destroys the specified window and all of its subwindows. A DestroyNotify event is generated for each destroyed window (a DestroyNotify event is first generated for any given window's inferiors). If the window was mapped, it will be automatically unmapped before destroying.

Calling DestroyWindow on the root window will do nothing.

### Parameters
* `c`: The connection
* `window`: The window to destroy.
### Returns
A cookie
"""
function xcb_destroy_window(c, window)
    ccall((:xcb_destroy_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_destroy_subwindows_checked(c, window)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_destroy_subwindows_checked(c, window)
    ccall((:xcb_destroy_subwindows_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_destroy_subwindows(c, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_destroy_subwindows(c, window)
    ccall((:xcb_destroy_subwindows, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_change_save_set_checked(c, mode, window)

Changes a client's save set

TODO: explain what the save set is for.

This function either adds or removes the specified window to the client's (your application's) save set.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_set_mode_t`](@ref) values.
* `mode`: Insert to add the specified window to the save set or Delete to delete it from the save set.
* `window`: The window to add or delete to/from your save set.
### Returns
A cookie
"""
function xcb_change_save_set_checked(c, mode, window)
    ccall((:xcb_change_save_set_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t), c, mode, window)
end

"""
    xcb_change_save_set(c, mode, window)

Changes a client's save set

TODO: explain what the save set is for.

This function either adds or removes the specified window to the client's (your application's) save set.

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_set_mode_t`](@ref) values.
* `mode`: Insert to add the specified window to the save set or Delete to delete it from the save set.
* `window`: The window to add or delete to/from your save set.
### Returns
A cookie
"""
function xcb_change_save_set(c, mode, window)
    ccall((:xcb_change_save_set, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t), c, mode, window)
end

"""
    xcb_reparent_window_checked(c, window, parent, x, y)

Reparents a window

Makes the specified window a child of the specified parent window. If the window is mapped, it will automatically be unmapped before reparenting and re-mapped after reparenting. The window is placed in the stacking order on top with respect to sibling windows.

After reparenting, a ReparentNotify event is generated.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to reparent.
* `parent`: The new parent of the window.
* `x`: The X position of the window within its new parent.
* `y`: The Y position of the window within its new parent.
### Returns
A cookie
"""
function xcb_reparent_window_checked(c, window, parent, x, y)
    ccall((:xcb_reparent_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16), c, window, parent, x, y)
end

"""
    xcb_reparent_window(c, window, parent, x, y)

Reparents a window

Makes the specified window a child of the specified parent window. If the window is mapped, it will automatically be unmapped before reparenting and re-mapped after reparenting. The window is placed in the stacking order on top with respect to sibling windows.

After reparenting, a ReparentNotify event is generated.

### Parameters
* `c`: The connection
* `window`: The window to reparent.
* `parent`: The new parent of the window.
* `x`: The X position of the window within its new parent.
* `y`: The Y position of the window within its new parent.
### Returns
A cookie
"""
function xcb_reparent_window(c, window, parent, x, y)
    ccall((:xcb_reparent_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16), c, window, parent, x, y)
end

"""
    xcb_map_window_checked(c, window)

Makes a window visible

Maps the specified window. This means making the window visible (as long as its parent is visible).

This MapWindow request will be translated to a MapRequest request if a window manager is running. The window manager then decides to either map the window or not. Set the override-redirect window attribute to true if you want to bypass this mechanism.

If the window manager decides to map the window (or if no window manager is running), a MapNotify event is generated.

If the window becomes viewable and no earlier contents for it are remembered, the X server tiles the window with its background. If the window's background is undefined, the existing screen contents are not altered, and the X server generates zero or more Expose events.

If the window type is InputOutput, an Expose event will be generated when the window becomes visible. The normal response to an Expose event should be to repaint the window.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to make visible.
### Returns
A cookie
"""
function xcb_map_window_checked(c, window)
    ccall((:xcb_map_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_map_window(c, window)

Makes a window visible

Maps the specified window. This means making the window visible (as long as its parent is visible).

This MapWindow request will be translated to a MapRequest request if a window manager is running. The window manager then decides to either map the window or not. Set the override-redirect window attribute to true if you want to bypass this mechanism.

If the window manager decides to map the window (or if no window manager is running), a MapNotify event is generated.

If the window becomes viewable and no earlier contents for it are remembered, the X server tiles the window with its background. If the window's background is undefined, the existing screen contents are not altered, and the X server generates zero or more Expose events.

If the window type is InputOutput, an Expose event will be generated when the window becomes visible. The normal response to an Expose event should be to repaint the window.

### Parameters
* `c`: The connection
* `window`: The window to make visible.
### Returns
A cookie
"""
function xcb_map_window(c, window)
    ccall((:xcb_map_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_map_subwindows_checked(c, window)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_map_subwindows_checked(c, window)
    ccall((:xcb_map_subwindows_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_map_subwindows(c, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_map_subwindows(c, window)
    ccall((:xcb_map_subwindows, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_unmap_window_checked(c, window)

Makes a window invisible

Unmaps the specified window. This means making the window invisible (and all its child windows).

Unmapping a window leads to the `UnmapNotify` event being generated. Also, `Expose` events are generated for formerly obscured windows.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to make invisible.
### Returns
A cookie
"""
function xcb_unmap_window_checked(c, window)
    ccall((:xcb_unmap_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_unmap_window(c, window)

Makes a window invisible

Unmaps the specified window. This means making the window invisible (and all its child windows).

Unmapping a window leads to the `UnmapNotify` event being generated. Also, `Expose` events are generated for formerly obscured windows.

### Parameters
* `c`: The connection
* `window`: The window to make invisible.
### Returns
A cookie
"""
function xcb_unmap_window(c, window)
    ccall((:xcb_unmap_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_unmap_subwindows_checked(c, window)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_unmap_subwindows_checked(c, window)
    ccall((:xcb_unmap_subwindows_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_unmap_subwindows(c, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_unmap_subwindows(c, window)
    ccall((:xcb_unmap_subwindows, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

function xcb_configure_window_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_configure_window_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt16, Ptr{xcb_configure_window_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_configure_window_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_configure_window_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt16, Ptr{xcb_configure_window_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_configure_window_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_configure_window_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt16), _buffer, value_mask)
end

function xcb_configure_window_sizeof(_buffer)
    ccall((:xcb_configure_window_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_configure_window_checked(c, window, value_mask, value_list)

Configures window attributes

Configures a window's size, position, border width and stacking order.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to configure.
* `value_mask`: Bitmask of attributes to change.
* `value_list`: New values, corresponding to the attributes in value\\_mask. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_configure_window_checked(c, window, value_mask, value_list)
    ccall((:xcb_configure_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Ptr{Cvoid}), c, window, value_mask, value_list)
end

"""
    xcb_configure_window(c, window, value_mask, value_list)

Configures window attributes

Configures a window's size, position, border width and stacking order.

### Parameters
* `c`: The connection
* `window`: The window to configure.
* `value_mask`: Bitmask of attributes to change.
* `value_list`: New values, corresponding to the attributes in value\\_mask. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_configure_window(c, window, value_mask, value_list)
    ccall((:xcb_configure_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Ptr{Cvoid}), c, window, value_mask, value_list)
end

"""
    xcb_configure_window_aux_checked(c, window, value_mask, value_list)

Configures window attributes

Configures a window's size, position, border width and stacking order.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `window`: The window to configure.
* `value_mask`: Bitmask of attributes to change.
* `value_list`: New values, corresponding to the attributes in value\\_mask. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_configure_window_aux_checked(c, window, value_mask, value_list)
    ccall((:xcb_configure_window_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Ptr{xcb_configure_window_value_list_t}), c, window, value_mask, value_list)
end

"""
    xcb_configure_window_aux(c, window, value_mask, value_list)

Configures window attributes

Configures a window's size, position, border width and stacking order.

### Parameters
* `c`: The connection
* `window`: The window to configure.
* `value_mask`: Bitmask of attributes to change.
* `value_list`: New values, corresponding to the attributes in value\\_mask. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_configure_window_aux(c, window, value_mask, value_list)
    ccall((:xcb_configure_window_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Ptr{xcb_configure_window_value_list_t}), c, window, value_mask, value_list)
end

function xcb_configure_window_value_list(R)
    ccall((:xcb_configure_window_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_configure_window_request_t},), R)
end

"""
    xcb_circulate_window_checked(c, direction, window)

Change window stacking order

If *direction* is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if any) will be raised to the top of the stack.

If *direction* is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will be lowered to the bottom of the stack.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `direction`: A bitmask of #[`xcb_circulate_t`](@ref) values.
* `direction`:
* `window`: The window to raise/lower (depending on *direction*).
### Returns
A cookie
"""
function xcb_circulate_window_checked(c, direction, window)
    ccall((:xcb_circulate_window_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t), c, direction, window)
end

"""
    xcb_circulate_window(c, direction, window)

Change window stacking order

If *direction* is `XCB_CIRCULATE_RAISE_LOWEST`, the lowest mapped child (if any) will be raised to the top of the stack.

If *direction* is `XCB_CIRCULATE_LOWER_HIGHEST`, the highest mapped child will be lowered to the bottom of the stack.

### Parameters
* `c`: The connection
* `direction`: A bitmask of #[`xcb_circulate_t`](@ref) values.
* `direction`:
* `window`: The window to raise/lower (depending on *direction*).
### Returns
A cookie
"""
function xcb_circulate_window(c, direction, window)
    ccall((:xcb_circulate_window, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t), c, direction, window)
end

"""
    xcb_get_geometry(c, drawable)

Get current window geometry

Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).

### Parameters
* `c`: The connection
* `drawable`: The drawable (`Window` or `Pixmap`) of which the geometry will be received.
### Returns
A cookie
"""
function xcb_get_geometry(c, drawable)
    ccall((:xcb_get_geometry, libxcb), xcb_get_geometry_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t), c, drawable)
end

"""
    xcb_get_geometry_unchecked(c, drawable)

Get current window geometry

Gets the current geometry of the specified drawable (either `Window` or `Pixmap`).

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `drawable`: The drawable (`Window` or `Pixmap`) of which the geometry will be received.
### Returns
A cookie
"""
function xcb_get_geometry_unchecked(c, drawable)
    ccall((:xcb_get_geometry_unchecked, libxcb), xcb_get_geometry_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t), c, drawable)
end

"""
    xcb_get_geometry_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_geometry_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_geometry_reply(c, cookie, e)
    ccall((:xcb_get_geometry_reply, libxcb), Ptr{xcb_get_geometry_reply_t}, (Ptr{xcb_connection_t}, xcb_get_geometry_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_query_tree_sizeof(_buffer)
    ccall((:xcb_query_tree_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_query_tree(c, window)

query the window tree

Gets the root window ID, parent window ID and list of children windows for the specified *window*. The children are listed in bottom-to-top stacking order.

### Parameters
* `c`: The connection
* `window`: The *window* to query.
### Returns
A cookie
"""
function xcb_query_tree(c, window)
    ccall((:xcb_query_tree, libxcb), xcb_query_tree_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_query_tree_unchecked(c, window)

query the window tree

Gets the root window ID, parent window ID and list of children windows for the specified *window*. The children are listed in bottom-to-top stacking order.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `window`: The *window* to query.
### Returns
A cookie
"""
function xcb_query_tree_unchecked(c, window)
    ccall((:xcb_query_tree_unchecked, libxcb), xcb_query_tree_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

function xcb_query_tree_children(R)
    ccall((:xcb_query_tree_children, libxcb), Ptr{xcb_window_t}, (Ptr{xcb_query_tree_reply_t},), R)
end

function xcb_query_tree_children_length(R)
    ccall((:xcb_query_tree_children_length, libxcb), Cint, (Ptr{xcb_query_tree_reply_t},), R)
end

function xcb_query_tree_children_end(R)
    ccall((:xcb_query_tree_children_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_query_tree_reply_t},), R)
end

"""
    xcb_query_tree_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_tree_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_tree_reply(c, cookie, e)
    ccall((:xcb_query_tree_reply, libxcb), Ptr{xcb_query_tree_reply_t}, (Ptr{xcb_connection_t}, xcb_query_tree_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_intern_atom_sizeof(_buffer)
    ccall((:xcb_intern_atom_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_intern_atom(c, only_if_exists, name_len, name)

Get atom identifier by name

Retrieves the identifier ([`xcb_atom_t`](@ref) TODO) for the atom with the specified name. Atoms are used in protocols like EWMH, for example to store window titles (`_NET_WM_NAME` atom) as property of a window.

If *only_if_exists* is 0, the atom will be created if it does not already exist. If *only_if_exists* is 1, `XCB_ATOM_NONE` will be returned if the atom does not yet exist.

### Parameters
* `c`: The connection
* `only_if_exists`: Return a valid atom id only if the atom already exists.
* `name_len`: The length of the following *name*.
* `name`: The name of the atom.
### Returns
A cookie
"""
function xcb_intern_atom(c, only_if_exists, name_len, name)
    ccall((:xcb_intern_atom, libxcb), xcb_intern_atom_cookie_t, (Ptr{xcb_connection_t}, UInt8, UInt16, Ptr{Cchar}), c, only_if_exists, name_len, name)
end

"""
    xcb_intern_atom_unchecked(c, only_if_exists, name_len, name)

Get atom identifier by name

Retrieves the identifier ([`xcb_atom_t`](@ref) TODO) for the atom with the specified name. Atoms are used in protocols like EWMH, for example to store window titles (`_NET_WM_NAME` atom) as property of a window.

If *only_if_exists* is 0, the atom will be created if it does not already exist. If *only_if_exists* is 1, `XCB_ATOM_NONE` will be returned if the atom does not yet exist.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `only_if_exists`: Return a valid atom id only if the atom already exists.
* `name_len`: The length of the following *name*.
* `name`: The name of the atom.
### Returns
A cookie
"""
function xcb_intern_atom_unchecked(c, only_if_exists, name_len, name)
    ccall((:xcb_intern_atom_unchecked, libxcb), xcb_intern_atom_cookie_t, (Ptr{xcb_connection_t}, UInt8, UInt16, Ptr{Cchar}), c, only_if_exists, name_len, name)
end

"""
    xcb_intern_atom_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_intern_atom_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_intern_atom_reply(c, cookie, e)
    ccall((:xcb_intern_atom_reply, libxcb), Ptr{xcb_intern_atom_reply_t}, (Ptr{xcb_connection_t}, xcb_intern_atom_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_get_atom_name_sizeof(_buffer)
    ccall((:xcb_get_atom_name_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_atom_name(c, atom)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_atom_name(c, atom)
    ccall((:xcb_get_atom_name, libxcb), xcb_get_atom_name_cookie_t, (Ptr{xcb_connection_t}, xcb_atom_t), c, atom)
end

"""
    xcb_get_atom_name_unchecked(c, atom)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_atom_name_unchecked(c, atom)
    ccall((:xcb_get_atom_name_unchecked, libxcb), xcb_get_atom_name_cookie_t, (Ptr{xcb_connection_t}, xcb_atom_t), c, atom)
end

function xcb_get_atom_name_name(R)
    ccall((:xcb_get_atom_name_name, libxcb), Ptr{Cchar}, (Ptr{xcb_get_atom_name_reply_t},), R)
end

function xcb_get_atom_name_name_length(R)
    ccall((:xcb_get_atom_name_name_length, libxcb), Cint, (Ptr{xcb_get_atom_name_reply_t},), R)
end

function xcb_get_atom_name_name_end(R)
    ccall((:xcb_get_atom_name_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_atom_name_reply_t},), R)
end

"""
    xcb_get_atom_name_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_atom_name_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_atom_name_reply(c, cookie, e)
    ccall((:xcb_get_atom_name_reply, libxcb), Ptr{xcb_get_atom_name_reply_t}, (Ptr{xcb_connection_t}, xcb_get_atom_name_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_change_property_sizeof(_buffer)
    ccall((:xcb_change_property_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_property_checked(c, mode, window, property, type, format, data_len, data)

Changes a window property

Sets or updates a property on the specified *window*. Properties are for example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`). Protocols such as EWMH also use properties - for example EWMH defines the window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_prop_mode_t`](@ref) values.
* `mode`:
* `window`: The window whose property you want to change.
* `property`: The property you want to change (an atom).
* `type`: The type of the property you want to change (an atom).
* `format`: Specifies whether the data should be viewed as a list of 8-bit, 16-bit or 32-bit quantities. Possible values are 8, 16 and 32. This information allows the X server to correctly perform byte-swap operations as necessary.
* `data_len`: Specifies the number of elements (see *format*).
* `data`: The property data.
### Returns
A cookie
"""
function xcb_change_property_checked(c, mode, window, property, type, format, data_len, data)
    ccall((:xcb_change_property_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_atom_t, xcb_atom_t, UInt8, UInt32, Ptr{Cvoid}), c, mode, window, property, type, format, data_len, data)
end

"""
    xcb_change_property(c, mode, window, property, type, format, data_len, data)

Changes a window property

Sets or updates a property on the specified *window*. Properties are for example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`). Protocols such as EWMH also use properties - for example EWMH defines the window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_prop_mode_t`](@ref) values.
* `mode`:
* `window`: The window whose property you want to change.
* `property`: The property you want to change (an atom).
* `type`: The type of the property you want to change (an atom).
* `format`: Specifies whether the data should be viewed as a list of 8-bit, 16-bit or 32-bit quantities. Possible values are 8, 16 and 32. This information allows the X server to correctly perform byte-swap operations as necessary.
* `data_len`: Specifies the number of elements (see *format*).
* `data`: The property data.
### Returns
A cookie
"""
function xcb_change_property(c, mode, window, property, type, format, data_len, data)
    ccall((:xcb_change_property, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_atom_t, xcb_atom_t, UInt8, UInt32, Ptr{Cvoid}), c, mode, window, property, type, format, data_len, data)
end

function xcb_change_property_data(R)
    ccall((:xcb_change_property_data, libxcb), Ptr{Cvoid}, (Ptr{xcb_change_property_request_t},), R)
end

function xcb_change_property_data_length(R)
    ccall((:xcb_change_property_data_length, libxcb), Cint, (Ptr{xcb_change_property_request_t},), R)
end

function xcb_change_property_data_end(R)
    ccall((:xcb_change_property_data_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_change_property_request_t},), R)
end

"""
    xcb_delete_property_checked(c, window, property)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_delete_property_checked(c, window, property)
    ccall((:xcb_delete_property_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t), c, window, property)
end

"""
    xcb_delete_property(c, window, property)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_delete_property(c, window, property)
    ccall((:xcb_delete_property, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t), c, window, property)
end

function xcb_get_property_sizeof(_buffer)
    ccall((:xcb_get_property_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_property(c, _delete, window, property, type, long_offset, long_length)

Gets a window property

Gets the specified *property* from the specified *window*. Properties are for example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`). Protocols such as EWMH also use properties - for example EWMH defines the window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

TODO: talk about *type*  TODO: talk about `delete`

TODO: talk about the offset/length thing. what's a valid use case?

### Parameters
* `c`: The connection
* `_delete`: Whether the property should actually be deleted. For deleting a property, the specified *type* has to match the actual property type.
* `window`: The window whose property you want to get.
* `property`: The property you want to get (an atom).
* `type`: The type of the property you want to get (an atom).
* `long_offset`: Specifies the offset (in 32-bit multiples) in the specified property where the data is to be retrieved.
* `long_length`: Specifies how many 32-bit multiples of data should be retrieved (e.g. if you set *long_length* to 4, you will receive 16 bytes of data).
### Returns
A cookie
"""
function xcb_get_property(c, _delete, window, property, type, long_offset, long_length)
    ccall((:xcb_get_property, libxcb), xcb_get_property_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_atom_t, xcb_atom_t, UInt32, UInt32), c, _delete, window, property, type, long_offset, long_length)
end

"""
    xcb_get_property_unchecked(c, _delete, window, property, type, long_offset, long_length)

Gets a window property

Gets the specified *property* from the specified *window*. Properties are for example the window title (`WM_NAME`) or its minimum size (`WM_NORMAL_HINTS`). Protocols such as EWMH also use properties - for example EWMH defines the window title, encoded as UTF-8 string, in the `_NET_WM_NAME` property.

TODO: talk about *type*  TODO: talk about `delete`

TODO: talk about the offset/length thing. what's a valid use case?

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `_delete`: Whether the property should actually be deleted. For deleting a property, the specified *type* has to match the actual property type.
* `window`: The window whose property you want to get.
* `property`: The property you want to get (an atom).
* `type`: The type of the property you want to get (an atom).
* `long_offset`: Specifies the offset (in 32-bit multiples) in the specified property where the data is to be retrieved.
* `long_length`: Specifies how many 32-bit multiples of data should be retrieved (e.g. if you set *long_length* to 4, you will receive 16 bytes of data).
### Returns
A cookie
"""
function xcb_get_property_unchecked(c, _delete, window, property, type, long_offset, long_length)
    ccall((:xcb_get_property_unchecked, libxcb), xcb_get_property_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_atom_t, xcb_atom_t, UInt32, UInt32), c, _delete, window, property, type, long_offset, long_length)
end

function xcb_get_property_value(R)
    ccall((:xcb_get_property_value, libxcb), Ptr{Cvoid}, (Ptr{xcb_get_property_reply_t},), R)
end

function xcb_get_property_value_length(R)
    ccall((:xcb_get_property_value_length, libxcb), Cint, (Ptr{xcb_get_property_reply_t},), R)
end

function xcb_get_property_value_end(R)
    ccall((:xcb_get_property_value_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_property_reply_t},), R)
end

"""
    xcb_get_property_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_property_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_property_reply(c, cookie, e)
    ccall((:xcb_get_property_reply, libxcb), Ptr{xcb_get_property_reply_t}, (Ptr{xcb_connection_t}, xcb_get_property_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_list_properties_sizeof(_buffer)
    ccall((:xcb_list_properties_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_properties(c, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_properties(c, window)
    ccall((:xcb_list_properties, libxcb), xcb_list_properties_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_list_properties_unchecked(c, window)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_properties_unchecked(c, window)
    ccall((:xcb_list_properties_unchecked, libxcb), xcb_list_properties_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

function xcb_list_properties_atoms(R)
    ccall((:xcb_list_properties_atoms, libxcb), Ptr{xcb_atom_t}, (Ptr{xcb_list_properties_reply_t},), R)
end

function xcb_list_properties_atoms_length(R)
    ccall((:xcb_list_properties_atoms_length, libxcb), Cint, (Ptr{xcb_list_properties_reply_t},), R)
end

function xcb_list_properties_atoms_end(R)
    ccall((:xcb_list_properties_atoms_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_list_properties_reply_t},), R)
end

"""
    xcb_list_properties_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_properties_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_properties_reply(c, cookie, e)
    ccall((:xcb_list_properties_reply, libxcb), Ptr{xcb_list_properties_reply_t}, (Ptr{xcb_connection_t}, xcb_list_properties_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_set_selection_owner_checked(c, owner, selection, time)

Sets the owner of a selection

Makes `window` the owner of the selection *selection* and updates the last-change time of the specified selection.

TODO: briefly explain what a selection is.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `owner`: The new owner of the selection.  The special value [`XCB_NONE`](@ref) means that the selection will have no owner.
* `selection`: The selection.
* `time`: Timestamp to avoid race conditions when running X over the network.  The selection will not be changed if *time* is earlier than the current last-change time of the *selection* or is later than the current X server time. Otherwise, the last-change time is set to the specified time.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_set_selection_owner_checked(c, owner, selection, time)
    ccall((:xcb_set_selection_owner_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t, xcb_timestamp_t), c, owner, selection, time)
end

"""
    xcb_set_selection_owner(c, owner, selection, time)

Sets the owner of a selection

Makes `window` the owner of the selection *selection* and updates the last-change time of the specified selection.

TODO: briefly explain what a selection is.

### Parameters
* `c`: The connection
* `owner`: The new owner of the selection.  The special value [`XCB_NONE`](@ref) means that the selection will have no owner.
* `selection`: The selection.
* `time`: Timestamp to avoid race conditions when running X over the network.  The selection will not be changed if *time* is earlier than the current last-change time of the *selection* or is later than the current X server time. Otherwise, the last-change time is set to the specified time.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_set_selection_owner(c, owner, selection, time)
    ccall((:xcb_set_selection_owner, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t, xcb_timestamp_t), c, owner, selection, time)
end

"""
    xcb_get_selection_owner(c, selection)

Gets the owner of a selection

Gets the owner of the specified selection.

TODO: briefly explain what a selection is.

### Parameters
* `c`: The connection
* `selection`: The selection.
### Returns
A cookie
"""
function xcb_get_selection_owner(c, selection)
    ccall((:xcb_get_selection_owner, libxcb), xcb_get_selection_owner_cookie_t, (Ptr{xcb_connection_t}, xcb_atom_t), c, selection)
end

"""
    xcb_get_selection_owner_unchecked(c, selection)

Gets the owner of a selection

Gets the owner of the specified selection.

TODO: briefly explain what a selection is.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `selection`: The selection.
### Returns
A cookie
"""
function xcb_get_selection_owner_unchecked(c, selection)
    ccall((:xcb_get_selection_owner_unchecked, libxcb), xcb_get_selection_owner_cookie_t, (Ptr{xcb_connection_t}, xcb_atom_t), c, selection)
end

"""
    xcb_get_selection_owner_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_selection_owner_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_selection_owner_reply(c, cookie, e)
    ccall((:xcb_get_selection_owner_reply, libxcb), Ptr{xcb_get_selection_owner_reply_t}, (Ptr{xcb_connection_t}, xcb_get_selection_owner_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_convert_selection_checked(c, requestor, selection, target, property, time)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_convert_selection_checked(c, requestor, selection, target, property, time)
    ccall((:xcb_convert_selection_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t, xcb_atom_t, xcb_atom_t, xcb_timestamp_t), c, requestor, selection, target, property, time)
end

"""
    xcb_convert_selection(c, requestor, selection, target, property, time)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_convert_selection(c, requestor, selection, target, property, time)
    ccall((:xcb_convert_selection, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_atom_t, xcb_atom_t, xcb_atom_t, xcb_timestamp_t), c, requestor, selection, target, property, time)
end

"""
    xcb_send_event_checked(c, propagate, destination, event_mask, event)

send an event

Identifies the *destination* window, determines which clients should receive the specified event and ignores any active grabs.

The *event* must be one of the core events or an event defined by an extension, so that the X server can correctly byte-swap the contents as necessary. The contents of *event* are otherwise unaltered and unchecked except for the `send_event` field which is forced to 'true'.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `propagate`: If *propagate* is true and no clients have selected any event on *destination*, the destination is replaced with the closest ancestor of *destination* for which some client has selected a type in *event_mask* and for which no intervening window has that type in its do-not-propagate-mask. If no such window exists or if the window is an ancestor of the focus window and `InputFocus` was originally specified as the destination, the event is not sent to any clients. Otherwise, the event is reported to every client selecting on the final destination any of the types specified in *event_mask*.
* `destination`: The window to send this event to. Every client which selects any event within *event_mask* on *destination* will get the event.  The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window that contains the mouse pointer.  The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which has the keyboard focus.
* `event_mask`: Event\\_mask for determining which clients should receive the specified event. See *destination* and *propagate*.
* `event`: The event to send to the specified *destination*.
### Returns
A cookie
"""
function xcb_send_event_checked(c, propagate, destination, event_mask, event)
    ccall((:xcb_send_event_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt32, Ptr{Cchar}), c, propagate, destination, event_mask, event)
end

"""
    xcb_send_event(c, propagate, destination, event_mask, event)

send an event

Identifies the *destination* window, determines which clients should receive the specified event and ignores any active grabs.

The *event* must be one of the core events or an event defined by an extension, so that the X server can correctly byte-swap the contents as necessary. The contents of *event* are otherwise unaltered and unchecked except for the `send_event` field which is forced to 'true'.

### Parameters
* `c`: The connection
* `propagate`: If *propagate* is true and no clients have selected any event on *destination*, the destination is replaced with the closest ancestor of *destination* for which some client has selected a type in *event_mask* and for which no intervening window has that type in its do-not-propagate-mask. If no such window exists or if the window is an ancestor of the focus window and `InputFocus` was originally specified as the destination, the event is not sent to any clients. Otherwise, the event is reported to every client selecting on the final destination any of the types specified in *event_mask*.
* `destination`: The window to send this event to. Every client which selects any event within *event_mask* on *destination* will get the event.  The special value `XCB_SEND_EVENT_DEST_POINTER_WINDOW` refers to the window that contains the mouse pointer.  The special value `XCB_SEND_EVENT_DEST_ITEM_FOCUS` refers to the window which has the keyboard focus.
* `event_mask`: Event\\_mask for determining which clients should receive the specified event. See *destination* and *propagate*.
* `event`: The event to send to the specified *destination*.
### Returns
A cookie
"""
function xcb_send_event(c, propagate, destination, event_mask, event)
    ccall((:xcb_send_event, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt32, Ptr{Cchar}), c, propagate, destination, event_mask, event)
end

"""
    xcb_grab_pointer(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)

Grab the pointer

Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `event_mask`: Specifies which pointer events are reported to the client.  TODO: which values?
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
* `confine_to`: Specifies the window to confine the pointer in (the user will not be able to move the pointer out of that window).  The special value [`XCB_NONE`](@ref) means don't confine the pointer.
* `cursor`: Specifies the cursor that should be displayed or [`XCB_NONE`](@ref) to not change the cursor.
* `time`: The time argument allows you to avoid certain circumstances that come up if applications take a long time to respond or if there are long network delays. Consider a situation where you have two applications, both of which normally grab the pointer when clicked on. If both applications specify the timestamp from the event, the second application may wake up faster and successfully grab the pointer before the first application. The first application then will get an indication that the other application grabbed the pointer before its request was processed.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_grab_pointer(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
    ccall((:xcb_grab_pointer, libxcb), xcb_grab_pointer_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, UInt8, UInt8, xcb_window_t, xcb_cursor_t, xcb_timestamp_t), c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
end

"""
    xcb_grab_pointer_unchecked(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)

Grab the pointer

Actively grabs control of the pointer. Further pointer events are reported only to the grabbing client. Overrides any active pointer grab by this client.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `event_mask`: Specifies which pointer events are reported to the client.  TODO: which values?
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
* `confine_to`: Specifies the window to confine the pointer in (the user will not be able to move the pointer out of that window).  The special value [`XCB_NONE`](@ref) means don't confine the pointer.
* `cursor`: Specifies the cursor that should be displayed or [`XCB_NONE`](@ref) to not change the cursor.
* `time`: The time argument allows you to avoid certain circumstances that come up if applications take a long time to respond or if there are long network delays. Consider a situation where you have two applications, both of which normally grab the pointer when clicked on. If both applications specify the timestamp from the event, the second application may wake up faster and successfully grab the pointer before the first application. The first application then will get an indication that the other application grabbed the pointer before its request was processed.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_grab_pointer_unchecked(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
    ccall((:xcb_grab_pointer_unchecked, libxcb), xcb_grab_pointer_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, UInt8, UInt8, xcb_window_t, xcb_cursor_t, xcb_timestamp_t), c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, time)
end

"""
    xcb_grab_pointer_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_grab_pointer_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_grab_pointer_reply(c, cookie, e)
    ccall((:xcb_grab_pointer_reply, libxcb), Ptr{xcb_grab_pointer_reply_t}, (Ptr{xcb_connection_t}, xcb_grab_pointer_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_ungrab_pointer_checked(c, time)

release the pointer

Releases the pointer and any queued events if you actively grabbed the pointer before using [`xcb_grab_pointer`](@ref), [`xcb_grab_button`](@ref) or within a normal button press.

EnterNotify and LeaveNotify events are generated.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `time`: Timestamp to avoid race conditions when running X over the network.  The pointer will not be released if *time* is earlier than the last-pointer-grab time or later than the current X server time.
### Returns
A cookie
"""
function xcb_ungrab_pointer_checked(c, time)
    ccall((:xcb_ungrab_pointer_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_timestamp_t), c, time)
end

"""
    xcb_ungrab_pointer(c, time)

release the pointer

Releases the pointer and any queued events if you actively grabbed the pointer before using [`xcb_grab_pointer`](@ref), [`xcb_grab_button`](@ref) or within a normal button press.

EnterNotify and LeaveNotify events are generated.

### Parameters
* `c`: The connection
* `time`: Timestamp to avoid race conditions when running X over the network.  The pointer will not be released if *time* is earlier than the last-pointer-grab time or later than the current X server time.
### Returns
A cookie
"""
function xcb_ungrab_pointer(c, time)
    ccall((:xcb_ungrab_pointer, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_timestamp_t), c, time)
end

"""
    xcb_grab_button_checked(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)

Grab pointer button(s)

This request establishes a passive grab. The pointer is actively grabbed as described in GrabPointer, the last-pointer-grab time is set to the time at which the button was pressed (as transmitted in the ButtonPress event), and the ButtonPress event is reported if all of the following conditions are true:

The pointer is not grabbed and the specified button is logically pressed when the specified modifier keys are logically down, and no other buttons or modifier keys are logically down.

The grab-window contains the pointer.

The confine-to window (if any) is viewable.

A passive grab on the same button/key combination does not exist on any ancestor of grab-window.

The interpretation of the remaining arguments is the same as for GrabPointer. The active grab is terminated automatically when the logical state of the pointer has all buttons released, independent of the logical state of modifier keys. Note that the logical state of a device (as seen by means of the protocol) may lag the physical state if device event processing is frozen. This request overrides all previous passive grabs by the same client on the same button/key combinations on the same window. A modifier of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers). It is not required that all specified modifiers have currently assigned keycodes. A button of AnyButton is equivalent to issuing the request for all possible buttons. Otherwise, it is not required that the button specified currently be assigned to a physical button.

An Access error is generated if some other client has already issued a GrabButton request with the same button/key combination on the same window. When using AnyModifier or AnyButton, the request fails completely (no grabs are established), and an Access error is generated if there is a conflicting grab for any combination. The request has no effect on an active grab.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `event_mask`: Specifies which pointer events are reported to the client.  TODO: which values?
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
* `confine_to`: Specifies the window to confine the pointer in (the user will not be able to move the pointer out of that window).  The special value [`XCB_NONE`](@ref) means don't confine the pointer.
* `cursor`: Specifies the cursor that should be displayed or [`XCB_NONE`](@ref) to not change the cursor.
* `button`: A bitmask of #[`xcb_button_index_t`](@ref) values.
* `button`:
* `modifiers`: The modifiers to grab.  Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all possible modifier combinations.
### Returns
A cookie
"""
function xcb_grab_button_checked(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
    ccall((:xcb_grab_button_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, UInt8, UInt8, xcb_window_t, xcb_cursor_t, UInt8, UInt16), c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
end

"""
    xcb_grab_button(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)

Grab pointer button(s)

This request establishes a passive grab. The pointer is actively grabbed as described in GrabPointer, the last-pointer-grab time is set to the time at which the button was pressed (as transmitted in the ButtonPress event), and the ButtonPress event is reported if all of the following conditions are true:

The pointer is not grabbed and the specified button is logically pressed when the specified modifier keys are logically down, and no other buttons or modifier keys are logically down.

The grab-window contains the pointer.

The confine-to window (if any) is viewable.

A passive grab on the same button/key combination does not exist on any ancestor of grab-window.

The interpretation of the remaining arguments is the same as for GrabPointer. The active grab is terminated automatically when the logical state of the pointer has all buttons released, independent of the logical state of modifier keys. Note that the logical state of a device (as seen by means of the protocol) may lag the physical state if device event processing is frozen. This request overrides all previous passive grabs by the same client on the same button/key combinations on the same window. A modifier of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers). It is not required that all specified modifiers have currently assigned keycodes. A button of AnyButton is equivalent to issuing the request for all possible buttons. Otherwise, it is not required that the button specified currently be assigned to a physical button.

An Access error is generated if some other client has already issued a GrabButton request with the same button/key combination on the same window. When using AnyModifier or AnyButton, the request fails completely (no grabs are established), and an Access error is generated if there is a conflicting grab for any combination. The request has no effect on an active grab.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `event_mask`: Specifies which pointer events are reported to the client.  TODO: which values?
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
* `confine_to`: Specifies the window to confine the pointer in (the user will not be able to move the pointer out of that window).  The special value [`XCB_NONE`](@ref) means don't confine the pointer.
* `cursor`: Specifies the cursor that should be displayed or [`XCB_NONE`](@ref) to not change the cursor.
* `button`: A bitmask of #[`xcb_button_index_t`](@ref) values.
* `button`:
* `modifiers`: The modifiers to grab.  Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all possible modifier combinations.
### Returns
A cookie
"""
function xcb_grab_button(c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
    ccall((:xcb_grab_button, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, UInt8, UInt8, xcb_window_t, xcb_cursor_t, UInt8, UInt16), c, owner_events, grab_window, event_mask, pointer_mode, keyboard_mode, confine_to, cursor, button, modifiers)
end

"""
    xcb_ungrab_button_checked(c, button, grab_window, modifiers)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_button_checked(c, button, grab_window, modifiers)
    ccall((:xcb_ungrab_button_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16), c, button, grab_window, modifiers)
end

"""
    xcb_ungrab_button(c, button, grab_window, modifiers)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_button(c, button, grab_window, modifiers)
    ccall((:xcb_ungrab_button, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16), c, button, grab_window, modifiers)
end

"""
    xcb_change_active_pointer_grab_checked(c, cursor, time, event_mask)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_active_pointer_grab_checked(c, cursor, time, event_mask)
    ccall((:xcb_change_active_pointer_grab_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_timestamp_t, UInt16), c, cursor, time, event_mask)
end

"""
    xcb_change_active_pointer_grab(c, cursor, time, event_mask)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_active_pointer_grab(c, cursor, time, event_mask)
    ccall((:xcb_change_active_pointer_grab, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_timestamp_t, UInt16), c, cursor, time, event_mask)
end

"""
    xcb_grab_keyboard(c, owner_events, grab_window, time, pointer_mode, keyboard_mode)

Grab the keyboard

Actively grabs control of the keyboard and generates FocusIn and FocusOut events. Further key events are reported only to the grabbing client.

Any active keyboard grab by this client is overridden. If the keyboard is actively grabbed by some other client, `AlreadyGrabbed` is returned. If *grab_window* is not viewable, `GrabNotViewable` is returned. If the keyboard is frozen by an active grab of another client, `GrabFrozen` is returned. If the specified *time* is earlier than the last-keyboard-grab time or later than the current X server time, `GrabInvalidTime` is returned. Otherwise, the last-keyboard-grab time is set to the specified time.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
### Returns
A cookie
"""
function xcb_grab_keyboard(c, owner_events, grab_window, time, pointer_mode, keyboard_mode)
    ccall((:xcb_grab_keyboard, libxcb), xcb_grab_keyboard_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_timestamp_t, UInt8, UInt8), c, owner_events, grab_window, time, pointer_mode, keyboard_mode)
end

"""
    xcb_grab_keyboard_unchecked(c, owner_events, grab_window, time, pointer_mode, keyboard_mode)

Grab the keyboard

Actively grabs control of the keyboard and generates FocusIn and FocusOut events. Further key events are reported only to the grabbing client.

Any active keyboard grab by this client is overridden. If the keyboard is actively grabbed by some other client, `AlreadyGrabbed` is returned. If *grab_window* is not viewable, `GrabNotViewable` is returned. If the keyboard is frozen by an active grab of another client, `GrabFrozen` is returned. If the specified *time* is earlier than the last-keyboard-grab time or later than the current X server time, `GrabInvalidTime` is returned. Otherwise, the last-keyboard-grab time is set to the specified time.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
### Returns
A cookie
"""
function xcb_grab_keyboard_unchecked(c, owner_events, grab_window, time, pointer_mode, keyboard_mode)
    ccall((:xcb_grab_keyboard_unchecked, libxcb), xcb_grab_keyboard_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_timestamp_t, UInt8, UInt8), c, owner_events, grab_window, time, pointer_mode, keyboard_mode)
end

"""
    xcb_grab_keyboard_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_grab_keyboard_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_grab_keyboard_reply(c, cookie, e)
    ccall((:xcb_grab_keyboard_reply, libxcb), Ptr{xcb_grab_keyboard_reply_t}, (Ptr{xcb_connection_t}, xcb_grab_keyboard_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_ungrab_keyboard_checked(c, time)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_keyboard_checked(c, time)
    ccall((:xcb_ungrab_keyboard_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_timestamp_t), c, time)
end

"""
    xcb_ungrab_keyboard(c, time)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_keyboard(c, time)
    ccall((:xcb_ungrab_keyboard, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_timestamp_t), c, time)
end

"""
    xcb_grab_key_checked(c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)

Grab keyboard key(s)

Establishes a passive grab on the keyboard. In the future, the keyboard is actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to the time at which the key was pressed (as transmitted in the KeyPress event), and the KeyPress event is reported if all of the following conditions are true:

The keyboard is not grabbed and the specified key (which can itself be a modifier key) is logically pressed when the specified modifier keys are logically down, and no other modifier keys are logically down.

Either the grab\\_window is an ancestor of (or is) the focus window, or the grab\\_window is a descendant of the focus window and contains the pointer.

A passive grab on the same key combination does not exist on any ancestor of grab\\_window.

The interpretation of the remaining arguments is as for XGrabKeyboard. The active grab is terminated automatically when the logical state of the keyboard has the specified key released (independent of the logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.

Note that the logical state of a device (as seen by client applications) may lag the physical state if device event processing is frozen.

A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers). It is not required that all modifiers specified have currently assigned KeyCodes. A keycode argument of AnyKey is equivalent to issuing the request for all possible KeyCodes. Otherwise, the specified keycode must be in the range specified by min\\_keycode and max\\_keycode in the connection setup, or a BadValue error results.

If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess error results. When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error results (no grabs are established) if there is a conflicting grab for any combination.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `modifiers`: The modifiers to grab.  Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all possible modifier combinations.
* `key`: The keycode of the key to grab.  The special value `XCB_GRAB_ANY` means grab any key.
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
### Returns
A cookie
"""
function xcb_grab_key_checked(c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
    ccall((:xcb_grab_key_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, xcb_keycode_t, UInt8, UInt8), c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
end

"""
    xcb_grab_key(c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)

Grab keyboard key(s)

Establishes a passive grab on the keyboard. In the future, the keyboard is actively grabbed (as for `GrabKeyboard`), the last-keyboard-grab time is set to the time at which the key was pressed (as transmitted in the KeyPress event), and the KeyPress event is reported if all of the following conditions are true:

The keyboard is not grabbed and the specified key (which can itself be a modifier key) is logically pressed when the specified modifier keys are logically down, and no other modifier keys are logically down.

Either the grab\\_window is an ancestor of (or is) the focus window, or the grab\\_window is a descendant of the focus window and contains the pointer.

A passive grab on the same key combination does not exist on any ancestor of grab\\_window.

The interpretation of the remaining arguments is as for XGrabKeyboard. The active grab is terminated automatically when the logical state of the keyboard has the specified key released (independent of the logical state of the modifier keys), at which point a KeyRelease event is reported to the grabbing window.

Note that the logical state of a device (as seen by client applications) may lag the physical state if device event processing is frozen.

A modifiers argument of AnyModifier is equivalent to issuing the request for all possible modifier combinations (including the combination of no modifiers). It is not required that all modifiers specified have currently assigned KeyCodes. A keycode argument of AnyKey is equivalent to issuing the request for all possible KeyCodes. Otherwise, the specified keycode must be in the range specified by min\\_keycode and max\\_keycode in the connection setup, or a BadValue error results.

If some other client has issued a XGrabKey with the same key combination on the same window, a BadAccess error results. When using AnyModifier or AnyKey, the request fails completely, and a BadAccess error results (no grabs are established) if there is a conflicting grab for any combination.

### Parameters
* `c`: The connection
* `owner_events`: If 1, the *grab_window* will still get the pointer events. If 0, events are not reported to the *grab_window*.
* `grab_window`: Specifies the window on which the pointer should be grabbed.
* `modifiers`: The modifiers to grab.  Using the special value `XCB_MOD_MASK_ANY` means grab the pointer with all possible modifier combinations.
* `key`: The keycode of the key to grab.  The special value `XCB_GRAB_ANY` means grab any key.
* `pointer_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `pointer_mode`:
* `keyboard_mode`: A bitmask of #[`xcb_grab_mode_t`](@ref) values.
* `keyboard_mode`:
### Returns
A cookie
"""
function xcb_grab_key(c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
    ccall((:xcb_grab_key, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, UInt16, xcb_keycode_t, UInt8, UInt8), c, owner_events, grab_window, modifiers, key, pointer_mode, keyboard_mode)
end

"""
    xcb_ungrab_key_checked(c, key, grab_window, modifiers)

release a key combination

Releases the key combination on *grab_window* if you grabbed it using [`xcb_grab_key`](@ref) before.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `key`: The keycode of the specified key combination.  Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
* `grab_window`: The window on which the grabbed key combination will be released.
* `modifiers`: The modifiers of the specified key combination.  Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination with every possible modifier combination.
### Returns
A cookie
"""
function xcb_ungrab_key_checked(c, key, grab_window, modifiers)
    ccall((:xcb_ungrab_key_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_keycode_t, xcb_window_t, UInt16), c, key, grab_window, modifiers)
end

"""
    xcb_ungrab_key(c, key, grab_window, modifiers)

release a key combination

Releases the key combination on *grab_window* if you grabbed it using [`xcb_grab_key`](@ref) before.

### Parameters
* `c`: The connection
* `key`: The keycode of the specified key combination.  Using the special value `XCB_GRAB_ANY` means releasing all possible key codes.
* `grab_window`: The window on which the grabbed key combination will be released.
* `modifiers`: The modifiers of the specified key combination.  Using the special value `XCB_MOD_MASK_ANY` means releasing the key combination with every possible modifier combination.
### Returns
A cookie
"""
function xcb_ungrab_key(c, key, grab_window, modifiers)
    ccall((:xcb_ungrab_key, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_keycode_t, xcb_window_t, UInt16), c, key, grab_window, modifiers)
end

"""
    xcb_allow_events_checked(c, mode, time)

release queued events

Releases queued events if the client has caused a device (pointer/keyboard) to freeze due to grabbing it actively. This request has no effect if *time* is earlier than the last-grab time of the most recent active grab for this client or if *time* is later than the current X server time.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_allow_t`](@ref) values.
* `mode`:
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_allow_events_checked(c, mode, time)
    ccall((:xcb_allow_events_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_timestamp_t), c, mode, time)
end

"""
    xcb_allow_events(c, mode, time)

release queued events

Releases queued events if the client has caused a device (pointer/keyboard) to freeze due to grabbing it actively. This request has no effect if *time* is earlier than the last-grab time of the most recent active grab for this client or if *time* is later than the current X server time.

### Parameters
* `c`: The connection
* `mode`: A bitmask of #[`xcb_allow_t`](@ref) values.
* `mode`:
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_allow_events(c, mode, time)
    ccall((:xcb_allow_events, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_timestamp_t), c, mode, time)
end

"""
    xcb_grab_server_checked(c)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_grab_server_checked(c)
    ccall((:xcb_grab_server_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_grab_server(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_grab_server(c)
    ccall((:xcb_grab_server, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_ungrab_server_checked(c)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_server_checked(c)
    ccall((:xcb_ungrab_server_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_ungrab_server(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_ungrab_server(c)
    ccall((:xcb_ungrab_server, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_query_pointer(c, window)

get pointer coordinates

Gets the root window the pointer is logically on and the pointer coordinates relative to the root window's origin.

### Parameters
* `c`: The connection
* `window`: A window to check if the pointer is on the same screen as *window* (see the `same_screen` field in the reply).
### Returns
A cookie
"""
function xcb_query_pointer(c, window)
    ccall((:xcb_query_pointer, libxcb), xcb_query_pointer_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_query_pointer_unchecked(c, window)

get pointer coordinates

Gets the root window the pointer is logically on and the pointer coordinates relative to the root window's origin.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `window`: A window to check if the pointer is on the same screen as *window* (see the `same_screen` field in the reply).
### Returns
A cookie
"""
function xcb_query_pointer_unchecked(c, window)
    ccall((:xcb_query_pointer_unchecked, libxcb), xcb_query_pointer_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_query_pointer_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_pointer_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_pointer_reply(c, cookie, e)
    ccall((:xcb_query_pointer_reply, libxcb), Ptr{xcb_query_pointer_reply_t}, (Ptr{xcb_connection_t}, xcb_query_pointer_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_timecoord_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_timecoord_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_timecoord_iterator_t`](@ref)
"""
function xcb_timecoord_next(i)
    ccall((:xcb_timecoord_next, libxcb), Cvoid, (Ptr{xcb_timecoord_iterator_t},), i)
end

"""
    xcb_timecoord_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_timecoord_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_timecoord_end(i)
    ccall((:xcb_timecoord_end, libxcb), xcb_generic_iterator_t, (xcb_timecoord_iterator_t,), i)
end

function xcb_get_motion_events_sizeof(_buffer)
    ccall((:xcb_get_motion_events_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_motion_events(c, window, start, stop)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_motion_events(c, window, start, stop)
    ccall((:xcb_get_motion_events, libxcb), xcb_get_motion_events_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_timestamp_t, xcb_timestamp_t), c, window, start, stop)
end

"""
    xcb_get_motion_events_unchecked(c, window, start, stop)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_motion_events_unchecked(c, window, start, stop)
    ccall((:xcb_get_motion_events_unchecked, libxcb), xcb_get_motion_events_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_timestamp_t, xcb_timestamp_t), c, window, start, stop)
end

function xcb_get_motion_events_events(R)
    ccall((:xcb_get_motion_events_events, libxcb), Ptr{xcb_timecoord_t}, (Ptr{xcb_get_motion_events_reply_t},), R)
end

function xcb_get_motion_events_events_length(R)
    ccall((:xcb_get_motion_events_events_length, libxcb), Cint, (Ptr{xcb_get_motion_events_reply_t},), R)
end

function xcb_get_motion_events_events_iterator(R)
    ccall((:xcb_get_motion_events_events_iterator, libxcb), xcb_timecoord_iterator_t, (Ptr{xcb_get_motion_events_reply_t},), R)
end

"""
    xcb_get_motion_events_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_motion_events_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_motion_events_reply(c, cookie, e)
    ccall((:xcb_get_motion_events_reply, libxcb), Ptr{xcb_get_motion_events_reply_t}, (Ptr{xcb_connection_t}, xcb_get_motion_events_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_translate_coordinates(c, src_window, dst_window, src_x, src_y)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_translate_coordinates(c, src_window, dst_window, src_x, src_y)
    ccall((:xcb_translate_coordinates, libxcb), xcb_translate_coordinates_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16), c, src_window, dst_window, src_x, src_y)
end

"""
    xcb_translate_coordinates_unchecked(c, src_window, dst_window, src_x, src_y)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_translate_coordinates_unchecked(c, src_window, dst_window, src_x, src_y)
    ccall((:xcb_translate_coordinates_unchecked, libxcb), xcb_translate_coordinates_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16), c, src_window, dst_window, src_x, src_y)
end

"""
    xcb_translate_coordinates_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_translate_coordinates_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_translate_coordinates_reply(c, cookie, e)
    ccall((:xcb_translate_coordinates_reply, libxcb), Ptr{xcb_translate_coordinates_reply_t}, (Ptr{xcb_connection_t}, xcb_translate_coordinates_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_warp_pointer_checked(c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)

move mouse pointer

Moves the mouse pointer to the specified position.

If *src_window* is not [`XCB_NONE`](@ref) (TODO), the move will only take place if the pointer is inside *src_window* and within the rectangle specified by (*src_x*, *src_y*, *src_width*, *src_height*). The rectangle coordinates are relative to *src_window*.  If *dst_window* is not [`XCB_NONE`](@ref) (TODO), the pointer will be moved to the offsets (*dst_x*, *dst_y*) relative to *dst_window*. If *dst_window* is [`XCB_NONE`](@ref) (TODO), the pointer will be moved by the offsets (*dst_x*, *dst_y*) relative to the current position of the pointer.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `src_window`: If *src_window* is not [`XCB_NONE`](@ref) (TODO), the move will only take place if the pointer is inside *src_window* and within the rectangle specified by (*src_x*, *src_y*, *src_width*, *src_height*). The rectangle coordinates are relative to *src_window*.
* `dst_window`: If *dst_window* is not [`XCB_NONE`](@ref) (TODO), the pointer will be moved to the offsets (*dst_x*, *dst_y*) relative to *dst_window*. If *dst_window* is [`XCB_NONE`](@ref) (TODO), the pointer will be moved by the offsets (*dst_x*, *dst_y*) relative to the current position of the pointer.
### Returns
A cookie
"""
function xcb_warp_pointer_checked(c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
    ccall((:xcb_warp_pointer_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, Int16, Int16), c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
end

"""
    xcb_warp_pointer(c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)

move mouse pointer

Moves the mouse pointer to the specified position.

If *src_window* is not [`XCB_NONE`](@ref) (TODO), the move will only take place if the pointer is inside *src_window* and within the rectangle specified by (*src_x*, *src_y*, *src_width*, *src_height*). The rectangle coordinates are relative to *src_window*.  If *dst_window* is not [`XCB_NONE`](@ref) (TODO), the pointer will be moved to the offsets (*dst_x*, *dst_y*) relative to *dst_window*. If *dst_window* is [`XCB_NONE`](@ref) (TODO), the pointer will be moved by the offsets (*dst_x*, *dst_y*) relative to the current position of the pointer.

### Parameters
* `c`: The connection
* `src_window`: If *src_window* is not [`XCB_NONE`](@ref) (TODO), the move will only take place if the pointer is inside *src_window* and within the rectangle specified by (*src_x*, *src_y*, *src_width*, *src_height*). The rectangle coordinates are relative to *src_window*.
* `dst_window`: If *dst_window* is not [`XCB_NONE`](@ref) (TODO), the pointer will be moved to the offsets (*dst_x*, *dst_y*) relative to *dst_window*. If *dst_window* is [`XCB_NONE`](@ref) (TODO), the pointer will be moved by the offsets (*dst_x*, *dst_y*) relative to the current position of the pointer.
### Returns
A cookie
"""
function xcb_warp_pointer(c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
    ccall((:xcb_warp_pointer, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, xcb_window_t, Int16, Int16, UInt16, UInt16, Int16, Int16), c, src_window, dst_window, src_x, src_y, src_width, src_height, dst_x, dst_y)
end

"""
    xcb_set_input_focus_checked(c, revert_to, focus, time)

Sets input focus

Changes the input focus and the last-focus-change time. If the specified *time* is earlier than the current last-focus-change time, the request is ignored (to avoid race conditions when running X over the network).

A FocusIn and FocusOut event is generated when focus is changed.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `revert_to`: A bitmask of #[`xcb_input_focus_t`](@ref) values.
* `revert_to`: Specifies what happens when the *focus* window becomes unviewable (if *focus* is neither [`XCB_NONE`](@ref) nor `XCB_POINTER_ROOT`).
* `focus`: The window to focus. All keyboard events will be reported to this window. The window must be viewable (TODO), or a [`xcb_match_error_t`](@ref) occurs (TODO).  If *focus* is [`XCB_NONE`](@ref) (TODO), all keyboard events are discarded until a new focus window is set.  If *focus* is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the screen on which the pointer is on currently.
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_set_input_focus_checked(c, revert_to, focus, time)
    ccall((:xcb_set_input_focus_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_timestamp_t), c, revert_to, focus, time)
end

"""
    xcb_set_input_focus(c, revert_to, focus, time)

Sets input focus

Changes the input focus and the last-focus-change time. If the specified *time* is earlier than the current last-focus-change time, the request is ignored (to avoid race conditions when running X over the network).

A FocusIn and FocusOut event is generated when focus is changed.

### Parameters
* `c`: The connection
* `revert_to`: A bitmask of #[`xcb_input_focus_t`](@ref) values.
* `revert_to`: Specifies what happens when the *focus* window becomes unviewable (if *focus* is neither [`XCB_NONE`](@ref) nor `XCB_POINTER_ROOT`).
* `focus`: The window to focus. All keyboard events will be reported to this window. The window must be viewable (TODO), or a [`xcb_match_error_t`](@ref) occurs (TODO).  If *focus* is [`XCB_NONE`](@ref) (TODO), all keyboard events are discarded until a new focus window is set.  If *focus* is `XCB_POINTER_ROOT` (TODO), focus is on the root window of the screen on which the pointer is on currently.
* `time`: Timestamp to avoid race conditions when running X over the network.  The special value [`XCB_CURRENT_TIME`](@ref) will be replaced with the current server time.
### Returns
A cookie
"""
function xcb_set_input_focus(c, revert_to, focus, time)
    ccall((:xcb_set_input_focus, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, xcb_timestamp_t), c, revert_to, focus, time)
end

"""
    xcb_get_input_focus(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_input_focus(c)
    ccall((:xcb_get_input_focus, libxcb), xcb_get_input_focus_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_input_focus_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_input_focus_unchecked(c)
    ccall((:xcb_get_input_focus_unchecked, libxcb), xcb_get_input_focus_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_input_focus_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_input_focus_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_input_focus_reply(c, cookie, e)
    ccall((:xcb_get_input_focus_reply, libxcb), Ptr{xcb_get_input_focus_reply_t}, (Ptr{xcb_connection_t}, xcb_get_input_focus_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_query_keymap(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_keymap(c)
    ccall((:xcb_query_keymap, libxcb), xcb_query_keymap_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_query_keymap_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_keymap_unchecked(c)
    ccall((:xcb_query_keymap_unchecked, libxcb), xcb_query_keymap_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_query_keymap_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_keymap_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_keymap_reply(c, cookie, e)
    ccall((:xcb_query_keymap_reply, libxcb), Ptr{xcb_query_keymap_reply_t}, (Ptr{xcb_connection_t}, xcb_query_keymap_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_open_font_sizeof(_buffer)
    ccall((:xcb_open_font_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_open_font_checked(c, fid, name_len, name)

opens a font

Opens any X core font matching the given *name* (for example "-misc-fixed-*").

Note that X core fonts are deprecated (but still supported) in favor of client-side rendering using Xft.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `fid`: The ID with which you will refer to the font, created by [`xcb_generate_id`](@ref).
* `name_len`: Length (in bytes) of *name*.
* `name`: A pattern describing an X core font.
### Returns
A cookie
"""
function xcb_open_font_checked(c, fid, name_len, name)
    ccall((:xcb_open_font_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_font_t, UInt16, Ptr{Cchar}), c, fid, name_len, name)
end

"""
    xcb_open_font(c, fid, name_len, name)

opens a font

Opens any X core font matching the given *name* (for example "-misc-fixed-*").

Note that X core fonts are deprecated (but still supported) in favor of client-side rendering using Xft.

### Parameters
* `c`: The connection
* `fid`: The ID with which you will refer to the font, created by [`xcb_generate_id`](@ref).
* `name_len`: Length (in bytes) of *name*.
* `name`: A pattern describing an X core font.
### Returns
A cookie
"""
function xcb_open_font(c, fid, name_len, name)
    ccall((:xcb_open_font, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_font_t, UInt16, Ptr{Cchar}), c, fid, name_len, name)
end

function xcb_open_font_name(R)
    ccall((:xcb_open_font_name, libxcb), Ptr{Cchar}, (Ptr{xcb_open_font_request_t},), R)
end

function xcb_open_font_name_length(R)
    ccall((:xcb_open_font_name_length, libxcb), Cint, (Ptr{xcb_open_font_request_t},), R)
end

function xcb_open_font_name_end(R)
    ccall((:xcb_open_font_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_open_font_request_t},), R)
end

"""
    xcb_close_font_checked(c, font)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_close_font_checked(c, font)
    ccall((:xcb_close_font_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_font_t), c, font)
end

"""
    xcb_close_font(c, font)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_close_font(c, font)
    ccall((:xcb_close_font, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_font_t), c, font)
end

"""
    xcb_fontprop_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_fontprop_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_fontprop_iterator_t`](@ref)
"""
function xcb_fontprop_next(i)
    ccall((:xcb_fontprop_next, libxcb), Cvoid, (Ptr{xcb_fontprop_iterator_t},), i)
end

"""
    xcb_fontprop_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_fontprop_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_fontprop_end(i)
    ccall((:xcb_fontprop_end, libxcb), xcb_generic_iterator_t, (xcb_fontprop_iterator_t,), i)
end

"""
    xcb_charinfo_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_charinfo_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_charinfo_iterator_t`](@ref)
"""
function xcb_charinfo_next(i)
    ccall((:xcb_charinfo_next, libxcb), Cvoid, (Ptr{xcb_charinfo_iterator_t},), i)
end

"""
    xcb_charinfo_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_charinfo_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_charinfo_end(i)
    ccall((:xcb_charinfo_end, libxcb), xcb_generic_iterator_t, (xcb_charinfo_iterator_t,), i)
end

function xcb_query_font_sizeof(_buffer)
    ccall((:xcb_query_font_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_query_font(c, font)

query font metrics

Queries information associated with the font.

### Parameters
* `c`: The connection
* `font`: The fontable (Font or Graphics Context) to query.
### Returns
A cookie
"""
function xcb_query_font(c, font)
    ccall((:xcb_query_font, libxcb), xcb_query_font_cookie_t, (Ptr{xcb_connection_t}, xcb_fontable_t), c, font)
end

"""
    xcb_query_font_unchecked(c, font)

query font metrics

Queries information associated with the font.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `font`: The fontable (Font or Graphics Context) to query.
### Returns
A cookie
"""
function xcb_query_font_unchecked(c, font)
    ccall((:xcb_query_font_unchecked, libxcb), xcb_query_font_cookie_t, (Ptr{xcb_connection_t}, xcb_fontable_t), c, font)
end

function xcb_query_font_properties(R)
    ccall((:xcb_query_font_properties, libxcb), Ptr{xcb_fontprop_t}, (Ptr{xcb_query_font_reply_t},), R)
end

function xcb_query_font_properties_length(R)
    ccall((:xcb_query_font_properties_length, libxcb), Cint, (Ptr{xcb_query_font_reply_t},), R)
end

function xcb_query_font_properties_iterator(R)
    ccall((:xcb_query_font_properties_iterator, libxcb), xcb_fontprop_iterator_t, (Ptr{xcb_query_font_reply_t},), R)
end

function xcb_query_font_char_infos(R)
    ccall((:xcb_query_font_char_infos, libxcb), Ptr{xcb_charinfo_t}, (Ptr{xcb_query_font_reply_t},), R)
end

function xcb_query_font_char_infos_length(R)
    ccall((:xcb_query_font_char_infos_length, libxcb), Cint, (Ptr{xcb_query_font_reply_t},), R)
end

function xcb_query_font_char_infos_iterator(R)
    ccall((:xcb_query_font_char_infos_iterator, libxcb), xcb_charinfo_iterator_t, (Ptr{xcb_query_font_reply_t},), R)
end

"""
    xcb_query_font_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_font_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_font_reply(c, cookie, e)
    ccall((:xcb_query_font_reply, libxcb), Ptr{xcb_query_font_reply_t}, (Ptr{xcb_connection_t}, xcb_query_font_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_query_text_extents_sizeof(_buffer, string_len)
    ccall((:xcb_query_text_extents_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, string_len)
end

"""
    xcb_query_text_extents(c, font, string_len, string)

get text extents

Query text extents from the X11 server. This request returns the bounding box of the specified 16-bit character string in the specified *font* or the font contained in the specified graphics context.

`font_ascent` is set to the maximum of the ascent metrics of all characters in the string. `font_descent` is set to the maximum of the descent metrics. `overall_width` is set to the sum of the character-width metrics of all characters in the string. For each character in the string, let W be the sum of the character-width metrics of all characters preceding it in the string. Let L be the left-side-bearing metric of the character plus W. Let R be the right-side-bearing metric of the character plus W. The lbearing member is set to the minimum L of all characters in the string. The rbearing member is set to the maximum R.

For fonts defined with linear indexing rather than 2-byte matrix indexing, each [`xcb_char2b_t`](@ref) structure is interpreted as a 16-bit number with byte1 as the most significant byte. If the font has no defined default character, undefined characters in the string are taken to have all zero metrics.

Characters with all zero metrics are ignored. If the font has no defined default\\_char, the undefined characters in the string are also ignored.

### Parameters
* `c`: The connection
* `font`: The *font* to calculate text extents in. You can also pass a graphics context.
* `string_len`: The number of characters in *string*.
* `string`: The text to get text extents for.
### Returns
A cookie
"""
function xcb_query_text_extents(c, font, string_len, string)
    ccall((:xcb_query_text_extents, libxcb), xcb_query_text_extents_cookie_t, (Ptr{xcb_connection_t}, xcb_fontable_t, UInt32, Ptr{xcb_char2b_t}), c, font, string_len, string)
end

"""
    xcb_query_text_extents_unchecked(c, font, string_len, string)

get text extents

Query text extents from the X11 server. This request returns the bounding box of the specified 16-bit character string in the specified *font* or the font contained in the specified graphics context.

`font_ascent` is set to the maximum of the ascent metrics of all characters in the string. `font_descent` is set to the maximum of the descent metrics. `overall_width` is set to the sum of the character-width metrics of all characters in the string. For each character in the string, let W be the sum of the character-width metrics of all characters preceding it in the string. Let L be the left-side-bearing metric of the character plus W. Let R be the right-side-bearing metric of the character plus W. The lbearing member is set to the minimum L of all characters in the string. The rbearing member is set to the maximum R.

For fonts defined with linear indexing rather than 2-byte matrix indexing, each [`xcb_char2b_t`](@ref) structure is interpreted as a 16-bit number with byte1 as the most significant byte. If the font has no defined default character, undefined characters in the string are taken to have all zero metrics.

Characters with all zero metrics are ignored. If the font has no defined default\\_char, the undefined characters in the string are also ignored.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `font`: The *font* to calculate text extents in. You can also pass a graphics context.
* `string_len`: The number of characters in *string*.
* `string`: The text to get text extents for.
### Returns
A cookie
"""
function xcb_query_text_extents_unchecked(c, font, string_len, string)
    ccall((:xcb_query_text_extents_unchecked, libxcb), xcb_query_text_extents_cookie_t, (Ptr{xcb_connection_t}, xcb_fontable_t, UInt32, Ptr{xcb_char2b_t}), c, font, string_len, string)
end

"""
    xcb_query_text_extents_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_text_extents_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_text_extents_reply(c, cookie, e)
    ccall((:xcb_query_text_extents_reply, libxcb), Ptr{xcb_query_text_extents_reply_t}, (Ptr{xcb_connection_t}, xcb_query_text_extents_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_str_sizeof(_buffer)
    ccall((:xcb_str_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_str_name(R)
    ccall((:xcb_str_name, libxcb), Ptr{Cchar}, (Ptr{xcb_str_t},), R)
end

function xcb_str_name_length(R)
    ccall((:xcb_str_name_length, libxcb), Cint, (Ptr{xcb_str_t},), R)
end

function xcb_str_name_end(R)
    ccall((:xcb_str_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_str_t},), R)
end

"""
    xcb_str_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_str_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_str_iterator_t`](@ref)
"""
function xcb_str_next(i)
    ccall((:xcb_str_next, libxcb), Cvoid, (Ptr{xcb_str_iterator_t},), i)
end

"""
    xcb_str_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_str_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_str_end(i)
    ccall((:xcb_str_end, libxcb), xcb_generic_iterator_t, (xcb_str_iterator_t,), i)
end

function xcb_list_fonts_sizeof(_buffer)
    ccall((:xcb_list_fonts_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_fonts(c, max_names, pattern_len, pattern)

get matching font names

Gets a list of available font names which match the given *pattern*.

### Parameters
* `c`: The connection
* `max_names`: The maximum number of fonts to be returned.
* `pattern_len`: The length (in bytes) of *pattern*.
* `pattern`: A font pattern, for example "-misc-fixed-*".  The asterisk (*) is a wildcard for any number of characters. The question mark (?) is a wildcard for a single character. Use of uppercase or lowercase does not matter.
### Returns
A cookie
"""
function xcb_list_fonts(c, max_names, pattern_len, pattern)
    ccall((:xcb_list_fonts, libxcb), xcb_list_fonts_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16, Ptr{Cchar}), c, max_names, pattern_len, pattern)
end

"""
    xcb_list_fonts_unchecked(c, max_names, pattern_len, pattern)

get matching font names

Gets a list of available font names which match the given *pattern*.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `max_names`: The maximum number of fonts to be returned.
* `pattern_len`: The length (in bytes) of *pattern*.
* `pattern`: A font pattern, for example "-misc-fixed-*".  The asterisk (*) is a wildcard for any number of characters. The question mark (?) is a wildcard for a single character. Use of uppercase or lowercase does not matter.
### Returns
A cookie
"""
function xcb_list_fonts_unchecked(c, max_names, pattern_len, pattern)
    ccall((:xcb_list_fonts_unchecked, libxcb), xcb_list_fonts_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16, Ptr{Cchar}), c, max_names, pattern_len, pattern)
end

function xcb_list_fonts_names_length(R)
    ccall((:xcb_list_fonts_names_length, libxcb), Cint, (Ptr{xcb_list_fonts_reply_t},), R)
end

function xcb_list_fonts_names_iterator(R)
    ccall((:xcb_list_fonts_names_iterator, libxcb), xcb_str_iterator_t, (Ptr{xcb_list_fonts_reply_t},), R)
end

"""
    xcb_list_fonts_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_fonts_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_fonts_reply(c, cookie, e)
    ccall((:xcb_list_fonts_reply, libxcb), Ptr{xcb_list_fonts_reply_t}, (Ptr{xcb_connection_t}, xcb_list_fonts_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_list_fonts_with_info_sizeof(_buffer)
    ccall((:xcb_list_fonts_with_info_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_fonts_with_info(c, max_names, pattern_len, pattern)

get matching font names and information

Gets a list of available font names which match the given *pattern*.

### Parameters
* `c`: The connection
* `max_names`: The maximum number of fonts to be returned.
* `pattern_len`: The length (in bytes) of *pattern*.
* `pattern`: A font pattern, for example "-misc-fixed-*".  The asterisk (*) is a wildcard for any number of characters. The question mark (?) is a wildcard for a single character. Use of uppercase or lowercase does not matter.
### Returns
A cookie
"""
function xcb_list_fonts_with_info(c, max_names, pattern_len, pattern)
    ccall((:xcb_list_fonts_with_info, libxcb), xcb_list_fonts_with_info_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16, Ptr{Cchar}), c, max_names, pattern_len, pattern)
end

"""
    xcb_list_fonts_with_info_unchecked(c, max_names, pattern_len, pattern)

get matching font names and information

Gets a list of available font names which match the given *pattern*.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `max_names`: The maximum number of fonts to be returned.
* `pattern_len`: The length (in bytes) of *pattern*.
* `pattern`: A font pattern, for example "-misc-fixed-*".  The asterisk (*) is a wildcard for any number of characters. The question mark (?) is a wildcard for a single character. Use of uppercase or lowercase does not matter.
### Returns
A cookie
"""
function xcb_list_fonts_with_info_unchecked(c, max_names, pattern_len, pattern)
    ccall((:xcb_list_fonts_with_info_unchecked, libxcb), xcb_list_fonts_with_info_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16, Ptr{Cchar}), c, max_names, pattern_len, pattern)
end

function xcb_list_fonts_with_info_properties(R)
    ccall((:xcb_list_fonts_with_info_properties, libxcb), Ptr{xcb_fontprop_t}, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

function xcb_list_fonts_with_info_properties_length(R)
    ccall((:xcb_list_fonts_with_info_properties_length, libxcb), Cint, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

function xcb_list_fonts_with_info_properties_iterator(R)
    ccall((:xcb_list_fonts_with_info_properties_iterator, libxcb), xcb_fontprop_iterator_t, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

function xcb_list_fonts_with_info_name(R)
    ccall((:xcb_list_fonts_with_info_name, libxcb), Ptr{Cchar}, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

function xcb_list_fonts_with_info_name_length(R)
    ccall((:xcb_list_fonts_with_info_name_length, libxcb), Cint, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

function xcb_list_fonts_with_info_name_end(R)
    ccall((:xcb_list_fonts_with_info_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_list_fonts_with_info_reply_t},), R)
end

"""
    xcb_list_fonts_with_info_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_fonts_with_info_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_fonts_with_info_reply(c, cookie, e)
    ccall((:xcb_list_fonts_with_info_reply, libxcb), Ptr{xcb_list_fonts_with_info_reply_t}, (Ptr{xcb_connection_t}, xcb_list_fonts_with_info_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_set_font_path_sizeof(_buffer)
    ccall((:xcb_set_font_path_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_set_font_path_checked(c, font_qty, font)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_font_path_checked(c, font_qty, font)
    ccall((:xcb_set_font_path_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt16, Ptr{xcb_str_t}), c, font_qty, font)
end

"""
    xcb_set_font_path(c, font_qty, font)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_font_path(c, font_qty, font)
    ccall((:xcb_set_font_path, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt16, Ptr{xcb_str_t}), c, font_qty, font)
end

function xcb_set_font_path_font_length(R)
    ccall((:xcb_set_font_path_font_length, libxcb), Cint, (Ptr{xcb_set_font_path_request_t},), R)
end

function xcb_set_font_path_font_iterator(R)
    ccall((:xcb_set_font_path_font_iterator, libxcb), xcb_str_iterator_t, (Ptr{xcb_set_font_path_request_t},), R)
end

function xcb_get_font_path_sizeof(_buffer)
    ccall((:xcb_get_font_path_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_font_path(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_font_path(c)
    ccall((:xcb_get_font_path, libxcb), xcb_get_font_path_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_font_path_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_font_path_unchecked(c)
    ccall((:xcb_get_font_path_unchecked, libxcb), xcb_get_font_path_cookie_t, (Ptr{xcb_connection_t},), c)
end

function xcb_get_font_path_path_length(R)
    ccall((:xcb_get_font_path_path_length, libxcb), Cint, (Ptr{xcb_get_font_path_reply_t},), R)
end

function xcb_get_font_path_path_iterator(R)
    ccall((:xcb_get_font_path_path_iterator, libxcb), xcb_str_iterator_t, (Ptr{xcb_get_font_path_reply_t},), R)
end

"""
    xcb_get_font_path_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_font_path_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_font_path_reply(c, cookie, e)
    ccall((:xcb_get_font_path_reply, libxcb), Ptr{xcb_get_font_path_reply_t}, (Ptr{xcb_connection_t}, xcb_get_font_path_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_create_pixmap_checked(c, depth, pid, drawable, width, height)

Creates a pixmap

Creates a pixmap. The pixmap can only be used on the same screen as *drawable* is on and only with drawables of the same *depth*.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `depth`: TODO
* `pid`: The ID with which you will refer to the new pixmap, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the screen from.
* `width`: The width of the new pixmap.
* `height`: The height of the new pixmap.
### Returns
A cookie
"""
function xcb_create_pixmap_checked(c, depth, pid, drawable, width, height)
    ccall((:xcb_create_pixmap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_pixmap_t, xcb_drawable_t, UInt16, UInt16), c, depth, pid, drawable, width, height)
end

"""
    xcb_create_pixmap(c, depth, pid, drawable, width, height)

Creates a pixmap

Creates a pixmap. The pixmap can only be used on the same screen as *drawable* is on and only with drawables of the same *depth*.

### Parameters
* `c`: The connection
* `depth`: TODO
* `pid`: The ID with which you will refer to the new pixmap, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the screen from.
* `width`: The width of the new pixmap.
* `height`: The height of the new pixmap.
### Returns
A cookie
"""
function xcb_create_pixmap(c, depth, pid, drawable, width, height)
    ccall((:xcb_create_pixmap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_pixmap_t, xcb_drawable_t, UInt16, UInt16), c, depth, pid, drawable, width, height)
end

"""
    xcb_free_pixmap_checked(c, pixmap)

Destroys a pixmap

Deletes the association between the pixmap ID and the pixmap. The pixmap storage will be freed when there are no more references to it.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `pixmap`: The pixmap to destroy.
### Returns
A cookie
"""
function xcb_free_pixmap_checked(c, pixmap)
    ccall((:xcb_free_pixmap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_pixmap_t), c, pixmap)
end

"""
    xcb_free_pixmap(c, pixmap)

Destroys a pixmap

Deletes the association between the pixmap ID and the pixmap. The pixmap storage will be freed when there are no more references to it.

### Parameters
* `c`: The connection
* `pixmap`: The pixmap to destroy.
### Returns
A cookie
"""
function xcb_free_pixmap(c, pixmap)
    ccall((:xcb_free_pixmap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_pixmap_t), c, pixmap)
end

function xcb_create_gc_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_create_gc_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt32, Ptr{xcb_create_gc_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_create_gc_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_create_gc_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt32, Ptr{xcb_create_gc_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_create_gc_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_create_gc_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, value_mask)
end

function xcb_create_gc_sizeof(_buffer)
    ccall((:xcb_create_gc_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_create_gc_checked(c, cid, drawable, value_mask, value_list)

Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable that has the same root and depth as the specified drawable.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the graphics context, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the root/depth from.
### Returns
A cookie
"""
function xcb_create_gc_checked(c, cid, drawable, value_mask, value_list)
    ccall((:xcb_create_gc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_drawable_t, UInt32, Ptr{Cvoid}), c, cid, drawable, value_mask, value_list)
end

"""
    xcb_create_gc(c, cid, drawable, value_mask, value_list)

Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable that has the same root and depth as the specified drawable.

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the graphics context, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the root/depth from.
### Returns
A cookie
"""
function xcb_create_gc(c, cid, drawable, value_mask, value_list)
    ccall((:xcb_create_gc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_drawable_t, UInt32, Ptr{Cvoid}), c, cid, drawable, value_mask, value_list)
end

"""
    xcb_create_gc_aux_checked(c, cid, drawable, value_mask, value_list)

Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable that has the same root and depth as the specified drawable.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the graphics context, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the root/depth from.
### Returns
A cookie
"""
function xcb_create_gc_aux_checked(c, cid, drawable, value_mask, value_list)
    ccall((:xcb_create_gc_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_drawable_t, UInt32, Ptr{xcb_create_gc_value_list_t}), c, cid, drawable, value_mask, value_list)
end

"""
    xcb_create_gc_aux(c, cid, drawable, value_mask, value_list)

Creates a graphics context

Creates a graphics context. The graphics context can be used with any drawable that has the same root and depth as the specified drawable.

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the graphics context, created by [`xcb_generate_id`](@ref).
* `drawable`: Drawable to get the root/depth from.
### Returns
A cookie
"""
function xcb_create_gc_aux(c, cid, drawable, value_mask, value_list)
    ccall((:xcb_create_gc_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_drawable_t, UInt32, Ptr{xcb_create_gc_value_list_t}), c, cid, drawable, value_mask, value_list)
end

function xcb_create_gc_value_list(R)
    ccall((:xcb_create_gc_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_create_gc_request_t},), R)
end

function xcb_change_gc_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_change_gc_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt32, Ptr{xcb_change_gc_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_gc_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_change_gc_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt32, Ptr{xcb_change_gc_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_gc_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_change_gc_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, value_mask)
end

function xcb_change_gc_sizeof(_buffer)
    ccall((:xcb_change_gc_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_gc_checked(c, gc, value_mask, value_list)

change graphics context components

Changes the components specified by *value_mask* for the specified graphics context.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `gc`: The graphics context to change.
* `value_mask`: A bitmask of #[`xcb_gc_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the components specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_gc_checked(c, gc, value_mask, value_list)
    ccall((:xcb_change_gc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt32, Ptr{Cvoid}), c, gc, value_mask, value_list)
end

"""
    xcb_change_gc(c, gc, value_mask, value_list)

change graphics context components

Changes the components specified by *value_mask* for the specified graphics context.

### Parameters
* `c`: The connection
* `gc`: The graphics context to change.
* `value_mask`: A bitmask of #[`xcb_gc_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the components specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_gc(c, gc, value_mask, value_list)
    ccall((:xcb_change_gc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt32, Ptr{Cvoid}), c, gc, value_mask, value_list)
end

"""
    xcb_change_gc_aux_checked(c, gc, value_mask, value_list)

change graphics context components

Changes the components specified by *value_mask* for the specified graphics context.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `gc`: The graphics context to change.
* `value_mask`: A bitmask of #[`xcb_gc_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the components specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_gc_aux_checked(c, gc, value_mask, value_list)
    ccall((:xcb_change_gc_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt32, Ptr{xcb_change_gc_value_list_t}), c, gc, value_mask, value_list)
end

"""
    xcb_change_gc_aux(c, gc, value_mask, value_list)

change graphics context components

Changes the components specified by *value_mask* for the specified graphics context.

### Parameters
* `c`: The connection
* `gc`: The graphics context to change.
* `value_mask`: A bitmask of #[`xcb_gc_t`](@ref) values.
* `value_mask`:
* `value_list`: Values for each of the components specified in the bitmask *value_mask*. The order has to correspond to the order of possible *value_mask* bits. See the example.
### Returns
A cookie
"""
function xcb_change_gc_aux(c, gc, value_mask, value_list)
    ccall((:xcb_change_gc_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt32, Ptr{xcb_change_gc_value_list_t}), c, gc, value_mask, value_list)
end

function xcb_change_gc_value_list(R)
    ccall((:xcb_change_gc_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_change_gc_request_t},), R)
end

"""
    xcb_copy_gc_checked(c, src_gc, dst_gc, value_mask)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_gc_checked(c, src_gc, dst_gc, value_mask)
    ccall((:xcb_copy_gc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_gcontext_t, UInt32), c, src_gc, dst_gc, value_mask)
end

"""
    xcb_copy_gc(c, src_gc, dst_gc, value_mask)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_gc(c, src_gc, dst_gc, value_mask)
    ccall((:xcb_copy_gc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, xcb_gcontext_t, UInt32), c, src_gc, dst_gc, value_mask)
end

function xcb_set_dashes_sizeof(_buffer)
    ccall((:xcb_set_dashes_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_set_dashes_checked(c, gc, dash_offset, dashes_len, dashes)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_dashes_checked(c, gc, dash_offset, dashes_len, dashes)
    ccall((:xcb_set_dashes_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt16, UInt16, Ptr{UInt8}), c, gc, dash_offset, dashes_len, dashes)
end

"""
    xcb_set_dashes(c, gc, dash_offset, dashes_len, dashes)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_dashes(c, gc, dash_offset, dashes_len, dashes)
    ccall((:xcb_set_dashes, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t, UInt16, UInt16, Ptr{UInt8}), c, gc, dash_offset, dashes_len, dashes)
end

function xcb_set_dashes_dashes(R)
    ccall((:xcb_set_dashes_dashes, libxcb), Ptr{UInt8}, (Ptr{xcb_set_dashes_request_t},), R)
end

function xcb_set_dashes_dashes_length(R)
    ccall((:xcb_set_dashes_dashes_length, libxcb), Cint, (Ptr{xcb_set_dashes_request_t},), R)
end

function xcb_set_dashes_dashes_end(R)
    ccall((:xcb_set_dashes_dashes_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_set_dashes_request_t},), R)
end

function xcb_set_clip_rectangles_sizeof(_buffer, rectangles_len)
    ccall((:xcb_set_clip_rectangles_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, rectangles_len)
end

"""
    xcb_set_clip_rectangles_checked(c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_clip_rectangles_checked(c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)
    ccall((:xcb_set_clip_rectangles_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{xcb_rectangle_t}), c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)
end

"""
    xcb_set_clip_rectangles(c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_clip_rectangles(c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)
    ccall((:xcb_set_clip_rectangles, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{xcb_rectangle_t}), c, ordering, gc, clip_x_origin, clip_y_origin, rectangles_len, rectangles)
end

function xcb_set_clip_rectangles_rectangles(R)
    ccall((:xcb_set_clip_rectangles_rectangles, libxcb), Ptr{xcb_rectangle_t}, (Ptr{xcb_set_clip_rectangles_request_t},), R)
end

function xcb_set_clip_rectangles_rectangles_length(R)
    ccall((:xcb_set_clip_rectangles_rectangles_length, libxcb), Cint, (Ptr{xcb_set_clip_rectangles_request_t},), R)
end

function xcb_set_clip_rectangles_rectangles_iterator(R)
    ccall((:xcb_set_clip_rectangles_rectangles_iterator, libxcb), xcb_rectangle_iterator_t, (Ptr{xcb_set_clip_rectangles_request_t},), R)
end

"""
    xcb_free_gc_checked(c, gc)

Destroys a graphics context

Destroys the specified *gc* and all associated storage.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `gc`: The graphics context to destroy.
### Returns
A cookie
"""
function xcb_free_gc_checked(c, gc)
    ccall((:xcb_free_gc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t), c, gc)
end

"""
    xcb_free_gc(c, gc)

Destroys a graphics context

Destroys the specified *gc* and all associated storage.

### Parameters
* `c`: The connection
* `gc`: The graphics context to destroy.
### Returns
A cookie
"""
function xcb_free_gc(c, gc)
    ccall((:xcb_free_gc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_gcontext_t), c, gc)
end

"""
    xcb_clear_area_checked(c, exposures, window, x, y, width, height)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_clear_area_checked(c, exposures, window, x, y, width, height)
    ccall((:xcb_clear_area_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, Int16, Int16, UInt16, UInt16), c, exposures, window, x, y, width, height)
end

"""
    xcb_clear_area(c, exposures, window, x, y, width, height)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_clear_area(c, exposures, window, x, y, width, height)
    ccall((:xcb_clear_area, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_window_t, Int16, Int16, UInt16, UInt16), c, exposures, window, x, y, width, height)
end

"""
    xcb_copy_area_checked(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)

copy areas

Copies the specified rectangle from *src_drawable* to *dst_drawable*.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `src_drawable`: The source drawable (Window or Pixmap).
* `dst_drawable`: The destination drawable (Window or Pixmap).
* `gc`: The graphics context to use.
* `src_x`: The source X coordinate.
* `src_y`: The source Y coordinate.
* `dst_x`: The destination X coordinate.
* `dst_y`: The destination Y coordinate.
* `width`: The width of the area to copy (in pixels).
* `height`: The height of the area to copy (in pixels).
### Returns
A cookie
"""
function xcb_copy_area_checked(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
    ccall((:xcb_copy_area_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Int16, Int16, UInt16, UInt16), c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
end

"""
    xcb_copy_area(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)

copy areas

Copies the specified rectangle from *src_drawable* to *dst_drawable*.

### Parameters
* `c`: The connection
* `src_drawable`: The source drawable (Window or Pixmap).
* `dst_drawable`: The destination drawable (Window or Pixmap).
* `gc`: The graphics context to use.
* `src_x`: The source X coordinate.
* `src_y`: The source Y coordinate.
* `dst_x`: The destination X coordinate.
* `dst_y`: The destination Y coordinate.
* `width`: The width of the area to copy (in pixels).
* `height`: The height of the area to copy (in pixels).
### Returns
A cookie
"""
function xcb_copy_area(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
    ccall((:xcb_copy_area, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Int16, Int16, UInt16, UInt16), c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height)
end

"""
    xcb_copy_plane_checked(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_plane_checked(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
    ccall((:xcb_copy_plane_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Int16, Int16, UInt16, UInt16, UInt32), c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
end

"""
    xcb_copy_plane(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_plane(c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
    ccall((:xcb_copy_plane, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Int16, Int16, UInt16, UInt16, UInt32), c, src_drawable, dst_drawable, gc, src_x, src_y, dst_x, dst_y, width, height, bit_plane)
end

function xcb_poly_point_sizeof(_buffer, points_len)
    ccall((:xcb_poly_point_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, points_len)
end

"""
    xcb_poly_point_checked(c, coordinate_mode, drawable, gc, points_len, points)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_point_checked(c, coordinate_mode, drawable, gc, points_len, points)
    ccall((:xcb_poly_point_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_point_t}), c, coordinate_mode, drawable, gc, points_len, points)
end

"""
    xcb_poly_point(c, coordinate_mode, drawable, gc, points_len, points)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_point(c, coordinate_mode, drawable, gc, points_len, points)
    ccall((:xcb_poly_point, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_point_t}), c, coordinate_mode, drawable, gc, points_len, points)
end

function xcb_poly_point_points(R)
    ccall((:xcb_poly_point_points, libxcb), Ptr{xcb_point_t}, (Ptr{xcb_poly_point_request_t},), R)
end

function xcb_poly_point_points_length(R)
    ccall((:xcb_poly_point_points_length, libxcb), Cint, (Ptr{xcb_poly_point_request_t},), R)
end

function xcb_poly_point_points_iterator(R)
    ccall((:xcb_poly_point_points_iterator, libxcb), xcb_point_iterator_t, (Ptr{xcb_poly_point_request_t},), R)
end

function xcb_poly_line_sizeof(_buffer, points_len)
    ccall((:xcb_poly_line_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, points_len)
end

"""
    xcb_poly_line_checked(c, coordinate_mode, drawable, gc, points_len, points)

draw lines

Draws *points_len*-1 lines between each pair of points (point[i], point[i+1]) in the *points* array. The lines are drawn in the order listed in the array. They join correctly at all intermediate points, and if the first and last points coincide, the first and last lines also join correctly. For any given line, a pixel is not drawn more than once. If thin (zero line-width) lines intersect, the intersecting pixels are drawn multiple times. If wide lines intersect, the intersecting pixels are drawn only once, as though the entire request were a single, filled shape.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `coordinate_mode`: A bitmask of #[`xcb_coord_mode_t`](@ref) values.
* `coordinate_mode`:
* `drawable`: The drawable to draw the line(s) on.
* `gc`: The graphics context to use.
* `points_len`: The number of [`xcb_point_t`](@ref) structures in *points*.
* `points`: An array of points.
### Returns
A cookie
"""
function xcb_poly_line_checked(c, coordinate_mode, drawable, gc, points_len, points)
    ccall((:xcb_poly_line_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_point_t}), c, coordinate_mode, drawable, gc, points_len, points)
end

"""
    xcb_poly_line(c, coordinate_mode, drawable, gc, points_len, points)

draw lines

Draws *points_len*-1 lines between each pair of points (point[i], point[i+1]) in the *points* array. The lines are drawn in the order listed in the array. They join correctly at all intermediate points, and if the first and last points coincide, the first and last lines also join correctly. For any given line, a pixel is not drawn more than once. If thin (zero line-width) lines intersect, the intersecting pixels are drawn multiple times. If wide lines intersect, the intersecting pixels are drawn only once, as though the entire request were a single, filled shape.

### Parameters
* `c`: The connection
* `coordinate_mode`: A bitmask of #[`xcb_coord_mode_t`](@ref) values.
* `coordinate_mode`:
* `drawable`: The drawable to draw the line(s) on.
* `gc`: The graphics context to use.
* `points_len`: The number of [`xcb_point_t`](@ref) structures in *points*.
* `points`: An array of points.
### Returns
A cookie
"""
function xcb_poly_line(c, coordinate_mode, drawable, gc, points_len, points)
    ccall((:xcb_poly_line, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_point_t}), c, coordinate_mode, drawable, gc, points_len, points)
end

function xcb_poly_line_points(R)
    ccall((:xcb_poly_line_points, libxcb), Ptr{xcb_point_t}, (Ptr{xcb_poly_line_request_t},), R)
end

function xcb_poly_line_points_length(R)
    ccall((:xcb_poly_line_points_length, libxcb), Cint, (Ptr{xcb_poly_line_request_t},), R)
end

function xcb_poly_line_points_iterator(R)
    ccall((:xcb_poly_line_points_iterator, libxcb), xcb_point_iterator_t, (Ptr{xcb_poly_line_request_t},), R)
end

"""
    xcb_segment_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_segment_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_segment_iterator_t`](@ref)
"""
function xcb_segment_next(i)
    ccall((:xcb_segment_next, libxcb), Cvoid, (Ptr{xcb_segment_iterator_t},), i)
end

"""
    xcb_segment_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_segment_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_segment_end(i)
    ccall((:xcb_segment_end, libxcb), xcb_generic_iterator_t, (xcb_segment_iterator_t,), i)
end

function xcb_poly_segment_sizeof(_buffer, segments_len)
    ccall((:xcb_poly_segment_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, segments_len)
end

"""
    xcb_poly_segment_checked(c, drawable, gc, segments_len, segments)

draw lines

Draws multiple, unconnected lines. For each segment, a line is drawn between (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of [`xcb_segment_t`](@ref) structures and does not perform joining at coincident endpoints. For any given line, a pixel is not drawn more than once. If lines intersect, the intersecting pixels are drawn multiple times.

TODO: include the [`xcb_segment_t`](@ref) data structure

TODO: an example

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `drawable`: A drawable (Window or Pixmap) to draw on.
* `gc`: The graphics context to use.  TODO: document which attributes of a gc are used
* `segments_len`: The number of [`xcb_segment_t`](@ref) structures in *segments*.
* `segments`: An array of [`xcb_segment_t`](@ref) structures.
### Returns
A cookie
"""
function xcb_poly_segment_checked(c, drawable, gc, segments_len, segments)
    ccall((:xcb_poly_segment_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_segment_t}), c, drawable, gc, segments_len, segments)
end

"""
    xcb_poly_segment(c, drawable, gc, segments_len, segments)

draw lines

Draws multiple, unconnected lines. For each segment, a line is drawn between (x1, y1) and (x2, y2). The lines are drawn in the order listed in the array of [`xcb_segment_t`](@ref) structures and does not perform joining at coincident endpoints. For any given line, a pixel is not drawn more than once. If lines intersect, the intersecting pixels are drawn multiple times.

TODO: include the [`xcb_segment_t`](@ref) data structure

TODO: an example

### Parameters
* `c`: The connection
* `drawable`: A drawable (Window or Pixmap) to draw on.
* `gc`: The graphics context to use.  TODO: document which attributes of a gc are used
* `segments_len`: The number of [`xcb_segment_t`](@ref) structures in *segments*.
* `segments`: An array of [`xcb_segment_t`](@ref) structures.
### Returns
A cookie
"""
function xcb_poly_segment(c, drawable, gc, segments_len, segments)
    ccall((:xcb_poly_segment, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_segment_t}), c, drawable, gc, segments_len, segments)
end

function xcb_poly_segment_segments(R)
    ccall((:xcb_poly_segment_segments, libxcb), Ptr{xcb_segment_t}, (Ptr{xcb_poly_segment_request_t},), R)
end

function xcb_poly_segment_segments_length(R)
    ccall((:xcb_poly_segment_segments_length, libxcb), Cint, (Ptr{xcb_poly_segment_request_t},), R)
end

function xcb_poly_segment_segments_iterator(R)
    ccall((:xcb_poly_segment_segments_iterator, libxcb), xcb_segment_iterator_t, (Ptr{xcb_poly_segment_request_t},), R)
end

function xcb_poly_rectangle_sizeof(_buffer, rectangles_len)
    ccall((:xcb_poly_rectangle_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, rectangles_len)
end

"""
    xcb_poly_rectangle_checked(c, drawable, gc, rectangles_len, rectangles)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_rectangle_checked(c, drawable, gc, rectangles_len, rectangles)
    ccall((:xcb_poly_rectangle_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_rectangle_t}), c, drawable, gc, rectangles_len, rectangles)
end

"""
    xcb_poly_rectangle(c, drawable, gc, rectangles_len, rectangles)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_rectangle(c, drawable, gc, rectangles_len, rectangles)
    ccall((:xcb_poly_rectangle, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_rectangle_t}), c, drawable, gc, rectangles_len, rectangles)
end

function xcb_poly_rectangle_rectangles(R)
    ccall((:xcb_poly_rectangle_rectangles, libxcb), Ptr{xcb_rectangle_t}, (Ptr{xcb_poly_rectangle_request_t},), R)
end

function xcb_poly_rectangle_rectangles_length(R)
    ccall((:xcb_poly_rectangle_rectangles_length, libxcb), Cint, (Ptr{xcb_poly_rectangle_request_t},), R)
end

function xcb_poly_rectangle_rectangles_iterator(R)
    ccall((:xcb_poly_rectangle_rectangles_iterator, libxcb), xcb_rectangle_iterator_t, (Ptr{xcb_poly_rectangle_request_t},), R)
end

function xcb_poly_arc_sizeof(_buffer, arcs_len)
    ccall((:xcb_poly_arc_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, arcs_len)
end

"""
    xcb_poly_arc_checked(c, drawable, gc, arcs_len, arcs)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_arc_checked(c, drawable, gc, arcs_len, arcs)
    ccall((:xcb_poly_arc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_arc_t}), c, drawable, gc, arcs_len, arcs)
end

"""
    xcb_poly_arc(c, drawable, gc, arcs_len, arcs)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_arc(c, drawable, gc, arcs_len, arcs)
    ccall((:xcb_poly_arc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_arc_t}), c, drawable, gc, arcs_len, arcs)
end

function xcb_poly_arc_arcs(R)
    ccall((:xcb_poly_arc_arcs, libxcb), Ptr{xcb_arc_t}, (Ptr{xcb_poly_arc_request_t},), R)
end

function xcb_poly_arc_arcs_length(R)
    ccall((:xcb_poly_arc_arcs_length, libxcb), Cint, (Ptr{xcb_poly_arc_request_t},), R)
end

function xcb_poly_arc_arcs_iterator(R)
    ccall((:xcb_poly_arc_arcs_iterator, libxcb), xcb_arc_iterator_t, (Ptr{xcb_poly_arc_request_t},), R)
end

function xcb_fill_poly_sizeof(_buffer, points_len)
    ccall((:xcb_fill_poly_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, points_len)
end

"""
    xcb_fill_poly_checked(c, drawable, gc, shape, coordinate_mode, points_len, points)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_fill_poly_checked(c, drawable, gc, shape, coordinate_mode, points_len, points)
    ccall((:xcb_fill_poly_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt8, UInt8, UInt32, Ptr{xcb_point_t}), c, drawable, gc, shape, coordinate_mode, points_len, points)
end

"""
    xcb_fill_poly(c, drawable, gc, shape, coordinate_mode, points_len, points)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_fill_poly(c, drawable, gc, shape, coordinate_mode, points_len, points)
    ccall((:xcb_fill_poly, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt8, UInt8, UInt32, Ptr{xcb_point_t}), c, drawable, gc, shape, coordinate_mode, points_len, points)
end

function xcb_fill_poly_points(R)
    ccall((:xcb_fill_poly_points, libxcb), Ptr{xcb_point_t}, (Ptr{xcb_fill_poly_request_t},), R)
end

function xcb_fill_poly_points_length(R)
    ccall((:xcb_fill_poly_points_length, libxcb), Cint, (Ptr{xcb_fill_poly_request_t},), R)
end

function xcb_fill_poly_points_iterator(R)
    ccall((:xcb_fill_poly_points_iterator, libxcb), xcb_point_iterator_t, (Ptr{xcb_fill_poly_request_t},), R)
end

function xcb_poly_fill_rectangle_sizeof(_buffer, rectangles_len)
    ccall((:xcb_poly_fill_rectangle_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, rectangles_len)
end

"""
    xcb_poly_fill_rectangle_checked(c, drawable, gc, rectangles_len, rectangles)

Fills rectangles

Fills the specified rectangle(s) in the order listed in the array. For any given rectangle, each pixel is not drawn more than once. If rectangles intersect, the intersecting pixels are drawn multiple times.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `drawable`: The drawable (Window or Pixmap) to draw on.
* `gc`: The graphics context to use.  The following graphics context components are used: function, plane-mask, fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.  The following graphics context mode-dependent components are used: foreground, background, tile, stipple, tile-stipple-x-origin, and tile-stipple-y-origin.
* `rectangles_len`: The number of [`xcb_rectangle_t`](@ref) structures in *rectangles*.
* `rectangles`: The rectangles to fill.
### Returns
A cookie
"""
function xcb_poly_fill_rectangle_checked(c, drawable, gc, rectangles_len, rectangles)
    ccall((:xcb_poly_fill_rectangle_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_rectangle_t}), c, drawable, gc, rectangles_len, rectangles)
end

"""
    xcb_poly_fill_rectangle(c, drawable, gc, rectangles_len, rectangles)

Fills rectangles

Fills the specified rectangle(s) in the order listed in the array. For any given rectangle, each pixel is not drawn more than once. If rectangles intersect, the intersecting pixels are drawn multiple times.

### Parameters
* `c`: The connection
* `drawable`: The drawable (Window or Pixmap) to draw on.
* `gc`: The graphics context to use.  The following graphics context components are used: function, plane-mask, fill-style, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.  The following graphics context mode-dependent components are used: foreground, background, tile, stipple, tile-stipple-x-origin, and tile-stipple-y-origin.
* `rectangles_len`: The number of [`xcb_rectangle_t`](@ref) structures in *rectangles*.
* `rectangles`: The rectangles to fill.
### Returns
A cookie
"""
function xcb_poly_fill_rectangle(c, drawable, gc, rectangles_len, rectangles)
    ccall((:xcb_poly_fill_rectangle, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_rectangle_t}), c, drawable, gc, rectangles_len, rectangles)
end

function xcb_poly_fill_rectangle_rectangles(R)
    ccall((:xcb_poly_fill_rectangle_rectangles, libxcb), Ptr{xcb_rectangle_t}, (Ptr{xcb_poly_fill_rectangle_request_t},), R)
end

function xcb_poly_fill_rectangle_rectangles_length(R)
    ccall((:xcb_poly_fill_rectangle_rectangles_length, libxcb), Cint, (Ptr{xcb_poly_fill_rectangle_request_t},), R)
end

function xcb_poly_fill_rectangle_rectangles_iterator(R)
    ccall((:xcb_poly_fill_rectangle_rectangles_iterator, libxcb), xcb_rectangle_iterator_t, (Ptr{xcb_poly_fill_rectangle_request_t},), R)
end

function xcb_poly_fill_arc_sizeof(_buffer, arcs_len)
    ccall((:xcb_poly_fill_arc_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, arcs_len)
end

"""
    xcb_poly_fill_arc_checked(c, drawable, gc, arcs_len, arcs)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_fill_arc_checked(c, drawable, gc, arcs_len, arcs)
    ccall((:xcb_poly_fill_arc_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_arc_t}), c, drawable, gc, arcs_len, arcs)
end

"""
    xcb_poly_fill_arc(c, drawable, gc, arcs_len, arcs)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_fill_arc(c, drawable, gc, arcs_len, arcs)
    ccall((:xcb_poly_fill_arc, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, UInt32, Ptr{xcb_arc_t}), c, drawable, gc, arcs_len, arcs)
end

function xcb_poly_fill_arc_arcs(R)
    ccall((:xcb_poly_fill_arc_arcs, libxcb), Ptr{xcb_arc_t}, (Ptr{xcb_poly_fill_arc_request_t},), R)
end

function xcb_poly_fill_arc_arcs_length(R)
    ccall((:xcb_poly_fill_arc_arcs_length, libxcb), Cint, (Ptr{xcb_poly_fill_arc_request_t},), R)
end

function xcb_poly_fill_arc_arcs_iterator(R)
    ccall((:xcb_poly_fill_arc_arcs_iterator, libxcb), xcb_arc_iterator_t, (Ptr{xcb_poly_fill_arc_request_t},), R)
end

function xcb_put_image_sizeof(_buffer, data_len)
    ccall((:xcb_put_image_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, data_len)
end

"""
    xcb_put_image_checked(c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_put_image_checked(c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)
    ccall((:xcb_put_image_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt16, UInt16, Int16, Int16, UInt8, UInt8, UInt32, Ptr{UInt8}), c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)
end

"""
    xcb_put_image(c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_put_image(c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)
    ccall((:xcb_put_image, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, UInt16, UInt16, Int16, Int16, UInt8, UInt8, UInt32, Ptr{UInt8}), c, format, drawable, gc, width, height, dst_x, dst_y, left_pad, depth, data_len, data)
end

function xcb_put_image_data(R)
    ccall((:xcb_put_image_data, libxcb), Ptr{UInt8}, (Ptr{xcb_put_image_request_t},), R)
end

function xcb_put_image_data_length(R)
    ccall((:xcb_put_image_data_length, libxcb), Cint, (Ptr{xcb_put_image_request_t},), R)
end

function xcb_put_image_data_end(R)
    ccall((:xcb_put_image_data_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_put_image_request_t},), R)
end

function xcb_get_image_sizeof(_buffer)
    ccall((:xcb_get_image_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_image(c, format, drawable, x, y, width, height, plane_mask)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_image(c, format, drawable, x, y, width, height, plane_mask)
    ccall((:xcb_get_image, libxcb), xcb_get_image_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, Int16, Int16, UInt16, UInt16, UInt32), c, format, drawable, x, y, width, height, plane_mask)
end

"""
    xcb_get_image_unchecked(c, format, drawable, x, y, width, height, plane_mask)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_image_unchecked(c, format, drawable, x, y, width, height, plane_mask)
    ccall((:xcb_get_image_unchecked, libxcb), xcb_get_image_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, Int16, Int16, UInt16, UInt16, UInt32), c, format, drawable, x, y, width, height, plane_mask)
end

function xcb_get_image_data(R)
    ccall((:xcb_get_image_data, libxcb), Ptr{UInt8}, (Ptr{xcb_get_image_reply_t},), R)
end

function xcb_get_image_data_length(R)
    ccall((:xcb_get_image_data_length, libxcb), Cint, (Ptr{xcb_get_image_reply_t},), R)
end

function xcb_get_image_data_end(R)
    ccall((:xcb_get_image_data_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_image_reply_t},), R)
end

"""
    xcb_get_image_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_image_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_image_reply(c, cookie, e)
    ccall((:xcb_get_image_reply, libxcb), Ptr{xcb_get_image_reply_t}, (Ptr{xcb_connection_t}, xcb_get_image_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_poly_text_8_sizeof(_buffer, items_len)
    ccall((:xcb_poly_text_8_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, items_len)
end

"""
    xcb_poly_text_8_checked(c, drawable, gc, x, y, items_len, items)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_text_8_checked(c, drawable, gc, x, y, items_len, items)
    ccall((:xcb_poly_text_8_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{UInt8}), c, drawable, gc, x, y, items_len, items)
end

"""
    xcb_poly_text_8(c, drawable, gc, x, y, items_len, items)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_text_8(c, drawable, gc, x, y, items_len, items)
    ccall((:xcb_poly_text_8, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{UInt8}), c, drawable, gc, x, y, items_len, items)
end

function xcb_poly_text_8_items(R)
    ccall((:xcb_poly_text_8_items, libxcb), Ptr{UInt8}, (Ptr{xcb_poly_text_8_request_t},), R)
end

function xcb_poly_text_8_items_length(R)
    ccall((:xcb_poly_text_8_items_length, libxcb), Cint, (Ptr{xcb_poly_text_8_request_t},), R)
end

function xcb_poly_text_8_items_end(R)
    ccall((:xcb_poly_text_8_items_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_poly_text_8_request_t},), R)
end

function xcb_poly_text_16_sizeof(_buffer, items_len)
    ccall((:xcb_poly_text_16_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, items_len)
end

"""
    xcb_poly_text_16_checked(c, drawable, gc, x, y, items_len, items)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_text_16_checked(c, drawable, gc, x, y, items_len, items)
    ccall((:xcb_poly_text_16_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{UInt8}), c, drawable, gc, x, y, items_len, items)
end

"""
    xcb_poly_text_16(c, drawable, gc, x, y, items_len, items)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_poly_text_16(c, drawable, gc, x, y, items_len, items)
    ccall((:xcb_poly_text_16, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, UInt32, Ptr{UInt8}), c, drawable, gc, x, y, items_len, items)
end

function xcb_poly_text_16_items(R)
    ccall((:xcb_poly_text_16_items, libxcb), Ptr{UInt8}, (Ptr{xcb_poly_text_16_request_t},), R)
end

function xcb_poly_text_16_items_length(R)
    ccall((:xcb_poly_text_16_items_length, libxcb), Cint, (Ptr{xcb_poly_text_16_request_t},), R)
end

function xcb_poly_text_16_items_end(R)
    ccall((:xcb_poly_text_16_items_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_poly_text_16_request_t},), R)
end

function xcb_image_text_8_sizeof(_buffer)
    ccall((:xcb_image_text_8_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_image_text_8_checked(c, string_len, drawable, gc, x, y, string)

Draws text

Fills the destination rectangle with the background pixel from *gc*, then paints the text with the foreground pixel from *gc*. The upper-left corner of the filled rectangle is at [x, y - font-ascent]. The width is overall-width, the height is font-ascent + font-descent. The overall-width, font-ascent and font-descent are as returned by [`xcb_query_text_extents`](@ref) (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of client-side rendering using Xft.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `string_len`: The length of the *string*. Note that this parameter limited by 255 due to using 8 bits!
* `drawable`: The drawable (Window or Pixmap) to draw text on.
* `gc`: The graphics context to use.  The following graphics context components are used: plane-mask, foreground, background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
* `x`: The x coordinate of the first character, relative to the origin of *drawable*.
* `y`: The y coordinate of the first character, relative to the origin of *drawable*.
* `string`: The string to draw. Only the first 255 characters are relevant due to the data type of *string_len*.
### Returns
A cookie
"""
function xcb_image_text_8_checked(c, string_len, drawable, gc, x, y, string)
    ccall((:xcb_image_text_8_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Ptr{Cchar}), c, string_len, drawable, gc, x, y, string)
end

"""
    xcb_image_text_8(c, string_len, drawable, gc, x, y, string)

Draws text

Fills the destination rectangle with the background pixel from *gc*, then paints the text with the foreground pixel from *gc*. The upper-left corner of the filled rectangle is at [x, y - font-ascent]. The width is overall-width, the height is font-ascent + font-descent. The overall-width, font-ascent and font-descent are as returned by [`xcb_query_text_extents`](@ref) (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of client-side rendering using Xft.

### Parameters
* `c`: The connection
* `string_len`: The length of the *string*. Note that this parameter limited by 255 due to using 8 bits!
* `drawable`: The drawable (Window or Pixmap) to draw text on.
* `gc`: The graphics context to use.  The following graphics context components are used: plane-mask, foreground, background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
* `x`: The x coordinate of the first character, relative to the origin of *drawable*.
* `y`: The y coordinate of the first character, relative to the origin of *drawable*.
* `string`: The string to draw. Only the first 255 characters are relevant due to the data type of *string_len*.
### Returns
A cookie
"""
function xcb_image_text_8(c, string_len, drawable, gc, x, y, string)
    ccall((:xcb_image_text_8, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Ptr{Cchar}), c, string_len, drawable, gc, x, y, string)
end

function xcb_image_text_8_string(R)
    ccall((:xcb_image_text_8_string, libxcb), Ptr{Cchar}, (Ptr{xcb_image_text_8_request_t},), R)
end

function xcb_image_text_8_string_length(R)
    ccall((:xcb_image_text_8_string_length, libxcb), Cint, (Ptr{xcb_image_text_8_request_t},), R)
end

function xcb_image_text_8_string_end(R)
    ccall((:xcb_image_text_8_string_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_image_text_8_request_t},), R)
end

function xcb_image_text_16_sizeof(_buffer)
    ccall((:xcb_image_text_16_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_image_text_16_checked(c, string_len, drawable, gc, x, y, string)

Draws text

Fills the destination rectangle with the background pixel from *gc*, then paints the text with the foreground pixel from *gc*. The upper-left corner of the filled rectangle is at [x, y - font-ascent]. The width is overall-width, the height is font-ascent + font-descent. The overall-width, font-ascent and font-descent are as returned by [`xcb_query_text_extents`](@ref) (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of client-side rendering using Xft.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `string_len`: The length of the *string* in characters. Note that this parameter limited by 255 due to using 8 bits!
* `drawable`: The drawable (Window or Pixmap) to draw text on.
* `gc`: The graphics context to use.  The following graphics context components are used: plane-mask, foreground, background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
* `x`: The x coordinate of the first character, relative to the origin of *drawable*.
* `y`: The y coordinate of the first character, relative to the origin of *drawable*.
* `string`: The string to draw. Only the first 255 characters are relevant due to the data type of *string_len*. Every character uses 2 bytes (hence the 16 in this request's name).
### Returns
A cookie
"""
function xcb_image_text_16_checked(c, string_len, drawable, gc, x, y, string)
    ccall((:xcb_image_text_16_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Ptr{xcb_char2b_t}), c, string_len, drawable, gc, x, y, string)
end

"""
    xcb_image_text_16(c, string_len, drawable, gc, x, y, string)

Draws text

Fills the destination rectangle with the background pixel from *gc*, then paints the text with the foreground pixel from *gc*. The upper-left corner of the filled rectangle is at [x, y - font-ascent]. The width is overall-width, the height is font-ascent + font-descent. The overall-width, font-ascent and font-descent are as returned by [`xcb_query_text_extents`](@ref) (TODO).

Note that using X core fonts is deprecated (but still supported) in favor of client-side rendering using Xft.

### Parameters
* `c`: The connection
* `string_len`: The length of the *string* in characters. Note that this parameter limited by 255 due to using 8 bits!
* `drawable`: The drawable (Window or Pixmap) to draw text on.
* `gc`: The graphics context to use.  The following graphics context components are used: plane-mask, foreground, background, font, subwindow-mode, clip-x-origin, clip-y-origin, and clip-mask.
* `x`: The x coordinate of the first character, relative to the origin of *drawable*.
* `y`: The y coordinate of the first character, relative to the origin of *drawable*.
* `string`: The string to draw. Only the first 255 characters are relevant due to the data type of *string_len*. Every character uses 2 bytes (hence the 16 in this request's name).
### Returns
A cookie
"""
function xcb_image_text_16(c, string_len, drawable, gc, x, y, string)
    ccall((:xcb_image_text_16, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, xcb_gcontext_t, Int16, Int16, Ptr{xcb_char2b_t}), c, string_len, drawable, gc, x, y, string)
end

function xcb_image_text_16_string(R)
    ccall((:xcb_image_text_16_string, libxcb), Ptr{xcb_char2b_t}, (Ptr{xcb_image_text_16_request_t},), R)
end

function xcb_image_text_16_string_length(R)
    ccall((:xcb_image_text_16_string_length, libxcb), Cint, (Ptr{xcb_image_text_16_request_t},), R)
end

function xcb_image_text_16_string_iterator(R)
    ccall((:xcb_image_text_16_string_iterator, libxcb), xcb_char2b_iterator_t, (Ptr{xcb_image_text_16_request_t},), R)
end

"""
    xcb_create_colormap_checked(c, alloc, mid, window, visual)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_create_colormap_checked(c, alloc, mid, window, visual)
    ccall((:xcb_create_colormap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, xcb_window_t, xcb_visualid_t), c, alloc, mid, window, visual)
end

"""
    xcb_create_colormap(c, alloc, mid, window, visual)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_create_colormap(c, alloc, mid, window, visual)
    ccall((:xcb_create_colormap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, xcb_window_t, xcb_visualid_t), c, alloc, mid, window, visual)
end

"""
    xcb_free_colormap_checked(c, cmap)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_free_colormap_checked(c, cmap)
    ccall((:xcb_free_colormap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

"""
    xcb_free_colormap(c, cmap)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_free_colormap(c, cmap)
    ccall((:xcb_free_colormap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

"""
    xcb_copy_colormap_and_free_checked(c, mid, src_cmap)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_colormap_and_free_checked(c, mid, src_cmap)
    ccall((:xcb_copy_colormap_and_free_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, xcb_colormap_t), c, mid, src_cmap)
end

"""
    xcb_copy_colormap_and_free(c, mid, src_cmap)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_copy_colormap_and_free(c, mid, src_cmap)
    ccall((:xcb_copy_colormap_and_free, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, xcb_colormap_t), c, mid, src_cmap)
end

"""
    xcb_install_colormap_checked(c, cmap)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_install_colormap_checked(c, cmap)
    ccall((:xcb_install_colormap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

"""
    xcb_install_colormap(c, cmap)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_install_colormap(c, cmap)
    ccall((:xcb_install_colormap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

"""
    xcb_uninstall_colormap_checked(c, cmap)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_uninstall_colormap_checked(c, cmap)
    ccall((:xcb_uninstall_colormap_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

"""
    xcb_uninstall_colormap(c, cmap)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_uninstall_colormap(c, cmap)
    ccall((:xcb_uninstall_colormap, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t), c, cmap)
end

function xcb_list_installed_colormaps_sizeof(_buffer)
    ccall((:xcb_list_installed_colormaps_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_installed_colormaps(c, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_installed_colormaps(c, window)
    ccall((:xcb_list_installed_colormaps, libxcb), xcb_list_installed_colormaps_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

"""
    xcb_list_installed_colormaps_unchecked(c, window)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_installed_colormaps_unchecked(c, window)
    ccall((:xcb_list_installed_colormaps_unchecked, libxcb), xcb_list_installed_colormaps_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t), c, window)
end

function xcb_list_installed_colormaps_cmaps(R)
    ccall((:xcb_list_installed_colormaps_cmaps, libxcb), Ptr{xcb_colormap_t}, (Ptr{xcb_list_installed_colormaps_reply_t},), R)
end

function xcb_list_installed_colormaps_cmaps_length(R)
    ccall((:xcb_list_installed_colormaps_cmaps_length, libxcb), Cint, (Ptr{xcb_list_installed_colormaps_reply_t},), R)
end

function xcb_list_installed_colormaps_cmaps_end(R)
    ccall((:xcb_list_installed_colormaps_cmaps_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_list_installed_colormaps_reply_t},), R)
end

"""
    xcb_list_installed_colormaps_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_installed_colormaps_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_installed_colormaps_reply(c, cookie, e)
    ccall((:xcb_list_installed_colormaps_reply, libxcb), Ptr{xcb_list_installed_colormaps_reply_t}, (Ptr{xcb_connection_t}, xcb_list_installed_colormaps_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_alloc_color(c, cmap, red, green, blue)

Allocate a color

Allocates a read-only colormap entry corresponding to the closest RGB value supported by the hardware. If you are using TrueColor, you can take a shortcut and directly calculate the color pixel value to avoid the round trip. But, for example, on 16-bit color setups (VNC), you can easily get the closest supported RGB value to the RGB value you are specifying.

### Parameters
* `c`: The connection
* `cmap`: TODO
* `red`: The red value of your color.
* `green`: The green value of your color.
* `blue`: The blue value of your color.
### Returns
A cookie
"""
function xcb_alloc_color(c, cmap, red, green, blue)
    ccall((:xcb_alloc_color, libxcb), xcb_alloc_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, UInt16, UInt16), c, cmap, red, green, blue)
end

"""
    xcb_alloc_color_unchecked(c, cmap, red, green, blue)

Allocate a color

Allocates a read-only colormap entry corresponding to the closest RGB value supported by the hardware. If you are using TrueColor, you can take a shortcut and directly calculate the color pixel value to avoid the round trip. But, for example, on 16-bit color setups (VNC), you can easily get the closest supported RGB value to the RGB value you are specifying.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `cmap`: TODO
* `red`: The red value of your color.
* `green`: The green value of your color.
* `blue`: The blue value of your color.
### Returns
A cookie
"""
function xcb_alloc_color_unchecked(c, cmap, red, green, blue)
    ccall((:xcb_alloc_color_unchecked, libxcb), xcb_alloc_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, UInt16, UInt16), c, cmap, red, green, blue)
end

"""
    xcb_alloc_color_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_alloc_color_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_alloc_color_reply(c, cookie, e)
    ccall((:xcb_alloc_color_reply, libxcb), Ptr{xcb_alloc_color_reply_t}, (Ptr{xcb_connection_t}, xcb_alloc_color_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_alloc_named_color_sizeof(_buffer)
    ccall((:xcb_alloc_named_color_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_alloc_named_color(c, cmap, name_len, name)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_named_color(c, cmap, name_len, name)
    ccall((:xcb_alloc_named_color, libxcb), xcb_alloc_named_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, Ptr{Cchar}), c, cmap, name_len, name)
end

"""
    xcb_alloc_named_color_unchecked(c, cmap, name_len, name)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_named_color_unchecked(c, cmap, name_len, name)
    ccall((:xcb_alloc_named_color_unchecked, libxcb), xcb_alloc_named_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, Ptr{Cchar}), c, cmap, name_len, name)
end

"""
    xcb_alloc_named_color_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_alloc_named_color_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_alloc_named_color_reply(c, cookie, e)
    ccall((:xcb_alloc_named_color_reply, libxcb), Ptr{xcb_alloc_named_color_reply_t}, (Ptr{xcb_connection_t}, xcb_alloc_named_color_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_alloc_color_cells_sizeof(_buffer)
    ccall((:xcb_alloc_color_cells_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_alloc_color_cells(c, contiguous, cmap, colors, planes)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_color_cells(c, contiguous, cmap, colors, planes)
    ccall((:xcb_alloc_color_cells, libxcb), xcb_alloc_color_cells_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt16, UInt16), c, contiguous, cmap, colors, planes)
end

"""
    xcb_alloc_color_cells_unchecked(c, contiguous, cmap, colors, planes)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_color_cells_unchecked(c, contiguous, cmap, colors, planes)
    ccall((:xcb_alloc_color_cells_unchecked, libxcb), xcb_alloc_color_cells_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt16, UInt16), c, contiguous, cmap, colors, planes)
end

function xcb_alloc_color_cells_pixels(R)
    ccall((:xcb_alloc_color_cells_pixels, libxcb), Ptr{UInt32}, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

function xcb_alloc_color_cells_pixels_length(R)
    ccall((:xcb_alloc_color_cells_pixels_length, libxcb), Cint, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

function xcb_alloc_color_cells_pixels_end(R)
    ccall((:xcb_alloc_color_cells_pixels_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

function xcb_alloc_color_cells_masks(R)
    ccall((:xcb_alloc_color_cells_masks, libxcb), Ptr{UInt32}, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

function xcb_alloc_color_cells_masks_length(R)
    ccall((:xcb_alloc_color_cells_masks_length, libxcb), Cint, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

function xcb_alloc_color_cells_masks_end(R)
    ccall((:xcb_alloc_color_cells_masks_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_alloc_color_cells_reply_t},), R)
end

"""
    xcb_alloc_color_cells_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_alloc_color_cells_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_alloc_color_cells_reply(c, cookie, e)
    ccall((:xcb_alloc_color_cells_reply, libxcb), Ptr{xcb_alloc_color_cells_reply_t}, (Ptr{xcb_connection_t}, xcb_alloc_color_cells_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_alloc_color_planes_sizeof(_buffer)
    ccall((:xcb_alloc_color_planes_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_alloc_color_planes(c, contiguous, cmap, colors, reds, greens, blues)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_color_planes(c, contiguous, cmap, colors, reds, greens, blues)
    ccall((:xcb_alloc_color_planes, libxcb), xcb_alloc_color_planes_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt16, UInt16, UInt16, UInt16), c, contiguous, cmap, colors, reds, greens, blues)
end

"""
    xcb_alloc_color_planes_unchecked(c, contiguous, cmap, colors, reds, greens, blues)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_alloc_color_planes_unchecked(c, contiguous, cmap, colors, reds, greens, blues)
    ccall((:xcb_alloc_color_planes_unchecked, libxcb), xcb_alloc_color_planes_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt16, UInt16, UInt16, UInt16), c, contiguous, cmap, colors, reds, greens, blues)
end

function xcb_alloc_color_planes_pixels(R)
    ccall((:xcb_alloc_color_planes_pixels, libxcb), Ptr{UInt32}, (Ptr{xcb_alloc_color_planes_reply_t},), R)
end

function xcb_alloc_color_planes_pixels_length(R)
    ccall((:xcb_alloc_color_planes_pixels_length, libxcb), Cint, (Ptr{xcb_alloc_color_planes_reply_t},), R)
end

function xcb_alloc_color_planes_pixels_end(R)
    ccall((:xcb_alloc_color_planes_pixels_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_alloc_color_planes_reply_t},), R)
end

"""
    xcb_alloc_color_planes_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_alloc_color_planes_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_alloc_color_planes_reply(c, cookie, e)
    ccall((:xcb_alloc_color_planes_reply, libxcb), Ptr{xcb_alloc_color_planes_reply_t}, (Ptr{xcb_connection_t}, xcb_alloc_color_planes_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_free_colors_sizeof(_buffer, pixels_len)
    ccall((:xcb_free_colors_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, pixels_len)
end

"""
    xcb_free_colors_checked(c, cmap, plane_mask, pixels_len, pixels)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_free_colors_checked(c, cmap, plane_mask, pixels_len, pixels)
    ccall((:xcb_free_colors_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, UInt32, Ptr{UInt32}), c, cmap, plane_mask, pixels_len, pixels)
end

"""
    xcb_free_colors(c, cmap, plane_mask, pixels_len, pixels)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_free_colors(c, cmap, plane_mask, pixels_len, pixels)
    ccall((:xcb_free_colors, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, UInt32, Ptr{UInt32}), c, cmap, plane_mask, pixels_len, pixels)
end

function xcb_free_colors_pixels(R)
    ccall((:xcb_free_colors_pixels, libxcb), Ptr{UInt32}, (Ptr{xcb_free_colors_request_t},), R)
end

function xcb_free_colors_pixels_length(R)
    ccall((:xcb_free_colors_pixels_length, libxcb), Cint, (Ptr{xcb_free_colors_request_t},), R)
end

function xcb_free_colors_pixels_end(R)
    ccall((:xcb_free_colors_pixels_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_free_colors_request_t},), R)
end

"""
    xcb_coloritem_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_coloritem_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_coloritem_iterator_t`](@ref)
"""
function xcb_coloritem_next(i)
    ccall((:xcb_coloritem_next, libxcb), Cvoid, (Ptr{xcb_coloritem_iterator_t},), i)
end

"""
    xcb_coloritem_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_coloritem_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_coloritem_end(i)
    ccall((:xcb_coloritem_end, libxcb), xcb_generic_iterator_t, (xcb_coloritem_iterator_t,), i)
end

function xcb_store_colors_sizeof(_buffer, items_len)
    ccall((:xcb_store_colors_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, items_len)
end

"""
    xcb_store_colors_checked(c, cmap, items_len, items)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_store_colors_checked(c, cmap, items_len, items)
    ccall((:xcb_store_colors_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, Ptr{xcb_coloritem_t}), c, cmap, items_len, items)
end

"""
    xcb_store_colors(c, cmap, items_len, items)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_store_colors(c, cmap, items_len, items)
    ccall((:xcb_store_colors, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, Ptr{xcb_coloritem_t}), c, cmap, items_len, items)
end

function xcb_store_colors_items(R)
    ccall((:xcb_store_colors_items, libxcb), Ptr{xcb_coloritem_t}, (Ptr{xcb_store_colors_request_t},), R)
end

function xcb_store_colors_items_length(R)
    ccall((:xcb_store_colors_items_length, libxcb), Cint, (Ptr{xcb_store_colors_request_t},), R)
end

function xcb_store_colors_items_iterator(R)
    ccall((:xcb_store_colors_items_iterator, libxcb), xcb_coloritem_iterator_t, (Ptr{xcb_store_colors_request_t},), R)
end

function xcb_store_named_color_sizeof(_buffer)
    ccall((:xcb_store_named_color_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_store_named_color_checked(c, flags, cmap, pixel, name_len, name)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_store_named_color_checked(c, flags, cmap, pixel, name_len, name)
    ccall((:xcb_store_named_color_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt32, UInt16, Ptr{Cchar}), c, flags, cmap, pixel, name_len, name)
end

"""
    xcb_store_named_color(c, flags, cmap, pixel, name_len, name)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_store_named_color(c, flags, cmap, pixel, name_len, name)
    ccall((:xcb_store_named_color, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_colormap_t, UInt32, UInt16, Ptr{Cchar}), c, flags, cmap, pixel, name_len, name)
end

function xcb_store_named_color_name(R)
    ccall((:xcb_store_named_color_name, libxcb), Ptr{Cchar}, (Ptr{xcb_store_named_color_request_t},), R)
end

function xcb_store_named_color_name_length(R)
    ccall((:xcb_store_named_color_name_length, libxcb), Cint, (Ptr{xcb_store_named_color_request_t},), R)
end

function xcb_store_named_color_name_end(R)
    ccall((:xcb_store_named_color_name_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_store_named_color_request_t},), R)
end

"""
    xcb_rgb_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_rgb_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_rgb_iterator_t`](@ref)
"""
function xcb_rgb_next(i)
    ccall((:xcb_rgb_next, libxcb), Cvoid, (Ptr{xcb_rgb_iterator_t},), i)
end

"""
    xcb_rgb_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_rgb_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_rgb_end(i)
    ccall((:xcb_rgb_end, libxcb), xcb_generic_iterator_t, (xcb_rgb_iterator_t,), i)
end

function xcb_query_colors_sizeof(_buffer, pixels_len)
    ccall((:xcb_query_colors_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, pixels_len)
end

"""
    xcb_query_colors(c, cmap, pixels_len, pixels)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_colors(c, cmap, pixels_len, pixels)
    ccall((:xcb_query_colors, libxcb), xcb_query_colors_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, Ptr{UInt32}), c, cmap, pixels_len, pixels)
end

"""
    xcb_query_colors_unchecked(c, cmap, pixels_len, pixels)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_colors_unchecked(c, cmap, pixels_len, pixels)
    ccall((:xcb_query_colors_unchecked, libxcb), xcb_query_colors_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt32, Ptr{UInt32}), c, cmap, pixels_len, pixels)
end

function xcb_query_colors_colors(R)
    ccall((:xcb_query_colors_colors, libxcb), Ptr{xcb_rgb_t}, (Ptr{xcb_query_colors_reply_t},), R)
end

function xcb_query_colors_colors_length(R)
    ccall((:xcb_query_colors_colors_length, libxcb), Cint, (Ptr{xcb_query_colors_reply_t},), R)
end

function xcb_query_colors_colors_iterator(R)
    ccall((:xcb_query_colors_colors_iterator, libxcb), xcb_rgb_iterator_t, (Ptr{xcb_query_colors_reply_t},), R)
end

"""
    xcb_query_colors_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_colors_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_colors_reply(c, cookie, e)
    ccall((:xcb_query_colors_reply, libxcb), Ptr{xcb_query_colors_reply_t}, (Ptr{xcb_connection_t}, xcb_query_colors_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_lookup_color_sizeof(_buffer)
    ccall((:xcb_lookup_color_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_lookup_color(c, cmap, name_len, name)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_lookup_color(c, cmap, name_len, name)
    ccall((:xcb_lookup_color, libxcb), xcb_lookup_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, Ptr{Cchar}), c, cmap, name_len, name)
end

"""
    xcb_lookup_color_unchecked(c, cmap, name_len, name)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_lookup_color_unchecked(c, cmap, name_len, name)
    ccall((:xcb_lookup_color_unchecked, libxcb), xcb_lookup_color_cookie_t, (Ptr{xcb_connection_t}, xcb_colormap_t, UInt16, Ptr{Cchar}), c, cmap, name_len, name)
end

"""
    xcb_lookup_color_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_lookup_color_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_lookup_color_reply(c, cookie, e)
    ccall((:xcb_lookup_color_reply, libxcb), Ptr{xcb_lookup_color_reply_t}, (Ptr{xcb_connection_t}, xcb_lookup_color_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_create_cursor_checked(c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_create_cursor_checked(c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
    ccall((:xcb_create_cursor_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_pixmap_t, xcb_pixmap_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
end

"""
    xcb_create_cursor(c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_create_cursor(c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
    ccall((:xcb_create_cursor, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_pixmap_t, xcb_pixmap_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cid, source, mask, fore_red, fore_green, fore_blue, back_red, back_green, back_blue, x, y)
end

"""
    xcb_create_glyph_cursor_checked(c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)

create cursor

Creates a cursor from a font glyph. X provides a set of standard cursor shapes in a special font named cursor. Applications are encouraged to use this interface for their cursors because the font can be customized for the individual display type.

All pixels which are set to 1 in the source will use the foreground color (as specified by *fore_red*, *fore_green* and *fore_blue*). All pixels set to 0 will use the background color (as specified by *back_red*, *back_green* and *back_blue*).

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the cursor, created by [`xcb_generate_id`](@ref).
* `source_font`: In which font to look for the cursor glyph.
* `mask_font`: In which font to look for the mask glyph.
* `source_char`: The glyph of *source_font* to use.
* `mask_char`: The glyph of *mask_font* to use as a mask: Pixels which are set to 1 define which source pixels are displayed. All pixels which are set to 0 are not displayed.
* `fore_red`: The red value of the foreground color.
* `fore_green`: The green value of the foreground color.
* `fore_blue`: The blue value of the foreground color.
* `back_red`: The red value of the background color.
* `back_green`: The green value of the background color.
* `back_blue`: The blue value of the background color.
### Returns
A cookie
"""
function xcb_create_glyph_cursor_checked(c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    ccall((:xcb_create_glyph_cursor_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_font_t, xcb_font_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
end

"""
    xcb_create_glyph_cursor(c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)

create cursor

Creates a cursor from a font glyph. X provides a set of standard cursor shapes in a special font named cursor. Applications are encouraged to use this interface for their cursors because the font can be customized for the individual display type.

All pixels which are set to 1 in the source will use the foreground color (as specified by *fore_red*, *fore_green* and *fore_blue*). All pixels set to 0 will use the background color (as specified by *back_red*, *back_green* and *back_blue*).

### Parameters
* `c`: The connection
* `cid`: The ID with which you will refer to the cursor, created by [`xcb_generate_id`](@ref).
* `source_font`: In which font to look for the cursor glyph.
* `mask_font`: In which font to look for the mask glyph.
* `source_char`: The glyph of *source_font* to use.
* `mask_char`: The glyph of *mask_font* to use as a mask: Pixels which are set to 1 define which source pixels are displayed. All pixels which are set to 0 are not displayed.
* `fore_red`: The red value of the foreground color.
* `fore_green`: The green value of the foreground color.
* `fore_blue`: The blue value of the foreground color.
* `back_red`: The red value of the background color.
* `back_green`: The green value of the background color.
* `back_blue`: The blue value of the background color.
### Returns
A cookie
"""
function xcb_create_glyph_cursor(c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    ccall((:xcb_create_glyph_cursor, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, xcb_font_t, xcb_font_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cid, source_font, mask_font, source_char, mask_char, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
end

"""
    xcb_free_cursor_checked(c, cursor)

Deletes a cursor

Deletes the association between the cursor resource ID and the specified cursor. The cursor is freed when no other resource references it.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `cursor`: The cursor to destroy.
### Returns
A cookie
"""
function xcb_free_cursor_checked(c, cursor)
    ccall((:xcb_free_cursor_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t), c, cursor)
end

"""
    xcb_free_cursor(c, cursor)

Deletes a cursor

Deletes the association between the cursor resource ID and the specified cursor. The cursor is freed when no other resource references it.

### Parameters
* `c`: The connection
* `cursor`: The cursor to destroy.
### Returns
A cookie
"""
function xcb_free_cursor(c, cursor)
    ccall((:xcb_free_cursor, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t), c, cursor)
end

"""
    xcb_recolor_cursor_checked(c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_recolor_cursor_checked(c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    ccall((:xcb_recolor_cursor_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
end

"""
    xcb_recolor_cursor(c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_recolor_cursor(c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
    ccall((:xcb_recolor_cursor, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_cursor_t, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16), c, cursor, fore_red, fore_green, fore_blue, back_red, back_green, back_blue)
end

"""
    xcb_query_best_size(c, _class, drawable, width, height)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_best_size(c, _class, drawable, width, height)
    ccall((:xcb_query_best_size, libxcb), xcb_query_best_size_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, UInt16, UInt16), c, _class, drawable, width, height)
end

"""
    xcb_query_best_size_unchecked(c, _class, drawable, width, height)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_query_best_size_unchecked(c, _class, drawable, width, height)
    ccall((:xcb_query_best_size_unchecked, libxcb), xcb_query_best_size_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_drawable_t, UInt16, UInt16), c, _class, drawable, width, height)
end

"""
    xcb_query_best_size_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_best_size_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_best_size_reply(c, cookie, e)
    ccall((:xcb_query_best_size_reply, libxcb), Ptr{xcb_query_best_size_reply_t}, (Ptr{xcb_connection_t}, xcb_query_best_size_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_query_extension_sizeof(_buffer)
    ccall((:xcb_query_extension_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_query_extension(c, name_len, name)

check if extension is present

Determines if the specified extension is present on this X11 server.

Every extension has a unique `major_opcode` to identify requests, the minor opcodes and request formats are extension-specific. If the extension provides events and errors, the `first_event` and `first_error` fields in the reply are set accordingly.

There should rarely be a need to use this request directly, XCB provides the [`xcb_get_extension_data`](@ref) function instead.

### Parameters
* `c`: The connection
* `name_len`: The length of *name* in bytes.
* `name`: The name of the extension to query, for example "RANDR". This is case sensitive!
### Returns
A cookie
"""
function xcb_query_extension(c, name_len, name)
    ccall((:xcb_query_extension, libxcb), xcb_query_extension_cookie_t, (Ptr{xcb_connection_t}, UInt16, Ptr{Cchar}), c, name_len, name)
end

"""
    xcb_query_extension_unchecked(c, name_len, name)

check if extension is present

Determines if the specified extension is present on this X11 server.

Every extension has a unique `major_opcode` to identify requests, the minor opcodes and request formats are extension-specific. If the extension provides events and errors, the `first_event` and `first_error` fields in the reply are set accordingly.

There should rarely be a need to use this request directly, XCB provides the [`xcb_get_extension_data`](@ref) function instead.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
* `name_len`: The length of *name* in bytes.
* `name`: The name of the extension to query, for example "RANDR". This is case sensitive!
### Returns
A cookie
"""
function xcb_query_extension_unchecked(c, name_len, name)
    ccall((:xcb_query_extension_unchecked, libxcb), xcb_query_extension_cookie_t, (Ptr{xcb_connection_t}, UInt16, Ptr{Cchar}), c, name_len, name)
end

"""
    xcb_query_extension_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_query_extension_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_query_extension_reply(c, cookie, e)
    ccall((:xcb_query_extension_reply, libxcb), Ptr{xcb_query_extension_reply_t}, (Ptr{xcb_connection_t}, xcb_query_extension_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_list_extensions_sizeof(_buffer)
    ccall((:xcb_list_extensions_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_extensions(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_extensions(c)
    ccall((:xcb_list_extensions, libxcb), xcb_list_extensions_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_list_extensions_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_extensions_unchecked(c)
    ccall((:xcb_list_extensions_unchecked, libxcb), xcb_list_extensions_cookie_t, (Ptr{xcb_connection_t},), c)
end

function xcb_list_extensions_names_length(R)
    ccall((:xcb_list_extensions_names_length, libxcb), Cint, (Ptr{xcb_list_extensions_reply_t},), R)
end

function xcb_list_extensions_names_iterator(R)
    ccall((:xcb_list_extensions_names_iterator, libxcb), xcb_str_iterator_t, (Ptr{xcb_list_extensions_reply_t},), R)
end

"""
    xcb_list_extensions_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_extensions_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_extensions_reply(c, cookie, e)
    ccall((:xcb_list_extensions_reply, libxcb), Ptr{xcb_list_extensions_reply_t}, (Ptr{xcb_connection_t}, xcb_list_extensions_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_change_keyboard_mapping_sizeof(_buffer)
    ccall((:xcb_change_keyboard_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_keyboard_mapping_checked(c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_mapping_checked(c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)
    ccall((:xcb_change_keyboard_mapping_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_keycode_t, UInt8, Ptr{xcb_keysym_t}), c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)
end

"""
    xcb_change_keyboard_mapping(c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_mapping(c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)
    ccall((:xcb_change_keyboard_mapping, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, xcb_keycode_t, UInt8, Ptr{xcb_keysym_t}), c, keycode_count, first_keycode, keysyms_per_keycode, keysyms)
end

function xcb_change_keyboard_mapping_keysyms(R)
    ccall((:xcb_change_keyboard_mapping_keysyms, libxcb), Ptr{xcb_keysym_t}, (Ptr{xcb_change_keyboard_mapping_request_t},), R)
end

function xcb_change_keyboard_mapping_keysyms_length(R)
    ccall((:xcb_change_keyboard_mapping_keysyms_length, libxcb), Cint, (Ptr{xcb_change_keyboard_mapping_request_t},), R)
end

function xcb_change_keyboard_mapping_keysyms_end(R)
    ccall((:xcb_change_keyboard_mapping_keysyms_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_change_keyboard_mapping_request_t},), R)
end

function xcb_get_keyboard_mapping_sizeof(_buffer)
    ccall((:xcb_get_keyboard_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_keyboard_mapping(c, first_keycode, count)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_keyboard_mapping(c, first_keycode, count)
    ccall((:xcb_get_keyboard_mapping, libxcb), xcb_get_keyboard_mapping_cookie_t, (Ptr{xcb_connection_t}, xcb_keycode_t, UInt8), c, first_keycode, count)
end

"""
    xcb_get_keyboard_mapping_unchecked(c, first_keycode, count)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_keyboard_mapping_unchecked(c, first_keycode, count)
    ccall((:xcb_get_keyboard_mapping_unchecked, libxcb), xcb_get_keyboard_mapping_cookie_t, (Ptr{xcb_connection_t}, xcb_keycode_t, UInt8), c, first_keycode, count)
end

function xcb_get_keyboard_mapping_keysyms(R)
    ccall((:xcb_get_keyboard_mapping_keysyms, libxcb), Ptr{xcb_keysym_t}, (Ptr{xcb_get_keyboard_mapping_reply_t},), R)
end

function xcb_get_keyboard_mapping_keysyms_length(R)
    ccall((:xcb_get_keyboard_mapping_keysyms_length, libxcb), Cint, (Ptr{xcb_get_keyboard_mapping_reply_t},), R)
end

function xcb_get_keyboard_mapping_keysyms_end(R)
    ccall((:xcb_get_keyboard_mapping_keysyms_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_keyboard_mapping_reply_t},), R)
end

"""
    xcb_get_keyboard_mapping_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_keyboard_mapping_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_keyboard_mapping_reply(c, cookie, e)
    ccall((:xcb_get_keyboard_mapping_reply, libxcb), Ptr{xcb_get_keyboard_mapping_reply_t}, (Ptr{xcb_connection_t}, xcb_get_keyboard_mapping_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_change_keyboard_control_value_list_serialize(_buffer, value_mask, _aux)
    ccall((:xcb_change_keyboard_control_value_list_serialize, libxcb), Cint, (Ptr{Ptr{Cvoid}}, UInt32, Ptr{xcb_change_keyboard_control_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_keyboard_control_value_list_unpack(_buffer, value_mask, _aux)
    ccall((:xcb_change_keyboard_control_value_list_unpack, libxcb), Cint, (Ptr{Cvoid}, UInt32, Ptr{xcb_change_keyboard_control_value_list_t}), _buffer, value_mask, _aux)
end

function xcb_change_keyboard_control_value_list_sizeof(_buffer, value_mask)
    ccall((:xcb_change_keyboard_control_value_list_sizeof, libxcb), Cint, (Ptr{Cvoid}, UInt32), _buffer, value_mask)
end

function xcb_change_keyboard_control_sizeof(_buffer)
    ccall((:xcb_change_keyboard_control_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_keyboard_control_checked(c, value_mask, value_list)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_control_checked(c, value_mask, value_list)
    ccall((:xcb_change_keyboard_control_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32, Ptr{Cvoid}), c, value_mask, value_list)
end

"""
    xcb_change_keyboard_control(c, value_mask, value_list)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_control(c, value_mask, value_list)
    ccall((:xcb_change_keyboard_control, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32, Ptr{Cvoid}), c, value_mask, value_list)
end

"""
    xcb_change_keyboard_control_aux_checked(c, value_mask, value_list)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_control_aux_checked(c, value_mask, value_list)
    ccall((:xcb_change_keyboard_control_aux_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32, Ptr{xcb_change_keyboard_control_value_list_t}), c, value_mask, value_list)
end

"""
    xcb_change_keyboard_control_aux(c, value_mask, value_list)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_keyboard_control_aux(c, value_mask, value_list)
    ccall((:xcb_change_keyboard_control_aux, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32, Ptr{xcb_change_keyboard_control_value_list_t}), c, value_mask, value_list)
end

function xcb_change_keyboard_control_value_list(R)
    ccall((:xcb_change_keyboard_control_value_list, libxcb), Ptr{Cvoid}, (Ptr{xcb_change_keyboard_control_request_t},), R)
end

"""
    xcb_get_keyboard_control(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_keyboard_control(c)
    ccall((:xcb_get_keyboard_control, libxcb), xcb_get_keyboard_control_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_keyboard_control_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_keyboard_control_unchecked(c)
    ccall((:xcb_get_keyboard_control_unchecked, libxcb), xcb_get_keyboard_control_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_keyboard_control_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_keyboard_control_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_keyboard_control_reply(c, cookie, e)
    ccall((:xcb_get_keyboard_control_reply, libxcb), Ptr{xcb_get_keyboard_control_reply_t}, (Ptr{xcb_connection_t}, xcb_get_keyboard_control_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_bell_checked(c, percent)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_bell_checked(c, percent)
    ccall((:xcb_bell_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int8), c, percent)
end

"""
    xcb_bell(c, percent)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_bell(c, percent)
    ccall((:xcb_bell, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int8), c, percent)
end

"""
    xcb_change_pointer_control_checked(c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_pointer_control_checked(c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
    ccall((:xcb_change_pointer_control_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int16, Int16, Int16, UInt8, UInt8), c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
end

"""
    xcb_change_pointer_control(c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_pointer_control(c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
    ccall((:xcb_change_pointer_control, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int16, Int16, Int16, UInt8, UInt8), c, acceleration_numerator, acceleration_denominator, threshold, do_acceleration, do_threshold)
end

"""
    xcb_get_pointer_control(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_pointer_control(c)
    ccall((:xcb_get_pointer_control, libxcb), xcb_get_pointer_control_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_pointer_control_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_pointer_control_unchecked(c)
    ccall((:xcb_get_pointer_control_unchecked, libxcb), xcb_get_pointer_control_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_pointer_control_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_pointer_control_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_pointer_control_reply(c, cookie, e)
    ccall((:xcb_get_pointer_control_reply, libxcb), Ptr{xcb_get_pointer_control_reply_t}, (Ptr{xcb_connection_t}, xcb_get_pointer_control_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_set_screen_saver_checked(c, timeout, interval, prefer_blanking, allow_exposures)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_screen_saver_checked(c, timeout, interval, prefer_blanking, allow_exposures)
    ccall((:xcb_set_screen_saver_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int16, Int16, UInt8, UInt8), c, timeout, interval, prefer_blanking, allow_exposures)
end

"""
    xcb_set_screen_saver(c, timeout, interval, prefer_blanking, allow_exposures)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_screen_saver(c, timeout, interval, prefer_blanking, allow_exposures)
    ccall((:xcb_set_screen_saver, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, Int16, Int16, UInt8, UInt8), c, timeout, interval, prefer_blanking, allow_exposures)
end

"""
    xcb_get_screen_saver(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_screen_saver(c)
    ccall((:xcb_get_screen_saver, libxcb), xcb_get_screen_saver_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_screen_saver_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_screen_saver_unchecked(c)
    ccall((:xcb_get_screen_saver_unchecked, libxcb), xcb_get_screen_saver_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_screen_saver_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_screen_saver_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_screen_saver_reply(c, cookie, e)
    ccall((:xcb_get_screen_saver_reply, libxcb), Ptr{xcb_get_screen_saver_reply_t}, (Ptr{xcb_connection_t}, xcb_get_screen_saver_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_change_hosts_sizeof(_buffer)
    ccall((:xcb_change_hosts_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_change_hosts_checked(c, mode, family, address_len, address)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_hosts_checked(c, mode, family, address_len, address)
    ccall((:xcb_change_hosts_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, UInt8, UInt16, Ptr{UInt8}), c, mode, family, address_len, address)
end

"""
    xcb_change_hosts(c, mode, family, address_len, address)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_change_hosts(c, mode, family, address_len, address)
    ccall((:xcb_change_hosts, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8, UInt8, UInt16, Ptr{UInt8}), c, mode, family, address_len, address)
end

function xcb_change_hosts_address(R)
    ccall((:xcb_change_hosts_address, libxcb), Ptr{UInt8}, (Ptr{xcb_change_hosts_request_t},), R)
end

function xcb_change_hosts_address_length(R)
    ccall((:xcb_change_hosts_address_length, libxcb), Cint, (Ptr{xcb_change_hosts_request_t},), R)
end

function xcb_change_hosts_address_end(R)
    ccall((:xcb_change_hosts_address_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_change_hosts_request_t},), R)
end

function xcb_host_sizeof(_buffer)
    ccall((:xcb_host_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_host_address(R)
    ccall((:xcb_host_address, libxcb), Ptr{UInt8}, (Ptr{xcb_host_t},), R)
end

function xcb_host_address_length(R)
    ccall((:xcb_host_address_length, libxcb), Cint, (Ptr{xcb_host_t},), R)
end

function xcb_host_address_end(R)
    ccall((:xcb_host_address_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_host_t},), R)
end

"""
    xcb_host_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_host_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_host_iterator_t`](@ref)
"""
function xcb_host_next(i)
    ccall((:xcb_host_next, libxcb), Cvoid, (Ptr{xcb_host_iterator_t},), i)
end

"""
    xcb_host_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_host_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_host_end(i)
    ccall((:xcb_host_end, libxcb), xcb_generic_iterator_t, (xcb_host_iterator_t,), i)
end

function xcb_list_hosts_sizeof(_buffer)
    ccall((:xcb_list_hosts_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_list_hosts(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_hosts(c)
    ccall((:xcb_list_hosts, libxcb), xcb_list_hosts_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_list_hosts_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_list_hosts_unchecked(c)
    ccall((:xcb_list_hosts_unchecked, libxcb), xcb_list_hosts_cookie_t, (Ptr{xcb_connection_t},), c)
end

function xcb_list_hosts_hosts_length(R)
    ccall((:xcb_list_hosts_hosts_length, libxcb), Cint, (Ptr{xcb_list_hosts_reply_t},), R)
end

function xcb_list_hosts_hosts_iterator(R)
    ccall((:xcb_list_hosts_hosts_iterator, libxcb), xcb_host_iterator_t, (Ptr{xcb_list_hosts_reply_t},), R)
end

"""
    xcb_list_hosts_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_list_hosts_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_list_hosts_reply(c, cookie, e)
    ccall((:xcb_list_hosts_reply, libxcb), Ptr{xcb_list_hosts_reply_t}, (Ptr{xcb_connection_t}, xcb_list_hosts_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_set_access_control_checked(c, mode)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_access_control_checked(c, mode)
    ccall((:xcb_set_access_control_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

"""
    xcb_set_access_control(c, mode)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_access_control(c, mode)
    ccall((:xcb_set_access_control, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

"""
    xcb_set_close_down_mode_checked(c, mode)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_close_down_mode_checked(c, mode)
    ccall((:xcb_set_close_down_mode_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

"""
    xcb_set_close_down_mode(c, mode)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_close_down_mode(c, mode)
    ccall((:xcb_set_close_down_mode, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

"""
    xcb_kill_client_checked(c, resource)

kills a client

Forces a close down of the client that created the specified *resource*.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
* `resource`: Any resource belonging to the client (for example a Window), used to identify the client connection.  The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients that have terminated in `RetainTemporary` (TODO) are destroyed.
### Returns
A cookie
"""
function xcb_kill_client_checked(c, resource)
    ccall((:xcb_kill_client_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32), c, resource)
end

"""
    xcb_kill_client(c, resource)

kills a client

Forces a close down of the client that created the specified *resource*.

### Parameters
* `c`: The connection
* `resource`: Any resource belonging to the client (for example a Window), used to identify the client connection.  The special value of `XCB_KILL_ALL_TEMPORARY`, the resources of all clients that have terminated in `RetainTemporary` (TODO) are destroyed.
### Returns
A cookie
"""
function xcb_kill_client(c, resource)
    ccall((:xcb_kill_client, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt32), c, resource)
end

function xcb_rotate_properties_sizeof(_buffer)
    ccall((:xcb_rotate_properties_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_rotate_properties_checked(c, window, atoms_len, delta, atoms)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_rotate_properties_checked(c, window, atoms_len, delta, atoms)
    ccall((:xcb_rotate_properties_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Int16, Ptr{xcb_atom_t}), c, window, atoms_len, delta, atoms)
end

"""
    xcb_rotate_properties(c, window, atoms_len, delta, atoms)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_rotate_properties(c, window, atoms_len, delta, atoms)
    ccall((:xcb_rotate_properties, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_window_t, UInt16, Int16, Ptr{xcb_atom_t}), c, window, atoms_len, delta, atoms)
end

function xcb_rotate_properties_atoms(R)
    ccall((:xcb_rotate_properties_atoms, libxcb), Ptr{xcb_atom_t}, (Ptr{xcb_rotate_properties_request_t},), R)
end

function xcb_rotate_properties_atoms_length(R)
    ccall((:xcb_rotate_properties_atoms_length, libxcb), Cint, (Ptr{xcb_rotate_properties_request_t},), R)
end

function xcb_rotate_properties_atoms_end(R)
    ccall((:xcb_rotate_properties_atoms_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_rotate_properties_request_t},), R)
end

"""
    xcb_force_screen_saver_checked(c, mode)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_force_screen_saver_checked(c, mode)
    ccall((:xcb_force_screen_saver_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

"""
    xcb_force_screen_saver(c, mode)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_force_screen_saver(c, mode)
    ccall((:xcb_force_screen_saver, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, UInt8), c, mode)
end

function xcb_set_pointer_mapping_sizeof(_buffer)
    ccall((:xcb_set_pointer_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_set_pointer_mapping(c, map_len, map)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_pointer_mapping(c, map_len, map)
    ccall((:xcb_set_pointer_mapping, libxcb), xcb_set_pointer_mapping_cookie_t, (Ptr{xcb_connection_t}, UInt8, Ptr{UInt8}), c, map_len, map)
end

"""
    xcb_set_pointer_mapping_unchecked(c, map_len, map)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_pointer_mapping_unchecked(c, map_len, map)
    ccall((:xcb_set_pointer_mapping_unchecked, libxcb), xcb_set_pointer_mapping_cookie_t, (Ptr{xcb_connection_t}, UInt8, Ptr{UInt8}), c, map_len, map)
end

"""
    xcb_set_pointer_mapping_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_set_pointer_mapping_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_set_pointer_mapping_reply(c, cookie, e)
    ccall((:xcb_set_pointer_mapping_reply, libxcb), Ptr{xcb_set_pointer_mapping_reply_t}, (Ptr{xcb_connection_t}, xcb_set_pointer_mapping_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_get_pointer_mapping_sizeof(_buffer)
    ccall((:xcb_get_pointer_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_pointer_mapping(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_pointer_mapping(c)
    ccall((:xcb_get_pointer_mapping, libxcb), xcb_get_pointer_mapping_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_pointer_mapping_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_pointer_mapping_unchecked(c)
    ccall((:xcb_get_pointer_mapping_unchecked, libxcb), xcb_get_pointer_mapping_cookie_t, (Ptr{xcb_connection_t},), c)
end

function xcb_get_pointer_mapping_map(R)
    ccall((:xcb_get_pointer_mapping_map, libxcb), Ptr{UInt8}, (Ptr{xcb_get_pointer_mapping_reply_t},), R)
end

function xcb_get_pointer_mapping_map_length(R)
    ccall((:xcb_get_pointer_mapping_map_length, libxcb), Cint, (Ptr{xcb_get_pointer_mapping_reply_t},), R)
end

function xcb_get_pointer_mapping_map_end(R)
    ccall((:xcb_get_pointer_mapping_map_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_pointer_mapping_reply_t},), R)
end

"""
    xcb_get_pointer_mapping_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_pointer_mapping_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_pointer_mapping_reply(c, cookie, e)
    ccall((:xcb_get_pointer_mapping_reply, libxcb), Ptr{xcb_get_pointer_mapping_reply_t}, (Ptr{xcb_connection_t}, xcb_get_pointer_mapping_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_set_modifier_mapping_sizeof(_buffer)
    ccall((:xcb_set_modifier_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_set_modifier_mapping(c, keycodes_per_modifier, keycodes)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_modifier_mapping(c, keycodes_per_modifier, keycodes)
    ccall((:xcb_set_modifier_mapping, libxcb), xcb_set_modifier_mapping_cookie_t, (Ptr{xcb_connection_t}, UInt8, Ptr{xcb_keycode_t}), c, keycodes_per_modifier, keycodes)
end

"""
    xcb_set_modifier_mapping_unchecked(c, keycodes_per_modifier, keycodes)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_set_modifier_mapping_unchecked(c, keycodes_per_modifier, keycodes)
    ccall((:xcb_set_modifier_mapping_unchecked, libxcb), xcb_set_modifier_mapping_cookie_t, (Ptr{xcb_connection_t}, UInt8, Ptr{xcb_keycode_t}), c, keycodes_per_modifier, keycodes)
end

"""
    xcb_set_modifier_mapping_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_set_modifier_mapping_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_set_modifier_mapping_reply(c, cookie, e)
    ccall((:xcb_set_modifier_mapping_reply, libxcb), Ptr{xcb_set_modifier_mapping_reply_t}, (Ptr{xcb_connection_t}, xcb_set_modifier_mapping_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_get_modifier_mapping_sizeof(_buffer)
    ccall((:xcb_get_modifier_mapping_sizeof, libxcb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_get_modifier_mapping(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_modifier_mapping(c)
    ccall((:xcb_get_modifier_mapping, libxcb), xcb_get_modifier_mapping_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_modifier_mapping_unchecked(c)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_get_modifier_mapping_unchecked(c)
    ccall((:xcb_get_modifier_mapping_unchecked, libxcb), xcb_get_modifier_mapping_cookie_t, (Ptr{xcb_connection_t},), c)
end

function xcb_get_modifier_mapping_keycodes(R)
    ccall((:xcb_get_modifier_mapping_keycodes, libxcb), Ptr{xcb_keycode_t}, (Ptr{xcb_get_modifier_mapping_reply_t},), R)
end

function xcb_get_modifier_mapping_keycodes_length(R)
    ccall((:xcb_get_modifier_mapping_keycodes_length, libxcb), Cint, (Ptr{xcb_get_modifier_mapping_reply_t},), R)
end

function xcb_get_modifier_mapping_keycodes_end(R)
    ccall((:xcb_get_modifier_mapping_keycodes_end, libxcb), xcb_generic_iterator_t, (Ptr{xcb_get_modifier_mapping_reply_t},), R)
end

"""
    xcb_get_modifier_mapping_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_get_modifier_mapping_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_get_modifier_mapping_reply(c, cookie, e)
    ccall((:xcb_get_modifier_mapping_reply, libxcb), Ptr{xcb_get_modifier_mapping_reply_t}, (Ptr{xcb_connection_t}, xcb_get_modifier_mapping_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_no_operation_checked(c)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_no_operation_checked(c)
    ccall((:xcb_no_operation_checked, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_no_operation(c)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_no_operation(c)
    ccall((:xcb_no_operation, libxcb), xcb_void_cookie_t, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_auth_info_t

Container for authorization information.

A container for authorization information to be sent to the X server.

| Field   | Note                                                                                                        |
| :------ | :---------------------------------------------------------------------------------------------------------- |
| namelen | Length of the string name (as returned by strlen).                                                          |
| name    | String containing the authentication protocol name, such as "MIT-MAGIC-COOKIE-1" or "XDM-AUTHORIZATION-1".  |
| datalen | Length of the data member.                                                                                  |
| data    | Data interpreted in a protocol-specific manner.                                                             |
"""
struct xcb_auth_info_t
    namelen::Cint
    name::Ptr{Cchar}
    datalen::Cint
    data::Ptr{Cchar}
end

"""
    xcb_flush(c)

Forces any buffered output to be written to the server.

Forces any buffered output to be written to the server. Blocks until the write is complete.

### Parameters
* `c`: The connection to the X server.
### Returns
> `0` on success, <= `0` otherwise.
"""
function xcb_flush(c)
    ccall((:xcb_flush, libxcb), Cint, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_maximum_request_length(c)

Returns the maximum request length that this server accepts.

In the absence of the BIG-REQUESTS extension, returns the maximum request length field from the connection setup data, which may be as much as 65535. If the server supports BIG-REQUESTS, then the maximum request length field from the reply to the BigRequestsEnable request will be returned instead.

Note that this length is measured in four-byte units, making the theoretical maximum lengths roughly 256kB without BIG-REQUESTS and 16GB with.

### Parameters
* `c`: The connection to the X server.
### Returns
The maximum request length field.
"""
function xcb_get_maximum_request_length(c)
    ccall((:xcb_get_maximum_request_length, libxcb), UInt32, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_prefetch_maximum_request_length(c)

Prefetch the maximum request length without blocking.

Without blocking, does as much work as possible toward computing the maximum request length accepted by the X server.

Invoking this function may cause a call to xcb\\_big\\_requests\\_enable, but will not block waiting for the reply. [`xcb_get_maximum_request_length`](@ref) will return the prefetched data after possibly blocking while the reply is retrieved.

Note that in order for this function to be fully non-blocking, the application must previously have called [`xcb_prefetch_extension_data`](@ref)(c, &xcb\\_big\\_requests\\_id) and the reply must have already arrived.

### Parameters
* `c`: The connection to the X server.
"""
function xcb_prefetch_maximum_request_length(c)
    ccall((:xcb_prefetch_maximum_request_length, libxcb), Cvoid, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_wait_for_event(c)

Returns the next event or error from the server.

Returns the next event or error from the server, or returns null in the event of an I/O error. Blocks until either an event or error arrive, or an I/O error occurs.

### Parameters
* `c`: The connection to the X server.
### Returns
The next event from the server.
"""
function xcb_wait_for_event(c)
    ccall((:xcb_wait_for_event, libxcb), Ptr{xcb_generic_event_t}, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_poll_for_event(c)

Returns the next event or error from the server.

Returns the next event or error from the server, if one is available, or returns `NULL` otherwise. If no event is available, that might be because an I/O error like connection close occurred while attempting to read the next event, in which case the connection is shut down when this function returns.

### Parameters
* `c`: The connection to the X server.
### Returns
The next event from the server.
"""
function xcb_poll_for_event(c)
    ccall((:xcb_poll_for_event, libxcb), Ptr{xcb_generic_event_t}, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_poll_for_queued_event(c)

Returns the next event without reading from the connection.

This is a version of [`xcb_poll_for_event`](@ref) that only examines the event queue for new events. The function doesn't try to read new events from the connection if no queued events are found.

This function is useful for callers that know in advance that all interesting events have already been read from the connection. For example, callers might use xcb\\_wait\\_for\\_reply and be interested only of events that preceded a specific reply.

### Parameters
* `c`: The connection to the X server.
### Returns
The next already queued event from the server.
"""
function xcb_poll_for_queued_event(c)
    ccall((:xcb_poll_for_queued_event, libxcb), Ptr{xcb_generic_event_t}, (Ptr{xcb_connection_t},), c)
end

const xcb_special_event = Cvoid

const xcb_special_event_t = xcb_special_event

"""
    xcb_poll_for_special_event(c, se)

Returns the next event from a special queue
"""
function xcb_poll_for_special_event(c, se)
    ccall((:xcb_poll_for_special_event, libxcb), Ptr{xcb_generic_event_t}, (Ptr{xcb_connection_t}, Ptr{xcb_special_event_t}), c, se)
end

"""
    xcb_wait_for_special_event(c, se)

Returns the next event from a special queue, blocking until one arrives
"""
function xcb_wait_for_special_event(c, se)
    ccall((:xcb_wait_for_special_event, libxcb), Ptr{xcb_generic_event_t}, (Ptr{xcb_connection_t}, Ptr{xcb_special_event_t}), c, se)
end

const xcb_extension_t = Cvoid

"""
    xcb_register_for_special_xge(c, ext, eid, stamp)

Listen for a special event
"""
function xcb_register_for_special_xge(c, ext, eid, stamp)
    ccall((:xcb_register_for_special_xge, libxcb), Ptr{xcb_special_event_t}, (Ptr{xcb_connection_t}, Ptr{xcb_extension_t}, UInt32, Ptr{UInt32}), c, ext, eid, stamp)
end

"""
    xcb_unregister_for_special_event(c, se)

Stop listening for a special event
"""
function xcb_unregister_for_special_event(c, se)
    ccall((:xcb_unregister_for_special_event, libxcb), Cvoid, (Ptr{xcb_connection_t}, Ptr{xcb_special_event_t}), c, se)
end

"""
    xcb_request_check(c, cookie)

Return the error for a request, or NULL if none can ever arrive.

The [`xcb_void_cookie_t`](@ref) cookie supplied to this function must have resulted from a call to xcb\\_[request\\_name]\\_checked(). This function will block until one of two conditions happens. If an error is received, it will be returned. If a reply to a subsequent request has already arrived, no error can arrive for this request, so this function will return NULL.

Note that this function will perform a sync if needed to ensure that the sequence number will advance beyond that provided in cookie; this is a convenience to avoid races in determining whether the sync is needed.

### Parameters
* `c`: The connection to the X server.
* `cookie`: The request cookie.
### Returns
The error for the request, or NULL if none can ever arrive.
"""
function xcb_request_check(c, cookie)
    ccall((:xcb_request_check, libxcb), Ptr{xcb_generic_error_t}, (Ptr{xcb_connection_t}, xcb_void_cookie_t), c, cookie)
end

"""
    xcb_discard_reply(c, sequence)

Discards the reply for a request.

Discards the reply for a request. Additionally, any error generated by the request is also discarded (unless it was an \\_unchecked request and the error has already arrived).

This function will not block even if the reply is not yet available.

Note that the sequence really does have to come from an xcb cookie; this function is not designed to operate on socket-handoff replies.

### Parameters
* `c`: The connection to the X server.
* `sequence`: The request sequence number from a cookie.
"""
function xcb_discard_reply(c, sequence)
    ccall((:xcb_discard_reply, libxcb), Cvoid, (Ptr{xcb_connection_t}, Cuint), c, sequence)
end

"""
    xcb_discard_reply64(c, sequence)

Discards the reply for a request, given by a 64bit sequence number

Discards the reply for a request. Additionally, any error generated by the request is also discarded (unless it was an \\_unchecked request and the error has already arrived).

This function will not block even if the reply is not yet available.

Note that the sequence really does have to come from xcb\\_send\\_request64(); the cookie sequence number is defined as "unsigned" int and therefore not 64-bit on all platforms. This function is not designed to operate on socket-handoff replies.

Unlike its [`xcb_discard_reply`](@ref)() counterpart, the given sequence number is not automatically "widened" to 64-bit.

### Parameters
* `c`: The connection to the X server.
* `sequence`: 64-bit sequence number as returned by xcb\\_send\\_request64().
"""
function xcb_discard_reply64(c, sequence)
    ccall((:xcb_discard_reply64, libxcb), Cvoid, (Ptr{xcb_connection_t}, UInt64), c, sequence)
end

"""
    xcb_get_extension_data(c, ext)

Caches reply information from QueryExtension requests.

This function is the primary interface to the "extension cache", which caches reply information from QueryExtension requests. Invoking this function may cause a call to [`xcb_query_extension`](@ref) to retrieve extension information from the server, and may block until extension data is received from the server.

The result must not be freed. This storage is managed by the cache itself.

### Parameters
* `c`: The connection.
* `ext`: The extension data.
### Returns
A pointer to the [`xcb_query_extension_reply_t`](@ref) for the extension.
"""
function xcb_get_extension_data(c, ext)
    ccall((:xcb_get_extension_data, libxcb), Ptr{xcb_query_extension_reply_t}, (Ptr{xcb_connection_t}, Ptr{xcb_extension_t}), c, ext)
end

"""
    xcb_prefetch_extension_data(c, ext)

Prefetch of extension data into the extension cache

This function allows a "prefetch" of extension data into the extension cache. Invoking the function may cause a call to [`xcb_query_extension`](@ref), but will not block waiting for the reply. [`xcb_get_extension_data`](@ref) will return the prefetched data after possibly blocking while it is retrieved.

### Parameters
* `c`: The connection.
* `ext`: The extension data.
"""
function xcb_prefetch_extension_data(c, ext)
    ccall((:xcb_prefetch_extension_data, libxcb), Cvoid, (Ptr{xcb_connection_t}, Ptr{xcb_extension_t}), c, ext)
end

"""
    xcb_get_setup(c)

Access the data returned by the server.

Accessor for the data returned by the server when the [`xcb_connection_t`](@ref) was initialized. This data includes - the server's required format for images, - a list of available visuals, - a list of available screens, - the server's maximum request length (in the absence of the BIG-REQUESTS extension), - and other assorted information.

See the X protocol specification for more details.

The result must not be freed.

### Parameters
* `c`: The connection.
### Returns
A pointer to an [`xcb_setup_t`](@ref) structure.
"""
function xcb_get_setup(c)
    ccall((:xcb_get_setup, libxcb), Ptr{xcb_setup_t}, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_get_file_descriptor(c)

Access the file descriptor of the connection.

Accessor for the file descriptor that was passed to the [`xcb_connect_to_fd`](@ref) call that returned `c`.

### Parameters
* `c`: The connection.
### Returns
The file descriptor.
"""
function xcb_get_file_descriptor(c)
    ccall((:xcb_get_file_descriptor, libxcb), Cint, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_connection_has_error(c)

Test whether the connection has shut down due to a fatal error.

Some errors that occur in the context of an [`xcb_connection_t`](@ref) are unrecoverable. When such an error occurs, the connection is shut down and further operations on the [`xcb_connection_t`](@ref) have no effect, but memory will not be freed until [`xcb_disconnect`](@ref)() is called on the [`xcb_connection_t`](@ref).

### Parameters
* `c`: The connection.
### Returns
[`XCB_CONN_CLOSED_INVALID_SCREEN`](@ref), because the server does not have a screen matching the display.
"""
function xcb_connection_has_error(c)
    ccall((:xcb_connection_has_error, libxcb), Cint, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_connect_to_fd(fd, auth_info)

Connects to the X server.

Connects to an X server, given the open socket `fd` and the [`xcb_auth_info_t`](@ref) `auth_info`. The file descriptor `fd` is bidirectionally connected to an X server. If the connection should be unauthenticated, `auth_info` must be `NULL`.

Always returns a non-NULL pointer to a [`xcb_connection_t`](@ref), even on failure. Callers need to use [`xcb_connection_has_error`](@ref)() to check for failure. When finished, use [`xcb_disconnect`](@ref)() to close the connection and free the structure.

### Parameters
* `fd`: The file descriptor.
* `auth_info`: Authentication data.
### Returns
A newly allocated [`xcb_connection_t`](@ref) structure.
"""
function xcb_connect_to_fd(fd, auth_info)
    ccall((:xcb_connect_to_fd, libxcb), Ptr{xcb_connection_t}, (Cint, Ptr{xcb_auth_info_t}), fd, auth_info)
end

"""
    xcb_disconnect(c)

Closes the connection.

Closes the file descriptor and frees all memory associated with the connection `c`. If `c` is `NULL`, nothing is done.

### Parameters
* `c`: The connection.
"""
function xcb_disconnect(c)
    ccall((:xcb_disconnect, libxcb), Cvoid, (Ptr{xcb_connection_t},), c)
end

"""
    xcb_parse_display(name, host, display, screen)

Parses a display string name in the form documented by X(7x).

Parses the display string name `display_name` in the form documented by X(7x). Has no side effects on failure. If `displayname` is `NULL` or empty, it uses the environment variable DISPLAY. `hostp` is a pointer to a newly allocated string that contain the host name. `displayp` is set to the display number and `screenp` to the preferred screen number. `screenp` can be `NULL`. If `displayname` does not contain a screen number, it is set to `0`.

### Parameters
* `name`: The name of the display.
* `host`: A pointer to a malloc'd copy of the hostname.
* `display`: A pointer to the display number.
* `screen`: A pointer to the screen number.
### Returns
0 on failure, non 0 otherwise.
"""
function xcb_parse_display(name, host, display, screen)
    ccall((:xcb_parse_display, libxcb), Cint, (Ptr{Cchar}, Ptr{Ptr{Cchar}}, Ptr{Cint}, Ptr{Cint}), name, host, display, screen)
end

"""
    xcb_connect(displayname, screenp)

Connects to the X server.

Connects to the X server specified by `displayname`. If `displayname` is `NULL`, uses the value of the DISPLAY environment variable. If a particular screen on that server is preferred, the int pointed to by `screenp` (if not `NULL`) will be set to that screen; otherwise the screen will be set to 0.

Always returns a non-NULL pointer to a [`xcb_connection_t`](@ref), even on failure. Callers need to use [`xcb_connection_has_error`](@ref)() to check for failure. When finished, use [`xcb_disconnect`](@ref)() to close the connection and free the structure.

### Parameters
* `displayname`: The name of the display.
* `screenp`: A pointer to a preferred screen number.
### Returns
A newly allocated [`xcb_connection_t`](@ref) structure.
"""
function xcb_connect(displayname, screenp)
    ccall((:xcb_connect, libxcb), Ptr{xcb_connection_t}, (Ptr{Cchar}, Ptr{Cint}), displayname, screenp)
end

"""
    xcb_connect_to_display_with_auth_info(display, auth, screen)

Connects to the X server, using an authorization information.

Connects to the X server specified by `displayname`, using the authorization `auth`. If a particular screen on that server is preferred, the int pointed to by `screenp` (if not `NULL`) will be set to that screen; otherwise `screenp` will be set to 0.

Always returns a non-NULL pointer to a [`xcb_connection_t`](@ref), even on failure. Callers need to use [`xcb_connection_has_error`](@ref)() to check for failure. When finished, use [`xcb_disconnect`](@ref)() to close the connection and free the structure.

### Parameters
* `display`: The name of the display.
* `auth`: The authorization information.
* `screen`: A pointer to a preferred screen number.
### Returns
A newly allocated [`xcb_connection_t`](@ref) structure.
"""
function xcb_connect_to_display_with_auth_info(display, auth, screen)
    ccall((:xcb_connect_to_display_with_auth_info, libxcb), Ptr{xcb_connection_t}, (Ptr{Cchar}, Ptr{xcb_auth_info_t}, Ptr{Cint}), display, auth, screen)
end

"""
    xcb_generate_id(c)

Allocates an XID for a new object.

Allocates an XID for a new object. Typically used just prior to various object creation functions, such as [`xcb_create_window`](@ref).

### Parameters
* `c`: The connection.
### Returns
A newly allocated XID.
"""
function xcb_generate_id(c)
    ccall((:xcb_generate_id, libxcb), UInt32, (Ptr{xcb_connection_t},), c)
end

@enum xcb_xkb_const_t::UInt32 begin
    XCB_XKB_CONST_MAX_LEGAL_KEY_CODE = 255
    XCB_XKB_CONST_PER_KEY_BIT_ARRAY_SIZE = 32
    XCB_XKB_CONST_KEY_NAME_LENGTH = 4
end

@bitmask xcb_xkb_event_type_t::UInt32 begin
    XCB_XKB_EVENT_TYPE_NEW_KEYBOARD_NOTIFY = 1
    XCB_XKB_EVENT_TYPE_MAP_NOTIFY = 2
    XCB_XKB_EVENT_TYPE_STATE_NOTIFY = 4
    XCB_XKB_EVENT_TYPE_CONTROLS_NOTIFY = 8
    XCB_XKB_EVENT_TYPE_INDICATOR_STATE_NOTIFY = 16
    XCB_XKB_EVENT_TYPE_INDICATOR_MAP_NOTIFY = 32
    XCB_XKB_EVENT_TYPE_NAMES_NOTIFY = 64
    XCB_XKB_EVENT_TYPE_COMPAT_MAP_NOTIFY = 128
    XCB_XKB_EVENT_TYPE_BELL_NOTIFY = 256
    XCB_XKB_EVENT_TYPE_ACTION_MESSAGE = 512
    XCB_XKB_EVENT_TYPE_ACCESS_X_NOTIFY = 1024
    XCB_XKB_EVENT_TYPE_EXTENSION_DEVICE_NOTIFY = 2048
end

@bitmask xcb_xkb_nkn_detail_t::UInt32 begin
    XCB_XKB_NKN_DETAIL_KEYCODES = 1
    XCB_XKB_NKN_DETAIL_GEOMETRY = 2
    XCB_XKB_NKN_DETAIL_DEVICE_ID = 4
end

@bitmask xcb_xkb_axn_detail_t::UInt32 begin
    XCB_XKB_AXN_DETAIL_SK_PRESS = 1
    XCB_XKB_AXN_DETAIL_SK_ACCEPT = 2
    XCB_XKB_AXN_DETAIL_SK_REJECT = 4
    XCB_XKB_AXN_DETAIL_SK_RELEASE = 8
    XCB_XKB_AXN_DETAIL_BK_ACCEPT = 16
    XCB_XKB_AXN_DETAIL_BK_REJECT = 32
    XCB_XKB_AXN_DETAIL_AXK_WARNING = 64
end

@bitmask xcb_xkb_map_part_t::UInt32 begin
    XCB_XKB_MAP_PART_KEY_TYPES = 1
    XCB_XKB_MAP_PART_KEY_SYMS = 2
    XCB_XKB_MAP_PART_MODIFIER_MAP = 4
    XCB_XKB_MAP_PART_EXPLICIT_COMPONENTS = 8
    XCB_XKB_MAP_PART_KEY_ACTIONS = 16
    XCB_XKB_MAP_PART_KEY_BEHAVIORS = 32
    XCB_XKB_MAP_PART_VIRTUAL_MODS = 64
    XCB_XKB_MAP_PART_VIRTUAL_MOD_MAP = 128
end

@bitmask xcb_xkb_set_map_flags_t::UInt32 begin
    XCB_XKB_SET_MAP_FLAGS_RESIZE_TYPES = 1
    XCB_XKB_SET_MAP_FLAGS_RECOMPUTE_ACTIONS = 2
end

@bitmask xcb_xkb_state_part_t::UInt32 begin
    XCB_XKB_STATE_PART_MODIFIER_STATE = 1
    XCB_XKB_STATE_PART_MODIFIER_BASE = 2
    XCB_XKB_STATE_PART_MODIFIER_LATCH = 4
    XCB_XKB_STATE_PART_MODIFIER_LOCK = 8
    XCB_XKB_STATE_PART_GROUP_STATE = 16
    XCB_XKB_STATE_PART_GROUP_BASE = 32
    XCB_XKB_STATE_PART_GROUP_LATCH = 64
    XCB_XKB_STATE_PART_GROUP_LOCK = 128
    XCB_XKB_STATE_PART_COMPAT_STATE = 256
    XCB_XKB_STATE_PART_GRAB_MODS = 512
    XCB_XKB_STATE_PART_COMPAT_GRAB_MODS = 1024
    XCB_XKB_STATE_PART_LOOKUP_MODS = 2048
    XCB_XKB_STATE_PART_COMPAT_LOOKUP_MODS = 4096
    XCB_XKB_STATE_PART_POINTER_BUTTONS = 8192
end

@bitmask xcb_xkb_bool_ctrl_t::UInt32 begin
    XCB_XKB_BOOL_CTRL_REPEAT_KEYS = 1
    XCB_XKB_BOOL_CTRL_SLOW_KEYS = 2
    XCB_XKB_BOOL_CTRL_BOUNCE_KEYS = 4
    XCB_XKB_BOOL_CTRL_STICKY_KEYS = 8
    XCB_XKB_BOOL_CTRL_MOUSE_KEYS = 16
    XCB_XKB_BOOL_CTRL_MOUSE_KEYS_ACCEL = 32
    XCB_XKB_BOOL_CTRL_ACCESS_X_KEYS = 64
    XCB_XKB_BOOL_CTRL_ACCESS_X_TIMEOUT_MASK = 128
    XCB_XKB_BOOL_CTRL_ACCESS_X_FEEDBACK_MASK = 256
    XCB_XKB_BOOL_CTRL_AUDIBLE_BELL_MASK = 512
    XCB_XKB_BOOL_CTRL_OVERLAY_1_MASK = 1024
    XCB_XKB_BOOL_CTRL_OVERLAY_2_MASK = 2048
    XCB_XKB_BOOL_CTRL_IGNORE_GROUP_LOCK_MASK = 4096
end

@bitmask xcb_xkb_control_t::UInt32 begin
    XCB_XKB_CONTROL_GROUPS_WRAP = 134217728
    XCB_XKB_CONTROL_INTERNAL_MODS = 268435456
    XCB_XKB_CONTROL_IGNORE_LOCK_MODS = 536870912
    XCB_XKB_CONTROL_PER_KEY_REPEAT = 1073741824
    XCB_XKB_CONTROL_CONTROLS_ENABLED = 0x0000000080000000
end

@bitmask xcb_xkb_ax_option_t::UInt32 begin
    XCB_XKB_AX_OPTION_SK_PRESS_FB = 1
    XCB_XKB_AX_OPTION_SK_ACCEPT_FB = 2
    XCB_XKB_AX_OPTION_FEATURE_FB = 4
    XCB_XKB_AX_OPTION_SLOW_WARN_FB = 8
    XCB_XKB_AX_OPTION_INDICATOR_FB = 16
    XCB_XKB_AX_OPTION_STICKY_KEYS_FB = 32
    XCB_XKB_AX_OPTION_TWO_KEYS = 64
    XCB_XKB_AX_OPTION_LATCH_TO_LOCK = 128
    XCB_XKB_AX_OPTION_SK_RELEASE_FB = 256
    XCB_XKB_AX_OPTION_SK_REJECT_FB = 512
    XCB_XKB_AX_OPTION_BK_REJECT_FB = 1024
    XCB_XKB_AX_OPTION_DUMB_BELL = 2048
end

const xcb_xkb_device_spec_t = UInt16

"""
    xcb_xkb_device_spec_iterator_t

[`xcb_xkb_device_spec_iterator_t`](@ref)
"""
struct xcb_xkb_device_spec_iterator_t
    data::Ptr{xcb_xkb_device_spec_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_led_class_result_t::UInt32 begin
    XCB_XKB_LED_CLASS_RESULT_KBD_FEEDBACK_CLASS = 0
    XCB_XKB_LED_CLASS_RESULT_LED_FEEDBACK_CLASS = 4
end

@enum xcb_xkb_led_class_t::UInt32 begin
    XCB_XKB_LED_CLASS_KBD_FEEDBACK_CLASS = 0
    XCB_XKB_LED_CLASS_LED_FEEDBACK_CLASS = 4
    XCB_XKB_LED_CLASS_DFLT_XI_CLASS = 768
    XCB_XKB_LED_CLASS_ALL_XI_CLASSES = 1280
end

const xcb_xkb_led_class_spec_t = UInt16

"""
    xcb_xkb_led_class_spec_iterator_t

[`xcb_xkb_led_class_spec_iterator_t`](@ref)
"""
struct xcb_xkb_led_class_spec_iterator_t
    data::Ptr{xcb_xkb_led_class_spec_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_bell_class_result_t::UInt32 begin
    XCB_XKB_BELL_CLASS_RESULT_KBD_FEEDBACK_CLASS = 0
    XCB_XKB_BELL_CLASS_RESULT_BELL_FEEDBACK_CLASS = 5
end

@enum xcb_xkb_bell_class_t::UInt32 begin
    XCB_XKB_BELL_CLASS_KBD_FEEDBACK_CLASS = 0
    XCB_XKB_BELL_CLASS_BELL_FEEDBACK_CLASS = 5
    XCB_XKB_BELL_CLASS_DFLT_XI_CLASS = 768
end

const xcb_xkb_bell_class_spec_t = UInt16

"""
    xcb_xkb_bell_class_spec_iterator_t

[`xcb_xkb_bell_class_spec_iterator_t`](@ref)
"""
struct xcb_xkb_bell_class_spec_iterator_t
    data::Ptr{xcb_xkb_bell_class_spec_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_id_t::UInt32 begin
    XCB_XKB_ID_USE_CORE_KBD = 256
    XCB_XKB_ID_USE_CORE_PTR = 512
    XCB_XKB_ID_DFLT_XI_CLASS = 768
    XCB_XKB_ID_DFLT_XI_ID = 1024
    XCB_XKB_ID_ALL_XI_CLASS = 1280
    XCB_XKB_ID_ALL_XI_ID = 1536
    XCB_XKB_ID_XI_NONE = 65280
end

const xcb_xkb_id_spec_t = UInt16

"""
    xcb_xkb_id_spec_iterator_t

[`xcb_xkb_id_spec_iterator_t`](@ref)
"""
struct xcb_xkb_id_spec_iterator_t
    data::Ptr{xcb_xkb_id_spec_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_group_t::UInt32 begin
    XCB_XKB_GROUP_1 = 0
    XCB_XKB_GROUP_2 = 1
    XCB_XKB_GROUP_3 = 2
    XCB_XKB_GROUP_4 = 3
end

@enum xcb_xkb_groups_t::UInt32 begin
    XCB_XKB_GROUPS_ANY = 254
    XCB_XKB_GROUPS_ALL = 255
end

@bitmask xcb_xkb_set_of_group_t::UInt32 begin
    XCB_XKB_SET_OF_GROUP_GROUP_1 = 1
    XCB_XKB_SET_OF_GROUP_GROUP_2 = 2
    XCB_XKB_SET_OF_GROUP_GROUP_3 = 4
    XCB_XKB_SET_OF_GROUP_GROUP_4 = 8
end

@enum xcb_xkb_set_of_groups_t::UInt32 begin
    XCB_XKB_SET_OF_GROUPS_ANY = 128
end

@bitmask xcb_xkb_groups_wrap_t::UInt32 begin
    XCB_XKB_GROUPS_WRAP_WRAP_INTO_RANGE = 0
    XCB_XKB_GROUPS_WRAP_CLAMP_INTO_RANGE = 64
    XCB_XKB_GROUPS_WRAP_REDIRECT_INTO_RANGE = 128
end

@bitmask xcb_xkb_v_mods_high_t::UInt32 begin
    XCB_XKB_V_MODS_HIGH_15 = 128
    XCB_XKB_V_MODS_HIGH_14 = 64
    XCB_XKB_V_MODS_HIGH_13 = 32
    XCB_XKB_V_MODS_HIGH_12 = 16
    XCB_XKB_V_MODS_HIGH_11 = 8
    XCB_XKB_V_MODS_HIGH_10 = 4
    XCB_XKB_V_MODS_HIGH_9 = 2
    XCB_XKB_V_MODS_HIGH_8 = 1
end

@bitmask xcb_xkb_v_mods_low_t::UInt32 begin
    XCB_XKB_V_MODS_LOW_7 = 128
    XCB_XKB_V_MODS_LOW_6 = 64
    XCB_XKB_V_MODS_LOW_5 = 32
    XCB_XKB_V_MODS_LOW_4 = 16
    XCB_XKB_V_MODS_LOW_3 = 8
    XCB_XKB_V_MODS_LOW_2 = 4
    XCB_XKB_V_MODS_LOW_1 = 2
    XCB_XKB_V_MODS_LOW_0 = 1
end

@bitmask xcb_xkb_v_mod_t::UInt32 begin
    XCB_XKB_V_MOD_15 = 32768
    XCB_XKB_V_MOD_14 = 16384
    XCB_XKB_V_MOD_13 = 8192
    XCB_XKB_V_MOD_12 = 4096
    XCB_XKB_V_MOD_11 = 2048
    XCB_XKB_V_MOD_10 = 1024
    XCB_XKB_V_MOD_9 = 512
    XCB_XKB_V_MOD_8 = 256
    XCB_XKB_V_MOD_7 = 128
    XCB_XKB_V_MOD_6 = 64
    XCB_XKB_V_MOD_5 = 32
    XCB_XKB_V_MOD_4 = 16
    XCB_XKB_V_MOD_3 = 8
    XCB_XKB_V_MOD_2 = 4
    XCB_XKB_V_MOD_1 = 2
    XCB_XKB_V_MOD_0 = 1
end

@bitmask xcb_xkb_explicit_t::UInt32 begin
    XCB_XKB_EXPLICIT_V_MOD_MAP = 128
    XCB_XKB_EXPLICIT_BEHAVIOR = 64
    XCB_XKB_EXPLICIT_AUTO_REPEAT = 32
    XCB_XKB_EXPLICIT_INTERPRET = 16
    XCB_XKB_EXPLICIT_KEY_TYPE_4 = 8
    XCB_XKB_EXPLICIT_KEY_TYPE_3 = 4
    XCB_XKB_EXPLICIT_KEY_TYPE_2 = 2
    XCB_XKB_EXPLICIT_KEY_TYPE_1 = 1
end

@enum xcb_xkb_sym_interpret_match_t::UInt32 begin
    XCB_XKB_SYM_INTERPRET_MATCH_NONE_OF = 0
    XCB_XKB_SYM_INTERPRET_MATCH_ANY_OF_OR_NONE = 1
    XCB_XKB_SYM_INTERPRET_MATCH_ANY_OF = 2
    XCB_XKB_SYM_INTERPRET_MATCH_ALL_OF = 3
    XCB_XKB_SYM_INTERPRET_MATCH_EXACTLY = 4
end

@enum xcb_xkb_sym_interp_match_t::UInt32 begin
    XCB_XKB_SYM_INTERP_MATCH_LEVEL_ONE_ONLY = 128
    XCB_XKB_SYM_INTERP_MATCH_OP_MASK = 127
end

@bitmask xcb_xkb_im_flag_t::UInt32 begin
    XCB_XKB_IM_FLAG_NO_EXPLICIT = 128
    XCB_XKB_IM_FLAG_NO_AUTOMATIC = 64
    XCB_XKB_IM_FLAG_LED_DRIVES_KB = 32
end

@bitmask xcb_xkb_im_mods_which_t::UInt32 begin
    XCB_XKB_IM_MODS_WHICH_USE_COMPAT = 16
    XCB_XKB_IM_MODS_WHICH_USE_EFFECTIVE = 8
    XCB_XKB_IM_MODS_WHICH_USE_LOCKED = 4
    XCB_XKB_IM_MODS_WHICH_USE_LATCHED = 2
    XCB_XKB_IM_MODS_WHICH_USE_BASE = 1
end

@bitmask xcb_xkb_im_groups_which_t::UInt32 begin
    XCB_XKB_IM_GROUPS_WHICH_USE_COMPAT = 16
    XCB_XKB_IM_GROUPS_WHICH_USE_EFFECTIVE = 8
    XCB_XKB_IM_GROUPS_WHICH_USE_LOCKED = 4
    XCB_XKB_IM_GROUPS_WHICH_USE_LATCHED = 2
    XCB_XKB_IM_GROUPS_WHICH_USE_BASE = 1
end

"""
    xcb_xkb_indicator_map_t

[`xcb_xkb_indicator_map_t`](@ref)
"""
struct xcb_xkb_indicator_map_t
    flags::UInt8
    whichGroups::UInt8
    groups::UInt8
    whichMods::UInt8
    mods::UInt8
    realMods::UInt8
    vmods::UInt16
    ctrls::UInt32
end

"""
    xcb_xkb_indicator_map_iterator_t

[`xcb_xkb_indicator_map_iterator_t`](@ref)
"""
struct xcb_xkb_indicator_map_iterator_t
    data::Ptr{xcb_xkb_indicator_map_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_cm_detail_t::UInt32 begin
    XCB_XKB_CM_DETAIL_SYM_INTERP = 1
    XCB_XKB_CM_DETAIL_GROUP_COMPAT = 2
end

@bitmask xcb_xkb_name_detail_t::UInt32 begin
    XCB_XKB_NAME_DETAIL_KEYCODES = 1
    XCB_XKB_NAME_DETAIL_GEOMETRY = 2
    XCB_XKB_NAME_DETAIL_SYMBOLS = 4
    XCB_XKB_NAME_DETAIL_PHYS_SYMBOLS = 8
    XCB_XKB_NAME_DETAIL_TYPES = 16
    XCB_XKB_NAME_DETAIL_COMPAT = 32
    XCB_XKB_NAME_DETAIL_KEY_TYPE_NAMES = 64
    XCB_XKB_NAME_DETAIL_KT_LEVEL_NAMES = 128
    XCB_XKB_NAME_DETAIL_INDICATOR_NAMES = 256
    XCB_XKB_NAME_DETAIL_KEY_NAMES = 512
    XCB_XKB_NAME_DETAIL_KEY_ALIASES = 1024
    XCB_XKB_NAME_DETAIL_VIRTUAL_MOD_NAMES = 2048
    XCB_XKB_NAME_DETAIL_GROUP_NAMES = 4096
    XCB_XKB_NAME_DETAIL_RG_NAMES = 8192
end

@bitmask xcb_xkb_gbn_detail_t::UInt32 begin
    XCB_XKB_GBN_DETAIL_TYPES = 1
    XCB_XKB_GBN_DETAIL_COMPAT_MAP = 2
    XCB_XKB_GBN_DETAIL_CLIENT_SYMBOLS = 4
    XCB_XKB_GBN_DETAIL_SERVER_SYMBOLS = 8
    XCB_XKB_GBN_DETAIL_INDICATOR_MAPS = 16
    XCB_XKB_GBN_DETAIL_KEY_NAMES = 32
    XCB_XKB_GBN_DETAIL_GEOMETRY = 64
    XCB_XKB_GBN_DETAIL_OTHER_NAMES = 128
end

@bitmask xcb_xkb_xi_feature_t::UInt32 begin
    XCB_XKB_XI_FEATURE_KEYBOARDS = 1
    XCB_XKB_XI_FEATURE_BUTTON_ACTIONS = 2
    XCB_XKB_XI_FEATURE_INDICATOR_NAMES = 4
    XCB_XKB_XI_FEATURE_INDICATOR_MAPS = 8
    XCB_XKB_XI_FEATURE_INDICATOR_STATE = 16
end

@bitmask xcb_xkb_per_client_flag_t::UInt32 begin
    XCB_XKB_PER_CLIENT_FLAG_DETECTABLE_AUTO_REPEAT = 1
    XCB_XKB_PER_CLIENT_FLAG_GRABS_USE_XKB_STATE = 2
    XCB_XKB_PER_CLIENT_FLAG_AUTO_RESET_CONTROLS = 4
    XCB_XKB_PER_CLIENT_FLAG_LOOKUP_STATE_WHEN_GRABBED = 8
    XCB_XKB_PER_CLIENT_FLAG_SEND_EVENT_USES_XKB_STATE = 16
end

"""
    xcb_xkb_mod_def_t

[`xcb_xkb_mod_def_t`](@ref)
"""
struct xcb_xkb_mod_def_t
    mask::UInt8
    realMods::UInt8
    vmods::UInt16
end

"""
    xcb_xkb_mod_def_iterator_t

[`xcb_xkb_mod_def_iterator_t`](@ref)
"""
struct xcb_xkb_mod_def_iterator_t
    data::Ptr{xcb_xkb_mod_def_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_name_t

[`xcb_xkb_key_name_t`](@ref)
"""
struct xcb_xkb_key_name_t
    name::NTuple{4, Cchar}
end

"""
    xcb_xkb_key_name_iterator_t

[`xcb_xkb_key_name_iterator_t`](@ref)
"""
struct xcb_xkb_key_name_iterator_t
    data::Ptr{xcb_xkb_key_name_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_alias_t

[`xcb_xkb_key_alias_t`](@ref)
"""
struct xcb_xkb_key_alias_t
    real::NTuple{4, Cchar}
    alias::NTuple{4, Cchar}
end

"""
    xcb_xkb_key_alias_iterator_t

[`xcb_xkb_key_alias_iterator_t`](@ref)
"""
struct xcb_xkb_key_alias_iterator_t
    data::Ptr{xcb_xkb_key_alias_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_counted_string_16_t

[`xcb_xkb_counted_string_16_t`](@ref)
"""
struct xcb_xkb_counted_string_16_t
    length::UInt16
end

"""
    xcb_xkb_counted_string_16_iterator_t

[`xcb_xkb_counted_string_16_iterator_t`](@ref)
"""
struct xcb_xkb_counted_string_16_iterator_t
    data::Ptr{xcb_xkb_counted_string_16_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_kt_map_entry_t

[`xcb_xkb_kt_map_entry_t`](@ref)
"""
struct xcb_xkb_kt_map_entry_t
    active::UInt8
    mods_mask::UInt8
    level::UInt8
    mods_mods::UInt8
    mods_vmods::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_kt_map_entry_iterator_t

[`xcb_xkb_kt_map_entry_iterator_t`](@ref)
"""
struct xcb_xkb_kt_map_entry_iterator_t
    data::Ptr{xcb_xkb_kt_map_entry_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_type_t

[`xcb_xkb_key_type_t`](@ref)
"""
struct xcb_xkb_key_type_t
    mods_mask::UInt8
    mods_mods::UInt8
    mods_vmods::UInt16
    numLevels::UInt8
    nMapEntries::UInt8
    hasPreserve::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_key_type_iterator_t

[`xcb_xkb_key_type_iterator_t`](@ref)
"""
struct xcb_xkb_key_type_iterator_t
    data::Ptr{xcb_xkb_key_type_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_sym_map_t

[`xcb_xkb_key_sym_map_t`](@ref)
"""
struct xcb_xkb_key_sym_map_t
    kt_index::NTuple{4, UInt8}
    groupInfo::UInt8
    width::UInt8
    nSyms::UInt16
end

"""
    xcb_xkb_key_sym_map_iterator_t

[`xcb_xkb_key_sym_map_iterator_t`](@ref)
"""
struct xcb_xkb_key_sym_map_iterator_t
    data::Ptr{xcb_xkb_key_sym_map_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_common_behavior_t

[`xcb_xkb_common_behavior_t`](@ref)
"""
struct xcb_xkb_common_behavior_t
    type::UInt8
    data::UInt8
end

"""
    xcb_xkb_common_behavior_iterator_t

[`xcb_xkb_common_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_common_behavior_iterator_t
    data::Ptr{xcb_xkb_common_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_default_behavior_t

[`xcb_xkb_default_behavior_t`](@ref)
"""
struct xcb_xkb_default_behavior_t
    type::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_default_behavior_iterator_t

[`xcb_xkb_default_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_default_behavior_iterator_t
    data::Ptr{xcb_xkb_default_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_lock_behavior_t

[`xcb_xkb_lock_behavior_t`](@ref)
"""
struct xcb_xkb_lock_behavior_t
    type::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_lock_behavior_iterator_t

[`xcb_xkb_lock_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_lock_behavior_iterator_t
    data::Ptr{xcb_xkb_lock_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_radio_group_behavior_t

[`xcb_xkb_radio_group_behavior_t`](@ref)
"""
struct xcb_xkb_radio_group_behavior_t
    type::UInt8
    group::UInt8
end

"""
    xcb_xkb_radio_group_behavior_iterator_t

[`xcb_xkb_radio_group_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_radio_group_behavior_iterator_t
    data::Ptr{xcb_xkb_radio_group_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_overlay_behavior_t

[`xcb_xkb_overlay_behavior_t`](@ref)
"""
struct xcb_xkb_overlay_behavior_t
    type::UInt8
    key::xcb_keycode_t
end

"""
    xcb_xkb_overlay_behavior_iterator_t

[`xcb_xkb_overlay_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_overlay_behavior_iterator_t
    data::Ptr{xcb_xkb_overlay_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_permament_lock_behavior_t

[`xcb_xkb_permament_lock_behavior_t`](@ref)
"""
struct xcb_xkb_permament_lock_behavior_t
    type::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_permament_lock_behavior_iterator_t

[`xcb_xkb_permament_lock_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_permament_lock_behavior_iterator_t
    data::Ptr{xcb_xkb_permament_lock_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_permament_radio_group_behavior_t

[`xcb_xkb_permament_radio_group_behavior_t`](@ref)
"""
struct xcb_xkb_permament_radio_group_behavior_t
    type::UInt8
    group::UInt8
end

"""
    xcb_xkb_permament_radio_group_behavior_iterator_t

[`xcb_xkb_permament_radio_group_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_permament_radio_group_behavior_iterator_t
    data::Ptr{xcb_xkb_permament_radio_group_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_permament_overlay_behavior_t

[`xcb_xkb_permament_overlay_behavior_t`](@ref)
"""
struct xcb_xkb_permament_overlay_behavior_t
    type::UInt8
    key::xcb_keycode_t
end

"""
    xcb_xkb_permament_overlay_behavior_iterator_t

[`xcb_xkb_permament_overlay_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_permament_overlay_behavior_iterator_t
    data::Ptr{xcb_xkb_permament_overlay_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_behavior_t

[`xcb_xkb_behavior_t`](@ref)
"""
struct xcb_xkb_behavior_t
    data::NTuple{2, UInt8}
end

function Base.getproperty(x::Ptr{xcb_xkb_behavior_t}, f::Symbol)
    f === :common && return Ptr{xcb_xkb_common_behavior_t}(x + 0)
    f === :_default && return Ptr{xcb_xkb_default_behavior_t}(x + 0)
    f === :lock && return Ptr{xcb_xkb_lock_behavior_t}(x + 0)
    f === :radioGroup && return Ptr{xcb_xkb_radio_group_behavior_t}(x + 0)
    f === :overlay1 && return Ptr{xcb_xkb_overlay_behavior_t}(x + 0)
    f === :overlay2 && return Ptr{xcb_xkb_overlay_behavior_t}(x + 0)
    f === :permamentLock && return Ptr{xcb_xkb_permament_lock_behavior_t}(x + 0)
    f === :permamentRadioGroup && return Ptr{xcb_xkb_permament_radio_group_behavior_t}(x + 0)
    f === :permamentOverlay1 && return Ptr{xcb_xkb_permament_overlay_behavior_t}(x + 0)
    f === :permamentOverlay2 && return Ptr{xcb_xkb_permament_overlay_behavior_t}(x + 0)
    f === :type && return Ptr{UInt8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::xcb_xkb_behavior_t, f::Symbol)
    r = Ref{xcb_xkb_behavior_t}(x)
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_behavior_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{xcb_xkb_behavior_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const __U_xcb_xkb_behavior_t = Union{xcb_xkb_common_behavior_t, xcb_xkb_default_behavior_t, xcb_xkb_lock_behavior_t, xcb_xkb_radio_group_behavior_t, xcb_xkb_overlay_behavior_t, xcb_xkb_overlay_behavior_t, xcb_xkb_permament_lock_behavior_t, xcb_xkb_permament_radio_group_behavior_t, xcb_xkb_permament_overlay_behavior_t, xcb_xkb_permament_overlay_behavior_t, UInt8}

function xcb_xkb_behavior_t(val::__U_xcb_xkb_behavior_t)
    ref = Ref{xcb_xkb_behavior_t}()
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_behavior_t}, ref)
    if val isa xcb_xkb_common_behavior_t
        ptr.common = val
    elseif val isa xcb_xkb_default_behavior_t
        ptr._default = val
    elseif val isa xcb_xkb_lock_behavior_t
        ptr.lock = val
    elseif val isa xcb_xkb_radio_group_behavior_t
        ptr.radioGroup = val
    elseif val isa xcb_xkb_overlay_behavior_t
        ptr.overlay1 = val
    elseif val isa xcb_xkb_overlay_behavior_t
        ptr.overlay2 = val
    elseif val isa xcb_xkb_permament_lock_behavior_t
        ptr.permamentLock = val
    elseif val isa xcb_xkb_permament_radio_group_behavior_t
        ptr.permamentRadioGroup = val
    elseif val isa xcb_xkb_permament_overlay_behavior_t
        ptr.permamentOverlay1 = val
    elseif val isa xcb_xkb_permament_overlay_behavior_t
        ptr.permamentOverlay2 = val
    elseif val isa UInt8
        ptr.type = val
    end
    ref[]
end

"""
    xcb_xkb_behavior_iterator_t

[`xcb_xkb_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_behavior_iterator_t
    data::Ptr{xcb_xkb_behavior_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_behavior_type_t::UInt32 begin
    XCB_XKB_BEHAVIOR_TYPE_DEFAULT = 0
    XCB_XKB_BEHAVIOR_TYPE_LOCK = 1
    XCB_XKB_BEHAVIOR_TYPE_RADIO_GROUP = 2
    XCB_XKB_BEHAVIOR_TYPE_OVERLAY_1 = 3
    XCB_XKB_BEHAVIOR_TYPE_OVERLAY_2 = 4
    XCB_XKB_BEHAVIOR_TYPE_PERMAMENT_LOCK = 129
    XCB_XKB_BEHAVIOR_TYPE_PERMAMENT_RADIO_GROUP = 130
    XCB_XKB_BEHAVIOR_TYPE_PERMAMENT_OVERLAY_1 = 131
    XCB_XKB_BEHAVIOR_TYPE_PERMAMENT_OVERLAY_2 = 132
end

"""
    xcb_xkb_set_behavior_t

[`xcb_xkb_set_behavior_t`](@ref)
"""
struct xcb_xkb_set_behavior_t
    keycode::xcb_keycode_t
    behavior::xcb_xkb_behavior_t
    pad0::UInt8
end

"""
    xcb_xkb_set_behavior_iterator_t

[`xcb_xkb_set_behavior_iterator_t`](@ref)
"""
struct xcb_xkb_set_behavior_iterator_t
    data::Ptr{xcb_xkb_set_behavior_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_set_explicit_t

[`xcb_xkb_set_explicit_t`](@ref)
"""
struct xcb_xkb_set_explicit_t
    keycode::xcb_keycode_t
    explicit::UInt8
end

"""
    xcb_xkb_set_explicit_iterator_t

[`xcb_xkb_set_explicit_iterator_t`](@ref)
"""
struct xcb_xkb_set_explicit_iterator_t
    data::Ptr{xcb_xkb_set_explicit_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_mod_map_t

[`xcb_xkb_key_mod_map_t`](@ref)
"""
struct xcb_xkb_key_mod_map_t
    keycode::xcb_keycode_t
    mods::UInt8
end

"""
    xcb_xkb_key_mod_map_iterator_t

[`xcb_xkb_key_mod_map_iterator_t`](@ref)
"""
struct xcb_xkb_key_mod_map_iterator_t
    data::Ptr{xcb_xkb_key_mod_map_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_v_mod_map_t

[`xcb_xkb_key_v_mod_map_t`](@ref)
"""
struct xcb_xkb_key_v_mod_map_t
    keycode::xcb_keycode_t
    pad0::UInt8
    vmods::UInt16
end

"""
    xcb_xkb_key_v_mod_map_iterator_t

[`xcb_xkb_key_v_mod_map_iterator_t`](@ref)
"""
struct xcb_xkb_key_v_mod_map_iterator_t
    data::Ptr{xcb_xkb_key_v_mod_map_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_kt_set_map_entry_t

[`xcb_xkb_kt_set_map_entry_t`](@ref)
"""
struct xcb_xkb_kt_set_map_entry_t
    level::UInt8
    realMods::UInt8
    virtualMods::UInt16
end

"""
    xcb_xkb_kt_set_map_entry_iterator_t

[`xcb_xkb_kt_set_map_entry_iterator_t`](@ref)
"""
struct xcb_xkb_kt_set_map_entry_iterator_t
    data::Ptr{xcb_xkb_kt_set_map_entry_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_set_key_type_t

[`xcb_xkb_set_key_type_t`](@ref)
"""
struct xcb_xkb_set_key_type_t
    mask::UInt8
    realMods::UInt8
    virtualMods::UInt16
    numLevels::UInt8
    nMapEntries::UInt8
    preserve::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_set_key_type_iterator_t

[`xcb_xkb_set_key_type_iterator_t`](@ref)
"""
struct xcb_xkb_set_key_type_iterator_t
    data::Ptr{xcb_xkb_set_key_type_t}
    rem::Cint
    index::Cint
end

const xcb_xkb_string8_t = Cchar

"""
    xcb_xkb_string8_iterator_t

[`xcb_xkb_string8_iterator_t`](@ref)
"""
struct xcb_xkb_string8_iterator_t
    data::Ptr{xcb_xkb_string8_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_outline_t

[`xcb_xkb_outline_t`](@ref)
"""
struct xcb_xkb_outline_t
    nPoints::UInt8
    cornerRadius::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_outline_iterator_t

[`xcb_xkb_outline_iterator_t`](@ref)
"""
struct xcb_xkb_outline_iterator_t
    data::Ptr{xcb_xkb_outline_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_shape_t

[`xcb_xkb_shape_t`](@ref)
"""
struct xcb_xkb_shape_t
    name::xcb_atom_t
    nOutlines::UInt8
    primaryNdx::UInt8
    approxNdx::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_shape_iterator_t

[`xcb_xkb_shape_iterator_t`](@ref)
"""
struct xcb_xkb_shape_iterator_t
    data::Ptr{xcb_xkb_shape_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_key_t

[`xcb_xkb_key_t`](@ref)
"""
struct xcb_xkb_key_t
    name::NTuple{4, xcb_xkb_string8_t}
    gap::Int16
    shapeNdx::UInt8
    colorNdx::UInt8
end

"""
    xcb_xkb_key_iterator_t

[`xcb_xkb_key_iterator_t`](@ref)
"""
struct xcb_xkb_key_iterator_t
    data::Ptr{xcb_xkb_key_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_overlay_key_t

[`xcb_xkb_overlay_key_t`](@ref)
"""
struct xcb_xkb_overlay_key_t
    over::NTuple{4, xcb_xkb_string8_t}
    under::NTuple{4, xcb_xkb_string8_t}
end

"""
    xcb_xkb_overlay_key_iterator_t

[`xcb_xkb_overlay_key_iterator_t`](@ref)
"""
struct xcb_xkb_overlay_key_iterator_t
    data::Ptr{xcb_xkb_overlay_key_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_overlay_row_t

[`xcb_xkb_overlay_row_t`](@ref)
"""
struct xcb_xkb_overlay_row_t
    rowUnder::UInt8
    nKeys::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_overlay_row_iterator_t

[`xcb_xkb_overlay_row_iterator_t`](@ref)
"""
struct xcb_xkb_overlay_row_iterator_t
    data::Ptr{xcb_xkb_overlay_row_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_overlay_t

[`xcb_xkb_overlay_t`](@ref)
"""
struct xcb_xkb_overlay_t
    name::xcb_atom_t
    nRows::UInt8
    pad0::NTuple{3, UInt8}
end

"""
    xcb_xkb_overlay_iterator_t

[`xcb_xkb_overlay_iterator_t`](@ref)
"""
struct xcb_xkb_overlay_iterator_t
    data::Ptr{xcb_xkb_overlay_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_row_t

[`xcb_xkb_row_t`](@ref)
"""
struct xcb_xkb_row_t
    top::Int16
    left::Int16
    nKeys::UInt8
    vertical::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_row_iterator_t

[`xcb_xkb_row_iterator_t`](@ref)
"""
struct xcb_xkb_row_iterator_t
    data::Ptr{xcb_xkb_row_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_doodad_type_t::UInt32 begin
    XCB_XKB_DOODAD_TYPE_OUTLINE = 1
    XCB_XKB_DOODAD_TYPE_SOLID = 2
    XCB_XKB_DOODAD_TYPE_TEXT = 3
    XCB_XKB_DOODAD_TYPE_INDICATOR = 4
    XCB_XKB_DOODAD_TYPE_LOGO = 5
end

"""
    xcb_xkb_listing_t

[`xcb_xkb_listing_t`](@ref)
"""
struct xcb_xkb_listing_t
    flags::UInt16
    length::UInt16
end

"""
    xcb_xkb_listing_iterator_t

[`xcb_xkb_listing_iterator_t`](@ref)
"""
struct xcb_xkb_listing_iterator_t
    data::Ptr{xcb_xkb_listing_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_device_led_info_t

[`xcb_xkb_device_led_info_t`](@ref)
"""
struct xcb_xkb_device_led_info_t
    ledClass::xcb_xkb_led_class_spec_t
    ledID::xcb_xkb_id_spec_t
    namesPresent::UInt32
    mapsPresent::UInt32
    physIndicators::UInt32
    state::UInt32
end

"""
    xcb_xkb_device_led_info_iterator_t

[`xcb_xkb_device_led_info_iterator_t`](@ref)
"""
struct xcb_xkb_device_led_info_iterator_t
    data::Ptr{xcb_xkb_device_led_info_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_error_t::UInt32 begin
    XCB_XKB_ERROR_BAD_DEVICE = 255
    XCB_XKB_ERROR_BAD_CLASS = 254
    XCB_XKB_ERROR_BAD_ID = 253
end

"""
    xcb_xkb_keyboard_error_t

[`xcb_xkb_keyboard_error_t`](@ref)
"""
struct xcb_xkb_keyboard_error_t
    response_type::UInt8
    error_code::UInt8
    sequence::UInt16
    value::UInt32
    minorOpcode::UInt16
    majorOpcode::UInt8
    pad0::NTuple{21, UInt8}
end

@bitmask xcb_xkb_sa_t::UInt32 begin
    XCB_XKB_SA_CLEAR_LOCKS = 1
    XCB_XKB_SA_LATCH_TO_LOCK = 2
    XCB_XKB_SA_USE_MOD_MAP_MODS = 4
    # XCB_XKB_SA_GROUP_ABSOLUTE = 4
end

@bitmask xcb_xkb_sa_type_t::UInt32 begin
    XCB_XKB_SA_TYPE_NO_ACTION = 0
    XCB_XKB_SA_TYPE_SET_MODS = 1
    XCB_XKB_SA_TYPE_LATCH_MODS = 2
    XCB_XKB_SA_TYPE_LOCK_MODS = 3
    XCB_XKB_SA_TYPE_SET_GROUP = 4
    XCB_XKB_SA_TYPE_LATCH_GROUP = 5
    XCB_XKB_SA_TYPE_LOCK_GROUP = 6
    XCB_XKB_SA_TYPE_MOVE_PTR = 7
    XCB_XKB_SA_TYPE_PTR_BTN = 8
    XCB_XKB_SA_TYPE_LOCK_PTR_BTN = 9
    XCB_XKB_SA_TYPE_SET_PTR_DFLT = 10
    XCB_XKB_SA_TYPE_ISO_LOCK = 11
    XCB_XKB_SA_TYPE_TERMINATE = 12
    XCB_XKB_SA_TYPE_SWITCH_SCREEN = 13
    XCB_XKB_SA_TYPE_SET_CONTROLS = 14
    XCB_XKB_SA_TYPE_LOCK_CONTROLS = 15
    XCB_XKB_SA_TYPE_ACTION_MESSAGE = 16
    XCB_XKB_SA_TYPE_REDIRECT_KEY = 17
    XCB_XKB_SA_TYPE_DEVICE_BTN = 18
    XCB_XKB_SA_TYPE_LOCK_DEVICE_BTN = 19
    XCB_XKB_SA_TYPE_DEVICE_VALUATOR = 20
end

"""
    xcb_xkb_sa_no_action_t

[`xcb_xkb_sa_no_action_t`](@ref)
"""
struct xcb_xkb_sa_no_action_t
    type::UInt8
    pad0::NTuple{7, UInt8}
end

"""
    xcb_xkb_sa_no_action_iterator_t

[`xcb_xkb_sa_no_action_iterator_t`](@ref)
"""
struct xcb_xkb_sa_no_action_iterator_t
    data::Ptr{xcb_xkb_sa_no_action_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_set_mods_t

[`xcb_xkb_sa_set_mods_t`](@ref)
"""
struct xcb_xkb_sa_set_mods_t
    type::UInt8
    flags::UInt8
    mask::UInt8
    realMods::UInt8
    vmodsHigh::UInt8
    vmodsLow::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_set_mods_iterator_t

[`xcb_xkb_sa_set_mods_iterator_t`](@ref)
"""
struct xcb_xkb_sa_set_mods_iterator_t
    data::Ptr{xcb_xkb_sa_set_mods_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_latch_mods_t

[`xcb_xkb_sa_latch_mods_t`](@ref)
"""
struct xcb_xkb_sa_latch_mods_t
    type::UInt8
    flags::UInt8
    mask::UInt8
    realMods::UInt8
    vmodsHigh::UInt8
    vmodsLow::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_latch_mods_iterator_t

[`xcb_xkb_sa_latch_mods_iterator_t`](@ref)
"""
struct xcb_xkb_sa_latch_mods_iterator_t
    data::Ptr{xcb_xkb_sa_latch_mods_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_lock_mods_t

[`xcb_xkb_sa_lock_mods_t`](@ref)
"""
struct xcb_xkb_sa_lock_mods_t
    type::UInt8
    flags::UInt8
    mask::UInt8
    realMods::UInt8
    vmodsHigh::UInt8
    vmodsLow::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_lock_mods_iterator_t

[`xcb_xkb_sa_lock_mods_iterator_t`](@ref)
"""
struct xcb_xkb_sa_lock_mods_iterator_t
    data::Ptr{xcb_xkb_sa_lock_mods_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_set_group_t

[`xcb_xkb_sa_set_group_t`](@ref)
"""
struct xcb_xkb_sa_set_group_t
    type::UInt8
    flags::UInt8
    group::Int8
    pad0::NTuple{5, UInt8}
end

"""
    xcb_xkb_sa_set_group_iterator_t

[`xcb_xkb_sa_set_group_iterator_t`](@ref)
"""
struct xcb_xkb_sa_set_group_iterator_t
    data::Ptr{xcb_xkb_sa_set_group_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_latch_group_t

[`xcb_xkb_sa_latch_group_t`](@ref)
"""
struct xcb_xkb_sa_latch_group_t
    type::UInt8
    flags::UInt8
    group::Int8
    pad0::NTuple{5, UInt8}
end

"""
    xcb_xkb_sa_latch_group_iterator_t

[`xcb_xkb_sa_latch_group_iterator_t`](@ref)
"""
struct xcb_xkb_sa_latch_group_iterator_t
    data::Ptr{xcb_xkb_sa_latch_group_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_lock_group_t

[`xcb_xkb_sa_lock_group_t`](@ref)
"""
struct xcb_xkb_sa_lock_group_t
    type::UInt8
    flags::UInt8
    group::Int8
    pad0::NTuple{5, UInt8}
end

"""
    xcb_xkb_sa_lock_group_iterator_t

[`xcb_xkb_sa_lock_group_iterator_t`](@ref)
"""
struct xcb_xkb_sa_lock_group_iterator_t
    data::Ptr{xcb_xkb_sa_lock_group_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_sa_move_ptr_flag_t::UInt32 begin
    XCB_XKB_SA_MOVE_PTR_FLAG_NO_ACCELERATION = 1
    XCB_XKB_SA_MOVE_PTR_FLAG_MOVE_ABSOLUTE_X = 2
    XCB_XKB_SA_MOVE_PTR_FLAG_MOVE_ABSOLUTE_Y = 4
end

"""
    xcb_xkb_sa_move_ptr_t

[`xcb_xkb_sa_move_ptr_t`](@ref)
"""
struct xcb_xkb_sa_move_ptr_t
    type::UInt8
    flags::UInt8
    xHigh::Int8
    xLow::UInt8
    yHigh::Int8
    yLow::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_move_ptr_iterator_t

[`xcb_xkb_sa_move_ptr_iterator_t`](@ref)
"""
struct xcb_xkb_sa_move_ptr_iterator_t
    data::Ptr{xcb_xkb_sa_move_ptr_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_ptr_btn_t

[`xcb_xkb_sa_ptr_btn_t`](@ref)
"""
struct xcb_xkb_sa_ptr_btn_t
    type::UInt8
    flags::UInt8
    count::UInt8
    button::UInt8
    pad0::NTuple{4, UInt8}
end

"""
    xcb_xkb_sa_ptr_btn_iterator_t

[`xcb_xkb_sa_ptr_btn_iterator_t`](@ref)
"""
struct xcb_xkb_sa_ptr_btn_iterator_t
    data::Ptr{xcb_xkb_sa_ptr_btn_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_lock_ptr_btn_t

[`xcb_xkb_sa_lock_ptr_btn_t`](@ref)
"""
struct xcb_xkb_sa_lock_ptr_btn_t
    type::UInt8
    flags::UInt8
    pad0::UInt8
    button::UInt8
    pad1::NTuple{4, UInt8}
end

"""
    xcb_xkb_sa_lock_ptr_btn_iterator_t

[`xcb_xkb_sa_lock_ptr_btn_iterator_t`](@ref)
"""
struct xcb_xkb_sa_lock_ptr_btn_iterator_t
    data::Ptr{xcb_xkb_sa_lock_ptr_btn_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_sa_set_ptr_dflt_flag_t::UInt32 begin
    XCB_XKB_SA_SET_PTR_DFLT_FLAG_DFLT_BTN_ABSOLUTE = 4
    XCB_XKB_SA_SET_PTR_DFLT_FLAG_AFFECT_DFLT_BUTTON = 1
end

"""
    xcb_xkb_sa_set_ptr_dflt_t

[`xcb_xkb_sa_set_ptr_dflt_t`](@ref)
"""
struct xcb_xkb_sa_set_ptr_dflt_t
    type::UInt8
    flags::UInt8
    affect::UInt8
    value::Int8
    pad0::NTuple{4, UInt8}
end

"""
    xcb_xkb_sa_set_ptr_dflt_iterator_t

[`xcb_xkb_sa_set_ptr_dflt_iterator_t`](@ref)
"""
struct xcb_xkb_sa_set_ptr_dflt_iterator_t
    data::Ptr{xcb_xkb_sa_set_ptr_dflt_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_sa_iso_lock_flag_t::UInt32 begin
    XCB_XKB_SA_ISO_LOCK_FLAG_NO_LOCK = 1
    XCB_XKB_SA_ISO_LOCK_FLAG_NO_UNLOCK = 2
    XCB_XKB_SA_ISO_LOCK_FLAG_USE_MOD_MAP_MODS = 4
    # XCB_XKB_SA_ISO_LOCK_FLAG_GROUP_ABSOLUTE = 4
    XCB_XKB_SA_ISO_LOCK_FLAG_ISO_DFLT_IS_GROUP = 8
end

@bitmask xcb_xkb_sa_iso_lock_no_affect_t::UInt32 begin
    XCB_XKB_SA_ISO_LOCK_NO_AFFECT_CTRLS = 8
    XCB_XKB_SA_ISO_LOCK_NO_AFFECT_PTR = 16
    XCB_XKB_SA_ISO_LOCK_NO_AFFECT_GROUP = 32
    XCB_XKB_SA_ISO_LOCK_NO_AFFECT_MODS = 64
end

"""
    xcb_xkb_sa_iso_lock_t

[`xcb_xkb_sa_iso_lock_t`](@ref)
"""
struct xcb_xkb_sa_iso_lock_t
    type::UInt8
    flags::UInt8
    mask::UInt8
    realMods::UInt8
    group::Int8
    affect::UInt8
    vmodsHigh::UInt8
    vmodsLow::UInt8
end

"""
    xcb_xkb_sa_iso_lock_iterator_t

[`xcb_xkb_sa_iso_lock_iterator_t`](@ref)
"""
struct xcb_xkb_sa_iso_lock_iterator_t
    data::Ptr{xcb_xkb_sa_iso_lock_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_terminate_t

[`xcb_xkb_sa_terminate_t`](@ref)
"""
struct xcb_xkb_sa_terminate_t
    type::UInt8
    pad0::NTuple{7, UInt8}
end

"""
    xcb_xkb_sa_terminate_iterator_t

[`xcb_xkb_sa_terminate_iterator_t`](@ref)
"""
struct xcb_xkb_sa_terminate_iterator_t
    data::Ptr{xcb_xkb_sa_terminate_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_switch_screen_flag_t::UInt32 begin
    XCB_XKB_SWITCH_SCREEN_FLAG_APPLICATION = 1
    XCB_XKB_SWITCH_SCREEN_FLAG_ABSOLUTE = 4
end

"""
    xcb_xkb_sa_switch_screen_t

[`xcb_xkb_sa_switch_screen_t`](@ref)
"""
struct xcb_xkb_sa_switch_screen_t
    type::UInt8
    flags::UInt8
    newScreen::Int8
    pad0::NTuple{5, UInt8}
end

"""
    xcb_xkb_sa_switch_screen_iterator_t

[`xcb_xkb_sa_switch_screen_iterator_t`](@ref)
"""
struct xcb_xkb_sa_switch_screen_iterator_t
    data::Ptr{xcb_xkb_sa_switch_screen_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_bool_ctrls_high_t::UInt32 begin
    XCB_XKB_BOOL_CTRLS_HIGH_ACCESS_X_FEEDBACK = 1
    XCB_XKB_BOOL_CTRLS_HIGH_AUDIBLE_BELL = 2
    XCB_XKB_BOOL_CTRLS_HIGH_OVERLAY_1 = 4
    XCB_XKB_BOOL_CTRLS_HIGH_OVERLAY_2 = 8
    XCB_XKB_BOOL_CTRLS_HIGH_IGNORE_GROUP_LOCK = 16
end

@bitmask xcb_xkb_bool_ctrls_low_t::UInt32 begin
    XCB_XKB_BOOL_CTRLS_LOW_REPEAT_KEYS = 1
    XCB_XKB_BOOL_CTRLS_LOW_SLOW_KEYS = 2
    XCB_XKB_BOOL_CTRLS_LOW_BOUNCE_KEYS = 4
    XCB_XKB_BOOL_CTRLS_LOW_STICKY_KEYS = 8
    XCB_XKB_BOOL_CTRLS_LOW_MOUSE_KEYS = 16
    XCB_XKB_BOOL_CTRLS_LOW_MOUSE_KEYS_ACCEL = 32
    XCB_XKB_BOOL_CTRLS_LOW_ACCESS_X_KEYS = 64
    XCB_XKB_BOOL_CTRLS_LOW_ACCESS_X_TIMEOUT = 128
end

"""
    xcb_xkb_sa_set_controls_t

[`xcb_xkb_sa_set_controls_t`](@ref)
"""
struct xcb_xkb_sa_set_controls_t
    type::UInt8
    pad0::NTuple{3, UInt8}
    boolCtrlsHigh::UInt8
    boolCtrlsLow::UInt8
    pad1::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_set_controls_iterator_t

[`xcb_xkb_sa_set_controls_iterator_t`](@ref)
"""
struct xcb_xkb_sa_set_controls_iterator_t
    data::Ptr{xcb_xkb_sa_set_controls_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_lock_controls_t

[`xcb_xkb_sa_lock_controls_t`](@ref)
"""
struct xcb_xkb_sa_lock_controls_t
    type::UInt8
    pad0::NTuple{3, UInt8}
    boolCtrlsHigh::UInt8
    boolCtrlsLow::UInt8
    pad1::NTuple{2, UInt8}
end

"""
    xcb_xkb_sa_lock_controls_iterator_t

[`xcb_xkb_sa_lock_controls_iterator_t`](@ref)
"""
struct xcb_xkb_sa_lock_controls_iterator_t
    data::Ptr{xcb_xkb_sa_lock_controls_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_action_message_flag_t::UInt32 begin
    XCB_XKB_ACTION_MESSAGE_FLAG_ON_PRESS = 1
    XCB_XKB_ACTION_MESSAGE_FLAG_ON_RELEASE = 2
    XCB_XKB_ACTION_MESSAGE_FLAG_GEN_KEY_EVENT = 4
end

"""
    xcb_xkb_sa_action_message_t

[`xcb_xkb_sa_action_message_t`](@ref)
"""
struct xcb_xkb_sa_action_message_t
    type::UInt8
    flags::UInt8
    message::NTuple{6, UInt8}
end

"""
    xcb_xkb_sa_action_message_iterator_t

[`xcb_xkb_sa_action_message_iterator_t`](@ref)
"""
struct xcb_xkb_sa_action_message_iterator_t
    data::Ptr{xcb_xkb_sa_action_message_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_redirect_key_t

[`xcb_xkb_sa_redirect_key_t`](@ref)
"""
struct xcb_xkb_sa_redirect_key_t
    type::UInt8
    newkey::xcb_keycode_t
    mask::UInt8
    realModifiers::UInt8
    vmodsMaskHigh::UInt8
    vmodsMaskLow::UInt8
    vmodsHigh::UInt8
    vmodsLow::UInt8
end

"""
    xcb_xkb_sa_redirect_key_iterator_t

[`xcb_xkb_sa_redirect_key_iterator_t`](@ref)
"""
struct xcb_xkb_sa_redirect_key_iterator_t
    data::Ptr{xcb_xkb_sa_redirect_key_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sa_device_btn_t

[`xcb_xkb_sa_device_btn_t`](@ref)
"""
struct xcb_xkb_sa_device_btn_t
    type::UInt8
    flags::UInt8
    count::UInt8
    button::UInt8
    device::UInt8
    pad0::NTuple{3, UInt8}
end

"""
    xcb_xkb_sa_device_btn_iterator_t

[`xcb_xkb_sa_device_btn_iterator_t`](@ref)
"""
struct xcb_xkb_sa_device_btn_iterator_t
    data::Ptr{xcb_xkb_sa_device_btn_t}
    rem::Cint
    index::Cint
end

@bitmask xcb_xkb_lock_device_flags_t::UInt32 begin
    XCB_XKB_LOCK_DEVICE_FLAGS_NO_LOCK = 1
    XCB_XKB_LOCK_DEVICE_FLAGS_NO_UNLOCK = 2
end

"""
    xcb_xkb_sa_lock_device_btn_t

[`xcb_xkb_sa_lock_device_btn_t`](@ref)
"""
struct xcb_xkb_sa_lock_device_btn_t
    type::UInt8
    flags::UInt8
    pad0::UInt8
    button::UInt8
    device::UInt8
    pad1::NTuple{3, UInt8}
end

"""
    xcb_xkb_sa_lock_device_btn_iterator_t

[`xcb_xkb_sa_lock_device_btn_iterator_t`](@ref)
"""
struct xcb_xkb_sa_lock_device_btn_iterator_t
    data::Ptr{xcb_xkb_sa_lock_device_btn_t}
    rem::Cint
    index::Cint
end

@enum xcb_xkb_sa_val_what_t::UInt32 begin
    XCB_XKB_SA_VAL_WHAT_IGNORE_VAL = 0
    XCB_XKB_SA_VAL_WHAT_SET_VAL_MIN = 1
    XCB_XKB_SA_VAL_WHAT_SET_VAL_CENTER = 2
    XCB_XKB_SA_VAL_WHAT_SET_VAL_MAX = 3
    XCB_XKB_SA_VAL_WHAT_SET_VAL_RELATIVE = 4
    XCB_XKB_SA_VAL_WHAT_SET_VAL_ABSOLUTE = 5
end

"""
    xcb_xkb_sa_device_valuator_t

[`xcb_xkb_sa_device_valuator_t`](@ref)
"""
struct xcb_xkb_sa_device_valuator_t
    type::UInt8
    device::UInt8
    val1what::UInt8
    val1index::UInt8
    val1value::UInt8
    val2what::UInt8
    val2index::UInt8
    val2value::UInt8
end

"""
    xcb_xkb_sa_device_valuator_iterator_t

[`xcb_xkb_sa_device_valuator_iterator_t`](@ref)
"""
struct xcb_xkb_sa_device_valuator_iterator_t
    data::Ptr{xcb_xkb_sa_device_valuator_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_si_action_t

[`xcb_xkb_si_action_t`](@ref)
"""
struct xcb_xkb_si_action_t
    type::UInt8
    data::NTuple{7, UInt8}
end

"""
    xcb_xkb_si_action_iterator_t

[`xcb_xkb_si_action_iterator_t`](@ref)
"""
struct xcb_xkb_si_action_iterator_t
    data::Ptr{xcb_xkb_si_action_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_sym_interpret_t

[`xcb_xkb_sym_interpret_t`](@ref)
"""
struct xcb_xkb_sym_interpret_t
    sym::xcb_keysym_t
    mods::UInt8
    match::UInt8
    virtualMod::UInt8
    flags::UInt8
    action::xcb_xkb_si_action_t
end

"""
    xcb_xkb_sym_interpret_iterator_t

[`xcb_xkb_sym_interpret_iterator_t`](@ref)
"""
struct xcb_xkb_sym_interpret_iterator_t
    data::Ptr{xcb_xkb_sym_interpret_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_action_t

[`xcb_xkb_action_t`](@ref)
"""
struct xcb_xkb_action_t
    data::NTuple{8, UInt8}
end

function Base.getproperty(x::Ptr{xcb_xkb_action_t}, f::Symbol)
    f === :noaction && return Ptr{xcb_xkb_sa_no_action_t}(x + 0)
    f === :setmods && return Ptr{xcb_xkb_sa_set_mods_t}(x + 0)
    f === :latchmods && return Ptr{xcb_xkb_sa_latch_mods_t}(x + 0)
    f === :lockmods && return Ptr{xcb_xkb_sa_lock_mods_t}(x + 0)
    f === :setgroup && return Ptr{xcb_xkb_sa_set_group_t}(x + 0)
    f === :latchgroup && return Ptr{xcb_xkb_sa_latch_group_t}(x + 0)
    f === :lockgroup && return Ptr{xcb_xkb_sa_lock_group_t}(x + 0)
    f === :moveptr && return Ptr{xcb_xkb_sa_move_ptr_t}(x + 0)
    f === :ptrbtn && return Ptr{xcb_xkb_sa_ptr_btn_t}(x + 0)
    f === :lockptrbtn && return Ptr{xcb_xkb_sa_lock_ptr_btn_t}(x + 0)
    f === :setptrdflt && return Ptr{xcb_xkb_sa_set_ptr_dflt_t}(x + 0)
    f === :isolock && return Ptr{xcb_xkb_sa_iso_lock_t}(x + 0)
    f === :terminate && return Ptr{xcb_xkb_sa_terminate_t}(x + 0)
    f === :switchscreen && return Ptr{xcb_xkb_sa_switch_screen_t}(x + 0)
    f === :setcontrols && return Ptr{xcb_xkb_sa_set_controls_t}(x + 0)
    f === :lockcontrols && return Ptr{xcb_xkb_sa_lock_controls_t}(x + 0)
    f === :message && return Ptr{xcb_xkb_sa_action_message_t}(x + 0)
    f === :redirect && return Ptr{xcb_xkb_sa_redirect_key_t}(x + 0)
    f === :devbtn && return Ptr{xcb_xkb_sa_device_btn_t}(x + 0)
    f === :lockdevbtn && return Ptr{xcb_xkb_sa_lock_device_btn_t}(x + 0)
    f === :devval && return Ptr{xcb_xkb_sa_device_valuator_t}(x + 0)
    f === :type && return Ptr{UInt8}(x + 0)
    return getfield(x, f)
end

function Base.getproperty(x::xcb_xkb_action_t, f::Symbol)
    r = Ref{xcb_xkb_action_t}(x)
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_action_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{xcb_xkb_action_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

const __U_xcb_xkb_action_t = Union{xcb_xkb_sa_no_action_t, xcb_xkb_sa_set_mods_t, xcb_xkb_sa_latch_mods_t, xcb_xkb_sa_lock_mods_t, xcb_xkb_sa_set_group_t, xcb_xkb_sa_latch_group_t, xcb_xkb_sa_lock_group_t, xcb_xkb_sa_move_ptr_t, xcb_xkb_sa_ptr_btn_t, xcb_xkb_sa_lock_ptr_btn_t, xcb_xkb_sa_set_ptr_dflt_t, xcb_xkb_sa_iso_lock_t, xcb_xkb_sa_terminate_t, xcb_xkb_sa_switch_screen_t, xcb_xkb_sa_set_controls_t, xcb_xkb_sa_lock_controls_t, xcb_xkb_sa_action_message_t, xcb_xkb_sa_redirect_key_t, xcb_xkb_sa_device_btn_t, xcb_xkb_sa_lock_device_btn_t, xcb_xkb_sa_device_valuator_t, UInt8}

function xcb_xkb_action_t(val::__U_xcb_xkb_action_t)
    ref = Ref{xcb_xkb_action_t}()
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_action_t}, ref)
    if val isa xcb_xkb_sa_no_action_t
        ptr.noaction = val
    elseif val isa xcb_xkb_sa_set_mods_t
        ptr.setmods = val
    elseif val isa xcb_xkb_sa_latch_mods_t
        ptr.latchmods = val
    elseif val isa xcb_xkb_sa_lock_mods_t
        ptr.lockmods = val
    elseif val isa xcb_xkb_sa_set_group_t
        ptr.setgroup = val
    elseif val isa xcb_xkb_sa_latch_group_t
        ptr.latchgroup = val
    elseif val isa xcb_xkb_sa_lock_group_t
        ptr.lockgroup = val
    elseif val isa xcb_xkb_sa_move_ptr_t
        ptr.moveptr = val
    elseif val isa xcb_xkb_sa_ptr_btn_t
        ptr.ptrbtn = val
    elseif val isa xcb_xkb_sa_lock_ptr_btn_t
        ptr.lockptrbtn = val
    elseif val isa xcb_xkb_sa_set_ptr_dflt_t
        ptr.setptrdflt = val
    elseif val isa xcb_xkb_sa_iso_lock_t
        ptr.isolock = val
    elseif val isa xcb_xkb_sa_terminate_t
        ptr.terminate = val
    elseif val isa xcb_xkb_sa_switch_screen_t
        ptr.switchscreen = val
    elseif val isa xcb_xkb_sa_set_controls_t
        ptr.setcontrols = val
    elseif val isa xcb_xkb_sa_lock_controls_t
        ptr.lockcontrols = val
    elseif val isa xcb_xkb_sa_action_message_t
        ptr.message = val
    elseif val isa xcb_xkb_sa_redirect_key_t
        ptr.redirect = val
    elseif val isa xcb_xkb_sa_device_btn_t
        ptr.devbtn = val
    elseif val isa xcb_xkb_sa_lock_device_btn_t
        ptr.lockdevbtn = val
    elseif val isa xcb_xkb_sa_device_valuator_t
        ptr.devval = val
    elseif val isa UInt8
        ptr.type = val
    end
    ref[]
end

"""
    xcb_xkb_action_iterator_t

[`xcb_xkb_action_iterator_t`](@ref)
"""
struct xcb_xkb_action_iterator_t
    data::Ptr{xcb_xkb_action_t}
    rem::Cint
    index::Cint
end

"""
    xcb_xkb_use_extension_cookie_t

[`xcb_xkb_use_extension_cookie_t`](@ref)
"""
struct xcb_xkb_use_extension_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_use_extension_request_t

[`xcb_xkb_use_extension_request_t`](@ref)
"""
struct xcb_xkb_use_extension_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    wantedMajor::UInt16
    wantedMinor::UInt16
end

"""
    xcb_xkb_use_extension_reply_t

[`xcb_xkb_use_extension_reply_t`](@ref)
"""
struct xcb_xkb_use_extension_reply_t
    response_type::UInt8
    supported::UInt8
    sequence::UInt16
    length::UInt32
    serverMajor::UInt16
    serverMinor::UInt16
    pad0::NTuple{20, UInt8}
end

"""
    xcb_xkb_select_events_details_t

[`xcb_xkb_select_events_details_t`](@ref)
"""
struct xcb_xkb_select_events_details_t
    affectNewKeyboard::UInt16
    newKeyboardDetails::UInt16
    affectState::UInt16
    stateDetails::UInt16
    affectCtrls::UInt32
    ctrlDetails::UInt32
    affectIndicatorState::UInt32
    indicatorStateDetails::UInt32
    affectIndicatorMap::UInt32
    indicatorMapDetails::UInt32
    affectNames::UInt16
    namesDetails::UInt16
    affectCompat::UInt8
    compatDetails::UInt8
    affectBell::UInt8
    bellDetails::UInt8
    affectMsgDetails::UInt8
    msgDetails::UInt8
    affectAccessX::UInt16
    accessXDetails::UInt16
    affectExtDev::UInt16
    extdevDetails::UInt16
end

"""
    xcb_xkb_select_events_request_t

[`xcb_xkb_select_events_request_t`](@ref)
"""
struct xcb_xkb_select_events_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    affectWhich::UInt16
    clear::UInt16
    selectAll::UInt16
    affectMap::UInt16
    map::UInt16
end

"""
    xcb_xkb_bell_request_t

[`xcb_xkb_bell_request_t`](@ref)
"""
struct xcb_xkb_bell_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    bellClass::xcb_xkb_bell_class_spec_t
    bellID::xcb_xkb_id_spec_t
    percent::Int8
    forceSound::UInt8
    eventOnly::UInt8
    pad0::UInt8
    pitch::Int16
    duration::Int16
    pad1::NTuple{2, UInt8}
    name::xcb_atom_t
    window::xcb_window_t
end

"""
    xcb_xkb_get_state_cookie_t

[`xcb_xkb_get_state_cookie_t`](@ref)
"""
struct xcb_xkb_get_state_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_state_request_t

[`xcb_xkb_get_state_request_t`](@ref)
"""
struct xcb_xkb_get_state_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_get_state_reply_t

[`xcb_xkb_get_state_reply_t`](@ref)
"""
struct xcb_xkb_get_state_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    mods::UInt8
    baseMods::UInt8
    latchedMods::UInt8
    lockedMods::UInt8
    group::UInt8
    lockedGroup::UInt8
    baseGroup::Int16
    latchedGroup::Int16
    compatState::UInt8
    grabMods::UInt8
    compatGrabMods::UInt8
    lookupMods::UInt8
    compatLookupMods::UInt8
    pad0::UInt8
    ptrBtnState::UInt16
    pad1::NTuple{6, UInt8}
end

"""
    xcb_xkb_latch_lock_state_request_t

[`xcb_xkb_latch_lock_state_request_t`](@ref)
"""
struct xcb_xkb_latch_lock_state_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    affectModLocks::UInt8
    modLocks::UInt8
    lockGroup::UInt8
    groupLock::UInt8
    affectModLatches::UInt8
    pad0::UInt8
    pad1::UInt8
    latchGroup::UInt8
    groupLatch::UInt16
end

"""
    xcb_xkb_get_controls_cookie_t

[`xcb_xkb_get_controls_cookie_t`](@ref)
"""
struct xcb_xkb_get_controls_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_controls_request_t

[`xcb_xkb_get_controls_request_t`](@ref)
"""
struct xcb_xkb_get_controls_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_get_controls_reply_t

[`xcb_xkb_get_controls_reply_t`](@ref)
"""
struct xcb_xkb_get_controls_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    mouseKeysDfltBtn::UInt8
    numGroups::UInt8
    groupsWrap::UInt8
    internalModsMask::UInt8
    ignoreLockModsMask::UInt8
    internalModsRealMods::UInt8
    ignoreLockModsRealMods::UInt8
    pad0::UInt8
    internalModsVmods::UInt16
    ignoreLockModsVmods::UInt16
    repeatDelay::UInt16
    repeatInterval::UInt16
    slowKeysDelay::UInt16
    debounceDelay::UInt16
    mouseKeysDelay::UInt16
    mouseKeysInterval::UInt16
    mouseKeysTimeToMax::UInt16
    mouseKeysMaxSpeed::UInt16
    mouseKeysCurve::Int16
    accessXOption::UInt16
    accessXTimeout::UInt16
    accessXTimeoutOptionsMask::UInt16
    accessXTimeoutOptionsValues::UInt16
    pad1::NTuple{2, UInt8}
    accessXTimeoutMask::UInt32
    accessXTimeoutValues::UInt32
    enabledControls::UInt32
    perKeyRepeat::NTuple{32, UInt8}
end

"""
    xcb_xkb_set_controls_request_t

[`xcb_xkb_set_controls_request_t`](@ref)
"""
struct xcb_xkb_set_controls_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    affectInternalRealMods::UInt8
    internalRealMods::UInt8
    affectIgnoreLockRealMods::UInt8
    ignoreLockRealMods::UInt8
    affectInternalVirtualMods::UInt16
    internalVirtualMods::UInt16
    affectIgnoreLockVirtualMods::UInt16
    ignoreLockVirtualMods::UInt16
    mouseKeysDfltBtn::UInt8
    groupsWrap::UInt8
    accessXOptions::UInt16
    pad0::NTuple{2, UInt8}
    affectEnabledControls::UInt32
    enabledControls::UInt32
    changeControls::UInt32
    repeatDelay::UInt16
    repeatInterval::UInt16
    slowKeysDelay::UInt16
    debounceDelay::UInt16
    mouseKeysDelay::UInt16
    mouseKeysInterval::UInt16
    mouseKeysTimeToMax::UInt16
    mouseKeysMaxSpeed::UInt16
    mouseKeysCurve::Int16
    accessXTimeout::UInt16
    accessXTimeoutMask::UInt32
    accessXTimeoutValues::UInt32
    accessXTimeoutOptionsMask::UInt16
    accessXTimeoutOptionsValues::UInt16
    perKeyRepeat::NTuple{32, UInt8}
end

"""
    xcb_xkb_get_map_cookie_t

[`xcb_xkb_get_map_cookie_t`](@ref)
"""
struct xcb_xkb_get_map_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_map_request_t

[`xcb_xkb_get_map_request_t`](@ref)
"""
struct xcb_xkb_get_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    full::UInt16
    partial::UInt16
    firstType::UInt8
    nTypes::UInt8
    firstKeySym::xcb_keycode_t
    nKeySyms::UInt8
    firstKeyAction::xcb_keycode_t
    nKeyActions::UInt8
    firstKeyBehavior::xcb_keycode_t
    nKeyBehaviors::UInt8
    virtualMods::UInt16
    firstKeyExplicit::xcb_keycode_t
    nKeyExplicit::UInt8
    firstModMapKey::xcb_keycode_t
    nModMapKeys::UInt8
    firstVModMapKey::xcb_keycode_t
    nVModMapKeys::UInt8
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_get_map_map_t

[`xcb_xkb_get_map_map_t`](@ref)
"""
struct xcb_xkb_get_map_map_t
    types_rtrn::Ptr{xcb_xkb_key_type_t}
    syms_rtrn::Ptr{xcb_xkb_key_sym_map_t}
    acts_rtrn_count::Ptr{UInt8}
    pad2::Ptr{UInt8}
    acts_rtrn_acts::Ptr{xcb_xkb_action_t}
    behaviors_rtrn::Ptr{xcb_xkb_set_behavior_t}
    vmods_rtrn::Ptr{UInt8}
    pad3::Ptr{UInt8}
    explicit_rtrn::Ptr{xcb_xkb_set_explicit_t}
    pad4::Ptr{UInt8}
    modmap_rtrn::Ptr{xcb_xkb_key_mod_map_t}
    pad5::Ptr{UInt8}
    vmodmap_rtrn::Ptr{xcb_xkb_key_v_mod_map_t}
end

"""
    xcb_xkb_get_map_reply_t

[`xcb_xkb_get_map_reply_t`](@ref)
"""
struct xcb_xkb_get_map_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    pad0::NTuple{2, UInt8}
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    present::UInt16
    firstType::UInt8
    nTypes::UInt8
    totalTypes::UInt8
    firstKeySym::xcb_keycode_t
    totalSyms::UInt16
    nKeySyms::UInt8
    firstKeyAction::xcb_keycode_t
    totalActions::UInt16
    nKeyActions::UInt8
    firstKeyBehavior::xcb_keycode_t
    nKeyBehaviors::UInt8
    totalKeyBehaviors::UInt8
    firstKeyExplicit::xcb_keycode_t
    nKeyExplicit::UInt8
    totalKeyExplicit::UInt8
    firstModMapKey::xcb_keycode_t
    nModMapKeys::UInt8
    totalModMapKeys::UInt8
    firstVModMapKey::xcb_keycode_t
    nVModMapKeys::UInt8
    totalVModMapKeys::UInt8
    pad1::UInt8
    virtualMods::UInt16
end

"""
    xcb_xkb_set_map_values_t

[`xcb_xkb_set_map_values_t`](@ref)
"""
struct xcb_xkb_set_map_values_t
    types::Ptr{xcb_xkb_set_key_type_t}
    syms::Ptr{xcb_xkb_key_sym_map_t}
    actionsCount::Ptr{UInt8}
    actions::Ptr{xcb_xkb_action_t}
    behaviors::Ptr{xcb_xkb_set_behavior_t}
    vmods::Ptr{UInt8}
    explicit::Ptr{xcb_xkb_set_explicit_t}
    modmap::Ptr{xcb_xkb_key_mod_map_t}
    vmodmap::Ptr{xcb_xkb_key_v_mod_map_t}
end

"""
    xcb_xkb_set_map_request_t

[`xcb_xkb_set_map_request_t`](@ref)
"""
struct xcb_xkb_set_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    present::UInt16
    flags::UInt16
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    firstType::UInt8
    nTypes::UInt8
    firstKeySym::xcb_keycode_t
    nKeySyms::UInt8
    totalSyms::UInt16
    firstKeyAction::xcb_keycode_t
    nKeyActions::UInt8
    totalActions::UInt16
    firstKeyBehavior::xcb_keycode_t
    nKeyBehaviors::UInt8
    totalKeyBehaviors::UInt8
    firstKeyExplicit::xcb_keycode_t
    nKeyExplicit::UInt8
    totalKeyExplicit::UInt8
    firstModMapKey::xcb_keycode_t
    nModMapKeys::UInt8
    totalModMapKeys::UInt8
    firstVModMapKey::xcb_keycode_t
    nVModMapKeys::UInt8
    totalVModMapKeys::UInt8
    virtualMods::UInt16
end

"""
    xcb_xkb_get_compat_map_cookie_t

[`xcb_xkb_get_compat_map_cookie_t`](@ref)
"""
struct xcb_xkb_get_compat_map_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_compat_map_request_t

[`xcb_xkb_get_compat_map_request_t`](@ref)
"""
struct xcb_xkb_get_compat_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    groups::UInt8
    getAllSI::UInt8
    firstSI::UInt16
    nSI::UInt16
end

"""
    xcb_xkb_get_compat_map_reply_t

[`xcb_xkb_get_compat_map_reply_t`](@ref)
"""
struct xcb_xkb_get_compat_map_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    groupsRtrn::UInt8
    pad0::UInt8
    firstSIRtrn::UInt16
    nSIRtrn::UInt16
    nTotalSI::UInt16
    pad1::NTuple{16, UInt8}
end

"""
    xcb_xkb_set_compat_map_request_t

[`xcb_xkb_set_compat_map_request_t`](@ref)
"""
struct xcb_xkb_set_compat_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::UInt8
    recomputeActions::UInt8
    truncateSI::UInt8
    groups::UInt8
    firstSI::UInt16
    nSI::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_xkb_get_indicator_state_cookie_t

[`xcb_xkb_get_indicator_state_cookie_t`](@ref)
"""
struct xcb_xkb_get_indicator_state_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_indicator_state_request_t

[`xcb_xkb_get_indicator_state_request_t`](@ref)
"""
struct xcb_xkb_get_indicator_state_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_get_indicator_state_reply_t

[`xcb_xkb_get_indicator_state_reply_t`](@ref)
"""
struct xcb_xkb_get_indicator_state_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    state::UInt32
    pad0::NTuple{20, UInt8}
end

"""
    xcb_xkb_get_indicator_map_cookie_t

[`xcb_xkb_get_indicator_map_cookie_t`](@ref)
"""
struct xcb_xkb_get_indicator_map_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_indicator_map_request_t

[`xcb_xkb_get_indicator_map_request_t`](@ref)
"""
struct xcb_xkb_get_indicator_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
    which::UInt32
end

"""
    xcb_xkb_get_indicator_map_reply_t

[`xcb_xkb_get_indicator_map_reply_t`](@ref)
"""
struct xcb_xkb_get_indicator_map_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    which::UInt32
    realIndicators::UInt32
    nIndicators::UInt8
    pad0::NTuple{15, UInt8}
end

"""
    xcb_xkb_set_indicator_map_request_t

[`xcb_xkb_set_indicator_map_request_t`](@ref)
"""
struct xcb_xkb_set_indicator_map_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
    which::UInt32
end

"""
    xcb_xkb_get_named_indicator_cookie_t

[`xcb_xkb_get_named_indicator_cookie_t`](@ref)
"""
struct xcb_xkb_get_named_indicator_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_named_indicator_request_t

[`xcb_xkb_get_named_indicator_request_t`](@ref)
"""
struct xcb_xkb_get_named_indicator_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    ledClass::xcb_xkb_led_class_spec_t
    ledID::xcb_xkb_id_spec_t
    pad0::NTuple{2, UInt8}
    indicator::xcb_atom_t
end

"""
    xcb_xkb_get_named_indicator_reply_t

[`xcb_xkb_get_named_indicator_reply_t`](@ref)
"""
struct xcb_xkb_get_named_indicator_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    indicator::xcb_atom_t
    found::UInt8
    on::UInt8
    realIndicator::UInt8
    ndx::UInt8
    map_flags::UInt8
    map_whichGroups::UInt8
    map_groups::UInt8
    map_whichMods::UInt8
    map_mods::UInt8
    map_realMods::UInt8
    map_vmod::UInt16
    map_ctrls::UInt32
    supported::UInt8
    pad0::NTuple{3, UInt8}
end

"""
    xcb_xkb_set_named_indicator_request_t

[`xcb_xkb_set_named_indicator_request_t`](@ref)
"""
struct xcb_xkb_set_named_indicator_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    ledClass::xcb_xkb_led_class_spec_t
    ledID::xcb_xkb_id_spec_t
    pad0::NTuple{2, UInt8}
    indicator::xcb_atom_t
    setState::UInt8
    on::UInt8
    setMap::UInt8
    createMap::UInt8
    pad1::UInt8
    map_flags::UInt8
    map_whichGroups::UInt8
    map_groups::UInt8
    map_whichMods::UInt8
    map_realMods::UInt8
    map_vmods::UInt16
    map_ctrls::UInt32
end

"""
    xcb_xkb_get_names_cookie_t

[`xcb_xkb_get_names_cookie_t`](@ref)
"""
struct xcb_xkb_get_names_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_names_request_t

[`xcb_xkb_get_names_request_t`](@ref)
"""
struct xcb_xkb_get_names_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
    which::UInt32
end

"""
    xcb_xkb_get_names_value_list_t

[`xcb_xkb_get_names_value_list_t`](@ref)
"""
struct xcb_xkb_get_names_value_list_t
    keycodesName::xcb_atom_t
    geometryName::xcb_atom_t
    symbolsName::xcb_atom_t
    physSymbolsName::xcb_atom_t
    typesName::xcb_atom_t
    compatName::xcb_atom_t
    typeNames::Ptr{xcb_atom_t}
    nLevelsPerType::Ptr{UInt8}
    pad1::Ptr{UInt8}
    ktLevelNames::Ptr{xcb_atom_t}
    indicatorNames::Ptr{xcb_atom_t}
    virtualModNames::Ptr{xcb_atom_t}
    groups::Ptr{xcb_atom_t}
    keyNames::Ptr{xcb_xkb_key_name_t}
    keyAliases::Ptr{xcb_xkb_key_alias_t}
    radioGroupNames::Ptr{xcb_atom_t}
end

"""
    xcb_xkb_get_names_reply_t

[`xcb_xkb_get_names_reply_t`](@ref)
"""
struct xcb_xkb_get_names_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    which::UInt32
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    nTypes::UInt8
    groupNames::UInt8
    virtualMods::UInt16
    firstKey::xcb_keycode_t
    nKeys::UInt8
    indicators::UInt32
    nRadioGroups::UInt8
    nKeyAliases::UInt8
    nKTLevels::UInt16
    pad0::NTuple{4, UInt8}
end

"""
    xcb_xkb_set_names_values_t

[`xcb_xkb_set_names_values_t`](@ref)
"""
struct xcb_xkb_set_names_values_t
    keycodesName::xcb_atom_t
    geometryName::xcb_atom_t
    symbolsName::xcb_atom_t
    physSymbolsName::xcb_atom_t
    typesName::xcb_atom_t
    compatName::xcb_atom_t
    typeNames::Ptr{xcb_atom_t}
    nLevelsPerType::Ptr{UInt8}
    ktLevelNames::Ptr{xcb_atom_t}
    indicatorNames::Ptr{xcb_atom_t}
    virtualModNames::Ptr{xcb_atom_t}
    groups::Ptr{xcb_atom_t}
    keyNames::Ptr{xcb_xkb_key_name_t}
    keyAliases::Ptr{xcb_xkb_key_alias_t}
    radioGroupNames::Ptr{xcb_atom_t}
end

"""
    xcb_xkb_set_names_request_t

[`xcb_xkb_set_names_request_t`](@ref)
"""
struct xcb_xkb_set_names_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    virtualMods::UInt16
    which::UInt32
    firstType::UInt8
    nTypes::UInt8
    firstKTLevelt::UInt8
    nKTLevels::UInt8
    indicators::UInt32
    groupNames::UInt8
    nRadioGroups::UInt8
    firstKey::xcb_keycode_t
    nKeys::UInt8
    nKeyAliases::UInt8
    pad0::UInt8
    totalKTLevelNames::UInt16
end

"""
    xcb_xkb_per_client_flags_cookie_t

[`xcb_xkb_per_client_flags_cookie_t`](@ref)
"""
struct xcb_xkb_per_client_flags_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_per_client_flags_request_t

[`xcb_xkb_per_client_flags_request_t`](@ref)
"""
struct xcb_xkb_per_client_flags_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    pad0::NTuple{2, UInt8}
    change::UInt32
    value::UInt32
    ctrlsToChange::UInt32
    autoCtrls::UInt32
    autoCtrlsValues::UInt32
end

"""
    xcb_xkb_per_client_flags_reply_t

[`xcb_xkb_per_client_flags_reply_t`](@ref)
"""
struct xcb_xkb_per_client_flags_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    supported::UInt32
    value::UInt32
    autoCtrls::UInt32
    autoCtrlsValues::UInt32
    pad0::NTuple{8, UInt8}
end

"""
    xcb_xkb_list_components_cookie_t

[`xcb_xkb_list_components_cookie_t`](@ref)
"""
struct xcb_xkb_list_components_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_list_components_request_t

[`xcb_xkb_list_components_request_t`](@ref)
"""
struct xcb_xkb_list_components_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    maxNames::UInt16
end

"""
    xcb_xkb_list_components_reply_t

[`xcb_xkb_list_components_reply_t`](@ref)
"""
struct xcb_xkb_list_components_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    nKeymaps::UInt16
    nKeycodes::UInt16
    nTypes::UInt16
    nCompatMaps::UInt16
    nSymbols::UInt16
    nGeometries::UInt16
    extra::UInt16
    pad0::NTuple{10, UInt8}
end

"""
    xcb_xkb_get_kbd_by_name_cookie_t

[`xcb_xkb_get_kbd_by_name_cookie_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_kbd_by_name_request_t

[`xcb_xkb_get_kbd_by_name_request_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    need::UInt16
    want::UInt16
    load::UInt8
    pad0::UInt8
end

"""
    xcb_xkb_get_kbd_by_name_replies_types_map_t

[`xcb_xkb_get_kbd_by_name_replies_types_map_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_replies_types_map_t
    types_rtrn::Ptr{xcb_xkb_key_type_t}
    syms_rtrn::Ptr{xcb_xkb_key_sym_map_t}
    acts_rtrn_count::Ptr{UInt8}
    acts_rtrn_acts::Ptr{xcb_xkb_action_t}
    behaviors_rtrn::Ptr{xcb_xkb_set_behavior_t}
    vmods_rtrn::Ptr{UInt8}
    explicit_rtrn::Ptr{xcb_xkb_set_explicit_t}
    modmap_rtrn::Ptr{xcb_xkb_key_mod_map_t}
    vmodmap_rtrn::Ptr{xcb_xkb_key_v_mod_map_t}
end

"""
    xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t

[`xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t
    keycodesName::xcb_atom_t
    geometryName::xcb_atom_t
    symbolsName::xcb_atom_t
    physSymbolsName::xcb_atom_t
    typesName::xcb_atom_t
    compatName::xcb_atom_t
    typeNames::Ptr{xcb_atom_t}
    nLevelsPerType::Ptr{UInt8}
    ktLevelNames::Ptr{xcb_atom_t}
    indicatorNames::Ptr{xcb_atom_t}
    virtualModNames::Ptr{xcb_atom_t}
    groups::Ptr{xcb_atom_t}
    keyNames::Ptr{xcb_xkb_key_name_t}
    keyAliases::Ptr{xcb_xkb_key_alias_t}
    radioGroupNames::Ptr{xcb_atom_t}
end

struct __JL_Ctag_18
    getmap_type::UInt8
    typeDeviceID::UInt8
    getmap_sequence::UInt16
    getmap_length::UInt32
    pad1::NTuple{2, UInt8}
    typeMinKeyCode::xcb_keycode_t
    typeMaxKeyCode::xcb_keycode_t
    present::UInt16
    firstType::UInt8
    nTypes::UInt8
    totalTypes::UInt8
    firstKeySym::xcb_keycode_t
    totalSyms::UInt16
    nKeySyms::UInt8
    firstKeyAction::xcb_keycode_t
    totalActions::UInt16
    nKeyActions::UInt8
    firstKeyBehavior::xcb_keycode_t
    nKeyBehaviors::UInt8
    totalKeyBehaviors::UInt8
    firstKeyExplicit::xcb_keycode_t
    nKeyExplicit::UInt8
    totalKeyExplicit::UInt8
    firstModMapKey::xcb_keycode_t
    nModMapKeys::UInt8
    totalModMapKeys::UInt8
    firstVModMapKey::xcb_keycode_t
    nVModMapKeys::UInt8
    totalVModMapKeys::UInt8
    pad2::UInt8
    virtualMods::UInt16
    map::xcb_xkb_get_kbd_by_name_replies_types_map_t
end
function Base.getproperty(x::Ptr{__JL_Ctag_18}, f::Symbol)
    f === :getmap_type && return Ptr{UInt8}(x + 0)
    f === :typeDeviceID && return Ptr{UInt8}(x + 1)
    f === :getmap_sequence && return Ptr{UInt16}(x + 2)
    f === :getmap_length && return Ptr{UInt32}(x + 4)
    f === :pad1 && return Ptr{NTuple{2, UInt8}}(x + 8)
    f === :typeMinKeyCode && return Ptr{xcb_keycode_t}(x + 10)
    f === :typeMaxKeyCode && return Ptr{xcb_keycode_t}(x + 11)
    f === :present && return Ptr{UInt16}(x + 12)
    f === :firstType && return Ptr{UInt8}(x + 14)
    f === :nTypes && return Ptr{UInt8}(x + 15)
    f === :totalTypes && return Ptr{UInt8}(x + 16)
    f === :firstKeySym && return Ptr{xcb_keycode_t}(x + 17)
    f === :totalSyms && return Ptr{UInt16}(x + 18)
    f === :nKeySyms && return Ptr{UInt8}(x + 20)
    f === :firstKeyAction && return Ptr{xcb_keycode_t}(x + 21)
    f === :totalActions && return Ptr{UInt16}(x + 22)
    f === :nKeyActions && return Ptr{UInt8}(x + 24)
    f === :firstKeyBehavior && return Ptr{xcb_keycode_t}(x + 25)
    f === :nKeyBehaviors && return Ptr{UInt8}(x + 26)
    f === :totalKeyBehaviors && return Ptr{UInt8}(x + 27)
    f === :firstKeyExplicit && return Ptr{xcb_keycode_t}(x + 28)
    f === :nKeyExplicit && return Ptr{UInt8}(x + 29)
    f === :totalKeyExplicit && return Ptr{UInt8}(x + 30)
    f === :firstModMapKey && return Ptr{xcb_keycode_t}(x + 31)
    f === :nModMapKeys && return Ptr{UInt8}(x + 32)
    f === :totalModMapKeys && return Ptr{UInt8}(x + 33)
    f === :firstVModMapKey && return Ptr{xcb_keycode_t}(x + 34)
    f === :nVModMapKeys && return Ptr{UInt8}(x + 35)
    f === :totalVModMapKeys && return Ptr{UInt8}(x + 36)
    f === :pad2 && return Ptr{UInt8}(x + 37)
    f === :virtualMods && return Ptr{UInt16}(x + 38)
    f === :map && return Ptr{xcb_xkb_get_kbd_by_name_replies_types_map_t}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_18, f::Symbol)
    r = Ref{__JL_Ctag_18}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_18}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_18}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_19
    compatmap_type::UInt8
    compatDeviceID::UInt8
    compatmap_sequence::UInt16
    compatmap_length::UInt32
    groupsRtrn::UInt8
    pad7::UInt8
    firstSIRtrn::UInt16
    nSIRtrn::UInt16
    nTotalSI::UInt16
    pad8::NTuple{16, UInt8}
    si_rtrn::Ptr{xcb_xkb_sym_interpret_t}
    group_rtrn::Ptr{xcb_xkb_mod_def_t}
end
function Base.getproperty(x::Ptr{__JL_Ctag_19}, f::Symbol)
    f === :compatmap_type && return Ptr{UInt8}(x + 0)
    f === :compatDeviceID && return Ptr{UInt8}(x + 1)
    f === :compatmap_sequence && return Ptr{UInt16}(x + 2)
    f === :compatmap_length && return Ptr{UInt32}(x + 4)
    f === :groupsRtrn && return Ptr{UInt8}(x + 8)
    f === :pad7 && return Ptr{UInt8}(x + 9)
    f === :firstSIRtrn && return Ptr{UInt16}(x + 10)
    f === :nSIRtrn && return Ptr{UInt16}(x + 12)
    f === :nTotalSI && return Ptr{UInt16}(x + 14)
    f === :pad8 && return Ptr{NTuple{16, UInt8}}(x + 16)
    f === :si_rtrn && return Ptr{Ptr{xcb_xkb_sym_interpret_t}}(x + 32)
    f === :group_rtrn && return Ptr{Ptr{xcb_xkb_mod_def_t}}(x + 40)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_19, f::Symbol)
    r = Ref{__JL_Ctag_19}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_19}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_19}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_20
    indicatormap_type::UInt8
    indicatorDeviceID::UInt8
    indicatormap_sequence::UInt16
    indicatormap_length::UInt32
    which::UInt32
    realIndicators::UInt32
    nIndicators::UInt8
    pad9::NTuple{15, UInt8}
    maps::Ptr{xcb_xkb_indicator_map_t}
end
function Base.getproperty(x::Ptr{__JL_Ctag_20}, f::Symbol)
    f === :indicatormap_type && return Ptr{UInt8}(x + 0)
    f === :indicatorDeviceID && return Ptr{UInt8}(x + 1)
    f === :indicatormap_sequence && return Ptr{UInt16}(x + 2)
    f === :indicatormap_length && return Ptr{UInt32}(x + 4)
    f === :which && return Ptr{UInt32}(x + 8)
    f === :realIndicators && return Ptr{UInt32}(x + 12)
    f === :nIndicators && return Ptr{UInt8}(x + 16)
    f === :pad9 && return Ptr{NTuple{15, UInt8}}(x + 17)
    f === :maps && return Ptr{Ptr{xcb_xkb_indicator_map_t}}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_20, f::Symbol)
    r = Ref{__JL_Ctag_20}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_20}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_20}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_21
    keyname_type::UInt8
    keyDeviceID::UInt8
    keyname_sequence::UInt16
    keyname_length::UInt32
    which::UInt32
    keyMinKeyCode::xcb_keycode_t
    keyMaxKeyCode::xcb_keycode_t
    nTypes::UInt8
    groupNames::UInt8
    virtualMods::UInt16
    firstKey::xcb_keycode_t
    nKeys::UInt8
    indicators::UInt32
    nRadioGroups::UInt8
    nKeyAliases::UInt8
    nKTLevels::UInt16
    pad10::NTuple{4, UInt8}
    valueList::xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t
end
function Base.getproperty(x::Ptr{__JL_Ctag_21}, f::Symbol)
    f === :keyname_type && return Ptr{UInt8}(x + 0)
    f === :keyDeviceID && return Ptr{UInt8}(x + 1)
    f === :keyname_sequence && return Ptr{UInt16}(x + 2)
    f === :keyname_length && return Ptr{UInt32}(x + 4)
    f === :which && return Ptr{UInt32}(x + 8)
    f === :keyMinKeyCode && return Ptr{xcb_keycode_t}(x + 12)
    f === :keyMaxKeyCode && return Ptr{xcb_keycode_t}(x + 13)
    f === :nTypes && return Ptr{UInt8}(x + 14)
    f === :groupNames && return Ptr{UInt8}(x + 15)
    f === :virtualMods && return Ptr{UInt16}(x + 16)
    f === :firstKey && return Ptr{xcb_keycode_t}(x + 18)
    f === :nKeys && return Ptr{UInt8}(x + 19)
    f === :indicators && return Ptr{UInt32}(x + 20)
    f === :nRadioGroups && return Ptr{UInt8}(x + 24)
    f === :nKeyAliases && return Ptr{UInt8}(x + 25)
    f === :nKTLevels && return Ptr{UInt16}(x + 26)
    f === :pad10 && return Ptr{NTuple{4, UInt8}}(x + 28)
    f === :valueList && return Ptr{xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_21, f::Symbol)
    r = Ref{__JL_Ctag_21}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_21}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_21}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


struct __JL_Ctag_22
    geometry_type::UInt8
    geometryDeviceID::UInt8
    geometry_sequence::UInt16
    geometry_length::UInt32
    name::xcb_atom_t
    geometryFound::UInt8
    pad12::UInt8
    widthMM::UInt16
    heightMM::UInt16
    nProperties::UInt16
    nColors::UInt16
    nShapes::UInt16
    nSections::UInt16
    nDoodads::UInt16
    nKeyAliases::UInt16
    baseColorNdx::UInt8
    labelColorNdx::UInt8
    labelFont::Ptr{xcb_xkb_counted_string_16_t}
end
function Base.getproperty(x::Ptr{__JL_Ctag_22}, f::Symbol)
    f === :geometry_type && return Ptr{UInt8}(x + 0)
    f === :geometryDeviceID && return Ptr{UInt8}(x + 1)
    f === :geometry_sequence && return Ptr{UInt16}(x + 2)
    f === :geometry_length && return Ptr{UInt32}(x + 4)
    f === :name && return Ptr{xcb_atom_t}(x + 8)
    f === :geometryFound && return Ptr{UInt8}(x + 12)
    f === :pad12 && return Ptr{UInt8}(x + 13)
    f === :widthMM && return Ptr{UInt16}(x + 14)
    f === :heightMM && return Ptr{UInt16}(x + 16)
    f === :nProperties && return Ptr{UInt16}(x + 18)
    f === :nColors && return Ptr{UInt16}(x + 20)
    f === :nShapes && return Ptr{UInt16}(x + 22)
    f === :nSections && return Ptr{UInt16}(x + 24)
    f === :nDoodads && return Ptr{UInt16}(x + 26)
    f === :nKeyAliases && return Ptr{UInt16}(x + 28)
    f === :baseColorNdx && return Ptr{UInt8}(x + 30)
    f === :labelColorNdx && return Ptr{UInt8}(x + 31)
    f === :labelFont && return Ptr{Ptr{xcb_xkb_counted_string_16_t}}(x + 32)
    return getfield(x, f)
end

function Base.getproperty(x::__JL_Ctag_22, f::Symbol)
    r = Ref{__JL_Ctag_22}(x)
    ptr = Base.unsafe_convert(Ptr{__JL_Ctag_22}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{__JL_Ctag_22}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end


"""
    xcb_xkb_get_kbd_by_name_replies_t

[`xcb_xkb_get_kbd_by_name_replies_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_replies_t
    data::NTuple{368, UInt8}
end

function Base.getproperty(x::Ptr{xcb_xkb_get_kbd_by_name_replies_t}, f::Symbol)
    f === :types && return Ptr{__JL_Ctag_18}(x + 0)
    f === :compat_map && return Ptr{__JL_Ctag_19}(x + 112)
    f === :indicator_maps && return Ptr{__JL_Ctag_20}(x + 160)
    f === :key_names && return Ptr{__JL_Ctag_21}(x + 200)
    f === :geometry && return Ptr{__JL_Ctag_22}(x + 328)
    return getfield(x, f)
end

function Base.getproperty(x::xcb_xkb_get_kbd_by_name_replies_t, f::Symbol)
    r = Ref{xcb_xkb_get_kbd_by_name_replies_t}(x)
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_get_kbd_by_name_replies_t}, r)
    fptr = getproperty(ptr, f)
    GC.@preserve r unsafe_load(fptr)
end

function Base.setproperty!(x::Ptr{xcb_xkb_get_kbd_by_name_replies_t}, f::Symbol, v)
    unsafe_store!(getproperty(x, f), v)
end

function xcb_xkb_get_kbd_by_name_replies_t(types::__JL_Ctag_18, compat_map::__JL_Ctag_19, indicator_maps::__JL_Ctag_20, key_names::__JL_Ctag_21, geometry::__JL_Ctag_22)
    ref = Ref{xcb_xkb_get_kbd_by_name_replies_t}()
    ptr = Base.unsafe_convert(Ptr{xcb_xkb_get_kbd_by_name_replies_t}, ref)
    ptr.types = types
    ptr.compat_map = compat_map
    ptr.indicator_maps = indicator_maps
    ptr.key_names = key_names
    ptr.geometry = geometry
    ref[]
end

function xcb_xkb_get_kbd_by_name_replies_types_map(R)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map, libxcb_xkb), Ptr{xcb_xkb_get_kbd_by_name_replies_types_map_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), R)
end

"""
    xcb_xkb_get_kbd_by_name_reply_t

[`xcb_xkb_get_kbd_by_name_reply_t`](@ref)
"""
struct xcb_xkb_get_kbd_by_name_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    loaded::UInt8
    newKeyboard::UInt8
    found::UInt16
    reported::UInt16
    pad0::NTuple{16, UInt8}
end

"""
    xcb_xkb_get_device_info_cookie_t

[`xcb_xkb_get_device_info_cookie_t`](@ref)
"""
struct xcb_xkb_get_device_info_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_get_device_info_request_t

[`xcb_xkb_get_device_info_request_t`](@ref)
"""
struct xcb_xkb_get_device_info_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    wanted::UInt16
    allButtons::UInt8
    firstButton::UInt8
    nButtons::UInt8
    pad0::UInt8
    ledClass::xcb_xkb_led_class_spec_t
    ledID::xcb_xkb_id_spec_t
end

"""
    xcb_xkb_get_device_info_reply_t

[`xcb_xkb_get_device_info_reply_t`](@ref)
"""
struct xcb_xkb_get_device_info_reply_t
    response_type::UInt8
    deviceID::UInt8
    sequence::UInt16
    length::UInt32
    present::UInt16
    supported::UInt16
    unsupported::UInt16
    nDeviceLedFBs::UInt16
    firstBtnWanted::UInt8
    nBtnsWanted::UInt8
    firstBtnRtrn::UInt8
    nBtnsRtrn::UInt8
    totalBtns::UInt8
    hasOwnState::UInt8
    dfltKbdFB::UInt16
    dfltLedFB::UInt16
    pad0::NTuple{2, UInt8}
    devType::xcb_atom_t
    nameLen::UInt16
end

"""
    xcb_xkb_set_device_info_request_t

[`xcb_xkb_set_device_info_request_t`](@ref)
"""
struct xcb_xkb_set_device_info_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    deviceSpec::xcb_xkb_device_spec_t
    firstBtn::UInt8
    nBtns::UInt8
    change::UInt16
    nDeviceLedFBs::UInt16
end

"""
    xcb_xkb_set_debugging_flags_cookie_t

[`xcb_xkb_set_debugging_flags_cookie_t`](@ref)
"""
struct xcb_xkb_set_debugging_flags_cookie_t
    sequence::Cuint
end

"""
    xcb_xkb_set_debugging_flags_request_t

[`xcb_xkb_set_debugging_flags_request_t`](@ref)
"""
struct xcb_xkb_set_debugging_flags_request_t
    major_opcode::UInt8
    minor_opcode::UInt8
    length::UInt16
    msgLength::UInt16
    pad0::NTuple{2, UInt8}
    affectFlags::UInt32
    flags::UInt32
    affectCtrls::UInt32
    ctrls::UInt32
end

"""
    xcb_xkb_set_debugging_flags_reply_t

[`xcb_xkb_set_debugging_flags_reply_t`](@ref)
"""
struct xcb_xkb_set_debugging_flags_reply_t
    response_type::UInt8
    pad0::UInt8
    sequence::UInt16
    length::UInt32
    currentFlags::UInt32
    currentCtrls::UInt32
    supportedFlags::UInt32
    supportedCtrls::UInt32
    pad1::NTuple{8, UInt8}
end

"""
    xcb_xkb_new_keyboard_notify_event_t

[`xcb_xkb_new_keyboard_notify_event_t`](@ref)
"""
struct xcb_xkb_new_keyboard_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    oldDeviceID::UInt8
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    oldMinKeyCode::xcb_keycode_t
    oldMaxKeyCode::xcb_keycode_t
    requestMajor::UInt8
    requestMinor::UInt8
    changed::UInt16
    pad0::NTuple{14, UInt8}
end

"""
    xcb_xkb_map_notify_event_t

[`xcb_xkb_map_notify_event_t`](@ref)
"""
struct xcb_xkb_map_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    ptrBtnActions::UInt8
    changed::UInt16
    minKeyCode::xcb_keycode_t
    maxKeyCode::xcb_keycode_t
    firstType::UInt8
    nTypes::UInt8
    firstKeySym::xcb_keycode_t
    nKeySyms::UInt8
    firstKeyAct::xcb_keycode_t
    nKeyActs::UInt8
    firstKeyBehavior::xcb_keycode_t
    nKeyBehavior::UInt8
    firstKeyExplicit::xcb_keycode_t
    nKeyExplicit::UInt8
    firstModMapKey::xcb_keycode_t
    nModMapKeys::UInt8
    firstVModMapKey::xcb_keycode_t
    nVModMapKeys::UInt8
    virtualMods::UInt16
    pad0::NTuple{2, UInt8}
end

"""
    xcb_xkb_state_notify_event_t

[`xcb_xkb_state_notify_event_t`](@ref)
"""
struct xcb_xkb_state_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    mods::UInt8
    baseMods::UInt8
    latchedMods::UInt8
    lockedMods::UInt8
    group::UInt8
    baseGroup::Int16
    latchedGroup::Int16
    lockedGroup::UInt8
    compatState::UInt8
    grabMods::UInt8
    compatGrabMods::UInt8
    lookupMods::UInt8
    compatLoockupMods::UInt8
    ptrBtnState::UInt16
    changed::UInt16
    keycode::xcb_keycode_t
    eventType::UInt8
    requestMajor::UInt8
    requestMinor::UInt8
end

"""
    xcb_xkb_controls_notify_event_t

[`xcb_xkb_controls_notify_event_t`](@ref)
"""
struct xcb_xkb_controls_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    numGroups::UInt8
    pad0::NTuple{2, UInt8}
    changedControls::UInt32
    enabledControls::UInt32
    enabledControlChanges::UInt32
    keycode::xcb_keycode_t
    eventType::UInt8
    requestMajor::UInt8
    requestMinor::UInt8
    pad1::NTuple{4, UInt8}
end

"""
    xcb_xkb_indicator_state_notify_event_t

[`xcb_xkb_indicator_state_notify_event_t`](@ref)
"""
struct xcb_xkb_indicator_state_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    pad0::NTuple{3, UInt8}
    state::UInt32
    stateChanged::UInt32
    pad1::NTuple{12, UInt8}
end

"""
    xcb_xkb_indicator_map_notify_event_t

[`xcb_xkb_indicator_map_notify_event_t`](@ref)
"""
struct xcb_xkb_indicator_map_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    pad0::NTuple{3, UInt8}
    state::UInt32
    mapChanged::UInt32
    pad1::NTuple{12, UInt8}
end

"""
    xcb_xkb_names_notify_event_t

[`xcb_xkb_names_notify_event_t`](@ref)
"""
struct xcb_xkb_names_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    pad0::UInt8
    changed::UInt16
    firstType::UInt8
    nTypes::UInt8
    firstLevelName::UInt8
    nLevelNames::UInt8
    pad1::UInt8
    nRadioGroups::UInt8
    nKeyAliases::UInt8
    changedGroupNames::UInt8
    changedVirtualMods::UInt16
    firstKey::xcb_keycode_t
    nKeys::UInt8
    changedIndicators::UInt32
    pad2::NTuple{4, UInt8}
end

"""
    xcb_xkb_compat_map_notify_event_t

[`xcb_xkb_compat_map_notify_event_t`](@ref)
"""
struct xcb_xkb_compat_map_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    changedGroups::UInt8
    firstSI::UInt16
    nSI::UInt16
    nTotalSI::UInt16
    pad0::NTuple{16, UInt8}
end

"""
    xcb_xkb_bell_notify_event_t

[`xcb_xkb_bell_notify_event_t`](@ref)
"""
struct xcb_xkb_bell_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    bellClass::UInt8
    bellID::UInt8
    percent::UInt8
    pitch::UInt16
    duration::UInt16
    name::xcb_atom_t
    window::xcb_window_t
    eventOnly::UInt8
    pad0::NTuple{7, UInt8}
end

"""
    xcb_xkb_action_message_event_t

[`xcb_xkb_action_message_event_t`](@ref)
"""
struct xcb_xkb_action_message_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    keycode::xcb_keycode_t
    press::UInt8
    keyEventFollows::UInt8
    mods::UInt8
    group::UInt8
    message::NTuple{8, xcb_xkb_string8_t}
    pad0::NTuple{10, UInt8}
end

"""
    xcb_xkb_access_x_notify_event_t

[`xcb_xkb_access_x_notify_event_t`](@ref)
"""
struct xcb_xkb_access_x_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    keycode::xcb_keycode_t
    detailt::UInt16
    slowKeysDelay::UInt16
    debounceDelay::UInt16
    pad0::NTuple{16, UInt8}
end

"""
    xcb_xkb_extension_device_notify_event_t

[`xcb_xkb_extension_device_notify_event_t`](@ref)
"""
struct xcb_xkb_extension_device_notify_event_t
    response_type::UInt8
    xkbType::UInt8
    sequence::UInt16
    time::xcb_timestamp_t
    deviceID::UInt8
    pad0::UInt8
    reason::UInt16
    ledClass::UInt16
    ledID::UInt16
    ledsDefined::UInt32
    ledState::UInt32
    firstButton::UInt8
    nButtons::UInt8
    supported::UInt16
    unsupported::UInt16
    pad1::NTuple{2, UInt8}
end

"""
    xcb_xkb_device_spec_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_device_spec_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_device_spec_iterator_t`](@ref)
"""
function xcb_xkb_device_spec_next(i)
    ccall((:xcb_xkb_device_spec_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_device_spec_iterator_t},), i)
end

"""
    xcb_xkb_device_spec_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_device_spec_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_device_spec_end(i)
    ccall((:xcb_xkb_device_spec_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_device_spec_iterator_t,), i)
end

"""
    xcb_xkb_led_class_spec_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_led_class_spec_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_led_class_spec_iterator_t`](@ref)
"""
function xcb_xkb_led_class_spec_next(i)
    ccall((:xcb_xkb_led_class_spec_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_led_class_spec_iterator_t},), i)
end

"""
    xcb_xkb_led_class_spec_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_led_class_spec_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_led_class_spec_end(i)
    ccall((:xcb_xkb_led_class_spec_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_led_class_spec_iterator_t,), i)
end

"""
    xcb_xkb_bell_class_spec_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_bell_class_spec_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_bell_class_spec_iterator_t`](@ref)
"""
function xcb_xkb_bell_class_spec_next(i)
    ccall((:xcb_xkb_bell_class_spec_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_bell_class_spec_iterator_t},), i)
end

"""
    xcb_xkb_bell_class_spec_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_bell_class_spec_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_bell_class_spec_end(i)
    ccall((:xcb_xkb_bell_class_spec_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_bell_class_spec_iterator_t,), i)
end

"""
    xcb_xkb_id_spec_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_id_spec_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_id_spec_iterator_t`](@ref)
"""
function xcb_xkb_id_spec_next(i)
    ccall((:xcb_xkb_id_spec_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_id_spec_iterator_t},), i)
end

"""
    xcb_xkb_id_spec_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_id_spec_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_id_spec_end(i)
    ccall((:xcb_xkb_id_spec_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_id_spec_iterator_t,), i)
end

"""
    xcb_xkb_indicator_map_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_indicator_map_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_indicator_map_iterator_t`](@ref)
"""
function xcb_xkb_indicator_map_next(i)
    ccall((:xcb_xkb_indicator_map_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_indicator_map_iterator_t},), i)
end

"""
    xcb_xkb_indicator_map_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_indicator_map_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_indicator_map_end(i)
    ccall((:xcb_xkb_indicator_map_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_indicator_map_iterator_t,), i)
end

"""
    xcb_xkb_mod_def_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_mod_def_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_mod_def_iterator_t`](@ref)
"""
function xcb_xkb_mod_def_next(i)
    ccall((:xcb_xkb_mod_def_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_mod_def_iterator_t},), i)
end

"""
    xcb_xkb_mod_def_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_mod_def_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_mod_def_end(i)
    ccall((:xcb_xkb_mod_def_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_mod_def_iterator_t,), i)
end

"""
    xcb_xkb_key_name_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_name_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_name_iterator_t`](@ref)
"""
function xcb_xkb_key_name_next(i)
    ccall((:xcb_xkb_key_name_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_name_iterator_t},), i)
end

"""
    xcb_xkb_key_name_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_name_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_name_end(i)
    ccall((:xcb_xkb_key_name_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_name_iterator_t,), i)
end

"""
    xcb_xkb_key_alias_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_alias_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_alias_iterator_t`](@ref)
"""
function xcb_xkb_key_alias_next(i)
    ccall((:xcb_xkb_key_alias_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_alias_iterator_t},), i)
end

"""
    xcb_xkb_key_alias_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_alias_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_alias_end(i)
    ccall((:xcb_xkb_key_alias_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_alias_iterator_t,), i)
end

function xcb_xkb_counted_string_16_sizeof(_buffer)
    ccall((:xcb_xkb_counted_string_16_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_counted_string_16_string(R)
    ccall((:xcb_xkb_counted_string_16_string, libxcb_xkb), Ptr{Cchar}, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

function xcb_xkb_counted_string_16_string_length(R)
    ccall((:xcb_xkb_counted_string_16_string_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

function xcb_xkb_counted_string_16_string_end(R)
    ccall((:xcb_xkb_counted_string_16_string_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

function xcb_xkb_counted_string_16_alignment_pad(R)
    ccall((:xcb_xkb_counted_string_16_alignment_pad, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

function xcb_xkb_counted_string_16_alignment_pad_length(R)
    ccall((:xcb_xkb_counted_string_16_alignment_pad_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

function xcb_xkb_counted_string_16_alignment_pad_end(R)
    ccall((:xcb_xkb_counted_string_16_alignment_pad_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_counted_string_16_t},), R)
end

"""
    xcb_xkb_counted_string_16_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_counted_string_16_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_counted_string_16_iterator_t`](@ref)
"""
function xcb_xkb_counted_string_16_next(i)
    ccall((:xcb_xkb_counted_string_16_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_counted_string_16_iterator_t},), i)
end

"""
    xcb_xkb_counted_string_16_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_counted_string_16_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_counted_string_16_end(i)
    ccall((:xcb_xkb_counted_string_16_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_counted_string_16_iterator_t,), i)
end

"""
    xcb_xkb_kt_map_entry_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_kt_map_entry_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_kt_map_entry_iterator_t`](@ref)
"""
function xcb_xkb_kt_map_entry_next(i)
    ccall((:xcb_xkb_kt_map_entry_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_kt_map_entry_iterator_t},), i)
end

"""
    xcb_xkb_kt_map_entry_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_kt_map_entry_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_kt_map_entry_end(i)
    ccall((:xcb_xkb_kt_map_entry_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_kt_map_entry_iterator_t,), i)
end

function xcb_xkb_key_type_sizeof(_buffer)
    ccall((:xcb_xkb_key_type_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_key_type_map(R)
    ccall((:xcb_xkb_key_type_map, libxcb_xkb), Ptr{xcb_xkb_kt_map_entry_t}, (Ptr{xcb_xkb_key_type_t},), R)
end

function xcb_xkb_key_type_map_length(R)
    ccall((:xcb_xkb_key_type_map_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_key_type_t},), R)
end

function xcb_xkb_key_type_map_iterator(R)
    ccall((:xcb_xkb_key_type_map_iterator, libxcb_xkb), xcb_xkb_kt_map_entry_iterator_t, (Ptr{xcb_xkb_key_type_t},), R)
end

function xcb_xkb_key_type_preserve(R)
    ccall((:xcb_xkb_key_type_preserve, libxcb_xkb), Ptr{xcb_xkb_mod_def_t}, (Ptr{xcb_xkb_key_type_t},), R)
end

function xcb_xkb_key_type_preserve_length(R)
    ccall((:xcb_xkb_key_type_preserve_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_key_type_t},), R)
end

function xcb_xkb_key_type_preserve_iterator(R)
    ccall((:xcb_xkb_key_type_preserve_iterator, libxcb_xkb), xcb_xkb_mod_def_iterator_t, (Ptr{xcb_xkb_key_type_t},), R)
end

"""
    xcb_xkb_key_type_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_type_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_type_iterator_t`](@ref)
"""
function xcb_xkb_key_type_next(i)
    ccall((:xcb_xkb_key_type_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_type_iterator_t},), i)
end

"""
    xcb_xkb_key_type_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_type_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_type_end(i)
    ccall((:xcb_xkb_key_type_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_type_iterator_t,), i)
end

function xcb_xkb_key_sym_map_sizeof(_buffer)
    ccall((:xcb_xkb_key_sym_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_key_sym_map_syms(R)
    ccall((:xcb_xkb_key_sym_map_syms, libxcb_xkb), Ptr{xcb_keysym_t}, (Ptr{xcb_xkb_key_sym_map_t},), R)
end

function xcb_xkb_key_sym_map_syms_length(R)
    ccall((:xcb_xkb_key_sym_map_syms_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_key_sym_map_t},), R)
end

function xcb_xkb_key_sym_map_syms_end(R)
    ccall((:xcb_xkb_key_sym_map_syms_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_key_sym_map_t},), R)
end

"""
    xcb_xkb_key_sym_map_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_sym_map_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_sym_map_iterator_t`](@ref)
"""
function xcb_xkb_key_sym_map_next(i)
    ccall((:xcb_xkb_key_sym_map_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_sym_map_iterator_t},), i)
end

"""
    xcb_xkb_key_sym_map_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_sym_map_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_sym_map_end(i)
    ccall((:xcb_xkb_key_sym_map_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_sym_map_iterator_t,), i)
end

"""
    xcb_xkb_common_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_common_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_common_behavior_iterator_t`](@ref)
"""
function xcb_xkb_common_behavior_next(i)
    ccall((:xcb_xkb_common_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_common_behavior_iterator_t},), i)
end

"""
    xcb_xkb_common_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_common_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_common_behavior_end(i)
    ccall((:xcb_xkb_common_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_common_behavior_iterator_t,), i)
end

"""
    xcb_xkb_default_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_default_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_default_behavior_iterator_t`](@ref)
"""
function xcb_xkb_default_behavior_next(i)
    ccall((:xcb_xkb_default_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_default_behavior_iterator_t},), i)
end

"""
    xcb_xkb_default_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_default_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_default_behavior_end(i)
    ccall((:xcb_xkb_default_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_default_behavior_iterator_t,), i)
end

"""
    xcb_xkb_lock_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_lock_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_lock_behavior_iterator_t`](@ref)
"""
function xcb_xkb_lock_behavior_next(i)
    ccall((:xcb_xkb_lock_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_lock_behavior_iterator_t},), i)
end

"""
    xcb_xkb_lock_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_lock_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_lock_behavior_end(i)
    ccall((:xcb_xkb_lock_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_lock_behavior_iterator_t,), i)
end

"""
    xcb_xkb_radio_group_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_radio_group_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_radio_group_behavior_iterator_t`](@ref)
"""
function xcb_xkb_radio_group_behavior_next(i)
    ccall((:xcb_xkb_radio_group_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_radio_group_behavior_iterator_t},), i)
end

"""
    xcb_xkb_radio_group_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_radio_group_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_radio_group_behavior_end(i)
    ccall((:xcb_xkb_radio_group_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_radio_group_behavior_iterator_t,), i)
end

"""
    xcb_xkb_overlay_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_overlay_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_overlay_behavior_iterator_t`](@ref)
"""
function xcb_xkb_overlay_behavior_next(i)
    ccall((:xcb_xkb_overlay_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_overlay_behavior_iterator_t},), i)
end

"""
    xcb_xkb_overlay_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_overlay_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_overlay_behavior_end(i)
    ccall((:xcb_xkb_overlay_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_overlay_behavior_iterator_t,), i)
end

"""
    xcb_xkb_permament_lock_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_permament_lock_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_permament_lock_behavior_iterator_t`](@ref)
"""
function xcb_xkb_permament_lock_behavior_next(i)
    ccall((:xcb_xkb_permament_lock_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_permament_lock_behavior_iterator_t},), i)
end

"""
    xcb_xkb_permament_lock_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_permament_lock_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_permament_lock_behavior_end(i)
    ccall((:xcb_xkb_permament_lock_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_permament_lock_behavior_iterator_t,), i)
end

"""
    xcb_xkb_permament_radio_group_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_permament_radio_group_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_permament_radio_group_behavior_iterator_t`](@ref)
"""
function xcb_xkb_permament_radio_group_behavior_next(i)
    ccall((:xcb_xkb_permament_radio_group_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_permament_radio_group_behavior_iterator_t},), i)
end

"""
    xcb_xkb_permament_radio_group_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_permament_radio_group_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_permament_radio_group_behavior_end(i)
    ccall((:xcb_xkb_permament_radio_group_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_permament_radio_group_behavior_iterator_t,), i)
end

"""
    xcb_xkb_permament_overlay_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_permament_overlay_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_permament_overlay_behavior_iterator_t`](@ref)
"""
function xcb_xkb_permament_overlay_behavior_next(i)
    ccall((:xcb_xkb_permament_overlay_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_permament_overlay_behavior_iterator_t},), i)
end

"""
    xcb_xkb_permament_overlay_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_permament_overlay_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_permament_overlay_behavior_end(i)
    ccall((:xcb_xkb_permament_overlay_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_permament_overlay_behavior_iterator_t,), i)
end

"""
    xcb_xkb_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_behavior_iterator_t`](@ref)
"""
function xcb_xkb_behavior_next(i)
    ccall((:xcb_xkb_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_behavior_iterator_t},), i)
end

"""
    xcb_xkb_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_behavior_end(i)
    ccall((:xcb_xkb_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_behavior_iterator_t,), i)
end

"""
    xcb_xkb_set_behavior_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_set_behavior_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_set_behavior_iterator_t`](@ref)
"""
function xcb_xkb_set_behavior_next(i)
    ccall((:xcb_xkb_set_behavior_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_set_behavior_iterator_t},), i)
end

"""
    xcb_xkb_set_behavior_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_set_behavior_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_set_behavior_end(i)
    ccall((:xcb_xkb_set_behavior_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_set_behavior_iterator_t,), i)
end

"""
    xcb_xkb_set_explicit_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_set_explicit_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_set_explicit_iterator_t`](@ref)
"""
function xcb_xkb_set_explicit_next(i)
    ccall((:xcb_xkb_set_explicit_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_set_explicit_iterator_t},), i)
end

"""
    xcb_xkb_set_explicit_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_set_explicit_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_set_explicit_end(i)
    ccall((:xcb_xkb_set_explicit_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_set_explicit_iterator_t,), i)
end

"""
    xcb_xkb_key_mod_map_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_mod_map_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_mod_map_iterator_t`](@ref)
"""
function xcb_xkb_key_mod_map_next(i)
    ccall((:xcb_xkb_key_mod_map_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_mod_map_iterator_t},), i)
end

"""
    xcb_xkb_key_mod_map_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_mod_map_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_mod_map_end(i)
    ccall((:xcb_xkb_key_mod_map_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_mod_map_iterator_t,), i)
end

"""
    xcb_xkb_key_v_mod_map_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_v_mod_map_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_v_mod_map_iterator_t`](@ref)
"""
function xcb_xkb_key_v_mod_map_next(i)
    ccall((:xcb_xkb_key_v_mod_map_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_v_mod_map_iterator_t},), i)
end

"""
    xcb_xkb_key_v_mod_map_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_v_mod_map_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_v_mod_map_end(i)
    ccall((:xcb_xkb_key_v_mod_map_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_v_mod_map_iterator_t,), i)
end

"""
    xcb_xkb_kt_set_map_entry_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_kt_set_map_entry_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_kt_set_map_entry_iterator_t`](@ref)
"""
function xcb_xkb_kt_set_map_entry_next(i)
    ccall((:xcb_xkb_kt_set_map_entry_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_kt_set_map_entry_iterator_t},), i)
end

"""
    xcb_xkb_kt_set_map_entry_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_kt_set_map_entry_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_kt_set_map_entry_end(i)
    ccall((:xcb_xkb_kt_set_map_entry_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_kt_set_map_entry_iterator_t,), i)
end

function xcb_xkb_set_key_type_sizeof(_buffer)
    ccall((:xcb_xkb_set_key_type_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_set_key_type_entries(R)
    ccall((:xcb_xkb_set_key_type_entries, libxcb_xkb), Ptr{xcb_xkb_kt_set_map_entry_t}, (Ptr{xcb_xkb_set_key_type_t},), R)
end

function xcb_xkb_set_key_type_entries_length(R)
    ccall((:xcb_xkb_set_key_type_entries_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_key_type_t},), R)
end

function xcb_xkb_set_key_type_entries_iterator(R)
    ccall((:xcb_xkb_set_key_type_entries_iterator, libxcb_xkb), xcb_xkb_kt_set_map_entry_iterator_t, (Ptr{xcb_xkb_set_key_type_t},), R)
end

function xcb_xkb_set_key_type_preserve_entries(R)
    ccall((:xcb_xkb_set_key_type_preserve_entries, libxcb_xkb), Ptr{xcb_xkb_kt_set_map_entry_t}, (Ptr{xcb_xkb_set_key_type_t},), R)
end

function xcb_xkb_set_key_type_preserve_entries_length(R)
    ccall((:xcb_xkb_set_key_type_preserve_entries_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_key_type_t},), R)
end

function xcb_xkb_set_key_type_preserve_entries_iterator(R)
    ccall((:xcb_xkb_set_key_type_preserve_entries_iterator, libxcb_xkb), xcb_xkb_kt_set_map_entry_iterator_t, (Ptr{xcb_xkb_set_key_type_t},), R)
end

"""
    xcb_xkb_set_key_type_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_set_key_type_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_set_key_type_iterator_t`](@ref)
"""
function xcb_xkb_set_key_type_next(i)
    ccall((:xcb_xkb_set_key_type_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_set_key_type_iterator_t},), i)
end

"""
    xcb_xkb_set_key_type_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_set_key_type_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_set_key_type_end(i)
    ccall((:xcb_xkb_set_key_type_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_set_key_type_iterator_t,), i)
end

"""
    xcb_xkb_string8_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_string8_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_string8_iterator_t`](@ref)
"""
function xcb_xkb_string8_next(i)
    ccall((:xcb_xkb_string8_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_string8_iterator_t},), i)
end

"""
    xcb_xkb_string8_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_string8_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_string8_end(i)
    ccall((:xcb_xkb_string8_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_string8_iterator_t,), i)
end

function xcb_xkb_outline_sizeof(_buffer)
    ccall((:xcb_xkb_outline_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_outline_points(R)
    ccall((:xcb_xkb_outline_points, libxcb_xkb), Ptr{xcb_point_t}, (Ptr{xcb_xkb_outline_t},), R)
end

function xcb_xkb_outline_points_length(R)
    ccall((:xcb_xkb_outline_points_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_outline_t},), R)
end

function xcb_xkb_outline_points_iterator(R)
    ccall((:xcb_xkb_outline_points_iterator, libxcb_xkb), xcb_point_iterator_t, (Ptr{xcb_xkb_outline_t},), R)
end

"""
    xcb_xkb_outline_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_outline_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_outline_iterator_t`](@ref)
"""
function xcb_xkb_outline_next(i)
    ccall((:xcb_xkb_outline_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_outline_iterator_t},), i)
end

"""
    xcb_xkb_outline_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_outline_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_outline_end(i)
    ccall((:xcb_xkb_outline_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_outline_iterator_t,), i)
end

function xcb_xkb_shape_sizeof(_buffer)
    ccall((:xcb_xkb_shape_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_shape_outlines_length(R)
    ccall((:xcb_xkb_shape_outlines_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_shape_t},), R)
end

function xcb_xkb_shape_outlines_iterator(R)
    ccall((:xcb_xkb_shape_outlines_iterator, libxcb_xkb), xcb_xkb_outline_iterator_t, (Ptr{xcb_xkb_shape_t},), R)
end

"""
    xcb_xkb_shape_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_shape_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_shape_iterator_t`](@ref)
"""
function xcb_xkb_shape_next(i)
    ccall((:xcb_xkb_shape_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_shape_iterator_t},), i)
end

"""
    xcb_xkb_shape_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_shape_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_shape_end(i)
    ccall((:xcb_xkb_shape_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_shape_iterator_t,), i)
end

"""
    xcb_xkb_key_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_key_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_key_iterator_t`](@ref)
"""
function xcb_xkb_key_next(i)
    ccall((:xcb_xkb_key_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_key_iterator_t},), i)
end

"""
    xcb_xkb_key_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_key_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_key_end(i)
    ccall((:xcb_xkb_key_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_key_iterator_t,), i)
end

"""
    xcb_xkb_overlay_key_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_overlay_key_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_overlay_key_iterator_t`](@ref)
"""
function xcb_xkb_overlay_key_next(i)
    ccall((:xcb_xkb_overlay_key_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_overlay_key_iterator_t},), i)
end

"""
    xcb_xkb_overlay_key_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_overlay_key_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_overlay_key_end(i)
    ccall((:xcb_xkb_overlay_key_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_overlay_key_iterator_t,), i)
end

function xcb_xkb_overlay_row_sizeof(_buffer)
    ccall((:xcb_xkb_overlay_row_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_overlay_row_keys(R)
    ccall((:xcb_xkb_overlay_row_keys, libxcb_xkb), Ptr{xcb_xkb_overlay_key_t}, (Ptr{xcb_xkb_overlay_row_t},), R)
end

function xcb_xkb_overlay_row_keys_length(R)
    ccall((:xcb_xkb_overlay_row_keys_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_overlay_row_t},), R)
end

function xcb_xkb_overlay_row_keys_iterator(R)
    ccall((:xcb_xkb_overlay_row_keys_iterator, libxcb_xkb), xcb_xkb_overlay_key_iterator_t, (Ptr{xcb_xkb_overlay_row_t},), R)
end

"""
    xcb_xkb_overlay_row_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_overlay_row_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_overlay_row_iterator_t`](@ref)
"""
function xcb_xkb_overlay_row_next(i)
    ccall((:xcb_xkb_overlay_row_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_overlay_row_iterator_t},), i)
end

"""
    xcb_xkb_overlay_row_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_overlay_row_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_overlay_row_end(i)
    ccall((:xcb_xkb_overlay_row_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_overlay_row_iterator_t,), i)
end

function xcb_xkb_overlay_sizeof(_buffer)
    ccall((:xcb_xkb_overlay_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_overlay_rows_length(R)
    ccall((:xcb_xkb_overlay_rows_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_overlay_t},), R)
end

function xcb_xkb_overlay_rows_iterator(R)
    ccall((:xcb_xkb_overlay_rows_iterator, libxcb_xkb), xcb_xkb_overlay_row_iterator_t, (Ptr{xcb_xkb_overlay_t},), R)
end

"""
    xcb_xkb_overlay_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_overlay_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_overlay_iterator_t`](@ref)
"""
function xcb_xkb_overlay_next(i)
    ccall((:xcb_xkb_overlay_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_overlay_iterator_t},), i)
end

"""
    xcb_xkb_overlay_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_overlay_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_overlay_end(i)
    ccall((:xcb_xkb_overlay_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_overlay_iterator_t,), i)
end

function xcb_xkb_row_sizeof(_buffer)
    ccall((:xcb_xkb_row_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_row_keys(R)
    ccall((:xcb_xkb_row_keys, libxcb_xkb), Ptr{xcb_xkb_key_t}, (Ptr{xcb_xkb_row_t},), R)
end

function xcb_xkb_row_keys_length(R)
    ccall((:xcb_xkb_row_keys_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_row_t},), R)
end

function xcb_xkb_row_keys_iterator(R)
    ccall((:xcb_xkb_row_keys_iterator, libxcb_xkb), xcb_xkb_key_iterator_t, (Ptr{xcb_xkb_row_t},), R)
end

"""
    xcb_xkb_row_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_row_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_row_iterator_t`](@ref)
"""
function xcb_xkb_row_next(i)
    ccall((:xcb_xkb_row_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_row_iterator_t},), i)
end

"""
    xcb_xkb_row_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_row_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_row_end(i)
    ccall((:xcb_xkb_row_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_row_iterator_t,), i)
end

function xcb_xkb_listing_sizeof(_buffer)
    ccall((:xcb_xkb_listing_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_listing_string(R)
    ccall((:xcb_xkb_listing_string, libxcb_xkb), Ptr{xcb_xkb_string8_t}, (Ptr{xcb_xkb_listing_t},), R)
end

function xcb_xkb_listing_string_length(R)
    ccall((:xcb_xkb_listing_string_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_listing_t},), R)
end

function xcb_xkb_listing_string_end(R)
    ccall((:xcb_xkb_listing_string_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_listing_t},), R)
end

"""
    xcb_xkb_listing_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_listing_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_listing_iterator_t`](@ref)
"""
function xcb_xkb_listing_next(i)
    ccall((:xcb_xkb_listing_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_listing_iterator_t},), i)
end

"""
    xcb_xkb_listing_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_listing_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_listing_end(i)
    ccall((:xcb_xkb_listing_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_listing_iterator_t,), i)
end

function xcb_xkb_device_led_info_sizeof(_buffer)
    ccall((:xcb_xkb_device_led_info_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

function xcb_xkb_device_led_info_names(R)
    ccall((:xcb_xkb_device_led_info_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_device_led_info_t},), R)
end

function xcb_xkb_device_led_info_names_length(R)
    ccall((:xcb_xkb_device_led_info_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_device_led_info_t},), R)
end

function xcb_xkb_device_led_info_names_end(R)
    ccall((:xcb_xkb_device_led_info_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_device_led_info_t},), R)
end

function xcb_xkb_device_led_info_maps(R)
    ccall((:xcb_xkb_device_led_info_maps, libxcb_xkb), Ptr{xcb_xkb_indicator_map_t}, (Ptr{xcb_xkb_device_led_info_t},), R)
end

function xcb_xkb_device_led_info_maps_length(R)
    ccall((:xcb_xkb_device_led_info_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_device_led_info_t},), R)
end

function xcb_xkb_device_led_info_maps_iterator(R)
    ccall((:xcb_xkb_device_led_info_maps_iterator, libxcb_xkb), xcb_xkb_indicator_map_iterator_t, (Ptr{xcb_xkb_device_led_info_t},), R)
end

"""
    xcb_xkb_device_led_info_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_device_led_info_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_device_led_info_iterator_t`](@ref)
"""
function xcb_xkb_device_led_info_next(i)
    ccall((:xcb_xkb_device_led_info_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_device_led_info_iterator_t},), i)
end

"""
    xcb_xkb_device_led_info_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_device_led_info_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_device_led_info_end(i)
    ccall((:xcb_xkb_device_led_info_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_device_led_info_iterator_t,), i)
end

"""
    xcb_xkb_sa_no_action_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_no_action_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_no_action_iterator_t`](@ref)
"""
function xcb_xkb_sa_no_action_next(i)
    ccall((:xcb_xkb_sa_no_action_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_no_action_iterator_t},), i)
end

"""
    xcb_xkb_sa_no_action_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_no_action_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_no_action_end(i)
    ccall((:xcb_xkb_sa_no_action_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_no_action_iterator_t,), i)
end

"""
    xcb_xkb_sa_set_mods_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_set_mods_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_set_mods_iterator_t`](@ref)
"""
function xcb_xkb_sa_set_mods_next(i)
    ccall((:xcb_xkb_sa_set_mods_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_set_mods_iterator_t},), i)
end

"""
    xcb_xkb_sa_set_mods_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_set_mods_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_set_mods_end(i)
    ccall((:xcb_xkb_sa_set_mods_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_set_mods_iterator_t,), i)
end

"""
    xcb_xkb_sa_latch_mods_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_latch_mods_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_latch_mods_iterator_t`](@ref)
"""
function xcb_xkb_sa_latch_mods_next(i)
    ccall((:xcb_xkb_sa_latch_mods_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_latch_mods_iterator_t},), i)
end

"""
    xcb_xkb_sa_latch_mods_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_latch_mods_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_latch_mods_end(i)
    ccall((:xcb_xkb_sa_latch_mods_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_latch_mods_iterator_t,), i)
end

"""
    xcb_xkb_sa_lock_mods_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_lock_mods_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_lock_mods_iterator_t`](@ref)
"""
function xcb_xkb_sa_lock_mods_next(i)
    ccall((:xcb_xkb_sa_lock_mods_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_lock_mods_iterator_t},), i)
end

"""
    xcb_xkb_sa_lock_mods_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_lock_mods_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_lock_mods_end(i)
    ccall((:xcb_xkb_sa_lock_mods_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_lock_mods_iterator_t,), i)
end

"""
    xcb_xkb_sa_set_group_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_set_group_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_set_group_iterator_t`](@ref)
"""
function xcb_xkb_sa_set_group_next(i)
    ccall((:xcb_xkb_sa_set_group_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_set_group_iterator_t},), i)
end

"""
    xcb_xkb_sa_set_group_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_set_group_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_set_group_end(i)
    ccall((:xcb_xkb_sa_set_group_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_set_group_iterator_t,), i)
end

"""
    xcb_xkb_sa_latch_group_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_latch_group_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_latch_group_iterator_t`](@ref)
"""
function xcb_xkb_sa_latch_group_next(i)
    ccall((:xcb_xkb_sa_latch_group_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_latch_group_iterator_t},), i)
end

"""
    xcb_xkb_sa_latch_group_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_latch_group_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_latch_group_end(i)
    ccall((:xcb_xkb_sa_latch_group_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_latch_group_iterator_t,), i)
end

"""
    xcb_xkb_sa_lock_group_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_lock_group_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_lock_group_iterator_t`](@ref)
"""
function xcb_xkb_sa_lock_group_next(i)
    ccall((:xcb_xkb_sa_lock_group_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_lock_group_iterator_t},), i)
end

"""
    xcb_xkb_sa_lock_group_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_lock_group_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_lock_group_end(i)
    ccall((:xcb_xkb_sa_lock_group_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_lock_group_iterator_t,), i)
end

"""
    xcb_xkb_sa_move_ptr_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_move_ptr_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_move_ptr_iterator_t`](@ref)
"""
function xcb_xkb_sa_move_ptr_next(i)
    ccall((:xcb_xkb_sa_move_ptr_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_move_ptr_iterator_t},), i)
end

"""
    xcb_xkb_sa_move_ptr_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_move_ptr_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_move_ptr_end(i)
    ccall((:xcb_xkb_sa_move_ptr_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_move_ptr_iterator_t,), i)
end

"""
    xcb_xkb_sa_ptr_btn_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_ptr_btn_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_ptr_btn_iterator_t`](@ref)
"""
function xcb_xkb_sa_ptr_btn_next(i)
    ccall((:xcb_xkb_sa_ptr_btn_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_ptr_btn_iterator_t},), i)
end

"""
    xcb_xkb_sa_ptr_btn_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_ptr_btn_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_ptr_btn_end(i)
    ccall((:xcb_xkb_sa_ptr_btn_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_ptr_btn_iterator_t,), i)
end

"""
    xcb_xkb_sa_lock_ptr_btn_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_lock_ptr_btn_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_lock_ptr_btn_iterator_t`](@ref)
"""
function xcb_xkb_sa_lock_ptr_btn_next(i)
    ccall((:xcb_xkb_sa_lock_ptr_btn_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_lock_ptr_btn_iterator_t},), i)
end

"""
    xcb_xkb_sa_lock_ptr_btn_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_lock_ptr_btn_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_lock_ptr_btn_end(i)
    ccall((:xcb_xkb_sa_lock_ptr_btn_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_lock_ptr_btn_iterator_t,), i)
end

"""
    xcb_xkb_sa_set_ptr_dflt_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_set_ptr_dflt_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_set_ptr_dflt_iterator_t`](@ref)
"""
function xcb_xkb_sa_set_ptr_dflt_next(i)
    ccall((:xcb_xkb_sa_set_ptr_dflt_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_set_ptr_dflt_iterator_t},), i)
end

"""
    xcb_xkb_sa_set_ptr_dflt_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_set_ptr_dflt_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_set_ptr_dflt_end(i)
    ccall((:xcb_xkb_sa_set_ptr_dflt_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_set_ptr_dflt_iterator_t,), i)
end

"""
    xcb_xkb_sa_iso_lock_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_iso_lock_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_iso_lock_iterator_t`](@ref)
"""
function xcb_xkb_sa_iso_lock_next(i)
    ccall((:xcb_xkb_sa_iso_lock_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_iso_lock_iterator_t},), i)
end

"""
    xcb_xkb_sa_iso_lock_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_iso_lock_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_iso_lock_end(i)
    ccall((:xcb_xkb_sa_iso_lock_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_iso_lock_iterator_t,), i)
end

"""
    xcb_xkb_sa_terminate_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_terminate_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_terminate_iterator_t`](@ref)
"""
function xcb_xkb_sa_terminate_next(i)
    ccall((:xcb_xkb_sa_terminate_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_terminate_iterator_t},), i)
end

"""
    xcb_xkb_sa_terminate_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_terminate_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_terminate_end(i)
    ccall((:xcb_xkb_sa_terminate_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_terminate_iterator_t,), i)
end

"""
    xcb_xkb_sa_switch_screen_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_switch_screen_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_switch_screen_iterator_t`](@ref)
"""
function xcb_xkb_sa_switch_screen_next(i)
    ccall((:xcb_xkb_sa_switch_screen_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_switch_screen_iterator_t},), i)
end

"""
    xcb_xkb_sa_switch_screen_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_switch_screen_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_switch_screen_end(i)
    ccall((:xcb_xkb_sa_switch_screen_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_switch_screen_iterator_t,), i)
end

"""
    xcb_xkb_sa_set_controls_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_set_controls_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_set_controls_iterator_t`](@ref)
"""
function xcb_xkb_sa_set_controls_next(i)
    ccall((:xcb_xkb_sa_set_controls_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_set_controls_iterator_t},), i)
end

"""
    xcb_xkb_sa_set_controls_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_set_controls_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_set_controls_end(i)
    ccall((:xcb_xkb_sa_set_controls_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_set_controls_iterator_t,), i)
end

"""
    xcb_xkb_sa_lock_controls_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_lock_controls_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_lock_controls_iterator_t`](@ref)
"""
function xcb_xkb_sa_lock_controls_next(i)
    ccall((:xcb_xkb_sa_lock_controls_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_lock_controls_iterator_t},), i)
end

"""
    xcb_xkb_sa_lock_controls_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_lock_controls_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_lock_controls_end(i)
    ccall((:xcb_xkb_sa_lock_controls_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_lock_controls_iterator_t,), i)
end

"""
    xcb_xkb_sa_action_message_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_action_message_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_action_message_iterator_t`](@ref)
"""
function xcb_xkb_sa_action_message_next(i)
    ccall((:xcb_xkb_sa_action_message_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_action_message_iterator_t},), i)
end

"""
    xcb_xkb_sa_action_message_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_action_message_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_action_message_end(i)
    ccall((:xcb_xkb_sa_action_message_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_action_message_iterator_t,), i)
end

"""
    xcb_xkb_sa_redirect_key_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_redirect_key_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_redirect_key_iterator_t`](@ref)
"""
function xcb_xkb_sa_redirect_key_next(i)
    ccall((:xcb_xkb_sa_redirect_key_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_redirect_key_iterator_t},), i)
end

"""
    xcb_xkb_sa_redirect_key_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_redirect_key_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_redirect_key_end(i)
    ccall((:xcb_xkb_sa_redirect_key_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_redirect_key_iterator_t,), i)
end

"""
    xcb_xkb_sa_device_btn_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_device_btn_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_device_btn_iterator_t`](@ref)
"""
function xcb_xkb_sa_device_btn_next(i)
    ccall((:xcb_xkb_sa_device_btn_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_device_btn_iterator_t},), i)
end

"""
    xcb_xkb_sa_device_btn_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_device_btn_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_device_btn_end(i)
    ccall((:xcb_xkb_sa_device_btn_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_device_btn_iterator_t,), i)
end

"""
    xcb_xkb_sa_lock_device_btn_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_lock_device_btn_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_lock_device_btn_iterator_t`](@ref)
"""
function xcb_xkb_sa_lock_device_btn_next(i)
    ccall((:xcb_xkb_sa_lock_device_btn_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_lock_device_btn_iterator_t},), i)
end

"""
    xcb_xkb_sa_lock_device_btn_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_lock_device_btn_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_lock_device_btn_end(i)
    ccall((:xcb_xkb_sa_lock_device_btn_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_lock_device_btn_iterator_t,), i)
end

"""
    xcb_xkb_sa_device_valuator_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sa_device_valuator_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sa_device_valuator_iterator_t`](@ref)
"""
function xcb_xkb_sa_device_valuator_next(i)
    ccall((:xcb_xkb_sa_device_valuator_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sa_device_valuator_iterator_t},), i)
end

"""
    xcb_xkb_sa_device_valuator_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sa_device_valuator_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sa_device_valuator_end(i)
    ccall((:xcb_xkb_sa_device_valuator_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sa_device_valuator_iterator_t,), i)
end

"""
    xcb_xkb_si_action_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_si_action_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_si_action_iterator_t`](@ref)
"""
function xcb_xkb_si_action_next(i)
    ccall((:xcb_xkb_si_action_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_si_action_iterator_t},), i)
end

"""
    xcb_xkb_si_action_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_si_action_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_si_action_end(i)
    ccall((:xcb_xkb_si_action_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_si_action_iterator_t,), i)
end

"""
    xcb_xkb_sym_interpret_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_sym_interpret_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_sym_interpret_iterator_t`](@ref)
"""
function xcb_xkb_sym_interpret_next(i)
    ccall((:xcb_xkb_sym_interpret_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_sym_interpret_iterator_t},), i)
end

"""
    xcb_xkb_sym_interpret_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_sym_interpret_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_sym_interpret_end(i)
    ccall((:xcb_xkb_sym_interpret_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_sym_interpret_iterator_t,), i)
end

"""
    xcb_xkb_action_next(i)

Get the next element of the iterator

Get the next element in the iterator. The member rem is decreased by one. The member data points to the next element. The member index is increased by sizeof([`xcb_xkb_action_t`](@ref))

### Parameters
* `i`: Pointer to a [`xcb_xkb_action_iterator_t`](@ref)
"""
function xcb_xkb_action_next(i)
    ccall((:xcb_xkb_action_next, libxcb_xkb), Cvoid, (Ptr{xcb_xkb_action_iterator_t},), i)
end

"""
    xcb_xkb_action_end(i)

Return the iterator pointing to the last element

Set the current element in the iterator to the last element. The member rem is set to 0. The member data points to the last element.

### Parameters
* `i`: An [`xcb_xkb_action_iterator_t`](@ref)
### Returns
The iterator pointing to the last element
"""
function xcb_xkb_action_end(i)
    ccall((:xcb_xkb_action_end, libxcb_xkb), xcb_generic_iterator_t, (xcb_xkb_action_iterator_t,), i)
end

"""
    xcb_xkb_use_extension(c, wantedMajor, wantedMinor)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_use_extension(c, wantedMajor, wantedMinor)
    ccall((:xcb_xkb_use_extension, libxcb_xkb), xcb_xkb_use_extension_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16), c, wantedMajor, wantedMinor)
end

"""
    xcb_xkb_use_extension_unchecked(c, wantedMajor, wantedMinor)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_use_extension_unchecked(c, wantedMajor, wantedMinor)
    ccall((:xcb_xkb_use_extension_unchecked, libxcb_xkb), xcb_xkb_use_extension_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt16), c, wantedMajor, wantedMinor)
end

"""
    xcb_xkb_use_extension_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_use_extension_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_use_extension_reply(c, cookie, e)
    ccall((:xcb_xkb_use_extension_reply, libxcb_xkb), Ptr{xcb_xkb_use_extension_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_use_extension_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_select_events_details_serialize(_buffer, affectWhich, clear, selectAll, _aux)
    ccall((:xcb_xkb_select_events_details_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt16, UInt16, UInt16, Ptr{xcb_xkb_select_events_details_t}), _buffer, affectWhich, clear, selectAll, _aux)
end

function xcb_xkb_select_events_details_unpack(_buffer, affectWhich, clear, selectAll, _aux)
    ccall((:xcb_xkb_select_events_details_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt16, UInt16, UInt16, Ptr{xcb_xkb_select_events_details_t}), _buffer, affectWhich, clear, selectAll, _aux)
end

function xcb_xkb_select_events_details_sizeof(_buffer, affectWhich, clear, selectAll)
    ccall((:xcb_xkb_select_events_details_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt16, UInt16, UInt16), _buffer, affectWhich, clear, selectAll)
end

function xcb_xkb_select_events_sizeof(_buffer)
    ccall((:xcb_xkb_select_events_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_select_events_checked(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_select_events_checked(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
    ccall((:xcb_xkb_select_events_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt16, UInt16, UInt16, Ptr{Cvoid}), c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
end

"""
    xcb_xkb_select_events(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_select_events(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
    ccall((:xcb_xkb_select_events, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt16, UInt16, UInt16, Ptr{Cvoid}), c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
end

"""
    xcb_xkb_select_events_aux_checked(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_select_events_aux_checked(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
    ccall((:xcb_xkb_select_events_aux_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt16, UInt16, UInt16, Ptr{xcb_xkb_select_events_details_t}), c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
end

"""
    xcb_xkb_select_events_aux(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_select_events_aux(c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
    ccall((:xcb_xkb_select_events_aux, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt16, UInt16, UInt16, Ptr{xcb_xkb_select_events_details_t}), c, deviceSpec, affectWhich, clear, selectAll, affectMap, map, details)
end

function xcb_xkb_select_events_details(R)
    ccall((:xcb_xkb_select_events_details, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_select_events_request_t},), R)
end

"""
    xcb_xkb_bell_checked(c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_bell_checked(c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)
    ccall((:xcb_xkb_bell_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_bell_class_spec_t, xcb_xkb_id_spec_t, Int8, UInt8, UInt8, Int16, Int16, xcb_atom_t, xcb_window_t), c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)
end

"""
    xcb_xkb_bell(c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_bell(c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)
    ccall((:xcb_xkb_bell, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_bell_class_spec_t, xcb_xkb_id_spec_t, Int8, UInt8, UInt8, Int16, Int16, xcb_atom_t, xcb_window_t), c, deviceSpec, bellClass, bellID, percent, forceSound, eventOnly, pitch, duration, name, window)
end

"""
    xcb_xkb_get_state(c, deviceSpec)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_state(c, deviceSpec)
    ccall((:xcb_xkb_get_state, libxcb_xkb), xcb_xkb_get_state_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_state_unchecked(c, deviceSpec)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_state_unchecked(c, deviceSpec)
    ccall((:xcb_xkb_get_state_unchecked, libxcb_xkb), xcb_xkb_get_state_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_state_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_state_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_state_reply(c, cookie, e)
    ccall((:xcb_xkb_get_state_reply, libxcb_xkb), Ptr{xcb_xkb_get_state_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_state_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_xkb_latch_lock_state_checked(c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_latch_lock_state_checked(c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)
    ccall((:xcb_xkb_latch_lock_state_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt16), c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)
end

"""
    xcb_xkb_latch_lock_state(c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_latch_lock_state(c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)
    ccall((:xcb_xkb_latch_lock_state, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt16), c, deviceSpec, affectModLocks, modLocks, lockGroup, groupLock, affectModLatches, latchGroup, groupLatch)
end

"""
    xcb_xkb_get_controls(c, deviceSpec)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_controls(c, deviceSpec)
    ccall((:xcb_xkb_get_controls, libxcb_xkb), xcb_xkb_get_controls_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_controls_unchecked(c, deviceSpec)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_controls_unchecked(c, deviceSpec)
    ccall((:xcb_xkb_get_controls_unchecked, libxcb_xkb), xcb_xkb_get_controls_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_controls_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_controls_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_controls_reply(c, cookie, e)
    ccall((:xcb_xkb_get_controls_reply, libxcb_xkb), Ptr{xcb_xkb_get_controls_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_controls_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_xkb_set_controls_checked(c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_controls_checked(c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)
    ccall((:xcb_xkb_set_controls_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt8, UInt16, UInt16, UInt16, UInt16, UInt8, UInt8, UInt16, UInt32, UInt32, UInt32, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, Int16, UInt16, UInt32, UInt32, UInt16, UInt16, Ptr{UInt8}), c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)
end

"""
    xcb_xkb_set_controls(c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_controls(c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)
    ccall((:xcb_xkb_set_controls, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt8, UInt16, UInt16, UInt16, UInt16, UInt8, UInt8, UInt16, UInt32, UInt32, UInt32, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, UInt16, Int16, UInt16, UInt32, UInt32, UInt16, UInt16, Ptr{UInt8}), c, deviceSpec, affectInternalRealMods, internalRealMods, affectIgnoreLockRealMods, ignoreLockRealMods, affectInternalVirtualMods, internalVirtualMods, affectIgnoreLockVirtualMods, ignoreLockVirtualMods, mouseKeysDfltBtn, groupsWrap, accessXOptions, affectEnabledControls, enabledControls, changeControls, repeatDelay, repeatInterval, slowKeysDelay, debounceDelay, mouseKeysDelay, mouseKeysInterval, mouseKeysTimeToMax, mouseKeysMaxSpeed, mouseKeysCurve, accessXTimeout, accessXTimeoutMask, accessXTimeoutValues, accessXTimeoutOptionsMask, accessXTimeoutOptionsValues, perKeyRepeat)
end

function xcb_xkb_get_map_map_types_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_types_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_types_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_types_rtrn_iterator, libxcb_xkb), xcb_xkb_key_type_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_syms_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_syms_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_syms_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_syms_rtrn_iterator, libxcb_xkb), xcb_xkb_key_sym_map_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_acts_rtrn_count(S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_count, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_acts_rtrn_count_length(R, S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_count_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_acts_rtrn_count_end(R, S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_count_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_acts_rtrn_acts(S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_acts, libxcb_xkb), Ptr{xcb_xkb_action_t}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_acts_rtrn_acts_length(R, S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_acts_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_acts_rtrn_acts_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_acts_rtrn_acts_iterator, libxcb_xkb), xcb_xkb_action_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_behaviors_rtrn(S)
    ccall((:xcb_xkb_get_map_map_behaviors_rtrn, libxcb_xkb), Ptr{xcb_xkb_set_behavior_t}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_behaviors_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_behaviors_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_behaviors_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_behaviors_rtrn_iterator, libxcb_xkb), xcb_xkb_set_behavior_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_vmods_rtrn(S)
    ccall((:xcb_xkb_get_map_map_vmods_rtrn, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_vmods_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_vmods_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_vmods_rtrn_end(R, S)
    ccall((:xcb_xkb_get_map_map_vmods_rtrn_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_explicit_rtrn(S)
    ccall((:xcb_xkb_get_map_map_explicit_rtrn, libxcb_xkb), Ptr{xcb_xkb_set_explicit_t}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_explicit_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_explicit_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_explicit_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_explicit_rtrn_iterator, libxcb_xkb), xcb_xkb_set_explicit_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_modmap_rtrn(S)
    ccall((:xcb_xkb_get_map_map_modmap_rtrn, libxcb_xkb), Ptr{xcb_xkb_key_mod_map_t}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_modmap_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_modmap_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_modmap_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_modmap_rtrn_iterator, libxcb_xkb), xcb_xkb_key_mod_map_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_vmodmap_rtrn(S)
    ccall((:xcb_xkb_get_map_map_vmodmap_rtrn, libxcb_xkb), Ptr{xcb_xkb_key_v_mod_map_t}, (Ptr{xcb_xkb_get_map_map_t},), S)
end

function xcb_xkb_get_map_map_vmodmap_rtrn_length(R, S)
    ccall((:xcb_xkb_get_map_map_vmodmap_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_vmodmap_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_map_map_vmodmap_rtrn_iterator, libxcb_xkb), xcb_xkb_key_v_mod_map_iterator_t, (Ptr{xcb_xkb_get_map_reply_t}, Ptr{xcb_xkb_get_map_map_t}), R, S)
end

function xcb_xkb_get_map_map_serialize(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_get_map_map_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_get_map_map_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_get_map_map_unpack(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_get_map_map_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_get_map_map_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_get_map_map_sizeof(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
    ccall((:xcb_xkb_get_map_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
end

function xcb_xkb_get_map_sizeof(_buffer)
    ccall((:xcb_xkb_get_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_map(c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_map(c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)
    ccall((:xcb_xkb_get_map, libxcb_xkb), xcb_xkb_get_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt8, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8), c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)
end

"""
    xcb_xkb_get_map_unchecked(c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_map_unchecked(c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)
    ccall((:xcb_xkb_get_map_unchecked, libxcb_xkb), xcb_xkb_get_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt8, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8, xcb_keycode_t, UInt8), c, deviceSpec, full, partial, firstType, nTypes, firstKeySym, nKeySyms, firstKeyAction, nKeyActions, firstKeyBehavior, nKeyBehaviors, virtualMods, firstKeyExplicit, nKeyExplicit, firstModMapKey, nModMapKeys, firstVModMapKey, nVModMapKeys)
end

function xcb_xkb_get_map_map(R)
    ccall((:xcb_xkb_get_map_map, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_get_map_reply_t},), R)
end

"""
    xcb_xkb_get_map_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_map_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_map_reply(c, cookie, e)
    ccall((:xcb_xkb_get_map_reply, libxcb_xkb), Ptr{xcb_xkb_get_map_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_map_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_set_map_values_types_length(R, S)
    ccall((:xcb_xkb_set_map_values_types_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_types_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_types_iterator, libxcb_xkb), xcb_xkb_set_key_type_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_syms_length(R, S)
    ccall((:xcb_xkb_set_map_values_syms_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_syms_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_syms_iterator, libxcb_xkb), xcb_xkb_key_sym_map_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_actions_count(S)
    ccall((:xcb_xkb_set_map_values_actions_count, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_actions_count_length(R, S)
    ccall((:xcb_xkb_set_map_values_actions_count_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_actions_count_end(R, S)
    ccall((:xcb_xkb_set_map_values_actions_count_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_actions(S)
    ccall((:xcb_xkb_set_map_values_actions, libxcb_xkb), Ptr{xcb_xkb_action_t}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_actions_length(R, S)
    ccall((:xcb_xkb_set_map_values_actions_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_actions_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_actions_iterator, libxcb_xkb), xcb_xkb_action_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_behaviors(S)
    ccall((:xcb_xkb_set_map_values_behaviors, libxcb_xkb), Ptr{xcb_xkb_set_behavior_t}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_behaviors_length(R, S)
    ccall((:xcb_xkb_set_map_values_behaviors_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_behaviors_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_behaviors_iterator, libxcb_xkb), xcb_xkb_set_behavior_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_vmods(S)
    ccall((:xcb_xkb_set_map_values_vmods, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_vmods_length(R, S)
    ccall((:xcb_xkb_set_map_values_vmods_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_vmods_end(R, S)
    ccall((:xcb_xkb_set_map_values_vmods_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_explicit(S)
    ccall((:xcb_xkb_set_map_values_explicit, libxcb_xkb), Ptr{xcb_xkb_set_explicit_t}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_explicit_length(R, S)
    ccall((:xcb_xkb_set_map_values_explicit_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_explicit_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_explicit_iterator, libxcb_xkb), xcb_xkb_set_explicit_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_modmap(S)
    ccall((:xcb_xkb_set_map_values_modmap, libxcb_xkb), Ptr{xcb_xkb_key_mod_map_t}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_modmap_length(R, S)
    ccall((:xcb_xkb_set_map_values_modmap_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_modmap_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_modmap_iterator, libxcb_xkb), xcb_xkb_key_mod_map_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_vmodmap(S)
    ccall((:xcb_xkb_set_map_values_vmodmap, libxcb_xkb), Ptr{xcb_xkb_key_v_mod_map_t}, (Ptr{xcb_xkb_set_map_values_t},), S)
end

function xcb_xkb_set_map_values_vmodmap_length(R, S)
    ccall((:xcb_xkb_set_map_values_vmodmap_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_vmodmap_iterator(R, S)
    ccall((:xcb_xkb_set_map_values_vmodmap_iterator, libxcb_xkb), xcb_xkb_key_v_mod_map_iterator_t, (Ptr{xcb_xkb_set_map_request_t}, Ptr{xcb_xkb_set_map_values_t}), R, S)
end

function xcb_xkb_set_map_values_serialize(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_set_map_values_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_map_values_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_set_map_values_unpack(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_set_map_values_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_map_values_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_set_map_values_sizeof(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
    ccall((:xcb_xkb_set_map_values_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
end

function xcb_xkb_set_map_sizeof(_buffer)
    ccall((:xcb_xkb_set_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_map_checked(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_map_checked(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
    ccall((:xcb_xkb_set_map_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, xcb_keycode_t, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{Cvoid}), c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
end

"""
    xcb_xkb_set_map(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_map(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
    ccall((:xcb_xkb_set_map, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, xcb_keycode_t, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{Cvoid}), c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
end

"""
    xcb_xkb_set_map_aux_checked(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_map_aux_checked(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
    ccall((:xcb_xkb_set_map_aux_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, xcb_keycode_t, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_map_values_t}), c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
end

"""
    xcb_xkb_set_map_aux(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_map_aux(c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
    ccall((:xcb_xkb_set_map_aux, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, xcb_keycode_t, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt16, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_map_values_t}), c, deviceSpec, present, flags, minKeyCode, maxKeyCode, firstType, nTypes, firstKeySym, nKeySyms, totalSyms, firstKeyAction, nKeyActions, totalActions, firstKeyBehavior, nKeyBehaviors, totalKeyBehaviors, firstKeyExplicit, nKeyExplicit, totalKeyExplicit, firstModMapKey, nModMapKeys, totalModMapKeys, firstVModMapKey, nVModMapKeys, totalVModMapKeys, virtualMods, values)
end

function xcb_xkb_set_map_values(R)
    ccall((:xcb_xkb_set_map_values, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_set_map_request_t},), R)
end

function xcb_xkb_get_compat_map_sizeof(_buffer)
    ccall((:xcb_xkb_get_compat_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_compat_map(c, deviceSpec, groups, getAllSI, firstSI, nSI)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_compat_map(c, deviceSpec, groups, getAllSI, firstSI, nSI)
    ccall((:xcb_xkb_get_compat_map, libxcb_xkb), xcb_xkb_get_compat_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt16, UInt16), c, deviceSpec, groups, getAllSI, firstSI, nSI)
end

"""
    xcb_xkb_get_compat_map_unchecked(c, deviceSpec, groups, getAllSI, firstSI, nSI)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_compat_map_unchecked(c, deviceSpec, groups, getAllSI, firstSI, nSI)
    ccall((:xcb_xkb_get_compat_map_unchecked, libxcb_xkb), xcb_xkb_get_compat_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt16, UInt16), c, deviceSpec, groups, getAllSI, firstSI, nSI)
end

function xcb_xkb_get_compat_map_si_rtrn(R)
    ccall((:xcb_xkb_get_compat_map_si_rtrn, libxcb_xkb), Ptr{xcb_xkb_sym_interpret_t}, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

function xcb_xkb_get_compat_map_si_rtrn_length(R)
    ccall((:xcb_xkb_get_compat_map_si_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

function xcb_xkb_get_compat_map_si_rtrn_iterator(R)
    ccall((:xcb_xkb_get_compat_map_si_rtrn_iterator, libxcb_xkb), xcb_xkb_sym_interpret_iterator_t, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

function xcb_xkb_get_compat_map_group_rtrn(R)
    ccall((:xcb_xkb_get_compat_map_group_rtrn, libxcb_xkb), Ptr{xcb_xkb_mod_def_t}, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

function xcb_xkb_get_compat_map_group_rtrn_length(R)
    ccall((:xcb_xkb_get_compat_map_group_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

function xcb_xkb_get_compat_map_group_rtrn_iterator(R)
    ccall((:xcb_xkb_get_compat_map_group_rtrn_iterator, libxcb_xkb), xcb_xkb_mod_def_iterator_t, (Ptr{xcb_xkb_get_compat_map_reply_t},), R)
end

"""
    xcb_xkb_get_compat_map_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_compat_map_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_compat_map_reply(c, cookie, e)
    ccall((:xcb_xkb_get_compat_map_reply, libxcb_xkb), Ptr{xcb_xkb_get_compat_map_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_compat_map_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_set_compat_map_sizeof(_buffer)
    ccall((:xcb_xkb_set_compat_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_compat_map_checked(c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_compat_map_checked(c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)
    ccall((:xcb_xkb_set_compat_map_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt16, UInt16, Ptr{xcb_xkb_sym_interpret_t}, Ptr{xcb_xkb_mod_def_t}), c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)
end

"""
    xcb_xkb_set_compat_map(c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_compat_map(c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)
    ccall((:xcb_xkb_set_compat_map, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt8, UInt16, UInt16, Ptr{xcb_xkb_sym_interpret_t}, Ptr{xcb_xkb_mod_def_t}), c, deviceSpec, recomputeActions, truncateSI, groups, firstSI, nSI, si, groupMaps)
end

function xcb_xkb_set_compat_map_si(R)
    ccall((:xcb_xkb_set_compat_map_si, libxcb_xkb), Ptr{xcb_xkb_sym_interpret_t}, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

function xcb_xkb_set_compat_map_si_length(R)
    ccall((:xcb_xkb_set_compat_map_si_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

function xcb_xkb_set_compat_map_si_iterator(R)
    ccall((:xcb_xkb_set_compat_map_si_iterator, libxcb_xkb), xcb_xkb_sym_interpret_iterator_t, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

function xcb_xkb_set_compat_map_group_maps(R)
    ccall((:xcb_xkb_set_compat_map_group_maps, libxcb_xkb), Ptr{xcb_xkb_mod_def_t}, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

function xcb_xkb_set_compat_map_group_maps_length(R)
    ccall((:xcb_xkb_set_compat_map_group_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

function xcb_xkb_set_compat_map_group_maps_iterator(R)
    ccall((:xcb_xkb_set_compat_map_group_maps_iterator, libxcb_xkb), xcb_xkb_mod_def_iterator_t, (Ptr{xcb_xkb_set_compat_map_request_t},), R)
end

"""
    xcb_xkb_get_indicator_state(c, deviceSpec)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_indicator_state(c, deviceSpec)
    ccall((:xcb_xkb_get_indicator_state, libxcb_xkb), xcb_xkb_get_indicator_state_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_indicator_state_unchecked(c, deviceSpec)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_indicator_state_unchecked(c, deviceSpec)
    ccall((:xcb_xkb_get_indicator_state_unchecked, libxcb_xkb), xcb_xkb_get_indicator_state_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t), c, deviceSpec)
end

"""
    xcb_xkb_get_indicator_state_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_indicator_state_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_indicator_state_reply(c, cookie, e)
    ccall((:xcb_xkb_get_indicator_state_reply, libxcb_xkb), Ptr{xcb_xkb_get_indicator_state_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_indicator_state_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_get_indicator_map_sizeof(_buffer)
    ccall((:xcb_xkb_get_indicator_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_indicator_map(c, deviceSpec, which)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_indicator_map(c, deviceSpec, which)
    ccall((:xcb_xkb_get_indicator_map, libxcb_xkb), xcb_xkb_get_indicator_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32), c, deviceSpec, which)
end

"""
    xcb_xkb_get_indicator_map_unchecked(c, deviceSpec, which)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_indicator_map_unchecked(c, deviceSpec, which)
    ccall((:xcb_xkb_get_indicator_map_unchecked, libxcb_xkb), xcb_xkb_get_indicator_map_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32), c, deviceSpec, which)
end

function xcb_xkb_get_indicator_map_maps(R)
    ccall((:xcb_xkb_get_indicator_map_maps, libxcb_xkb), Ptr{xcb_xkb_indicator_map_t}, (Ptr{xcb_xkb_get_indicator_map_reply_t},), R)
end

function xcb_xkb_get_indicator_map_maps_length(R)
    ccall((:xcb_xkb_get_indicator_map_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_indicator_map_reply_t},), R)
end

function xcb_xkb_get_indicator_map_maps_iterator(R)
    ccall((:xcb_xkb_get_indicator_map_maps_iterator, libxcb_xkb), xcb_xkb_indicator_map_iterator_t, (Ptr{xcb_xkb_get_indicator_map_reply_t},), R)
end

"""
    xcb_xkb_get_indicator_map_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_indicator_map_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_indicator_map_reply(c, cookie, e)
    ccall((:xcb_xkb_get_indicator_map_reply, libxcb_xkb), Ptr{xcb_xkb_get_indicator_map_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_indicator_map_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_set_indicator_map_sizeof(_buffer)
    ccall((:xcb_xkb_set_indicator_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_indicator_map_checked(c, deviceSpec, which, maps)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_indicator_map_checked(c, deviceSpec, which, maps)
    ccall((:xcb_xkb_set_indicator_map_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32, Ptr{xcb_xkb_indicator_map_t}), c, deviceSpec, which, maps)
end

"""
    xcb_xkb_set_indicator_map(c, deviceSpec, which, maps)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_indicator_map(c, deviceSpec, which, maps)
    ccall((:xcb_xkb_set_indicator_map, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32, Ptr{xcb_xkb_indicator_map_t}), c, deviceSpec, which, maps)
end

function xcb_xkb_set_indicator_map_maps(R)
    ccall((:xcb_xkb_set_indicator_map_maps, libxcb_xkb), Ptr{xcb_xkb_indicator_map_t}, (Ptr{xcb_xkb_set_indicator_map_request_t},), R)
end

function xcb_xkb_set_indicator_map_maps_length(R)
    ccall((:xcb_xkb_set_indicator_map_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_indicator_map_request_t},), R)
end

function xcb_xkb_set_indicator_map_maps_iterator(R)
    ccall((:xcb_xkb_set_indicator_map_maps_iterator, libxcb_xkb), xcb_xkb_indicator_map_iterator_t, (Ptr{xcb_xkb_set_indicator_map_request_t},), R)
end

"""
    xcb_xkb_get_named_indicator(c, deviceSpec, ledClass, ledID, indicator)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_named_indicator(c, deviceSpec, ledClass, ledID, indicator)
    ccall((:xcb_xkb_get_named_indicator, libxcb_xkb), xcb_xkb_get_named_indicator_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t, xcb_atom_t), c, deviceSpec, ledClass, ledID, indicator)
end

"""
    xcb_xkb_get_named_indicator_unchecked(c, deviceSpec, ledClass, ledID, indicator)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_named_indicator_unchecked(c, deviceSpec, ledClass, ledID, indicator)
    ccall((:xcb_xkb_get_named_indicator_unchecked, libxcb_xkb), xcb_xkb_get_named_indicator_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t, xcb_atom_t), c, deviceSpec, ledClass, ledID, indicator)
end

"""
    xcb_xkb_get_named_indicator_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_named_indicator_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_named_indicator_reply(c, cookie, e)
    ccall((:xcb_xkb_get_named_indicator_reply, libxcb_xkb), Ptr{xcb_xkb_get_named_indicator_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_named_indicator_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

"""
    xcb_xkb_set_named_indicator_checked(c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_named_indicator_checked(c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)
    ccall((:xcb_xkb_set_named_indicator_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t, xcb_atom_t, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt16, UInt32), c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)
end

"""
    xcb_xkb_set_named_indicator(c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_named_indicator(c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)
    ccall((:xcb_xkb_set_named_indicator, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t, xcb_atom_t, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt16, UInt32), c, deviceSpec, ledClass, ledID, indicator, setState, on, setMap, createMap, map_flags, map_whichGroups, map_groups, map_whichMods, map_realMods, map_vmods, map_ctrls)
end

function xcb_xkb_get_names_value_list_type_names(S)
    ccall((:xcb_xkb_get_names_value_list_type_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_type_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_type_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_type_names_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_type_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_n_levels_per_type(S)
    ccall((:xcb_xkb_get_names_value_list_n_levels_per_type, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_n_levels_per_type_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_n_levels_per_type_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_n_levels_per_type_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_n_levels_per_type_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_kt_level_names(S)
    ccall((:xcb_xkb_get_names_value_list_kt_level_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_kt_level_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_kt_level_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_kt_level_names_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_kt_level_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_indicator_names(S)
    ccall((:xcb_xkb_get_names_value_list_indicator_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_indicator_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_indicator_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_indicator_names_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_indicator_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_virtual_mod_names(S)
    ccall((:xcb_xkb_get_names_value_list_virtual_mod_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_virtual_mod_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_virtual_mod_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_virtual_mod_names_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_virtual_mod_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_groups(S)
    ccall((:xcb_xkb_get_names_value_list_groups, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_groups_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_groups_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_groups_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_groups_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_key_names(S)
    ccall((:xcb_xkb_get_names_value_list_key_names, libxcb_xkb), Ptr{xcb_xkb_key_name_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_key_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_key_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_key_names_iterator(R, S)
    ccall((:xcb_xkb_get_names_value_list_key_names_iterator, libxcb_xkb), xcb_xkb_key_name_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_key_aliases(S)
    ccall((:xcb_xkb_get_names_value_list_key_aliases, libxcb_xkb), Ptr{xcb_xkb_key_alias_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_key_aliases_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_key_aliases_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_key_aliases_iterator(R, S)
    ccall((:xcb_xkb_get_names_value_list_key_aliases_iterator, libxcb_xkb), xcb_xkb_key_alias_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_radio_group_names(S)
    ccall((:xcb_xkb_get_names_value_list_radio_group_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_names_value_list_t},), S)
end

function xcb_xkb_get_names_value_list_radio_group_names_length(R, S)
    ccall((:xcb_xkb_get_names_value_list_radio_group_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_radio_group_names_end(R, S)
    ccall((:xcb_xkb_get_names_value_list_radio_group_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_names_reply_t}, Ptr{xcb_xkb_get_names_value_list_t}), R, S)
end

function xcb_xkb_get_names_value_list_serialize(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_get_names_value_list_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_get_names_value_list_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_get_names_value_list_unpack(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_get_names_value_list_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_get_names_value_list_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_get_names_value_list_sizeof(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
    ccall((:xcb_xkb_get_names_value_list_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
end

function xcb_xkb_get_names_sizeof(_buffer)
    ccall((:xcb_xkb_get_names_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_names(c, deviceSpec, which)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_names(c, deviceSpec, which)
    ccall((:xcb_xkb_get_names, libxcb_xkb), xcb_xkb_get_names_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32), c, deviceSpec, which)
end

"""
    xcb_xkb_get_names_unchecked(c, deviceSpec, which)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_names_unchecked(c, deviceSpec, which)
    ccall((:xcb_xkb_get_names_unchecked, libxcb_xkb), xcb_xkb_get_names_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32), c, deviceSpec, which)
end

function xcb_xkb_get_names_value_list(R)
    ccall((:xcb_xkb_get_names_value_list, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_get_names_reply_t},), R)
end

"""
    xcb_xkb_get_names_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_names_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_names_reply(c, cookie, e)
    ccall((:xcb_xkb_get_names_reply, libxcb_xkb), Ptr{xcb_xkb_get_names_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_names_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_set_names_values_type_names(S)
    ccall((:xcb_xkb_set_names_values_type_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_type_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_type_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_type_names_end(R, S)
    ccall((:xcb_xkb_set_names_values_type_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_n_levels_per_type(S)
    ccall((:xcb_xkb_set_names_values_n_levels_per_type, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_n_levels_per_type_length(R, S)
    ccall((:xcb_xkb_set_names_values_n_levels_per_type_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_n_levels_per_type_end(R, S)
    ccall((:xcb_xkb_set_names_values_n_levels_per_type_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_kt_level_names(S)
    ccall((:xcb_xkb_set_names_values_kt_level_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_kt_level_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_kt_level_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_kt_level_names_end(R, S)
    ccall((:xcb_xkb_set_names_values_kt_level_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_indicator_names(S)
    ccall((:xcb_xkb_set_names_values_indicator_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_indicator_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_indicator_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_indicator_names_end(R, S)
    ccall((:xcb_xkb_set_names_values_indicator_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_virtual_mod_names(S)
    ccall((:xcb_xkb_set_names_values_virtual_mod_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_virtual_mod_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_virtual_mod_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_virtual_mod_names_end(R, S)
    ccall((:xcb_xkb_set_names_values_virtual_mod_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_groups(S)
    ccall((:xcb_xkb_set_names_values_groups, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_groups_length(R, S)
    ccall((:xcb_xkb_set_names_values_groups_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_groups_end(R, S)
    ccall((:xcb_xkb_set_names_values_groups_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_key_names(S)
    ccall((:xcb_xkb_set_names_values_key_names, libxcb_xkb), Ptr{xcb_xkb_key_name_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_key_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_key_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_key_names_iterator(R, S)
    ccall((:xcb_xkb_set_names_values_key_names_iterator, libxcb_xkb), xcb_xkb_key_name_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_key_aliases(S)
    ccall((:xcb_xkb_set_names_values_key_aliases, libxcb_xkb), Ptr{xcb_xkb_key_alias_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_key_aliases_length(R, S)
    ccall((:xcb_xkb_set_names_values_key_aliases_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_key_aliases_iterator(R, S)
    ccall((:xcb_xkb_set_names_values_key_aliases_iterator, libxcb_xkb), xcb_xkb_key_alias_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_radio_group_names(S)
    ccall((:xcb_xkb_set_names_values_radio_group_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_set_names_values_t},), S)
end

function xcb_xkb_set_names_values_radio_group_names_length(R, S)
    ccall((:xcb_xkb_set_names_values_radio_group_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_radio_group_names_end(R, S)
    ccall((:xcb_xkb_set_names_values_radio_group_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_set_names_request_t}, Ptr{xcb_xkb_set_names_values_t}), R, S)
end

function xcb_xkb_set_names_values_serialize(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_set_names_values_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_set_names_values_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_set_names_values_unpack(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_set_names_values_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_set_names_values_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_set_names_values_sizeof(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
    ccall((:xcb_xkb_set_names_values_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
end

function xcb_xkb_set_names_sizeof(_buffer)
    ccall((:xcb_xkb_set_names_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_names_checked(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_names_checked(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
    ccall((:xcb_xkb_set_names_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{Cvoid}), c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
end

"""
    xcb_xkb_set_names(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_names(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
    ccall((:xcb_xkb_set_names, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{Cvoid}), c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
end

"""
    xcb_xkb_set_names_aux_checked(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_names_aux_checked(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
    ccall((:xcb_xkb_set_names_aux_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_names_values_t}), c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
end

"""
    xcb_xkb_set_names_aux(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_names_aux(c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
    ccall((:xcb_xkb_set_names_aux, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt32, UInt8, UInt8, UInt8, UInt8, UInt32, UInt8, UInt8, xcb_keycode_t, UInt8, UInt8, UInt16, Ptr{xcb_xkb_set_names_values_t}), c, deviceSpec, virtualMods, which, firstType, nTypes, firstKTLevelt, nKTLevels, indicators, groupNames, nRadioGroups, firstKey, nKeys, nKeyAliases, totalKTLevelNames, values)
end

function xcb_xkb_set_names_values(R)
    ccall((:xcb_xkb_set_names_values, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_set_names_request_t},), R)
end

"""
    xcb_xkb_per_client_flags(c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_per_client_flags(c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)
    ccall((:xcb_xkb_per_client_flags, libxcb_xkb), xcb_xkb_per_client_flags_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32, UInt32, UInt32, UInt32, UInt32), c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)
end

"""
    xcb_xkb_per_client_flags_unchecked(c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_per_client_flags_unchecked(c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)
    ccall((:xcb_xkb_per_client_flags_unchecked, libxcb_xkb), xcb_xkb_per_client_flags_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt32, UInt32, UInt32, UInt32, UInt32), c, deviceSpec, change, value, ctrlsToChange, autoCtrls, autoCtrlsValues)
end

"""
    xcb_xkb_per_client_flags_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_per_client_flags_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_per_client_flags_reply(c, cookie, e)
    ccall((:xcb_xkb_per_client_flags_reply, libxcb_xkb), Ptr{xcb_xkb_per_client_flags_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_per_client_flags_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_list_components_sizeof(_buffer)
    ccall((:xcb_xkb_list_components_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_list_components(c, deviceSpec, maxNames)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_list_components(c, deviceSpec, maxNames)
    ccall((:xcb_xkb_list_components, libxcb_xkb), xcb_xkb_list_components_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16), c, deviceSpec, maxNames)
end

"""
    xcb_xkb_list_components_unchecked(c, deviceSpec, maxNames)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_list_components_unchecked(c, deviceSpec, maxNames)
    ccall((:xcb_xkb_list_components_unchecked, libxcb_xkb), xcb_xkb_list_components_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16), c, deviceSpec, maxNames)
end

function xcb_xkb_list_components_keymaps_length(R)
    ccall((:xcb_xkb_list_components_keymaps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_keymaps_iterator(R)
    ccall((:xcb_xkb_list_components_keymaps_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_keycodes_length(R)
    ccall((:xcb_xkb_list_components_keycodes_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_keycodes_iterator(R)
    ccall((:xcb_xkb_list_components_keycodes_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_types_length(R)
    ccall((:xcb_xkb_list_components_types_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_types_iterator(R)
    ccall((:xcb_xkb_list_components_types_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_compat_maps_length(R)
    ccall((:xcb_xkb_list_components_compat_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_compat_maps_iterator(R)
    ccall((:xcb_xkb_list_components_compat_maps_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_symbols_length(R)
    ccall((:xcb_xkb_list_components_symbols_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_symbols_iterator(R)
    ccall((:xcb_xkb_list_components_symbols_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_geometries_length(R)
    ccall((:xcb_xkb_list_components_geometries_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

function xcb_xkb_list_components_geometries_iterator(R)
    ccall((:xcb_xkb_list_components_geometries_iterator, libxcb_xkb), xcb_xkb_listing_iterator_t, (Ptr{xcb_xkb_list_components_reply_t},), R)
end

"""
    xcb_xkb_list_components_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_list_components_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_list_components_reply(c, cookie, e)
    ccall((:xcb_xkb_list_components_reply, libxcb_xkb), Ptr{xcb_xkb_list_components_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_list_components_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_types_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_types_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_types_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_types_rtrn_iterator, libxcb_xkb), xcb_xkb_key_type_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_syms_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_syms_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_syms_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_syms_rtrn_iterator, libxcb_xkb), xcb_xkb_key_sym_map_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_count_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts, libxcb_xkb), Ptr{xcb_xkb_action_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_acts_rtrn_acts_iterator, libxcb_xkb), xcb_xkb_action_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn, libxcb_xkb), Ptr{xcb_xkb_set_behavior_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_behaviors_rtrn_iterator, libxcb_xkb), xcb_xkb_set_behavior_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmods_rtrn_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn, libxcb_xkb), Ptr{xcb_xkb_set_explicit_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_explicit_rtrn_iterator, libxcb_xkb), xcb_xkb_set_explicit_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn, libxcb_xkb), Ptr{xcb_xkb_key_mod_map_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_modmap_rtrn_iterator, libxcb_xkb), xcb_xkb_key_mod_map_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn, libxcb_xkb), Ptr{xcb_xkb_key_v_mod_map_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_vmodmap_rtrn_iterator, libxcb_xkb), xcb_xkb_key_v_mod_map_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_serialize(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_get_kbd_by_name_replies_types_map_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_unpack(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16, Ptr{xcb_xkb_get_kbd_by_name_replies_types_map_t}), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_types_map_sizeof(_buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
    ccall((:xcb_xkb_get_kbd_by_name_replies_types_map_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt8, UInt8, UInt16, UInt8, UInt16, UInt8, UInt8, UInt8, UInt16), _buffer, nTypes, nKeySyms, nKeyActions, totalActions, totalKeyBehaviors, virtualMods, totalKeyExplicit, totalModMapKeys, totalVModMapKeys, present)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_type_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type, libxcb_xkb), Ptr{UInt8}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_n_levels_per_type_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_kt_level_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_indicator_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_virtual_mod_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_groups_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names, libxcb_xkb), Ptr{xcb_xkb_key_name_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_names_iterator, libxcb_xkb), xcb_xkb_key_name_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases, libxcb_xkb), Ptr{xcb_xkb_key_alias_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_key_aliases_iterator, libxcb_xkb), xcb_xkb_key_alias_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names, libxcb_xkb), Ptr{xcb_atom_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names_end(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_radio_group_names_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_serialize(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_unpack(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32, Ptr{xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t}), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list_sizeof(_buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt8, UInt32, UInt16, UInt8, UInt8, UInt8, UInt8, UInt32), _buffer, nTypes, indicators, virtualMods, groupNames, nKeys, nKeyAliases, nRadioGroups, which)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn, libxcb_xkb), Ptr{xcb_xkb_sym_interpret_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_si_rtrn_iterator, libxcb_xkb), xcb_xkb_sym_interpret_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn, libxcb_xkb), Ptr{xcb_xkb_mod_def_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_compat_map_group_rtrn_iterator, libxcb_xkb), xcb_xkb_mod_def_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps(S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps, libxcb_xkb), Ptr{xcb_xkb_indicator_map_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), S)
end

function xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps_length(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps_iterator(R, S)
    ccall((:xcb_xkb_get_kbd_by_name_replies_indicator_maps_maps_iterator, libxcb_xkb), xcb_xkb_indicator_map_iterator_t, (Ptr{xcb_xkb_get_kbd_by_name_reply_t}, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), R, S)
end

function xcb_xkb_get_kbd_by_name_replies_key_names_value_list(R)
    ccall((:xcb_xkb_get_kbd_by_name_replies_key_names_value_list, libxcb_xkb), Ptr{xcb_xkb_get_kbd_by_name_replies_key_names_value_list_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), R)
end

function xcb_xkb_get_kbd_by_name_replies_geometry_label_font(R)
    ccall((:xcb_xkb_get_kbd_by_name_replies_geometry_label_font, libxcb_xkb), Ptr{xcb_xkb_counted_string_16_t}, (Ptr{xcb_xkb_get_kbd_by_name_replies_t},), R)
end

function xcb_xkb_get_kbd_by_name_replies_serialize(_buffer, reported, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_serialize, libxcb_xkb), Cint, (Ptr{Ptr{Cvoid}}, UInt16, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), _buffer, reported, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_unpack(_buffer, reported, _aux)
    ccall((:xcb_xkb_get_kbd_by_name_replies_unpack, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt16, Ptr{xcb_xkb_get_kbd_by_name_replies_t}), _buffer, reported, _aux)
end

function xcb_xkb_get_kbd_by_name_replies_sizeof(_buffer, reported)
    ccall((:xcb_xkb_get_kbd_by_name_replies_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid}, UInt16), _buffer, reported)
end

function xcb_xkb_get_kbd_by_name_sizeof(_buffer)
    ccall((:xcb_xkb_get_kbd_by_name_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_kbd_by_name(c, deviceSpec, need, want, load)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_kbd_by_name(c, deviceSpec, need, want, load)
    ccall((:xcb_xkb_get_kbd_by_name, libxcb_xkb), xcb_xkb_get_kbd_by_name_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt8), c, deviceSpec, need, want, load)
end

"""
    xcb_xkb_get_kbd_by_name_unchecked(c, deviceSpec, need, want, load)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_kbd_by_name_unchecked(c, deviceSpec, need, want, load)
    ccall((:xcb_xkb_get_kbd_by_name_unchecked, libxcb_xkb), xcb_xkb_get_kbd_by_name_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt16, UInt8), c, deviceSpec, need, want, load)
end

function xcb_xkb_get_kbd_by_name_replies(R)
    ccall((:xcb_xkb_get_kbd_by_name_replies, libxcb_xkb), Ptr{Cvoid}, (Ptr{xcb_xkb_get_kbd_by_name_reply_t},), R)
end

"""
    xcb_xkb_get_kbd_by_name_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_kbd_by_name_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_kbd_by_name_reply(c, cookie, e)
    ccall((:xcb_xkb_get_kbd_by_name_reply, libxcb_xkb), Ptr{xcb_xkb_get_kbd_by_name_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_kbd_by_name_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_get_device_info_sizeof(_buffer)
    ccall((:xcb_xkb_get_device_info_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_get_device_info(c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_device_info(c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)
    ccall((:xcb_xkb_get_device_info, libxcb_xkb), xcb_xkb_get_device_info_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt8, UInt8, UInt8, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t), c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)
end

"""
    xcb_xkb_get_device_info_unchecked(c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_get_device_info_unchecked(c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)
    ccall((:xcb_xkb_get_device_info_unchecked, libxcb_xkb), xcb_xkb_get_device_info_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt16, UInt8, UInt8, UInt8, xcb_xkb_led_class_spec_t, xcb_xkb_id_spec_t), c, deviceSpec, wanted, allButtons, firstButton, nButtons, ledClass, ledID)
end

function xcb_xkb_get_device_info_name(R)
    ccall((:xcb_xkb_get_device_info_name, libxcb_xkb), Ptr{xcb_xkb_string8_t}, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_name_length(R)
    ccall((:xcb_xkb_get_device_info_name_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_name_end(R)
    ccall((:xcb_xkb_get_device_info_name_end, libxcb_xkb), xcb_generic_iterator_t, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_btn_actions(R)
    ccall((:xcb_xkb_get_device_info_btn_actions, libxcb_xkb), Ptr{xcb_xkb_action_t}, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_btn_actions_length(R)
    ccall((:xcb_xkb_get_device_info_btn_actions_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_btn_actions_iterator(R)
    ccall((:xcb_xkb_get_device_info_btn_actions_iterator, libxcb_xkb), xcb_xkb_action_iterator_t, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_leds_length(R)
    ccall((:xcb_xkb_get_device_info_leds_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

function xcb_xkb_get_device_info_leds_iterator(R)
    ccall((:xcb_xkb_get_device_info_leds_iterator, libxcb_xkb), xcb_xkb_device_led_info_iterator_t, (Ptr{xcb_xkb_get_device_info_reply_t},), R)
end

"""
    xcb_xkb_get_device_info_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_get_device_info_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_get_device_info_reply(c, cookie, e)
    ccall((:xcb_xkb_get_device_info_reply, libxcb_xkb), Ptr{xcb_xkb_get_device_info_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_get_device_info_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_xkb_set_device_info_sizeof(_buffer)
    ccall((:xcb_xkb_set_device_info_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_device_info_checked(c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)

Delivers a request to the X server.

This form can be used only if the request will not cause a reply to be generated. Any returned error will be saved for handling by [`xcb_request_check`](@ref)().

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_device_info_checked(c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)
    ccall((:xcb_xkb_set_device_info_checked, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt16, UInt16, Ptr{xcb_xkb_action_t}, Ptr{xcb_xkb_device_led_info_t}), c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)
end

"""
    xcb_xkb_set_device_info(c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_device_info(c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)
    ccall((:xcb_xkb_set_device_info, libxcb_xkb), xcb_void_cookie_t, (Ptr{xcb_connection_t}, xcb_xkb_device_spec_t, UInt8, UInt8, UInt16, UInt16, Ptr{xcb_xkb_action_t}, Ptr{xcb_xkb_device_led_info_t}), c, deviceSpec, firstBtn, nBtns, change, nDeviceLedFBs, btnActions, leds)
end

function xcb_xkb_set_device_info_btn_actions(R)
    ccall((:xcb_xkb_set_device_info_btn_actions, libxcb_xkb), Ptr{xcb_xkb_action_t}, (Ptr{xcb_xkb_set_device_info_request_t},), R)
end

function xcb_xkb_set_device_info_btn_actions_length(R)
    ccall((:xcb_xkb_set_device_info_btn_actions_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_device_info_request_t},), R)
end

function xcb_xkb_set_device_info_btn_actions_iterator(R)
    ccall((:xcb_xkb_set_device_info_btn_actions_iterator, libxcb_xkb), xcb_xkb_action_iterator_t, (Ptr{xcb_xkb_set_device_info_request_t},), R)
end

function xcb_xkb_set_device_info_leds_length(R)
    ccall((:xcb_xkb_set_device_info_leds_length, libxcb_xkb), Cint, (Ptr{xcb_xkb_set_device_info_request_t},), R)
end

function xcb_xkb_set_device_info_leds_iterator(R)
    ccall((:xcb_xkb_set_device_info_leds_iterator, libxcb_xkb), xcb_xkb_device_led_info_iterator_t, (Ptr{xcb_xkb_set_device_info_request_t},), R)
end

function xcb_xkb_set_debugging_flags_sizeof(_buffer)
    ccall((:xcb_xkb_set_debugging_flags_sizeof, libxcb_xkb), Cint, (Ptr{Cvoid},), _buffer)
end

"""
    xcb_xkb_set_debugging_flags(c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)

Delivers a request to the X server.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_debugging_flags(c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)
    ccall((:xcb_xkb_set_debugging_flags, libxcb_xkb), xcb_xkb_set_debugging_flags_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt32, UInt32, UInt32, UInt32, Ptr{xcb_xkb_string8_t}), c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)
end

"""
    xcb_xkb_set_debugging_flags_unchecked(c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)

Delivers a request to the X server.

This form can be used only if the request will cause a reply to be generated. Any returned error will be placed in the event queue.

### Parameters
* `c`: The connection
### Returns
A cookie
"""
function xcb_xkb_set_debugging_flags_unchecked(c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)
    ccall((:xcb_xkb_set_debugging_flags_unchecked, libxcb_xkb), xcb_xkb_set_debugging_flags_cookie_t, (Ptr{xcb_connection_t}, UInt16, UInt32, UInt32, UInt32, UInt32, Ptr{xcb_xkb_string8_t}), c, msgLength, affectFlags, flags, affectCtrls, ctrls, message)
end

"""
    xcb_xkb_set_debugging_flags_reply(c, cookie, e)

Return the reply

Returns the reply of the request asked by

The parameter `e` supplied to this function must be NULL if [`xcb_xkb_set_debugging_flags_unchecked`](@ref)(). is used. Otherwise, it stores the error if any.

The returned value must be freed by the caller using free().

### Parameters
* `c`: The connection
* `cookie`: The cookie
* `e`: The [`xcb_generic_error_t`](@ref) supplied
"""
function xcb_xkb_set_debugging_flags_reply(c, cookie, e)
    ccall((:xcb_xkb_set_debugging_flags_reply, libxcb_xkb), Ptr{xcb_xkb_set_debugging_flags_reply_t}, (Ptr{xcb_connection_t}, xcb_xkb_set_debugging_flags_cookie_t, Ptr{Ptr{xcb_generic_error_t}}), c, cookie, e)
end

function xcb_event_get_label(type)
    ccall((:xcb_event_get_label, libxcb_util), Ptr{Cchar}, (Cint,), type)
end

function xcb_event_get_error_label(type)
    ccall((:xcb_event_get_error_label, libxcb_util), Ptr{Cchar}, (Cint,), type)
end

function xcb_event_get_request_label(type)
    ccall((:xcb_event_get_request_label, libxcb_util), Ptr{Cchar}, (Cint,), type)
end

# Skipping MacroDefinition: XCB_PACKED __attribute__ ( ( __packed__ ) )

const X_PROTOCOL = 11

const X_PROTOCOL_REVISION = 0

const X_TCP_PORT = 6000

const XCB_CONN_ERROR = 1

const XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2

const XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3

const XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4

const XCB_CONN_CLOSED_PARSE_ERR = 5

const XCB_CONN_CLOSED_INVALID_SCREEN = 6

const XCB_CONN_CLOSED_FDPASSING_FAILED = 7

const XCB_KEY_PRESS = 2

const XCB_KEY_RELEASE = 3

const XCB_BUTTON_PRESS = 4

const XCB_BUTTON_RELEASE = 5

const XCB_MOTION_NOTIFY = 6

const XCB_ENTER_NOTIFY = 7

const XCB_LEAVE_NOTIFY = 8

const XCB_FOCUS_IN = 9

const XCB_FOCUS_OUT = 10

const XCB_KEYMAP_NOTIFY = 11

const XCB_EXPOSE = 12

const XCB_GRAPHICS_EXPOSURE = 13

const XCB_NO_EXPOSURE = 14

const XCB_VISIBILITY_NOTIFY = 15

const XCB_CREATE_NOTIFY = 16

const XCB_DESTROY_NOTIFY = 17

const XCB_UNMAP_NOTIFY = 18

const XCB_MAP_NOTIFY = 19

const XCB_MAP_REQUEST = 20

const XCB_REPARENT_NOTIFY = 21

const XCB_CONFIGURE_NOTIFY = 22

const XCB_CONFIGURE_REQUEST = 23

const XCB_GRAVITY_NOTIFY = 24

const XCB_RESIZE_REQUEST = 25

const XCB_CIRCULATE_NOTIFY = 26

const XCB_CIRCULATE_REQUEST = 27

const XCB_PROPERTY_NOTIFY = 28

const XCB_SELECTION_CLEAR = 29

const XCB_SELECTION_REQUEST = 30

const XCB_SELECTION_NOTIFY = 31

const XCB_COLORMAP_NOTIFY = 32

const XCB_CLIENT_MESSAGE = 33

const XCB_MAPPING_NOTIFY = 34

const XCB_GE_GENERIC = 35

const XCB_REQUEST = 1

const XCB_VALUE = 2

const XCB_WINDOW = 3

const XCB_PIXMAP = 4

const XCB_ATOM = 5

const XCB_CURSOR = 6

const XCB_FONT = 7

const XCB_MATCH = 8

const XCB_DRAWABLE = 9

const XCB_ACCESS = 10

const XCB_ALLOC = 11

const XCB_COLORMAP = 12

const XCB_G_CONTEXT = 13

const XCB_ID_CHOICE = 14

const XCB_NAME = 15

const XCB_LENGTH = 16

const XCB_IMPLEMENTATION = 17

const XCB_CREATE_WINDOW = 1

const XCB_CHANGE_WINDOW_ATTRIBUTES = 2

const XCB_GET_WINDOW_ATTRIBUTES = 3

const XCB_DESTROY_WINDOW = 4

const XCB_DESTROY_SUBWINDOWS = 5

const XCB_CHANGE_SAVE_SET = 6

const XCB_REPARENT_WINDOW = 7

const XCB_MAP_WINDOW = 8

const XCB_MAP_SUBWINDOWS = 9

const XCB_UNMAP_WINDOW = 10

const XCB_UNMAP_SUBWINDOWS = 11

const XCB_CONFIGURE_WINDOW = 12

const XCB_CIRCULATE_WINDOW = 13

const XCB_GET_GEOMETRY = 14

const XCB_QUERY_TREE = 15

const XCB_INTERN_ATOM = 16

const XCB_GET_ATOM_NAME = 17

const XCB_CHANGE_PROPERTY = 18

const XCB_DELETE_PROPERTY = 19

const XCB_GET_PROPERTY = 20

const XCB_LIST_PROPERTIES = 21

const XCB_SET_SELECTION_OWNER = 22

const XCB_GET_SELECTION_OWNER = 23

const XCB_CONVERT_SELECTION = 24

const XCB_SEND_EVENT = 25

const XCB_GRAB_POINTER = 26

const XCB_UNGRAB_POINTER = 27

const XCB_GRAB_BUTTON = 28

const XCB_UNGRAB_BUTTON = 29

const XCB_CHANGE_ACTIVE_POINTER_GRAB = 30

const XCB_GRAB_KEYBOARD = 31

const XCB_UNGRAB_KEYBOARD = 32

const XCB_GRAB_KEY = 33

const XCB_UNGRAB_KEY = 34

const XCB_ALLOW_EVENTS = 35

const XCB_GRAB_SERVER = 36

const XCB_UNGRAB_SERVER = 37

const XCB_QUERY_POINTER = 38

const XCB_GET_MOTION_EVENTS = 39

const XCB_TRANSLATE_COORDINATES = 40

const XCB_WARP_POINTER = 41

const XCB_SET_INPUT_FOCUS = 42

const XCB_GET_INPUT_FOCUS = 43

const XCB_QUERY_KEYMAP = 44

const XCB_OPEN_FONT = 45

const XCB_CLOSE_FONT = 46

const XCB_QUERY_FONT = 47

const XCB_QUERY_TEXT_EXTENTS = 48

const XCB_LIST_FONTS = 49

const XCB_LIST_FONTS_WITH_INFO = 50

const XCB_SET_FONT_PATH = 51

const XCB_GET_FONT_PATH = 52

const XCB_CREATE_PIXMAP = 53

const XCB_FREE_PIXMAP = 54

const XCB_CREATE_GC = 55

const XCB_CHANGE_GC = 56

const XCB_COPY_GC = 57

const XCB_SET_DASHES = 58

const XCB_SET_CLIP_RECTANGLES = 59

const XCB_FREE_GC = 60

const XCB_CLEAR_AREA = 61

const XCB_COPY_AREA = 62

const XCB_COPY_PLANE = 63

const XCB_POLY_POINT = 64

const XCB_POLY_LINE = 65

const XCB_POLY_SEGMENT = 66

const XCB_POLY_RECTANGLE = 67

const XCB_POLY_ARC = 68

const XCB_FILL_POLY = 69

const XCB_POLY_FILL_RECTANGLE = 70

const XCB_POLY_FILL_ARC = 71

const XCB_PUT_IMAGE = 72

const XCB_GET_IMAGE = 73

const XCB_POLY_TEXT_8 = 74

const XCB_POLY_TEXT_16 = 75

const XCB_IMAGE_TEXT_8 = 76

const XCB_IMAGE_TEXT_16 = 77

const XCB_CREATE_COLORMAP = 78

const XCB_FREE_COLORMAP = 79

const XCB_COPY_COLORMAP_AND_FREE = 80

const XCB_INSTALL_COLORMAP = 81

const XCB_UNINSTALL_COLORMAP = 82

const XCB_LIST_INSTALLED_COLORMAPS = 83

const XCB_ALLOC_COLOR = 84

const XCB_ALLOC_NAMED_COLOR = 85

const XCB_ALLOC_COLOR_CELLS = 86

const XCB_ALLOC_COLOR_PLANES = 87

const XCB_FREE_COLORS = 88

const XCB_STORE_COLORS = 89

const XCB_STORE_NAMED_COLOR = 90

const XCB_QUERY_COLORS = 91

const XCB_LOOKUP_COLOR = 92

const XCB_CREATE_CURSOR = 93

const XCB_CREATE_GLYPH_CURSOR = 94

const XCB_FREE_CURSOR = 95

const XCB_RECOLOR_CURSOR = 96

const XCB_QUERY_BEST_SIZE = 97

const XCB_QUERY_EXTENSION = 98

const XCB_LIST_EXTENSIONS = 99

const XCB_CHANGE_KEYBOARD_MAPPING = 100

const XCB_GET_KEYBOARD_MAPPING = 101

const XCB_CHANGE_KEYBOARD_CONTROL = 102

const XCB_GET_KEYBOARD_CONTROL = 103

const XCB_BELL = 104

const XCB_CHANGE_POINTER_CONTROL = 105

const XCB_GET_POINTER_CONTROL = 106

const XCB_SET_SCREEN_SAVER = 107

const XCB_GET_SCREEN_SAVER = 108

const XCB_CHANGE_HOSTS = 109

const XCB_LIST_HOSTS = 110

const XCB_SET_ACCESS_CONTROL = 111

const XCB_SET_CLOSE_DOWN_MODE = 112

const XCB_KILL_CLIENT = 113

const XCB_ROTATE_PROPERTIES = 114

const XCB_FORCE_SCREEN_SAVER = 115

const XCB_SET_POINTER_MAPPING = 116

const XCB_GET_POINTER_MAPPING = 117

const XCB_SET_MODIFIER_MAPPING = 118

const XCB_GET_MODIFIER_MAPPING = 119

const XCB_NO_OPERATION = 127

const XCB_NONE = Clong(0)

const XCB_COPY_FROM_PARENT = Clong(0)

const XCB_CURRENT_TIME = Clong(0)

const XCB_NO_SYMBOL = Clong(0)

const XCB_XKB_MAJOR_VERSION = 1

const XCB_XKB_MINOR_VERSION = 0

const XCB_XKB_KEYBOARD = 0

const XCB_XKB_USE_EXTENSION = 0

const XCB_XKB_SELECT_EVENTS = 1

const XCB_XKB_BELL = 3

const XCB_XKB_GET_STATE = 4

const XCB_XKB_LATCH_LOCK_STATE = 5

const XCB_XKB_GET_CONTROLS = 6

const XCB_XKB_SET_CONTROLS = 7

const XCB_XKB_GET_MAP = 8

const XCB_XKB_SET_MAP = 9

const XCB_XKB_GET_COMPAT_MAP = 10

const XCB_XKB_SET_COMPAT_MAP = 11

const XCB_XKB_GET_INDICATOR_STATE = 12

const XCB_XKB_GET_INDICATOR_MAP = 13

const XCB_XKB_SET_INDICATOR_MAP = 14

const XCB_XKB_GET_NAMED_INDICATOR = 15

const XCB_XKB_SET_NAMED_INDICATOR = 16

const XCB_XKB_GET_NAMES = 17

const XCB_XKB_SET_NAMES = 18

const XCB_XKB_PER_CLIENT_FLAGS = 21

const XCB_XKB_LIST_COMPONENTS = 22

const XCB_XKB_GET_KBD_BY_NAME = 23

const XCB_XKB_GET_DEVICE_INFO = 24

const XCB_XKB_SET_DEVICE_INFO = 25

const XCB_XKB_SET_DEBUGGING_FLAGS = 101

const XCB_XKB_NEW_KEYBOARD_NOTIFY = 0

const XCB_XKB_MAP_NOTIFY = 1

const XCB_XKB_STATE_NOTIFY = 2

const XCB_XKB_CONTROLS_NOTIFY = 3

const XCB_XKB_INDICATOR_STATE_NOTIFY = 4

const XCB_XKB_INDICATOR_MAP_NOTIFY = 5

const XCB_XKB_NAMES_NOTIFY = 6

const XCB_XKB_COMPAT_MAP_NOTIFY = 7

const XCB_XKB_BELL_NOTIFY = 8

const XCB_XKB_ACTION_MESSAGE = 9

const XCB_XKB_ACCESS_X_NOTIFY = 10

const XCB_XKB_EXTENSION_DEVICE_NOTIFY = 11

const XCB_EVENT_RESPONSE_TYPE_MASK = 0x7f


