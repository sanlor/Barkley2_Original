/// scr_collision_eject_from_solid(x,y,collision_type)
/// Calculates ejection from walls when at position (x,y). Returns array with new coordinates.

var p_x = argument0;
var p_y = argument1;
var collision_type = argument2;

// Skip collision check on Grid collision types, and on None
if (collision_type == COLLISION_SHADOWS or collision_type == COLLISION_NONE) {
    var res = 0;
    res[0] = p_x;
    res[1] = p_y;
    return res;
}

// Do movement and collision check
var rtree = scr_collisionSystem_collisionTreeOfType(collision_type);

_sat_shape[2] = p_x;
_sat_shape[3] = p_y;
sat_move(rtree, _sat_shape, move_x, move_y, z + hitbox_z_bottom, z + hitbox_z_top);
// Read result
var res = 0;
res[0] = _sat_shape[2];
res[1] = _sat_shape[3];
// Reset shape to correct position
_sat_shape[2] = x;
_sat_shape[3] = y;

return res;
