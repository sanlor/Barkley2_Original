/// scr_path_getPoint(position_pixels, wall_distance)
/* Get XY point of path position where position is in pixels from start point,
   and with the given distance from all nearby walls */
   
var pos_pixels = argument0;
var wall_dist = argument1;
   
if (scr_path_active()) {
    var pathlen = path_get_length(path_walk);
    var px = path_get_x(path_walk, pos_pixels/pathlen);
    var py = path_get_y(path_walk, pos_pixels/pathlen);
    
    if (wall_dist >= 1) {
        var shape = sat_make_shape_circle(px, py, wall_dist);
        var rtree = scr_collisionSystem_collisionTreeOfType(collision_check);
        sat_move(rtree, shape, 0, 0, z + hitbox_z_bottom, z + hitbox_z_top); // Ejects shape from colliding rigids
        px = shape[@ 2];
        py = shape[@ 3];
        shape = 0; // Free shape from memory
    }
    var points = 0;
    points[0] = px;
    points[1] = py;
    return points;
}
else {
    return NULL;
}
