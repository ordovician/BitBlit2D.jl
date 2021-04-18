using Colors, FileIO

import Base: getindex, setindex!, size, show

export Image, width, height
export pixels

struct Image{T<:Colorant}
   pixels::Matrix{T} 
end

"""
    Image(filename)
Creates an image from an image file stored on disk. If loading
a `gif` image, this will produce multiple images
"""
function Image(filename::AbstractString)
    pixels = load(filename)
    dims = ndims(pixels)
    if dims == 2
        Image(pixels)
    elseif dims == 3
        map(1:size(pixels, 3)) do i
           Image(pixels[:, :, i]) 
        end
    else
        error("Don't support loading imagse with $dims dimensions")
    end
end

"""
    Image(w::Int, h::Int)
Creates a blank image of width `w` and height `h`.
"""
function Image(w::Int, h::Int)
    Image(fill(colorant"black", h, w))
end

"""
    Image(w::Int, h::Int, c::Colorant)
Creates image of width `w` and height `h` filled with color `c`.
"""
function Image(w::Int, h::Int, c::Colorant)
    Image(fill(c, h, w))
end

getindex(img::Image, x::Int, y::Int) = img.pixels[y+1, x+1]

function setindex!(img::Image, color::Colorant, x::Int, y::Int)
    img.pixels[y+1, x+1] = color
end

function getindex(img::Image, X::UnitRange{Int}, Y::UnitRange{Int})
    I = first(Y)+1:last(Y)
    J = first(X)+1:last(X)
    Image(img.pixels[I, J])
end

function getindex(img::Image, x::Int, Y::UnitRange{Int})
    I = first(Y)+1:last(Y)
    j = x+1
    img.pixels[I, j]
end

function getindex(img::Image, X::UnitRange{Int}, y::Int)
    i = y+1
    J = first(X)+1:last(X)
    img.pixels[i, J]
end

width(img::Image) = size(img.pixels, 2)
height(img::Image) = size(img.pixels, 1)

"""
    size(img::Image) -> Size
Gets the width and the height of image `img`.
"""
size(img::Image) = Size(width(img), height(img))

function show(io::IO, img::Image)
    show(io, img.pixels)
end

function pixels(img::Image)
   img.pixels 
end
