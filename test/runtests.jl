using XCB
using WindowAbstractions
using Test
using Parameters

function on_button_pressed(details::EventDetails)
    x, y = details.location
    click = details.data.button
    state = details.data.state
    buttons_pressed = pressed_buttons(state)
    printed_state = isempty(buttons_pressed) ? "" : "with $(join(string.(buttons_pressed), ", ")) button$(length(buttons_pressed) > 1 ? "s" : "") held"
    @info "$click at $x, $y $printed_state"
end

function on_key_pressed(wh::XWindowHandler, details::EventDetails)
    @unpack win, data = details
    send = XCB.send(wh, win)
    km = wh.keymap
    @info keystroke_info(km, details)
    @unpack key_name, key, input, modifiers = data
    kc = KeyCombination(key, modifiers)
    set_title(win, "Random title $(rand())")
    if kc ∈ [key"q", key"ctrl+q", key"f4"]
        throw(CloseWindow(win, "Received closing request from user input"))
    elseif kc == key"s"
        curr_extent = XCB.extent(win)
        XCB.set_extent(win, curr_extent .+ 1)
    elseif kc == key"i"
        open("keymap.txt", "w") do io
            write(io, String(km))
        end
    elseif kc == key"f"
        @info "Faking input: sending key AD01 to quit (requires an english keyboard layout to be translated to the relevant symbol 'q')"
        send(key_event_from_name(wh.keymap, :AD01, KeyModifierState(), KeyPressed()))
    else
        gc = win.gc
        set_attributes(gc, [XCB.XCB_GC_FOREGROUND], [rand(1:16_777_215)])
        XCB.@flush XCB.xcb_poly_fill_rectangle(win.conn, win.id, gc.id, UInt32(1), r)
    end
end

r = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))

const is_xvfb = ENV["DISPLAY"] == ":99"

function test()
    connection = Connection()
    setup = Setup(connection)
    println(setup.value)
    iter = XCB.xcb_setup_roots_iterator(setup)
    screen = unsafe_load(iter.data)
    println(screen)

    win = XCBWindow(connection, screen; x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", attributes=[XCB.XCB_CW_BACK_PIXEL], values=[screen.black_pixel])
    println("Window ID: ", win.id)
    ctx = GraphicsContext(connection, win; attributes=(XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES), values=(screen.black_pixel, 0))
    attach_graphics_context!(win, ctx)

    wh = XWindowHandler(connection, [win])

    set_callbacks!(wh, win, WindowCallbacks(;
        on_resize = x -> @info("Window size changed: $(x.data.new_dimensions)"),
        on_mouse_button_pressed = on_button_pressed,
        on_mouse_button_released = x -> @info("Released mouse button $(x.data.button)"),
        on_key_pressed = x -> on_key_pressed(wh, x),
        on_key_released = x -> @info("Released $(KeyCombination(x.data.key, x.data.modifiers))"),
        on_pointer_enter = x -> @info("Entering window at $(x.location)"),
        on_pointer_leave = x -> @info("Leaving window at $(x.location)"),
        on_pointer_move = x -> @info("Moving pointer at $(x.location)"),
        on_expose = x -> @info("Window exposed")
    ))

    send = XCB.send(wh, win)

    if is_xvfb
        @info "- Running window asynchronously"
        task = run(wh, Asynchronous(); warn_unknown=true)
        @info "- Sending fake inputs"
        send(MouseEvent(ButtonLeft(), MouseState(), ButtonPressed()))
        send(MouseEvent(ButtonLeft(), MouseState(), ButtonReleased()))
        send(PointerEntersWindowEvent())
        send(PointerMovesEvent())
        send(PointerLeavesWindowEvent())
        send(key_event_from_name(wh.keymap, :AC04, KeyModifierState(), KeyReleased()))
        send(key_event_from_name(wh.keymap, :AC04, KeyModifierState(), KeyPressed()))
        @info "- Waiting for window to close"
        wait(task)
    else
        run(wh, Synchronous(); warn_unknown=true, poll=false)
    end
end

test()
