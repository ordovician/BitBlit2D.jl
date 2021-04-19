export Size, Rect, width, height, isinside, isintersecting,
       origin, center
       
import Base: size, +, *, /

struct Size{T <: Number}
  width::T
  height::T
end


struct Rect{T <: Number}
  x::T
  y::T
  width::T
  height::T
end

size(r::Rect) = Size(r.width, r.height)
width(r::Union{Rect, Size}) = r.width
height(r::Union{Rect, Size}) = r.height

+(p::Point, sz::Size) = Point(p.x + sz.width, p.y + sz.height)
+(sz::Size, p::Point) = p + sz
*(sz::Size, k::Number) = Size(sz.width * k, sz.height * k)
*(k::Number, sz::Size) = sz * k
/(sz::Size, k::Number) = Size(sz.width/k, sz.height/k)

origin(r::Rect) = Point(r.x, r.y)
center(r::Rect) = origin(r) + 0.5*size(r)

function isinside(r::Rect, p::Point)
    origin(r) ≤ p ≤ origin(r) + size(r)    
end

function isintersecting(r::Rect, s::Rect)
	d = abs(center(s) - center(r))
	h1 = size(r)/2
	h2 = size(s)/2
	
	d.dx <= h1.width + h2.width &&
	d.dy <= h1.height + h2.height
end