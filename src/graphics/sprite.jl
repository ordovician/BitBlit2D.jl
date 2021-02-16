struct Sprite
    sheet::Image
    rows::Int
    cols::Int
    cellsize::Size{Int}
    region::Rect
end

function Sprite(sheet::Image, rows::Int, cols::Int)
    w, h = size(sheet)
    cellsize = Size(w/cols, h/rows)
    
    Sprite(sheet, rows, cols, cellsize, Rect(0, 0, w, h))
end

function draw!(canvas::Image, spr::Sprite, x::Int, y::Int, frame::Int)
    row = frame % spr.rows
    col = frame ÷ spr.cols
    
    w , h  = spr.cellsize
    x0, y0 = col*w, row*h
    
    draw!(canvas, spr.sheet[x0:x0+w, y0:y0+w], x, y)
end