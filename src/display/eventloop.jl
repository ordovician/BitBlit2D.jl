export renderloop

function keycallback(window::Ptr{Cvoid}, key::mfb_key, mod::mfb_key_mod, isPressed::Bool)
    if isPressed
        if key == MiniFB.KB_KEY_Q
            global quit = true
        end
        println("key was pressed: ", key, ", modifier: ", mod)
        
    end
end

function renderloop(w::Window)
    mfb_set_keyboard_callback(w.wndptr, keycallback)
    global quit = false

    while mfb_wait_sync(w.wndptr)


        state = mfb_update(w.wndptr, w.buffer)
        if state != MiniFB.STATE_OK
            break
        end
        
        if quit
            mfb_update(w.wndptr, w.buffer)
            break
        end
    end
    close(w)
end

# w = Window("Hello World", 400, 500)
# draw(w, Rect(10, 10, 200, 120))
# renderloop(w)