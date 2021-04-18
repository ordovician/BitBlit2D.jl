using LinearAlgebra

export translate, scale, rotate

import Base: position

"""
    translate(v::Vec2D) -> Matrix
Creates a 3x3 matrix that would translate points
in the `v` direction.
"""
function translate(v::Union{Vec2D, Point})
    A = zeros(3, 3) + I
	A[1, 3] = v.x
	A[2, 3] = v.y
	
    A
end


"""
    scale(x, y) -> Matrix
Create 3x3 matrix for scaling in object. If you multiply
this with a collection of points making up a shape, it
has the effect of scaling that shape.
"""
function scale(x::Number, y::Number)
    A = zeros(3, 3)
    A[1, 1] = x
    A[2, 2] = y
    A[3, 3] = 0.0 
    A
end

"""
    rotate(angle) -> Matrix
Create a 3x3 matrix that can be used to rotate a shape
made up of multiple points along its axis. Each point
will have to be a column in matrix.
"""
function rotate(angle::Number)
    A = zeros(3, 3) + I
    sine   = sin(angle)
    cosine = cos(angle)
    
	A[1, 1] = cosine
	A[1, 2] = -sine
	A[2, 1] = sine
	A[2, 2] = cosine
    
    A     
end
