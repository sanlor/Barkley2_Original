/// sat_check_line_collision(rtree, lx0, ly0, lx1, ly1, z)
/// Checks if the instance meets any SAT rigid at the position

var rtree = argument0;
var lx0   = argument1;
var ly0   = argument2;
var lx1   = argument3;
var ly1   = argument4;
var z     = argument5;

// Get list of rigids at target area
var rigids = sat_rtree_get_line(rtree, lx0, ly0, lx1, ly1);
if (ds_list_size(rigids) == 0) {
    // No rigids means no collision
    ds_list_destroy(rigids);
    return false;
}

// Check if collision with any rigids
var rigids_count = ds_list_size(rigids);
for (var n = 0; n < rigids_count; n += 3) {
    // Check if rigid is within Z bounds
    var rigid_zbot = rigids[| n];
    var rigid_ztop = rigids[| n+1];
    if (rigid_zbot < z and rigid_ztop > z) {
        var rigid = rigids[| n+2];
        var rigid_type = rigid[@ 0];
        
        // Shape is a rectangle
        if (rigid_type == SAT_SHAPE_AABB) {
            // Rigid is a rectangle
            if (sat_collision_line_rect(lx0, ly0, lx1, ly1,
                                        rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                ds_list_destroy(rigids); // Free array
                return true;
            }
        }
        else if (rigid_type == SAT_SHAPE_CIRCLE) {
            // Rigid is a circle
            if (sat_collision_line_circle(lx0, ly0, lx1, ly1,
                                          rigid[@ 2], rigid[@ 3], rigid[@ 4])) {
                ds_list_destroy(rigids); // Free array
                return true;
            }
        }
        else if (rigid_type == SAT_SHAPE_POLYGON) {
            // Rigid is a polygon
            var px = rigid[@ 2]
            var py = rigid[@ 3]
            if (sat_collision_line_polygon(lx0, ly0, lx1, ly1,
                                          rigid[@ 4] + px, rigid[@ 5] + py,
                                          rigid[@ 6] + px, rigid[@ 7] + py,
                                          rigid[@ 8] + px, rigid[@ 9] + py)) {
                ds_list_destroy(rigids); // Free array
                return true;
            }
        }
    }
}

ds_list_destroy(rigids); // Free array
return false;
