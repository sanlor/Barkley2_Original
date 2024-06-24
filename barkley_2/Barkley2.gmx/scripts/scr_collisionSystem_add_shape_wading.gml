/// scr_collisionSystem_add_shape_wading(shape, [z_bottom, z_top])
/// Adds a region to the shadow grid.

var shape = argument[0];
var z_bottom;
var z_top;

if (argument_count == 3) {
    z_bottom = argument[1];
    z_top = argument[2];
} else if (argument_count == 1) {
    z_bottom = ZMIN;
    z_top = ZMAX;
}

if (global.CACHEcollision == 0)
{
    // Add to Wading RTree
    sat_rtree_add_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_WADING), shape, z_bottom, z_top)

    // Add to All RTree
    sat_rtree_add_shape(scr_collisionSystem_collisionTreeOfType(COLLISION_ALL), shape, z_bottom, z_top)
}

// Motion planning grids
scr_collisionSystem_add_shape_motionPlanning(shape, MOTIONPLANNING_ALL)
scr_collisionSystem_add_shape_motionPlanning(shape, MOTIONPLANNING_WADING)
