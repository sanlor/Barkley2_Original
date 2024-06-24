/// scr_collisionSystem_remove_shape(shape)
/// Adds a region to the collision grid.

var shape = argument0;

// Remove from All RTree
sat_rtree_remove_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ALL), shape)
// Remove from all solids RTree
sat_rtree_remove_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_NORMAL), shape)
// Remove from only solids RTree
sat_rtree_remove_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ONLY_SOLID), shape)

// Motion planning grids
scr_collisionSystem_remove_shape_motionPlanning(shape, MOTIONPLANNING_ALL);
scr_collisionSystem_remove_shape_motionPlanning(shape, MOTIONPLANNING_NORMAL);
scr_collisionSystem_remove_shape_motionPlanning(shape, MOTIONPLANNING_ONLY_SOLID);
