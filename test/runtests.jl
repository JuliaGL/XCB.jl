using XCB
using Test

global EVENTS::Vector{Event} = Event[]
global LAST_PROCESSED::Float64 = 0.0

function main(wm, queue = EventQueue(wm))
    empty!(EVENTS)
    global LAST_PROCESSED = 0
    for event in queue
        push!(EVENTS, event)
        global LAST_PROCESSED = event.time
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
            @info "Window resized to $(event.window.extent) (movement: $(event.movement), resize: $(event.resize))"
        elseif event.type == WINDOW_MOVED
            @info "Window moved by $(event.movement) (now $(event.window.position))"
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
    matches(key"m", event) && return XCB.move_window_by(window, (rand(-5:5), rand(-5:5)))
    if matches(key"s", event)
        new_extent = window.extent .+ (rand(-50:50), rand(-50:50))
        return resize_window(window, new_extent; corner = rand(WindowCorner))
    elseif matches(key"w", event)
        new_extent = window.extent .+ (rand(-50:50), rand(-50:50))
        movement = (2, -2)
        return resize_window(window, new_extent; movement)
    elseif matches(key"x", event)
        new_extent = window.extent .+ (rand(-50:50), rand(-50:50))
        return resize_window(window, new_extent; corner = WINDOW_CORNER_BOTTOM_RIGHT)
    elseif matches(key"i", event)
        dest = abspath("keymap.c")
        println("Dumping keymap info to $dest")
        return open(dest, "w") do io
            write(io, String(wm.keymap))
        end
    elseif matches(key"d", event)
        XCB.hide_decorations!(window)
    elseif matches(key"left", event)
        move_window_by(window, (-25, 0))
    elseif matches(key"right", event)
        move_window_by(window, (25, 0))
    elseif matches(key"up", event)
        move_window_by(window, (0, -25))
    elseif matches(key"down", event)
        move_window_by(window, (0, 25))
    elseif matches(key"shift+left", event)
        resize_window(window, window.extent .+ (-25, 0))
    elseif matches(key"shift+right", event)
        resize_window(window, window.extent .+ (25, 0))
    elseif matches(key"shift+up", event)
        resize_window(window, window.extent .+ (0, -25))
    elseif matches(key"shift+down", event)
        resize_window(window, window.extent .+ (0, 25))
    end

    set_attributes(window.gc, [XCB.XCB_GC_FOREGROUND], [rand(1:16_777_215)])
    XCB.@flush XCB.xcb_poly_fill_rectangle(window.conn, window.id, window.gc.id, 1, rectangle)
end

function get_last_event(queue::EventQueue, type::EventType)
    # Wait for all pending events to be processed.
    while !isempty(queue) && poll_for_events!(queue)
        yield()
    end
    i = nothing
    while i === nothing
        i = findlast(event -> event.type == type, EVENTS)
        yield()
    end
    event = EVENTS[i]
    deleteat!(EVENTS, i)
    return event
end

rectangle = Ref(XCB.xcb_rectangle_t(20, 20, 60, 60))
interactive = ENV["DISPLAY"] ≠ ":99"

function setup(; offset=(300, -200), window_title="XCB window", icon_title="XCB", kwargs...)
    wm = XWindowManager()
    screen = current_screen(wm)
    window = XCBWindow(wm; screen, offset, window_title, icon_title, attributes=[XCB.XCB_CW_BACK_PIXEL], values=[0x00331122], kwargs...)
    ctx = GraphicsContext(window, attributes=[XCB.XCB_GC_FOREGROUND, XCB.XCB_GC_GRAPHICS_EXPOSURES], values=[screen.black_pixel, 0])
    attach_graphics_context!(window, ctx)
    queue = EventQueue(wm; record_history = true)
    return wm, window, queue
end

function main(; replay = false, kwargs...)
    wm, window, queue = setup(; kwargs...)
    try
        main(wm, queue)
        if replay
            events = save_history(wm, queue)
            @__MODULE__().replay(events)
        end
    finally
        isfile("keymap.c") && rm("keymap.c")
    end
end

function replay(events)
    wm, window, queue = setup()
    @info "Replaying events asynchronously..."
    task = @async main(wm, queue)
    wait_initialized()
    replay_history(wm, events; time_factor = 0.2)
    wait(task)
