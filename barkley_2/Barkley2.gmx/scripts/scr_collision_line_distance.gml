/// scr_collision_line_distance(x0, y0, x1, y1, z, collision_type)
/// Returns distance if there is a collision between the two specified points, -1 otherwise.

// Skip collision check on Grid collision types
if (argument5 == COLLISION_SHADOWS or argument5 == COLLISION_NONE) {
    return -1;
}

return sat_check_line_collision_distance(scr_collisionSystem_collisionTreeOfType(argument5), argument0, argument1, argument2, argument3, argument4);
