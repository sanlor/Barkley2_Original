/// scr_collisionSystem_remove_shape_semisolid(shape)
/// Adds a region to the collision grid.

var shape = argument0;

// Remove from All RTree
sat_rtree_remove_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ALL), shape)
// Remove from all solids RTree
sat_rtree_remove_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_NORMAL), shape)

// Motion planning grids
scr_collisionSystem_remove_shape_motionPlanning(shape, MOTIONPLANNING_ALL);
scr_collisionSystem_remove_shape_motionPlanning(shape, MOTIONPLANNING_NORMAL);
