using BitBlit2D, Colors


function checkered_board(rows=4, cols=4)
    w, h = 4, 4
    board = Image(cols*4, rows*4, colorant"yellow")
    square = Image(4, 4, colorant"brown") 
    
    for r in 0:rows-1
        for c in 0:cols-1
            if r % 2 == c % 2
                draw!(board, square, c*w, r*h)
            end
        end
    end
    board
end
   