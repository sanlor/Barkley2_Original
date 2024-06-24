/// scr_collisionSystem_collisionTreeOfType(collision_type)
/// Retrieves the correct collision grid based on the specified type.

if (argument0 == COLLISION_ONLY_SOLID) {
    return sys_collision.c_ostree;
} else if (argument0 == COLLISION_SHADOWS) {
    return sys_collision.c_stree;
} else if (argument0 == COLLISION_WADING) {
    return sys_collision.c_wadetree;
} else if (argument0 == COLLISION_ALL) {
    return sys_collision.c_alltree;
} else {
    return sys_collision.c_tree;
}
