import Base: +, -, *, /, abs

+(u::Vec2D, v::Vec2D) = Vec2D(u.dx + v.dx, u.dy + v.dy)
-(u::Vec2D, v::Vec2D) = Vec2D(u.dx - v.dx, u.dy - v.dy)
*(factor::Number, v::Vec2D) = Vec2D(v.dx * factor, v.dy * factor)
*(v::Vec2D, factor::Number) = Vec2D(v.dx * factor, v.dy * factor)
/(v::Vec2D, factor::Number) = Vec2D(v.dx / factor, v.dy / factor)

abs(v::Vec2D) = Vec2D(abs(v.dx), abs(v.dy))