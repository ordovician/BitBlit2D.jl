export Sprite, draw!

"""
A visualization of a game character, static object or tile
in the game world. While you can use this directly, ideally
you use it with higher level objects like `Actor` to manage
its location in the world.
"""
struct Sprite
    frames::Vector{Image}
end

"""
    Sprite(sheet::Image, rows, cols)
Constructs a sprite made up of multiple images found on a sprite sheet. We assume
that the sprite sheet is made up of multiple rows and columns, each showing the
character doing some different action or representing a static object in different states.

Pixel data is copied and not referenced, so don't try to share a sheet between multiple
sprites. Instead it would be better to share a sprite with multiple `Actor` objects
"""
function Sprite(sheet::Image, rows::Integer, cols::Integer)
    sheet_width, sheet_height = size(sheet)
    w, h = sheet_width/cols, sheet_height/rows
    
    frames = Image[]
    for row in 1:rows
        y0 = row*h
        for col in 1:cols
            x0 = col*w
            push!(frames, Image[x0:x0+w, y0:y0+h])
        end
    end
    
    Sprite(frames)
end

"""
    draw!(canvas::Image, sprite, x, y, frame=1)
"""
function draw!(canvas::Image, spr::Sprite, x::Integer, y::Integer, frame::Integer = 1)
    draw!(canvas, spr.frames[frame], x, y)
end

"""
    draw!(canvas::Image, sprite, pos, frame=1)
Draws sprite on canvas at position given as `(x, y)` or `pos`, using given `frame`
number. A sprite has multiple frames. This allows you to show a character doing different
things such as picking something up, walking or using a sword. 
"""
function draw!(canvas::Image, spr::Sprite, pos::Point{<:Integer}, frame::Integer = 1)
    draw!(canvas, spr.frames[frame], pos)
end