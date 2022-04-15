var documenterSearchIndex = {"docs":
[{"location":"utility/#Utility-tools","page":"Utility tools","title":"Utility tools","text":"","category":"section"},{"location":"utility/#Visualizing-X-events","page":"Utility tools","title":"Visualizing X events","text":"","category":"section"},{"location":"utility/","page":"Utility tools","title":"Utility tools","text":"xev is a command-line tool that setups a toy window and prints all incoming X events. It is a very useful tool to experiment with when trying to determine which events are sent upon which actions.","category":"page"},{"location":"utility/#Keyboard-configuration","page":"Utility tools","title":"Keyboard configuration","text":"","category":"section"},{"location":"utility/","page":"Utility tools","title":"Utility tools","text":"xmodmap allows one to query information about various input-related keyboard elements. Notably, it lists all the keycodes and corresponding key symbols as interpreted by the X Server.","category":"page"},{"location":"api/#API","page":"API","title":"API","text":"","category":"section"},{"location":"api/","page":"API","title":"API","text":"","category":"page"},{"location":"api/","page":"API","title":"API","text":"Modules = [XCB]\nPrivate = true","category":"page"},{"location":"api/#WindowAbstractions.KeySymbol-Tuple{XCB.Keymap, Integer}","page":"API","title":"WindowAbstractions.KeySymbol","text":"Generate a KeySymbol from a keycode.\n\nKeySymbol(km::XCB.Keymap, keycode::Integer) -> KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#WindowAbstractions.KeySymbol-Tuple{XCB.Keymap, Symbol}","page":"API","title":"WindowAbstractions.KeySymbol","text":"Generate a KeySymbol from a key name.\n\nKeySymbol(km::XCB.Keymap, key_name::Symbol) -> KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.Connection","page":"API","title":"XCB.Connection","text":"Connection to the X server.\n\nmutable struct Connection <: XCB.Handle\n\nh::Any\nOpaque handle to the connection, used for API calls.\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Connection-Tuple{}","page":"API","title":"XCB.Connection","text":"Initialize a connection to the X server.\n\nConnection(; display) -> Connection\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.ConnectionError","page":"API","title":"XCB.ConnectionError","text":"The X Server reported a connection error.\n\nstruct ConnectionError <: Exception\n\nmsg::Any\ncode::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.FlushError","page":"API","title":"XCB.FlushError","text":"Error when flushing a connection to the X Server.\n\nstruct FlushError <: Exception\n\ncode::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.GraphicsContext","page":"API","title":"XCB.GraphicsContext","text":"Graphics context attached to a window. Used to register drawing commands on the window surface.\n\nmutable struct GraphicsContext\n\nconn::Connection\nid::UInt32\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Handle","page":"API","title":"XCB.Handle","text":"Structures which contain a handle (opaque pointer) as primary data. Those structures are usually defined as mutable so that a finalizer can be registered. Any Handle structure is automatically converted to its handle data on ccalls, through unsafe_convert.\n\nabstract type Handle\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Keymap","page":"API","title":"XCB.Keymap","text":"Keymap used to encode information regarding keyboard layout, and country and language codes.\n\nA string representation can be obtained from a Keymap by using String(keymap).\n\nmutable struct Keymap <: XCB.Handle\n\nh::Ptr{Nothing}\nctx::Ptr{Nothing}\nstate::Ptr{Nothing}\nconn::Connection\ndevice_id::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Keymap-Tuple{Connection}","page":"API","title":"XCB.Keymap","text":"Construct a Keymap using conn as the connection to the X Server.\n\nIt uses XKB, the X Keyboard extension, which must be initialized for each connection, typically when creating a keymap (it is unlikely to be used before then). If this is not your first call to this constructor with this connection, you should set setup_xkb to false.\n\nKeymap(conn::Connection; setup_xkb) -> XCB.Keymap\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.RequestError","page":"API","title":"XCB.RequestError","text":"A request to the X Server returned with an error.\n\nstruct RequestError <: Exception\n\nmsg::Any\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.Setup","page":"API","title":"XCB.Setup","text":"Connection setup handle and data.\n\nstruct Setup <: XCB.Handle\n\nh::Any\nHandle to the setup, used for API calls.\n\nvalue::XCB.Libxcb.xcb_setup_t\nSetup value, obtained when dereferencing its handle.\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.XCBWindow","page":"API","title":"XCB.XCBWindow","text":"Window type used with the XCB API.\n\nmutable struct XCBWindow <: AbstractWindow\n\nconn::Connection\nid::UInt32\nparent_id::UInt32\nvisual_id::UInt32\ndelete_request::UInt32\ngc::Union{Nothing, GraphicsContext}\n\n\n\n\n\n","category":"type"},{"location":"api/#XCB.XCBWindow-Tuple{Any, Any, Any}","page":"API","title":"XCB.XCBWindow","text":"Create a new window whose parent is given by parent_id and visual by visual_id.\n\nXCBWindow(conn, parent_id, visual_id; depth, x, y, width, height, border_width, class, window_title, icon_title, map, attributes, values) -> XCBWindow\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.XCBWindow-Tuple{Connection, Any}","page":"API","title":"XCB.XCBWindow","text":"Create a new window on the provided screen.\n\nXCBWindow(conn::Connection, screen; kwargs...) -> XCBWindow\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.XCBWindow-Tuple{Connection}","page":"API","title":"XCB.XCBWindow","text":"Create a new window on the current screen.\n\nXCBWindow(conn::Connection; kwargs...) -> XCBWindow\n\n\n\n\n\n\n","category":"method"},{"location":"api/#Base.run","page":"API","title":"Base.run","text":"Run an EventLoop attached to a XWindowManager instance.\n\nrun(wm::XWindowManager, ::Synchronous)\nrun(wm::XWindowManager, ::Synchronous, execute_callback; poll, kwargs...)\n\n\n\n\n\n\n","category":"function"},{"location":"api/#XCB.check-Tuple{Connection}","page":"API","title":"XCB.check","text":"Check that the connection to the X server was successful. Throws a ConnectionError if the connection failed.\n\ncheck(connection::Connection) -> Connection\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.check_flush-Tuple{Any}","page":"API","title":"XCB.check_flush","text":"Check that the flush was successful, throwing a FlushError if the code is negative.\n\ncheck_flush(code)\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.check_request-Tuple{Any, Any}","page":"API","title":"XCB.check_request","text":"Check that the request was successfully handled by the server, throwing a RequestError if the request failed.\n\nThe severity level can be set via level with one of the two following values:\n\n- `:warn`: logs a warning with `@warn` (default).\n- `:error`: raise a `RequestError`.\n\ncheck_request(conn, request; level)\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.key_event_from_name-Tuple{XCB.Keymap, Symbol, KeyModifierState, KeyAction}","page":"API","title":"XCB.key_event_from_name","text":"Produce a key event based on a key name, a modifier state and an action using a keymap.\n\nkey_event_from_name(km::XCB.Keymap, key_name::Symbol, modifiers::KeyModifierState, action::KeyAction) -> KeyEvent\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.key_name-Tuple{XCB.Keymap, Integer}","page":"API","title":"XCB.key_name","text":"Obtain the name of a physical key identified by its keycode using a keymap.\n\nkey_name(km::XCB.Keymap, keycode::Integer) -> Symbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.key_symbol_from_keysym_string-Tuple{AbstractString}","page":"API","title":"XCB.key_symbol_from_keysym_string","text":"Generate a KeySymbol from a XCB keysym string.\n\nkey_symbol_from_keysym_string(keysym::AbstractString) -> KeySymbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.keycode-Tuple{XCB.Keymap, Symbol}","page":"API","title":"XCB.keycode","text":"Obtain a keycode from a key name using a keymap.\n\nkeycode(km::XCB.Keymap, name::Symbol) -> UInt32\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.keycode-Tuple{XWindowManager, EventDetails{<:KeyEvent}}","page":"API","title":"XCB.keycode","text":"Extract a keycode from an key event.\n\nkeycode(wm::XWindowManager, details::EventDetails{<:KeyEvent}) -> UInt32\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.keystroke_info-Tuple{XWindowManager, EventDetails}","page":"API","title":"XCB.keystroke_info","text":"Return condensed information regarding a keystroke as a String. Includes key name, keycode, character input and key symbol.\n\nkeystroke_info(wm::XWindowManager, event_details::EventDetails) -> String\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.keysym_string-Tuple{Integer}","page":"API","title":"XCB.keysym_string","text":"Return a String representation of an integer XCB keysym.\n\nkeysym_string(keysym::Integer; max_chars) -> String\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.response_type_xcb","page":"API","title":"XCB.response_type_xcb","text":"Translate an action into its corresponding XCB value.\n\n\n\n\n\n","category":"function"},{"location":"api/#XCB.standardize_key_symbol-Tuple{Symbol}","page":"API","title":"XCB.standardize_key_symbol","text":"Transform a key symbol obtained via XCB to a standard symbol defined in WindowAbstractions.\n\nstandardize_key_symbol(key_symbol::Symbol) -> Symbol\n\n\n\n\n\n\n","category":"method"},{"location":"api/#XCB.state_xcb","page":"API","title":"XCB.state_xcb","text":"Translate mouse or modifier state into the corresponding XCB value.\n\n\n\n\n\n","category":"function"},{"location":"api/#XCB.@check-Tuple{Any, Any}","page":"API","title":"XCB.@check","text":"Check the value returned by the function call request with check_request.\n\nThe severity level (:error or :warn) can be supplied as first argument. By default, the severity level is :warn.\n\nWraps request with check_request. The Connection argument is taken as the first argument of the function call expression request. The request is transformed to be checkable, through the functions xcb*checked (or xcb* if there exists a xcb*_unchecked version). If no checkable substitute is found, an ArgumentError is raised.\n\nTODO: @macroexpand example\n\n\n\n\n\n","category":"macro"},{"location":"api/#XCB.@flush-Tuple{Any}","page":"API","title":"XCB.@flush","text":"Flush a connection attached to a request expr.\n\nThe connection is taken to be the first argument of expr. expr can be a call to XCB.@check.\n\nExamples\n\njulia> @macroexpand @flush xcb_unmap_window(win.conn, win.id)\nquote\n    xcb_unmap_window(win.conn, win.id)\n    (flush)(win.conn)\nend\n\n\n\n\n\n","category":"macro"},{"location":"intro/#Introduction","page":"Introduction","title":"Introduction","text":"","category":"section"},{"location":"intro/","page":"Introduction","title":"Introduction","text":"XCB is a windowing API bound to the X Server and the X11 protocol on Unix-based systems. It simplifies the older X library that was traditionally used for interacting with the X Server.","category":"page"},{"location":"interface/#interface","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"","category":"section"},{"location":"interface/#Events","page":"WindowAbstractions Interface","title":"Events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"A large portion of this package is dedicated to handling the events reported by the X server and interfacing them into EventDetails instances.","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"In order to receive events from the server, we need to tell the server which types of event we want to be reported. This is done per-window, at their instantiation, through so-called event masks. In the future, it is intended to check which event we are subscribed to with the window callbacks that are provided to an event loop.","category":"page"},{"location":"interface/#Input-events","page":"WindowAbstractions Interface","title":"Input events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Input events can be classified into different types:","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Key events which are generated by pressing or releasing a key from a keyboard,\nMouse events originating from pressing or releasing mouse buttons,\nPointer events such as moving out of or entering a window with the pointer, or moving around inside the window.","category":"page"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Although drag actions are technically just of combination of mouse state and pointer events, they are reported as separate events.","category":"page"},{"location":"interface/#Key-events","page":"WindowAbstractions Interface","title":"Key events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"X and XCB do not offer much keystroke-related utilities, unless we look at some extensions such as XKB, which was used here for processing key inputs. It allows the storage of keyboard and keymap states, as well as functions to translate keystrokes into characters. The input processing using XKB was inspired from the XKB tutorial.","category":"page"},{"location":"interface/#Mouse-events","page":"WindowAbstractions Interface","title":"Mouse events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"It is a lot simpler to handle mouse events. Mouse state (e.g. which buttons were already pressed before the current mouse event) and pressed/released buttons are simply extracted from related X events, exposed in XCB via xcb_button_press_release_event_t and xcb_button_release_event_t.","category":"page"},{"location":"interface/#Pointer-events","page":"WindowAbstractions Interface","title":"Pointer events","text":"","category":"section"},{"location":"interface/","page":"WindowAbstractions Interface","title":"WindowAbstractions Interface","text":"Pointer events are handled similarly to mouse events. Moving the pointer in the window, as well as leaving or entering it send a X event from which the relevant data is extracted.","category":"page"},{"location":"troubleshooting/#Troubleshooting","page":"Troubleshooting","title":"Troubleshooting","text":"","category":"section"},{"location":"troubleshooting/#ConnectionError","page":"Troubleshooting","title":"ConnectionError","text":"","category":"section"},{"location":"troubleshooting/","page":"Troubleshooting","title":"Troubleshooting","text":"If the X Server returns an error when establishing a connection, an exception of type ConnectionError is raised. One common source of error is a badly set DISPLAY environment variable. Common values are :0 or :1.","category":"page"},{"location":"#XCB.jl","page":"Home","title":"XCB.jl","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"This package wraps the XCB library and exposes bindings for the WindowAbstractions.jl package.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The core API was generated with Clang.jl, from which abstractions were derived.","category":"page"},{"location":"","page":"Home","title":"Home","text":"If you want to use a high-level windowing API, you should see the documentation for the WindowAbstractions package. This documentation is aimed at developers who want to know more about XCB-specific utilities that this package exposes. It also contains a developer documentation, which covers the implementation of the WindowAbstractions interface among other things.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Pages = [\"intro.md\", \"api.md\", \"troubleshooting.md\", \"developer.md\"]","category":"page"}]
}
