using Colors

export draw!, blend, stroke!


"""
    blend(a, b) -> RGB

Blends pixel value `a` on top of pixel value `b`. Thus if `a` is opaque
the value of `b` will not matter. However if `a` is partially transparent
some of the color of `b` will "shine" through.

Read more: [Alpha compositing](https://en.wikipedia.org/wiki/Alpha_compositing)
"""
function blend(Ca::RGBA, Cb::Union{RGB, RGBA})
    α = alpha(Ca)
    β = alpha(Cb)
    C = Ca*α + Cb*β*(1-α)
    C = C/(α + β*(1-α))
    RGB(C)
end

blend(a::RGB, b::Colorant) = a


"""
    draw!(canvas::Image, x::Int, y::Int, img::Image)
    draw!(canvas::Image, p::Point, img::Image)
    
Draws an image `img` onto image `canvas` at location `(x, y)`. This operation
uses alpha blending. Thus if `img` has areas which are partially transparent, then parts
of the `screen` image will shine through.

This will clip the `img` image, so that if you draw outside the `canvas` image you willl
not get out of bounds error.    
"""
function draw!(canvas::Image, img::Image, x::Integer, y::Integer)
    w, h = size(img)
    cw, ch = size(canvas)
    
    w = min(x + w, cw) - x
    h = min(y + h, ch) - y
    
    x_src, y_src = 0, 0
    
    
    if x < 0
        x_src = -x
        x = 0
    end
    
    if y < 0
       y_src = -y
       y = 0
    end
    
    x0 = x_src
    x1 = x
    
    while x0 < w
        y0, y1 = y_src, y
        while y0 < h
            color = canvas[x1, y1]
            canvas[x1, y1] = blend(img[x0, y0], color)
            y0 += 1
            y1 += 1
        end
        x0 += 1
        x1 += 1
    end
    
    canvas
end

function draw!(canvas::Image, img::Image, p::Point{<:Integer})
    draw!(canvas, img, p.x, p.y)
end


"""
    fill!(img::Image, r::Rect, c::Colorant)
    
Fill a rectangular area defined by `r` with the color `c`.
"""
function fill!(canvas::Image, r::Rect{<:Integer}, color::Colorant)
    x, y = r.x, r.y
    h, w = size(r)
    canvas[x:x+w, y:y+h] = c
end