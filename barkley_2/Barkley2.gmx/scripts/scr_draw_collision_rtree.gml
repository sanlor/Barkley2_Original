/// scr_draw_collisionGrid(collision_map_grid)
/// Draws the collision R-Tree
var rtree = argument0

var shapes = sat_rtree_get(rtree, view_xview, view_yview, 384);
if (shapes != NULL) {
    var l = ds_list_size(shapes)
    for (var i = 0; i < l; i++) {
        var shape = shapes[| i];
        sat_debug_drawshape(shape)
    }
}
