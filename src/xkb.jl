function Keymap(conn::Connection; setup_xkb = true)
    km = keymap_from_x11(conn.h; setup_xkb)

    # Get notified of state changes.
    @check xcb_xkb_select_events_aux(conn, xkb_x11_get_core_keyboard_device_id(conn), XCB_XKB_EVENT_TYPE_STATE_NOTIFY, true, true, false, 0, Ref(event_details_xkb(Dict("state" => true))))

    km
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
