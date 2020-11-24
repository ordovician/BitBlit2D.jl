# Bit Blit 2D

Experiment with creating a game engine for 2D pixel art style of games. Initially I will just use this as a playground to try out the
MiniFB library to draw graphics. 

To test the program, make sure this package is in your path, and enter the Julia REPL:

    julia> using BitBlit2D
    julia> w = Window("Hello World", 400, 500)
    
Before showing the window we can draw a rectangle in it:

    julia> draw(w, Rect(10, 10, 200, 120))

This will cause the Julia REPL to block and show windows

    julia> renderloop(w)

