using MiniFB

export Window
export draw!, fillcolor!

import Base: show, close

"""
    Window
Floating window which we can render pixels into

```julia
w = Window("Hello World", 400, 500)

fillcolor!(w, 255, 0, 0)
draw!(w, Rect(10, 10, 200, 120))

renderloop(w)
```
"""
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


function draw!(wnd::Window, r::Rect)
    x, y = r.x, r.y
    w, h = r.width, r.height
    
    for j in y:(y + h)
        x0 = x + j*wnd.width
        for i in x0:(x0 + w)
            wnd.buffer[i] = wnd.fillcolor
        end
    end    
end

"""
    fillcolor!(w::Window, red, green, blue)
Specify color to be used by drawing commands
"""
function fillcolor!(w::Window, red, green, blue)
    w.fillcolor = mfb_rgb(red, green, blue)
end

quit = false