end

function wait_for(type::EventType, types::EventType...)
    types = collect(types)
    i = 1
    while true
        for (j, event) in enumerate(@view EVENTS[i:end])
            if event.type === type
                isempty(types) && return
                i += (j - 1)
                type = popfirst!(types)
                break
            end
        end
        yield()
    end
end

wait_initialized() = wait_for(WINDOW_GAINED_FOCUS)

function synchronize(f)
    t = time()
    f()
    while LAST_PROCESSED < t yield() end
end

macro synchronize(ex) :(synchronize(() -> $(esc(ex)))) end

@testset "XCB.jl" begin
    @testset "Resizing and moving" begin
        wm, window, queue = setup()
        task = @async main(wm, queue)
        wait_initialized()
        @test all(>(0), window.frame_extents)
        @test window.extent == XCB.get_extent(window) == (512, 512)

        (; position, extent) = window
        @synchronize resize_window(window, (150, 120))
        sleep(0.01)
        event = get_last_event(queue, WINDOW_RESIZED)
        movement = (extent .- window.extent) .÷ 2
        @test window.extent == XCB.get_extent(window) == (150, 120)
        @test window.position == XCB.get_position(window)
        @test window.position == position .+ movement
        @test event.movement == movement

        (; position, extent) = window
        @synchronize resize_window(window, (120, 140); corner = WINDOW_CORNER_BOTTOM_RIGHT)
        event = get_last_event(queue, WINDOW_RESIZED)
        movement = (0, 0)
        @test window.extent == XCB.get_extent(window) == (120, 140)
        @test window.position == XCB.get_position(window)
        @test window.position == position .+ movement
        @test event.movement == movement

        (; position, extent) = window
        @synchronize resize_window(window, (170, 180); corner = WINDOW_CORNER_BOTTOM_LEFT)
        event = get_last_event(queue, WINDOW_RESIZED)
        movement = (extent[1] - window.extent[1], 0)
        @test window.extent == XCB.get_extent(window) == (170, 180)
        @test window.position == XCB.get_position(window)
        @test window.position == position .+ movement
        @test event.movement == movement

        (; position) = window
        @synchronize move_window_to(window, (500, 500))
        event = get_last_event(queue, WINDOW_MOVED)
        @test window.position == (500, 500)
        @test event.movement == window.position .- position

        (; position) = window
        @synchronize move_window_by(window, (-40, 20))
        event = get_last_event(queue, WINDOW_MOVED)
        @test window.position == (460, 520)
        @test event.movement == window.position .- position

        close(wm, window)
    end

    @testset "Sending inputs" begin
        # XXX: Add more tests to make sure the proper `Event` data arrives at destination.
        wm, window, queue = setup()
        task = @async main(wm, queue)
        wait_initialized()
        _send = send_event(wm, window)
        send(args...) = @synchronize _send(args...)

        send(BUTTON_PRESSED, MouseEvent(BUTTON_LEFT, BUTTON_NONE))
        send(BUTTON_RELEASED, MouseEvent(BUTTON_LEFT, BUTTON_LEFT))
        send(POINTER_ENTERED)
        send(POINTER_MOVED, PointerState(BUTTON_NONE, NO_MODIFIERS))
        send(POINTER_EXITED)

        # i: dump keymap
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AD08)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AD08)))
        # l: trigger square color update
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC09)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC09)))
        for i in 1:10
            # s: resize
            send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC02)))
            send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC02)))
            for j in 1:10
                # m: move
                send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC10)))
                send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC10)))
            end
        end
        # d: hide decorations
        send(KEY_PRESSED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC03)))
        send(KEY_RELEASED, KeyEvent(wm.keymap, PhysicalKey(wm.keymap, :AC03)))
        send(WINDOW_CLOSED)
        @info "Waiting for window to close"
        wait(task)
        @test !istaskfailed(task)
        @test isfile("keymap.c")
        isfile("keymap.c") && rm("keymap.c")
        @test !istaskfailed(task)

        events = save_history(wm, queue)
        replay(events)
        @test isfile("keymap.c")
        isfile("keymap.c") && rm("keymap.c")
    end
end;

# For interactive debugging.
# main()
# main(replay = true)
