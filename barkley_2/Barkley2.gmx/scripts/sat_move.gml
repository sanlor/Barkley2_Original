/// sat_move(rtree, shape, move_x, move_y, z_bottom, z_top)

var rtree    = argument0;
var shape    = argument1;
var move_x   = argument2;
var move_y   = argument3;
var z_bottom = argument4;
var z_top    = argument5;


// Return values
var retval = false;


// New movement point X1, Y1
var sx = shape[@ 2];
var sy = shape[@ 3];

var x1 = sx + move_x;
var y1 = sy + move_y;

// Read instance SAT shape
var shape_type = shape[@ 0];
var wh1, wv1;
var wmin;
var shape_left, shape_top;
if (shape_type == SAT_SHAPE_AABB) {
    wh1 = shape[@ 4];
    wv1 = shape[@ 5];
    wmin = min(wh1, wv1);
    shape_left = x1-wh1;
    shape_top = y1-wv1;
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    wh1 = shape[@ 4];
    wv1 = wh1;
    wmin = wh1;
    shape_left = x1-wh1;
    shape_top = y1-wv1;
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    var px1 = shape[@ 4]
    var py1 = shape[@ 5]
    var px2 = shape[@ 6]
    var py2 = shape[@ 7]
    var px3 = shape[@ 8]
    var py3 = shape[@ 9]
    var poly_lft = min(px1, px2, px3)
    var poly_rgt = max(px1, px2, px3)
    var poly_top = min(py1, py2, py3)
    var poly_btm = max(py1, py2, py3)
    wh1 = (poly_rgt - poly_lft) / 2
    wv1 = (poly_btm - poly_top) / 2
    wmin = min(wh1, wv1)
    shape_left = x1 + poly_lft;
    shape_top = y1 + poly_top;
}
if (wmin < 2) { wmin = 2; }

// --- Fastest exclusion: If no shapes in entire movement area, move and exit! ---
var hit = false;

// Calculate bounding rect containing current and target position
var width = max((wh1*2) + abs(move_x), (wv1*2) + abs(move_y));
if (move_x < 0) {
    left = shape_left + move_x;
}
else {
    left = shape_left;
}
if (move_y < 0) {
    top = shape_top + move_y;
}
else {
    top = shape_top;
}

var rigids = sat_rtree_get(rtree, left, top, width);
if (rigids == NULL) {
    // No rigids means no collision
    shape[@ 2] = x1;
    shape[@ 3] = y1;
    return retval;
}

// --- There were some rigids in movement area - Perform precise movement code ---

// Cut movement steps at half-widths of object
var dist = point_distance(0, 0, move_x, move_y)
if (dist > wmin) {
    var remain = dist - wmin;
    var factor = wmin / dist;
    retval = retval or sat_move(rtree, shape, (1-factor) * move_x, (1-factor) * move_y, z_bottom, z_top);
    move_x *= factor;
    move_y *= factor;
    
    // Re-Calculate bounding rect containing current and target position
    var width = max((wh1*2) + abs(move_x), (wv1*2) + abs(move_y));
    if (move_x < 0) {
        left = shape_left + move_x;
    }
    else {
        left = shape_left;
    }
    if (move_y < 0) {
        top = shape_top + move_y;
    }
    else {
        top = shape_top;
    }
    
    // Get new list of rigids at new target area
    rigids = sat_rtree_get(rtree, left, top, width);
}


// Prepare for collisions checking
var vectors = NULL;

