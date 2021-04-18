export ChildSprite, parent!

"""
A visualization of a game character, static object or tile
in the game world. While you can use this directly, ideally
you use it with higher level objects like `Actor` to manage
its location in the world.
"""
mutable struct ChildSprite
    parent::Union{Sprite, Nothing}
    pos::Point{Float64}
    frames::Vector{Image}
    frame::Int
end

parent(sprite::ChildSprite) = sprite.parent
parent!(sprite::ChildSprite, parent::Sprite) = sprite.parent = parent
position(sprite::ChildSprite) = sprite.pos
position!(sprite::ChildSprite, pos::Point) = sprite.pos = pos


"""
    ChildSprite(frames)
Create a sprite with given frames and an optional parent sprite,
for which sprite position will be relative to.
"""
function ChildSprite(frames::AbstractVector{Image}, pos = Point(0.0, 0.0))
    ChildSprite(nothing, pos, frames, 1)
end

"""
    draw!(canvas::Image, sprite)
Draws sprite on canvas using position `world_position(sprite)` and 
current frame. 
"""
function draw!(canvas::Image, sprite::Sprite)
    frame = sprite.frame
    draw!(canvas, sprite.frames[frame], world_position(sprite))
end