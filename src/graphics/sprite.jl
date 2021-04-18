export Sprite, draw!, parent, position, position, position!, visible!, visible

abstract type Sprite end

"""
    parent(sprite) -> Union{Sprite, Nothing}
A sprite can be a child of another sprite. In this case its position would be relative
to the position of the parent sprite.
"""
parent(sprite::Sprite) = nothing

"""
    draw!(canvas::Image, sprite)
Draws sprite with current frame and position on canvas.
"""
function draw! end

"""
    position(sprite) -> Point
Position of `sprite` in local coordinate system.
"""
function position end

"""
    position!(sprite, pos::Point)
Set position of `sprite` to `pos`. This is position relative to parents sprite.
"""
function position! end

"""
    world_position(sprite) -> Point
Abosolute position on the coordinate system of the canvas where we draw
all objects.
"""
function world_position(sprite::Sprite)
    if isnothing(parent(sprite))
        position(sprite)
    else
        position(parent(sprite)) + position(sprite)
    end
end

"""
    visible!(sprite::Sprite, visible = true)
Set a sprite visible or hidden. If it is hidden it will not be drawn when
the `draw!` call is made.
"""
function visible! end

"""
    visible(sprite::Sprite)
Check if sprite is visible. If it is true, then a `draw!(canvas, sprite)` call
will make it appear on the canvas.
"""
function visible end

