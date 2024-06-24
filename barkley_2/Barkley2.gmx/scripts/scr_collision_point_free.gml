/// scr_collision_point_free(x, y, z, collision_type)
/// Returns true if the specified point is free, false otherwise.

if (argument3 == COLLISION_NONE) {
    return true; // No collision
}
else {
    // SAT-type collision checks
    return (not sat_check_point_collision(scr_collisionSystem_collisionTreeOfType(argument3), argument0, argument1, argument2));
}
