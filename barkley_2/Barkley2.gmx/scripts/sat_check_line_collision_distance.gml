/// sat_check_line_collision_distance(rtree, lx0, ly0, lx1, ly1, z)
/// WARNING: This is a very inefficient calculation. Use sparingly!
var rtree = argument0;
var lx0   = argument1;
var ly0   = argument2;
var lx1   = argument3;
var ly1   = argument4;
var z     = argument5;

// Get list of rigids at target area
var rigids = sat_rtree_get_line(rtree, lx0, ly0, lx1, ly1);

// Check if collision with any rigids
var min_dist = -1;
var rigids_count = ds_list_size(rigids);

for (var n = 0; n < rigids_count; n += 3) {
    // Check if rigid is within Z bounds
    var rigid_zbot = rigids[| n];
    var rigid_ztop = rigids[| n+1];
    if (rigid_zbot < z and rigid_ztop > z) {
        var rigid = rigids[| n+2];
        var rigid_type = rigid[@ 0]
        // Shape is a rectangle
        if (rigid_type == SAT_SHAPE_AABB) {
            // Rigid is a rectangle
            var res = sat_collision_distance_line_rect(lx0, ly0, lx1, ly1,
                                                       rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5]);
            if (res != -1 and (res < min_dist or min_dist == -1)) {
                min_dist = res;
            }
        }
        else if (rigid_type == SAT_SHAPE_CIRCLE) {
            // Rigid is a circle
            var res = sat_collision_distance_line_circle(lx0, ly0, lx1, ly1,
                                                         rigid[@ 2], rigid[@ 3], rigid[@ 4])
            if (res != -1 and (res < min_dist or min_dist == -1)) {
                min_dist = res;
            }
        }
        else if (rigid_type == SAT_SHAPE_POLYGON) {
            // Rigid is a polygon
            var px = rigid[@ 2]
            var py = rigid[@ 3]
            res = sat_collision_distance_line_polygon(lx0, ly0, lx1, ly1,
                                                    rigid[@ 4] + px, rigid[@ 5] + py,
                                                    rigid[@ 6] + px, rigid[@ 7] + py,
                                                    rigid[@ 8] + px, rigid[@ 9] + py)
            if (res != -1 and (res < min_dist or min_dist == -1)) {
                min_dist = res;
            }
        }
    }
}

ds_list_destroy(rigids); // Free arrays
return min_dist;
