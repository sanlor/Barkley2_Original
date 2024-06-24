/// sat_check_place_collision(rtree, shape, x, y, z_bottom, z_top)
/// Checks if the instance meets any SAT rigid at the position

var rtree    = argument0;
var shape    = argument1;
var x1       = argument2;
var y1       = argument3;
var z_bottom = argument4;
var z_top    = argument5;

// Read instance SAT shape
var shape_type = shape[@ 0];

var wh1, wv1, left, top;
if (shape_type == SAT_SHAPE_AABB) {
    wh1 = shape[@ 4];
    wv1 = shape[@ 5];
    left = x1-wh1;
    top = y1-wv1;
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    wh1 = shape[@ 4];
    wv1 = wh1;
    left = x1-wh1;
    top = y1-wv1;
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    // Make copy of shape with new XY coords
    // NOTE: No @ in brackets means a new copy is made on write
    shape[@ 2] = x1
    shape[@ 3] = y1
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
    left = x1 + poly_lft
    top = y1 + poly_top
}

// Get list of rigids at target area
var width = max(wh1, wv1)*2;

var rigids = sat_rtree_get(rtree, left, top, width);
if (rigids == NULL) {
    // No rigids means no collision
    return false;
}

// Check if collision with any rigids
var rigids_count = ds_list_size(rigids);
for (var n = 0; n < rigids_count; n += 3) {
    // Check if rigid is within Z bounds
    var rigid_zbot = rigids[| n];
    var rigid_ztop = rigids[| n+1];
    if (rigid_zbot < z_top and rigid_ztop > z_bottom) {
        var rigid = rigids[| n+2];
        var rigid_type = rigid[@ 0]
        
        if (shape_type == SAT_SHAPE_AABB) {
            // Shape is a rectangle
            if (rigid_type == SAT_SHAPE_AABB) {
                // Rigid is a rectangle
                if (sat_collision_rect_rect(x1, y1, wh1, wv1,
                                            rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_CIRCLE) {
                // Rigid is a circle
                if (sat_collision_circle_rect(rigid[@ 2], rigid[@ 3], rigid[@ 4],
                                              x1, y1, wh1, wv1)) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_POLYGON) {
                // Rigid is a polygon
                if (sat_collision_rect_polygon(x1, y1, wh1, wv1,
                                               rigid)) {
                    return true;
                }
            }
        }
        else if (shape_type == SAT_SHAPE_CIRCLE) {
            // Shape is a circle
            if (rigid_type == SAT_SHAPE_AABB) {
                // Rigid is a rectangle
                if (sat_collision_circle_rect(x1, y1, wh1,
                                              rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_CIRCLE) {
                // Rigid is a circle
                if (sat_collision_circle_circle(x1, y1, wh1,
                                                rigid[@ 2], rigid[@ 3], rigid[@ 4])) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_POLYGON) {
                // Rigid is a polygon
                var px = rigid[@ 2];
                var py = rigid[@ 3];
                if (sat_collision_circle_polygon(x1, y1, wh1,
                                                 rigid)) {
                    return true;
                }
            }
        }
        else if (shape_type == SAT_SHAPE_POLYGON) {
            // Shape is a polygon
            if (rigid_type == SAT_SHAPE_AABB) {
                // Rigid is a rectangle
                if (sat_collision_rect_polygon(rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5],
                                               shape)) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_CIRCLE) {
                // Rigid is a circle
                if (sat_collision_circle_polygon(rigid[@ 2], rigid[@ 3], rigid[@ 4],
                                                 shape)) {
                    return true;
                }
            }
            else if (rigid_type == SAT_SHAPE_POLYGON) {
                // Rigid is a polygon
                if (sat_collision_polygon_polygon(shape, rigid)) {
                    return true;
                }
            }
        }
     }
}

return false;
