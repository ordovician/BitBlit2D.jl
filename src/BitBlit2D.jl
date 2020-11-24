module BitBlit2D

export Window
export Rect

export renderloop
export draw, fillcolor

import Base: show, close

using MiniFB


mutable struct Window
    width::Int
    height::Int
    buffer::Vector{UInt32}
    wndptr::Ptr{Cvoid}
    fillcolor::UInt32
end

"""
    Window(title, width, height)
Create a window on the screen of given proportions which we can draw in.
"""
function Window(title::AbstractString, width::Integer, height::Integer)
    wndptr = mfb_open_ex(title, width, height, MiniFB.WF_RESIZABLE)
    Window(width, height, 
        zeros(UInt32, width*height), 
        wndptr,
        mfb_rgb(255, 255, 255))
end

function Window(width, height)
    Window("Untitled", width, height)
end

function close(w::Window)
    mfb_close(w.wndptr)
end

function show(io::IO, wnd::Window)
    print(io, "Window($(wnd.width), $(wnd.height))")
end

struct Rect
    x::Int
    y::Int
    width::Int
    height::Int
end

function draw(wnd::Window, r::Rect)
    x, y = r.x, r.y
    w, h = r.width, r.height
    
    for j in y:(y + h)
        x0 = x + j*wnd.width
        for i in x0:(x0 + w)
            wnd.buffer[i] = wnd.fillcolor
        end
    end    
end

function fillcolor(w::Window, red, green, blue)
    w.fillcolor = mfb_rgb(255, 255, 255)
end

quit = false


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

w = Window("Hello World", 400, 500)
draw(w, Rect(10, 10, 200, 120))
renderloop(w)

end
