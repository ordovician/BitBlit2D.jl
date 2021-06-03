export Sprite, draw!, parent, position, position, position!, visible!, visible

"""
A visualization of a game character, static object or tile
in the game world. While you can use this directly, ideally
you use it with higher level objects like `Actor` to manage
its location in the world.
"""
mutable struct Sprite
    parent::Union{Sprite, Nothing}
    pos::Point{Float64}
    frames::Vector{Image}
    frame::Int
    visible::Bool
end


"""
    Sprite(frames)
Create a sprite with given frames and an optional parent sprite,
for which sprite position will be relative to.
"""
function Sprite(frames::AbstractVector{Image}, pos = Point(0.0, 0.0))
    Sprite(nothing, pos, frames, 1, true)
end

"""
    draw!(canvas::Image, sprite)
Draws sprite on canvas using position `world_position(sprite)` and 
current frame. 
"""
function draw!(canvas::Image, sprite::Sprite)
    if sprite.visible
        frame = sprite.frame
        draw!(canvas, sprite.frames[frame], sprite.pos)
    end
end

"""
    visible!(sprite::Sprite, visible = true)
Set a sprite visible or hidden. If it is hidden it will not be drawn when
the `draw!` call is made.
"""
function visible!(sprite::Sprite, visible = true)
    sprite.visible = visible
end

"""
    visible(sprite::Sprite)
Check if sprite is visible. If it is true, then a `draw!(canvas, sprite)` call
will make it appear on the canvas.
"""
function visible(sprite::Sprite)
    sprite.visible
end

