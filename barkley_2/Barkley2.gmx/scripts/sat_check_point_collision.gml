/// sat_check_point_collision(rtree, x, y, z)
/// Checks if the instance meets any SAT rigid at the position
var rtree = argument0;
var x1    = argument1;
var y1    = argument2;
var z1    = argument3;

// Get list of rigids at target position
var rigids = sat_rtree_get(rtree, x1, y1, 1);

if (rigids == NULL) {
    // No rigids means no collision
    return false;
}

// Check if collision with any rigids
var rigids_count = ds_list_size(rigids);
for (var n = 0; n < rigids_count; n += 3) {
    var rigid_zbot = rigids[| n];
    var rigid_ztop = rigids[| n+1];
    if (rigid_zbot < z1 and rigid_ztop > z1) {
        var rigid = rigids[| n+2];
        var rigid_type = rigid[@ 0]
        if (rigid_type == SAT_SHAPE_AABB) {
            // Rigid is a rectangle
            if (sat_collision_point_rect(x1, y1, rigid[@ 2], rigid[@ 3], rigid[@ 4], rigid[@ 5])) {
                return true;
            }
        }
        else if (rigid_type == SAT_SHAPE_CIRCLE) {
            // Rigid is a circle
            if (sat_collision_point_circle(x1, y1, rigid[@ 2], rigid[@ 3], rigid[@ 4])) {
                return true;
            }
        }
        else if (rigid_type == SAT_SHAPE_POLYGON) {
            // Rigid is a circle
            if (sat_collision_point_polygon(x1, y1, rigid)) {
                return true;
            }
        }
    }
}

return false;
