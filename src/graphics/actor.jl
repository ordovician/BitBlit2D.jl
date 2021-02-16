export Actor, draw!

struct Actor
    parent::Union{Actor, Nothing}
  	sprite::Sprite
  	position::Point
  	orientation::Float64
  	frame::Int
end

function Actor(sprite::Sprite)
    Actor(nothing, sprite, Point(0, 0), 0, 1)
end

function draw!(canvas::Image, a::Actor)
    draw!(canvas, a.sprite, a.position, frame)
end
