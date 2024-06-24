/// scr_collisionSystem_add_shadow(left,top,width,height)
/// Adds a region to the shadow grid.

var left = argument0;
var top = argument1;
var width = argument2;
var height = argument3;

sat_rtree_add_shape(
        scr_collisionSystem_collisionTreeOfType(COLLISION_SHADOWS),
        sat_make_shape_rect(left + width/2, top + height/2, width/2, height/2),
        ZMIN, ZMAX)
