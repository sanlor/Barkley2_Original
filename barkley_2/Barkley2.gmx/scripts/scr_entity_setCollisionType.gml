/// scr_entity_setCollisionType(collision_type)

var type = argument0;

collision_check = argument0;

// Set pathfinding type to match (if such a pathfinding grid exists)
if (type == COLLISION_NORMAL) {
    scr_path_setMotionPlanningType(MOTIONPLANNING_NORMAL)
} else if (type == COLLISION_ALL) {
    scr_path_setMotionPlanningType(MOTIONPLANNING_ALL)
} else if (type == COLLISION_ONLY_SOLID) {
    scr_path_setMotionPlanningType(MOTIONPLANNING_ONLY_SOLID)
}
