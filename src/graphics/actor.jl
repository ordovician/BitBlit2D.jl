export Actor, global_position, position, draw!

struct Actor
    parent::Union{Actor, Nothing}
  	sprite::Sprite
  	position::Point{Float64}
  	orientation::Float64
  	frame::Int
end

position(a::Actor) = a.position

function global_position(a::Actor)
    if isnothing(a.parent)
        position(a)
    else
       position() 
    end
end

function Actor(sprite::Sprite)
    Actor(nothing, sprite, Point(0, 0), 0, 1)
end

function draw!(canvas::Image, a::Actor)
    x = round(Int, a.position.x)
    y = round(Int, a.position.y)
    draw!(canvas, a.sprite, x, y, frame)
end
