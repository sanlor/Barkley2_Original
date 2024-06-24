/// scr_actor_isOnGround(actor)

var actor = argument0;

var on_ground = false;
var current = actor.z;
if (current <= 0) { // If actor is on the ground or at z depth of 0
    on_ground = true;
}
return on_ground;
