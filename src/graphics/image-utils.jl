export dice_image

"""
    dice_image(sheet::Image, rows, cols)
Dice (or split) and image made up of many smaller images into multiple separate images
based on the `rows` and `cols` we have provided as arguments. This is useful because
game assets often come as sprite sheets containing multiple images of the same character
of different tiles.
"""
function dice_image(sheet::Image, rows::Integer, cols::Integer)
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
    
    frames
end