if (rigids == NULL) {
    // No rigids means no collision
    shape[@ 2] = x1;
    shape[@ 3] = y1;
    return retval;
}
else {
    // Check if collision with any rigids
    var rigids_count = ds_list_size(rigids);
    for (var n = 0; n < rigids_count; n += 3) {
        // Check if rigid is within Z bounds
        var rigid_zbot = rigids[| n];
        var rigid_ztop = rigids[| n+1];
        if (rigid_zbot < z_top and rigid_ztop > z_bottom) {
            // Collision check against each rigid in this part of the R-Tree
            var rigid = rigids[| n+2];
            var rigid_type = rigid[@ 0];
            if (shape_type == SAT_SHAPE_AABB) {
                // Shape is a rectangle
                if (rigid_type == SAT_SHAPE_AABB) {
                    // Rigid is a rectangle
                    if (sat_projection_rect_rect(x1, y1, wh1, wv1,
                                                 rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_CIRCLE) {
                    // Rigid is a circle
                    if (sat_projection_circle_rect(rigid[@ 2], rigid[@ 3], rigid[@ 4],
                                                   x1, y1, wh1, wv1)) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, -__vx); // Inverted because collision call is inverted
                        ds_list_add(vectors, -__vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_POLYGON) {
                    // Rigid is a polygon
                    var px = rigid[@ 2];
                    var py = rigid[@ 3];
                    if (sat_projection_rect_polygon(x1, y1, wh1, wv1,
                                                    rigid)) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
            }
            else if (shape_type == SAT_SHAPE_CIRCLE) {
                // Shape is a circle
                if (rigid_type == SAT_SHAPE_AABB) {
                    // Rigid is a rectangle
                    if (sat_projection_circle_rect(x1, y1, wh1,
                                                   rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_CIRCLE) {
                    // Rigid is a circle
                    if (sat_projection_circle_circle(x1, y1, wh1,
                                                     rigid[@ 2], rigid[@ 3], rigid[@ 4])) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_POLYGON) {
                    // Rigid is a polygon
                    var px = rigid[@ 2];
                    var py = rigid[@ 3];
                    if (sat_projection_circle_polygon(x1, y1, wh1,
                                                      rigid )) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
            }
            else if (shape_type == SAT_SHAPE_POLYGON) {
                // Shape is a circle
                if (rigid_type == SAT_SHAPE_AABB) {
                    // Rigid is a rectangle
                    if (sat_projection_rect_polygon(rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5],
                                                    shape)) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, -__vx); // Inverted because collision call is inverted
                        ds_list_add(vectors, -__vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_CIRCLE) {
                    // Rigid is a circle
                    if (sat_projection_circle_polygon(rigid[@ 2], rigid[@ 3], rigid[@ 4],
                                                      shape)) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, -__vx); // Inverted because collision call is inverted
                        ds_list_add(vectors, -__vy);
                        hit = true;
                    }
                }
                else if (rigid_type == SAT_SHAPE_POLYGON) {
                    // Rigid is a polygon
                    if (sat_projection_polygon_polygon(shape, rigid)) {
                        if (vectors == NULL) {
                            vectors = ds_list_create()
                        }
                        ds_list_add(vectors, __vx);
                        ds_list_add(vectors, __vy);
                        hit = true;
                    }
                }
            }
        }
    }
}

if (hit) {
    retval = true;
    var valid_projection_found = false;
    while ((not valid_projection_found) and ds_list_size(vectors) > 0) {
        // Get smallest projection vector
        var n = vector_min(vectors);
        var vx = ds_list_find_value(vectors, n);
        var vy = ds_list_find_value(vectors, n+1);
        ds_list_delete(vectors, n+1);
        ds_list_delete(vectors, n);
        // Check if it is a valid escape vector
        if (not sat_check_place_collision(rtree, shape, x1 + vx, y1 + vy, z_bottom, z_top)) {
            // On valid escape vector, move entity and exit
            valid_projection_found = true;
            __vx = vx;
            __vy = vy;
            shape[@ 2] = x1 + vx;
            shape[@ 3] = y1 + vy;
        }
        else {
            //show_debug_message("Invalid escape vector " + string(vx) + "," + string(vy))
        }
    }
    
    if ((not valid_projection_found) and point_distance(0, 0, move_x, move_y) > .5) {
        // Movement failed - partition movement into smaller steps and try again
        sat_move(rtree, shape, move_x * .5, move_y * .5, z_bottom, z_top);
        sat_move(rtree, shape, move_x * .5, move_y * .5, z_bottom, z_top);
    }
}
else {
    shape[@ 2] = x1;
    shape[@ 3] = y1;
}

// Memory cleanup
if (vectors != NULL) {
   ds_list_destroy(vectors)
}

return retval;
