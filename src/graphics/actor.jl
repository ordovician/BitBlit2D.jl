export Actor, world_position, position, draw!, hide!, appear!

mutable struct Actor
    parent::Union{Actor, Nothing}
  	sprite::Sprite
  	position::Point{Float64}
  	frame::Int
    visible::Bool
end

"""
    position(a::Actor) -> Point
Position of actor `a` in local coordinate system
"""
position(a::Actor) = a.position


hide!(a::Actor) = a.visible = false
appear!(a::Actor) = a.visible = true

"""
    world_position(a::Actor)
Position of actor `a` in global coordinate system
"""
function world_position(a::Actor)
    if isnothing(a.parent)
        position(a)
    else
        position(a.parent) + position(a)
    end
end

function Actor(sprite::Sprite)
    Actor(nothing, sprite, Point(0.0, 0.0), 1, true)
end

function draw!(canvas::Image, a::Actor)
    if a.visible
        x, y = world_position(a)
        x = round(Int, x)
        y = round(Int, y)
        draw!(canvas, a.sprite, x, y, frame)
    end
end
