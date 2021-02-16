import Base: size, iterate

export Point, Vec2D, Size, Rect

struct Point{T}
  x::T
  y::T
end

struct Vec2D{T}
  dx::T
  dy::T
end

struct Size{T}
  width::T
  height::T
end


struct Rect{T}
  x::T
  y::T
  width::T
  height::T
end

size(r::Union{Rect, Size}) = (r.width, r.height)
width(r::Union{Rect, Size}) = r.width
height(r::Union{Rect, Size}) = r.height

# Allows you to do things such as:
#  x, y, w, h = Rect(2, 4, 20, 30)
function iterate(t::Union{Point, Vec2D, Size, Rect}, i::Int=1)
    if i <= i <= fieldcount(typeof(t))
        (getfield(t, i), i+1)
    else
        nothing
    end
end