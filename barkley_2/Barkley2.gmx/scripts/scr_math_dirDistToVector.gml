/// scr_math_dirDistToVector(direction,distance)
/// Sets __vx and __vy to the vector with the specified direction and distance.

var _dir, _dist;
_dir = argument0;
_dist = argument1;

__vx =  cos(degtorad(_dir)) * _dist;
__vy = -sin(degtorad(_dir)) * _dist;
