using Clang
import Xorg_libxcb_jll
import Xorg_xcb_util_jll
import xkbcommon_jll

xcb_include_dir = joinpath(Xorg_libxcb_jll.artifact_dir, "include", "xcb")
xcb_util_dir = joinpath(dirname(dirname(Xorg_xcb_util_jll.libxcb_util_path)), "include", "xcb")
xkb_include_dir = joinpath(xkbcommon_jll.artifact_dir, "include", "xkbcommon")
xkb_headers = joinpath.(Ref(xkb_include_dir), ["xkbcommon.h", "xkbcommon-x11.h"])
xcb_headers = [joinpath.(Ref(xcb_include_dir), ["xkb.h"])..., joinpath(xcb_util_dir, "xcb_event.h")]

# Set up include paths
clang_xcb_includes = [xcb_include_dir, xcb_util_dir]
clang_xkb_includes = [xkb_include_dir]

# Clang arguments
clang_extraargs = ["-v"]

# Test if a header should be wrapped
function wrap_header(top_hdr, cursor_header)
    any(startswith.(Ref(dirname(cursor_header)), vcat(clang_xcb_includes, clang_xkb_includes)))
end

wc_xcb = init(;
                        headers=xcb_headers,
                        output_file=joinpath(@__DIR__, "..", "gen", "xcb_api.jl"),
                        common_file=joinpath(@__DIR__, "..", "gen", "xcb_common.jl"),
                        clang_includes=clang_xcb_includes,
                        clang_args=clang_extraargs,
                        header_wrapped=wrap_header,
                        header_library=x -> basename(x) == "xkb.h" ? "libxcb_xkb" : basename(x) == "xcb_event.h" ? "libxcb_util" : "libxcb",
                        clang_diagnostics=false,
                        )
run(wc_xcb)

wc_xkb = init(;
                        headers=xkb_headers,
                        output_file=joinpath(@__DIR__, "..", "gen", "xkb_api.jl"),
                        common_file=joinpath(@__DIR__, "..", "gen", "xkb_common.jl"),
                        clang_includes=clang_xkb_includes,
                        clang_args=clang_extraargs,
                        header_wrapped=wrap_header,
                        header_library=x -> endswith(x, "xkbcommon-x11.h") ? "libxkbcommon_x11" : "libxkbcommon",
                        clang_diagnostics=true,
                        )
run(wc_xkb)
