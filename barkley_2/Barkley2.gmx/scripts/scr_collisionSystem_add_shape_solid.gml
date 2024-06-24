/// scr_collisionSystem_add_shape_solid(shape, [z_bottom, z_top, blockPaths])
/// Adds a region to the collision grid.

var shape = argument[0];
var z_bottom;
var z_top;
var blockPaths;

if (argument_count == 4) {
    z_bottom = argument[1];
    z_top = argument[2];
    blockPaths = argument[3];
}
if (argument_count == 3) {
    z_bottom = argument[1];
    z_top = argument[2];
    blockPaths = true;
} else if (argument_count == 1) {
    z_bottom = ZMIN;
    z_top = ZMAX;
    blockPaths = true;
}

if (global.CACHEcollision == 0)
{
    // Add to All RTree
    sat_rtree_add_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ALL), shape, z_bottom, z_top)
    // Add to all solids RTree
    sat_rtree_add_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_NORMAL), shape, z_bottom, z_top)
    // Add to only solids RTree
    sat_rtree_add_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ONLY_SOLID), shape, z_bottom, z_top)
}

if (blockPaths) {
    // Motion planning grids
    scr_collisionSystem_add_shape_motionPlanning(shape, MOTIONPLANNING_ALL)
    scr_collisionSystem_add_shape_motionPlanning(shape, MOTIONPLANNING_NORMAL)
    scr_collisionSystem_add_shape_motionPlanning(shape, MOTIONPLANNING_ONLY_SOLID)
}
