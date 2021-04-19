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

# Current Status and Thoughts
This project is put in limbo, as I am not sure of future directions. As one starts to think of hierarchies of objects, collision detection etc, it becomes clearly that this quickly becomes a larger
project than I intended.

- Should game objects be part of a traditional scene graph? If so then we need a system to traverse it and draw things in proper order.
- Ideally we treat each object independently, but then things like collision detection becomes tricky as it will involve sorting multiple objects in some spatial fashion before checking if they overlap.
- Accurate collision detection would require having a mask to check against. That requires calculating overlapping rectangles and then checking pixel/bit values against each other.

The scope easily becomes large enough that I might reconsider simply using something like Godot. Why reinvent the wheel?

The aim of this project is to have a simple implementation of a sprite system. If the implementation gets complicated, then I deviate from that goal. It is hard to reconcile the simplicity I want with the features I want. Some possible ways out:

- Abandon the idea that sprites are in hierarchies. This complicates things like ordering and rendering. It complicates thought around how objects should be processes in a general fashion.

## What Works and Doesn't Work?
A lot of the code is quick hash out of ideas and not properly tested. Creating images and drawing them should work. Mostly anything else may in principle be broken.