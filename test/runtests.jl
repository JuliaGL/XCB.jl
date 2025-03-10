using XCB
using Test

function main(wm, queue = EventQueue(wm))
    for event in queue
        if event.type == WINDOW_CLOSED
            close(wm, event.window)
        elseif event.type == KEY_PRESSED
            print_key_info(stdout, wm.keymap, event.key_event)
            println()
            set_title(event.window, "Random title $(rand())")
            on_pressed_key(wm, event)
        elseif event.type == KEY_RELEASED
            active_modifiers = event.key_event.modifiers & ~event.key_event.consumed_modifiers
            @info "Released $(event.key_event.key)" * (iszero(active_modifiers) ? "" : " with active modifiers $active_modifiers")
        elseif event.type in BUTTON_EVENT
            print_button(event)
        elseif event.type == WINDOW_EXPOSED
            @info "Window exposed"
        elseif event.type == WINDOW_RESIZED
            @info "Window resized to $(event.new_dimensions)"
        elseif event.type == POINTER_ENTERED
            @info "Entering window at $(event.location)"
        elseif event.type == POINTER_MOVED
            print("Moving pointer at $(event.location)", ' '^50, '\r')
        elseif event.type == POINTER_EXITED
            @info "Leaving window at $(event.location)"
        elseif event.type == WINDOW_GAINED_FOCUS
            @info "Window gained focus"
        elseif event.type == WINDOW_LOST_FOCUS
            @info "Window lost focus"
        end
        isempty(windows(wm)) && break
    end
end

function print_button(event::Event)
    (; button, state) = event.mouse_event
    x, y = event.location
    printed_state = iszero(state) ? "" : "with $state button(s) held"
    println("$(event.type): $button at $x, $y $printed_state")
end

function on_pressed_key(wm, event)
    (; window) = event
    any(matches(event), [key"q", key"ctrl+q"]) && return close(wm, window)
    matches(key"s", event) && return resize(window, extent(window) .+ 1)
    if matches(key"i", event)
        dest = abspath("keymap.c")
        println("Dumping keymap info to $dest")
        return open(dest, "w") do io
            write(io, String(wm.keymap))
        end
    elseif matches(key"d", event)
        XCB.hide_decorations(window)
    end

    (; gc) = window
    set_attributes(gc, [XCB.XCB_GC_FOREGROUND], [rand(1:16_777_215)])
    XCB.@flush XCB.xcb_poly_fill_rectangle(window.conn, window.id, gc.id, UInt32(1), rectangle)
end

rectangle = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))
interactive = ENV["DISPLAY"] ≠ ":99"

function test(; replay_events = !interactive)
    wm = XWindowManager()
    screen = current_screen(wm)
    window = XCBWindow(wm; screen, x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", attributes=[XCB.XCB_CW_BACK_PIXEL], values=[screen.black_pixel])
    ctx = GraphicsContext(window, attributes=[XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES], values=[screen.black_pixel, 0])
    attach_graphics_context!(window, ctx)
    send = send_event(wm, window)
    send = (_ -> sleep(0.01)) ∘ send
    queue = EventQueue(wm; record_history = true)

    if interactive
        main(wm, queue)
        isfile("keymap.c") && rm("keymap.c")
    else
        @info "Running window asynchronously"
        task = @async main(wm, queue)
        @info "Sending fake inputs"
        send(BUTTON_PRESSED, MouseEvent(BUTTON_LEFT, BUTTON_NONE))
        send(BUTTON_RELEASED, MouseEvent(BUTTON_LEFT, BUTTON_LEFT))
        send(POINTER_ENTERED)
        send(POINTER_MOVED, PointerState(BUTTON_NONE, NO_MODIFIERS))
        send(POINTER_EXITED)
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AD08)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AD08)))
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC09)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC09)))
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC02)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC02)))
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC03)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC03)))
        sleep(0.5)
        @info "Sending WINDOW_CLOSED event"
        send(WINDOW_CLOSED)
        @info "Waiting for window to close"
        wait(task)
        @test !istaskfailed(task)
        @test isfile("keymap.c")
        isfile("keymap.c") && rm("keymap.c")
    end

    events = save_history(wm, queue)

    replay_events || return
    @info "Replaying events..."
    wm = XWindowManager()
    screen = current_screen(wm)
    window = XCBWindow(wm; screen, x=0, y=1000, border_width=50, window_title="XCB window", icon_title="XCB", attributes=[XCB.XCB_CW_BACK_PIXEL], values=[screen.black_pixel])
    ctx = GraphicsContext(window, attributes=[XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES], values=[screen.black_pixel, 0])
    attach_graphics_context!(window, ctx)
    task = @async main(wm)
    replay_history(wm, events; time_factor = 0.1)
    wait(task)
    @test !istaskfailed(task)
    isfile("keymap.c") && rm("keymap.c")

    nothing
end

@testset "XCB.jl" begin
    test()
end;
