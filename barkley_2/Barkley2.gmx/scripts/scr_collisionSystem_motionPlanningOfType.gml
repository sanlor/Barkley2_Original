/// scr_collisionSystem_motionPlanningOfType(collision_type)
/// Retrieves the correct collision grid based on the specified type.

if (argument0 == MOTIONPLANNING_ALL) {
    return sys_collision.mpc_allgrid;
} else if (argument0 == MOTIONPLANNING_NORMAL) {
    return sys_collision.mpc_grid;
} else if (argument0 == MOTIONPLANNING_ONLY_SOLID) {
    return sys_collision.mpc_osgrid;
} else {
    return sys_collision.mpc_wadegrid;
}
