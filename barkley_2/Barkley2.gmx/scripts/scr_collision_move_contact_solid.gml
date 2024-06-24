/// scr_collision_move_contact_solid(move_x, move_y, collision_type)

var move_x = argument0;
var move_y = argument1;
var collision_type = argument2;

// Skip collision check on Grid collision types, and on None
if (collision_type == COLLISION_SHADOWS or collision_type == COLLISION_NONE) {
    x += move_x;
    y += move_y;
    _sat_shape[@ 2] = x;
    _sat_shape[@ 3] = y;
    return false;
}

// Do movement and collision check
var rtree = scr_collisionSystem_collisionTreeOfType(collision_type);

_sat_shape[@ 2] = x;
_sat_shape[@ 3] = y;
var res = sat_move(rtree, _sat_shape, move_x, move_y, z + hitbox_z_bottom, z + hitbox_z_top);
x = _sat_shape[@ 2];
y = _sat_shape[@ 3];

return res;
