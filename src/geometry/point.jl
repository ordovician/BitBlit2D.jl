import Base: -, +, zero


"""
    zero(::Type{Point2D})
    zero(p::Point2D)
Gives origin for a point of a particular type
"""
zero(::Type{Point{T}}) where T <: Number = Point{T}(zero(T), zero(T))
zero(p::Point{T})      where T <: Number = zero(typeof(p))

-(p::Point, q::Point) = Vec2D(p.x - q.x, p.y - q.y)
-(p::Point, v::Vec2D) = Point(p.x - v.dx, p.y - v.dy)
+(p::Point, v::Vec2D) = Point(p.x + v.dx, p.y + v.dy)
+(v::Vec2D, p::Point) = p + v