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
Got going again. Current conclusion is to keep things simple. Abandoned idea of sprites in hierarchies. It is better for each game to simply hardcode this. This isn't a C++ style engine. Making a custom game object is easy and fast. We don't need lots of prefabricated overengineered object-hierarchies.

Instead we will do like many other simple 2D game engines: Provide the important building blocks to allow construction of simple games. These are the things we want to be able to provide as ready made chunks of functionality:

- Sprites to keep track of position and frame being drawn.
- Rigid bodies of some sort to handle physics stuff. At least stuff like velocity, gravity etc.
- Collision detection. Provide some shapes that can do intersection testing. Hierarchies.
- Path following?
- Loading sprite sheets, and game levels from standard tools.

Other than this, I think writing our own custom game loop is actually preferable. If you are going to teach people how this works, you might as well show how the internals work. Expose the fact that we deal with delta times etc.

Make each game entity custom. Make own concrete type for heroes, enemies etc. 

## What Works and Doesn't Work?
A lot of the code is quick hash out of ideas and not properly tested. Creating images and drawing them should work. Mostly anything else may in principle be broken.