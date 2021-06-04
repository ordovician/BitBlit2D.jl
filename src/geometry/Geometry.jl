import Base: size, iterate

export Point, Vec2D

struct Point{T <: Number}
  x::T
  y::T
end

struct Vec2D{T <: Number}
  dx::T
  dy::T
end

include("point.jl")
include("vec2d.jl")
include("rect.jl")

# Allows you to do things such as:
#  x, y, w, h = Rect(2, 4, 20, 30)
function iterate(t::Union{Point, Vec2D, Size, Rect}, i::Int=1)
    if 1 <= i <= fieldcount(typeof(t))
        (getfield(t, i), i+1)
    else
        nothing
    end
end