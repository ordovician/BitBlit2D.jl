export Actor, update!

abstract type Actor end

"""
    update!(actor::Actor, Δt::Number)
Update position, frame, animation, collision or anything else related to
and actor. 
"""
function update! end

