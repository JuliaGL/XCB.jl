
"""
Structures which contain a handle (opaque pointer) as primary data. Those structures are usually defined as mutable so that a finalizer can be registered. Any Handle structure is automatically converted to its handle data on `ccall`s, through `unsafe_convert`.
"""
abstract type Handle end

Base.unsafe_convert(::Type{<: Ptr}, handle::Handle) = handle.h

"""
Connection to the X server.
"""
mutable struct Connection <: Handle
    """
    Opaque handle to the connection, used for API calls.
    """
    h
    function Connection(h)
        conn = new(h)
        Base.finalizer(xcb_disconnect, conn)
        conn
    end
end

"""
Connection setup handle and data.
"""
struct Setup <: Handle
    """
    Handle to the setup, used for API calls.
    """
    h
    """
    Setup value, obtained when dereferencing its handle.
    """
    value::xcb_setup_t
end

"""
Initialize a connection to the X server.
"""
function Connection(; display=nothing)
    display = isnothing(display) ? C_NULL : display
    connection = Connection(xcb_connect(display, C_NULL))
    check(connection)
end

@enum XCB_CONN_ERROR_CODE begin
    XCB_CONN_ERROR = 1
    XCB_CONN_CLOSED_EXT_NOTSUPPORTED = 2
    XCB_CONN_CLOSED_MEM_INSUFFICIENT = 3
    XCB_CONN_CLOSED_REQ_LEN_EXCEED = 4
    XCB_CONN_CLOSED_PARSE_ERR = 5
    XCB_CONN_CLOSED_INVALID_SCREEN = 6
    XCB_CONN_CLOSED_FDPASSING_FAILED = 7
end

"""
Check that the connection to the X server was successful. Throws a [`ConnectionError`](@ref) if the connection failed.
"""
function check(connection::Connection)
    code = xcb_connection_has_error(connection)
    code ≠ 0 && throw(ConnectionError("XCB connection not successful ($(XCB_CONN_ERROR_CODE(code)))", code))
    connection
end

function Setup(connection::Connection)
    stp = xcb_get_setup(connection)
    Setup(stp, unsafe_load(stp))
end

"""
Check that the flush was successful, throwing a [`FlushError`](@ref) if the code is negative.
"""
function check_flush(code)
    if code <= 0
        throw(FlushError(code))
    end
end

Base.flush(connection::Connection) = check_flush(xcb_flush(connection))

"""
Check that the request was successfully handled by the server, throwing a [`RequestError`](@ref) if the request failed.

The severity level can be set via `level` with one of the two following values:

    - `:warn`: logs a warning with `@warn` (default).
    - `:error`: raise a `RequestError`.
"""
function check_request(conn, request; level=:warn)
    @assert level ∈ (:warn, :error) "Unknown severity level $level"
    errcode_ptr = xcb_request_check(conn, request)
    if errcode_ptr ≠ C_NULL
        errcode = Base.unsafe_load(errcode_ptr).error_code
        msg = unsafe_string(xcb_event_get_error_label(errcode))
        error_msg = "Request unsuccessful: (error code $errcode: $msg)"
        if level == :error
            throw(RequestError(error_msg))
        elseif level == :warn
            @warn error_msg
        end
    end
end

"""
Flush a connection attached to a request `expr`.

The connection is taken to be the first argument of `expr`. `expr` can be a call to `XCB.@check`.

# Examples
```
julia> @macroexpand @flush xcb_unmap_window(win.conn, win.id)
quote
    xcb_unmap_window(win.conn, win.id)
    (flush)(win.conn)
end
```
"""
macro flush(expr)
    if expr.head == :macrocall && expr.args[1] == Symbol("@check")
        _expr = expr.args[3]
        expr = _expr isa QuoteNode && _expr.value ∈ [:error, :warn] ? expr.args[4] : _expr
    end
    conn = expr.args[2]
    quote
        $(esc(expr))
        $(esc(flush))($(esc(conn)))
    end
end

"""
Check the value returned by the function call `request` with [`check_request`](@ref).

The severity level (`:error` or `:warn`) can be supplied as first argument.
By default, the severity level is `:warn`.

Wraps `request` with [`check_request`](@ref). The [`Connection`](@ref) argument is taken as the first argument of the function call expression `request`. The request is transformed to be checkable, through the functions xcb_*_checked (or xcb_* if there exists a xcb_*_unchecked version). If no checkable substitute is found, an `ArgumentError` is raised.

TODO: `@macroexpand` example
"""
macro check(level, request)
    conn = request.args[2]
    request_fun = string(request.args[1])
    module_prefix = string(@__MODULE__) * "."
    has_module_prefix = startswith(request_fun, module_prefix)
    has_module_prefix && (request_fun = request_fun[5:end])

    # get checked version of the request function
    if endswith(request_fun, "_unchecked")
        request_fun_checked = replace(request_fun, "_unchecked" => "")
    elseif !endswith(request_fun, "_checked")
        if isdefined(@__MODULE__, Symbol(request_fun * "_unchecked"))
            request_fun_checked = request_fun
        else
            request_fun_checked = request_fun * "_checked"
        end
    else
        request_fun_checked = request_fun
    end
    # restore module prefix and add it to `check_request` as well if relevant
    if has_module_prefix
        request_fun_checked = module_prefix * request_fun_checked
        check_request_fun = Meta.parse(module_prefix * "check_request")
    else
        check_request_fun = :check_request
    end
    # change the request function in the original expr
    if isdefined(@__MODULE__, Symbol(replace(request_fun_checked, module_prefix => "")))
        request.args[1] = Meta.parse(request_fun_checked)
    else
        throw(ArgumentError("Function $request_fun does not have a checked version available."))
    end
    :($(esc(check_request_fun))($(esc(conn)), $(esc(request)), level=$level))
end

macro check(request) esc(:(@check(:warn, $request))) end

Base.showerror(io::IO, error::FlushError) = print("FlushError: server returned code $(error.code)")

function Base.show(io::IO, setup::xcb_setup_t)
    desc = ["Version"]
    vals = [VersionNumber(setup.protocol_major_version, setup.protocol_minor_version, setup.release_number)]
    println(io, "Setup")
    prettyprint(io, desc, vals)
end

function Base.show(io::IO, screen::xcb_screen_t)
    desc = ["White pixel value", "Black pixel value", "Width", "Height"]
    vals = [format_bignumber(screen.white_pixel), format_bignumber(screen.black_pixel), "$(screen.width_in_pixels) pixels, $(screen.width_in_millimeters / 10) cm", "$(screen.height_in_pixels) pixels, $(screen.height_in_millimeters / 10) cm"]
    println(io, "Screen details")
    prettyprint(io, desc, vals)
end

function format_bignumber(number)
    str = string(number)
    seq = map(zip(length(str):-1:1, str)) do (i, x)
        if i % 3 == 0 && i ≠ length(str)
            sep = ','
        else
            sep = ""
        end
        sep * x
    end
    join(seq)
end

prettyprint(io, desc, vals) = (description = join.(zip(rpad.(desc, 20), vals), ": "); print(io, join("    " .* description, "\n")))
