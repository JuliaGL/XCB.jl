module XCB

using DocStringExtensions

@template (FUNCTIONS, METHODS, MACROS) =
    """
    $(DOCSTRING)
    $(TYPEDSIGNATURES)
    """

@template TYPES =
    """
    $(DOCSTRING)
    $(TYPEDEF)
    $(TYPEDSIGNATURES)
    $(TYPEDFIELDS)
    """

using Base: unsafe_convert
const Optional{T} = Union{Nothing,T}

using Reexport
@reexport using WindowAbstractions
@reexport using XKeyboard
import XKeyboard: Keymap
import WindowAbstractions: set_title,
                           set_icon_title,
                           resize_window,
                           move_window_to,
                           poll_for_events!,
                           window_type,
                           windows,
                           get_window,
                           map_window,
                           unmap_window,
                           current_screen,

                           MouseEvent,
                           MouseButton,
                           PointerState,
                           KeyEvent,
                           ModifierState,
                           Event,
                           EventQueue,
                           save_history,
                           replay_history

include("LibXCB.jl")
@reexport using .LibXCB

include("exceptions.jl")
include("connection.jl")
include("graphics.jl")
include("window.jl")
include("xkb.jl")
include("window_manager.jl")
include("inputs.jl")
include("testing.jl")
include("events.jl")


export 
       Connection,
       Setup,
       check,
       check_flush,
       current_screen,
       XCBWindow,
       GraphicsContext,
       attach_graphics_context!,
       set_attributes,
       XWindowManager,
       @check,
       @flush,
       send_event,
       WindowCorner, WINDOW_CORNER_BOTTOM_LEFT, WINDOW_CORNER_BOTTOM_RIGHT, WINDOW_CORNER_TOP_LEFT, WINDOW_CORNER_TOP_RIGHT

end # module
