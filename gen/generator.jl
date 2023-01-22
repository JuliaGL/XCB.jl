using Pkg
cd(@__DIR__)
Pkg.activate(".")

using Clang.Generators
using Clang.Generators.JLLEnvs
using Xorg_libxcb_jll
using Xorg_xcb_util_jll

add_include!(args, include::String) = push!(args, "-I$INCLUDE")
add_include!(args, includes::AbstractVector) = foreach(x -> add_include!(args, x), includes)

bitmasks = [
    :xcb_event_mask_t,
    :xcb_mod_mask_t,
    :xcb_key_but_mask_t,
    :xcb_button_mask_t,
    :xkb_state_match,
    :xcb_cw_t,
    :xcb_config_window_t,
    :xcb_gc_t,
    :xcb_color_flag_t,
    :xcb_kb_t,
    :xcb_xkb_event_type_t,
    :xcb_xkb_nkn_detail_t,
    :xcb_xkb_axn_detail_t,
    :xcb_xkb_map_part_t,
    :xcb_xkb_set_map_flags_t,
    :xcb_xkb_state_part_t,
    :xcb_xkb_bool_ctrl_t,
    :xcb_xkb_control_t,
    :xcb_xkb_ax_option_t,
    :xcb_xkb_id_t,
    :xcb_xkb_set_of_group_t,
    :xcb_xkb_groups_wrap_t,
    :xcb_xkb_v_mods_high_t,
    :xcb_xkb_v_mods_low_t,
    :xcb_xkb_v_mod_t,
    :xcb_xkb_explicit_t,
    :xcb_xkb_im_flag_t,
    :xcb_xkb_im_mods_which_t,
    :xcb_xkb_im_groups_which_t,
    :xcb_xkb_cm_detail_t,
    :xcb_xkb_name_detail_t,
    :xcb_xkb_gbn_detail_t,
    :xcb_xkb_xi_feature_t,
    :xcb_xkb_per_client_flag_t,
    :xcb_xkb_sa_t,
    :xcb_xkb_sa_move_ptr_flag_t,
    :xcb_xkb_sa_set_ptr_dflt_flag_t,
    :xcb_xkb_sa_iso_lock_flag_t,
    :xcb_xkb_sa_iso_lock_no_affect_t,
    :xcb_xkb_switch_screen_flag_t,
    :xcb_xkb_bool_ctrls_high_t,
    :xcb_xkb_bool_ctrls_low_t,
    :xcb_xkb_action_message_flag_t,
    :xcb_xkb_lock_device_flags_t,
]

# get include directory
INCLUDE = [joinpath(Xorg_libxcb_jll.artifact_dir, "include", "xcb"), joinpath(Xorg_xcb_util_jll.artifact_dir, "include", "xcb")]
HEADERS = [joinpath.(INCLUDE[1], ["xkb.h"]); joinpath.(INCLUDE[2], ["xcb_event.h"])]

function postprocess(target)
    final = ""
    bitmasks_regex = Regex(string("@enum (", join(bitmasks, '|'), ')'))
    for line in split(read(target, String), '\n')
        # Turn `@enum` into `@bitmask` for bitmaskable enums.
        is_bitmask = startswith(line, bitmasks_regex)
        is_bitmask && (line = replace(line, bitmasks_regex => s"@bitmask \1"))
        final *= line * '\n'
    end
    write(target, final)
end

for target in JLLEnvs.JLL_ENV_TRIPLES
# for target in ["x86_64-linux-gnu"]
    @info "processing $target"

    # programmatically add options
    general = Dict{String,Any}()
    codegen = Dict{String,Any}()
    options = Dict{String,Any}(
        "general" => general,
        "codegen" => codegen,
    )
    general["library_name"] = "libxcb"
    general["library_names"] = Dict(
        "xkb.h" => "libxcb_xkb",
        "xcb_event.h" => "libxcb_util",
    )
    general["output_file_path"] = joinpath(dirname(@__DIR__), "lib", "$target.jl")
    general["use_deterministic_symbol"] = true
    general["use_julia_native_enum_type"] = true
    general["extract_c_comment_style"] = "doxygen"
    general["struct_field_comment_style"] = "outofline"
    general["enumerator_comment_style"] = "outofline"
    codegen["add_record_constructors"] = true
    codegen["union_single_constructor"] = true
    codegen["opaque_as_mutable_struct"] = false

    # add compiler flags
    args = get_default_args(target)
    add_include!(args, INCLUDE)
    ctx = create_context(HEADERS, args, options)

    build!(ctx)
    postprocess(general["output_file_path"])
end
