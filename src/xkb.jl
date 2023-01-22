"""
Keymap used to encode information regarding keyboard layout, and country and language codes.

A string representation can be obtained from a `Keymap` by using `String(keymap)`.
"""
mutable struct Keymap <: Handle
    h::Ptr{xkb_keymap}
    ctx::Ptr{xkb_context}
    state::Ptr{xkb_state}
    conn::Connection
    device_id
    function Keymap(h, ctx, state, conn, id)
        km = new(h, ctx, state, conn, id)

        # get notified of state changes
        @check xcb_xkb_select_events_aux(conn, id, XCB_XKB_EVENT_TYPE_STATE_NOTIFY, true, true, false, 0, Ref(event_details_xkb(Dict("state" => true))))

        finalizer(km) do x
            xkb_state_unref(x.state)
            xkb_keymap_unref(x.h)
            xkb_context_unref(x.ctx)
        end
    end
end

function event_details_xkb(fields::Dict{String, Bool})
    names = fieldnames(xcb_xkb_select_events_details_t)
    flags = zeros(length(names))
    fields_affect = Dict("affect" * uppercasefirst(k) => v for (k, v) ∈ fields)
    for i ∈ 1:2:length(names)
        access_field = string(names[i])
        if access_field ∈ keys(fields_affect)
            flags[i] = 1 # affect
            flags[i + 1] = fields_affect[access_field] # details
        end
    end
    xcb_xkb_select_events_details_t(flags...)
end

"""
Construct a `Keymap` using `conn` as the connection to the X Server.

It uses XKB, the X Keyboard extension, which must be initialized for each connection, typically when creating a keymap (it is unlikely to be used before then). If this is not your first call to this constructor with this connection, you should set `setup_xkb` to `false`.
"""
function Keymap(conn::Connection; setup_xkb=true)
    if setup_xkb
        ret_code = xkb_x11_setup_xkb_extension(conn, 1, 0, XKB_X11_SETUP_XKB_EXTENSION_NO_FLAGS, C_NULL, C_NULL, C_NULL, C_NULL)
        ret_code == 0 && error("XKB extension setup failed")
    end
    ctx = xkb_context_new(XKB_CONTEXT_NO_DEFAULT_INCLUDES)
    ctx == C_NULL && error("Context creation failed")
    device_id = xkb_x11_get_core_keyboard_device_id(conn)
    device_id == -1 && error("No keyboard device ID could be retrieved")
    keymap = xkb_x11_keymap_new_from_device(ctx, conn, device_id, XKB_KEYMAP_COMPILE_NO_FLAGS)
    state = xkb_x11_state_new_from_device(keymap, conn, device_id)
    state == C_NULL && error("State creation failed")
    Keymap(keymap, ctx, state, conn, device_id)
end

function Base.String(km::Keymap)
    km_name_ptr = xkb_keymap_get_as_string(km, XKB_KEYMAP_FORMAT_TEXT_V1)
    km_name_ptr == C_NULL && error("Failed to obtain a string from the keymap $km")
    unsafe_string(km_name_ptr)
end

"""
Return a `String` representation of an integer XCB keysym.
"""
function keysym_string(keysym::Integer; max_chars=50)
    char_tmp = zeros(UInt8, max_chars)
    char_tmp_ptr = pointer(char_tmp)
    GC.@preserve char_tmp begin
        val = xkb_keysym_get_name(keysym, pointer(char_tmp), sizeof(eltype(char_tmp)) * length(char_tmp))
        val == -1 && @error("Failed to obtain a keysym string for $(hex(keysym))")
        str = unsafe_string(char_tmp_ptr)
    end
    str
end

"""
Obtain the name of a physical key identified by its `keycode` using a keymap.
"""
function key_name(km::Keymap, keycode::Integer)
    ptr = xkb_keymap_key_get_name(km, keycode)
    ptr == C_NULL && error("Failed to obtain a name from the keycode $keycode")
    Symbol(unsafe_string(ptr))
end

"""
Obtain a keycode from a key `name` using a keymap.
"""
function keycode(km::Keymap, name::Symbol)
    keycode = xkb_keymap_key_by_name(km, string(name))
    keycode == typemax(UInt32) && error("Failed to obtain a keycode from the key name $name")
    keycode
end

function keystroke_info(km::Keymap, event_details::EventDetails)
    @unpack key_name, key, input = event_details.data
    keycode = xkb_keymap_key_by_name(km, string(key_name))
    "Key \e[31m$key_name\e[m (code \e[33m$keycode\e[m): input \"\e[36m$input\e[m\" from symbol \e[36m$key\e[m"
end

function Base.Char(km::Keymap, keycode::Integer)
    codepoints = zeros(UInt8, 5) # reserve 4 bytes + 1 NUL byte
    size = xkb_state_key_get_utf8(km.state, keycode, C_NULL, 0)
    @assert size ≤ 4 "More than 4 bytes appear to be required to represent the character from keycode $keycode in UTF-8; `Char`s can only hold 4 bytes of data, which suggests an error or unexpected behavior from XKB or the wrapping logic."
    GC.@preserve codepoints begin
        ptr = pointer(codepoints)
        xkb_state_key_get_utf8(km.state, keycode, ptr, 5)
        Char(reinterpret(UInt32, @view codepoints[1:4])[])
    end
end

"""
Generate a `KeySymbol` from a keycode.
"""
KeySymbol(km::Keymap, keycode::Integer) = key_symbol_from_keysym_string(keysym_string(xkb_state_key_get_one_sym(km.state, keycode)))

"""
Generate a `KeySymbol` from a key name.
"""
KeySymbol(km::Keymap, key_name::Symbol) = KeySymbol(km, xkb_keymap_key_by_name(km, string(key_name)))

"""
Generate a `KeySymbol` from a XCB keysym string.
"""
function key_symbol_from_keysym_string(keysym::AbstractString)
    keysym = Symbol(lowercase(keysym))
    KeySymbol(standardize_key_symbol(keysym))
end

"""
Transform a key symbol obtained via XCB to a standard symbol defined in `WindowAbstractions`.
"""
standardize_key_symbol(key_symbol::Symbol) = key_symbol ∈ keys(keysym_names_translation) ? keysym_names_translation[key_symbol] : key_symbol

const keysym_names_translation = Dict(
    :shift_r          => :shift_right,
    :shift_l          => :shift_left,
    :control_r        => :control_right,
    :control_l        => :control_left,
    :iso_level3_shift => :alt_gr,
    :alt_l            => :alt_left,
    :return           => :enter,
)

"""
Produce a key event based on a key name, a modifier state and an action using a keymap.
"""
function key_event_from_name(km::Keymap, key_name::Symbol, modifiers::KeyModifierState, action::KeyAction)
    KeyEvent(key_name, KeySymbol(km, key_name), Char(km, keycode(km, key_name)), modifiers, action)
end
