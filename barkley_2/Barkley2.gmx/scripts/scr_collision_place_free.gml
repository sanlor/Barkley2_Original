/// scr_collision_place_free(x, y, collision_type)
/// Returns true if the specified area is free, false otherwise.

// Grid-type collisions: always free
if (argument2 == COLLISION_SHADOWS or argument2 == COLLISION_NONE) {
    return true;
}

return (not sat_check_place_collision(scr_collisionSystem_collisionTreeOfType(argument2), _sat_shape, argument0, argument1, z + hitbox_z_bottom, z + hitbox_z_top));
