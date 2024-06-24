/// scr_collisionSystem_remove_shape_motionPlanning(shape, motionPlanningGridType)
var shape = argument0;
var type = argument1;


var MPGRID_W = 8;
var MPGRID_WH = 4;

// Inverted for wading
var inverted = (type == MOTIONPLANNING_WADING);
// Get MP grid
var mpg = scr_collisionSystem_motionPlanningOfType(type);
// Get collision grid
var rtree;
switch (type) {
    case MOTIONPLANNING_NORMAL:
        rtree = scr_collisionSystem_collisionTreeOfType(COLLISION_NORMAL);
        break;
    case MOTIONPLANNING_ONLY_SOLID:
        rtree = scr_collisionSystem_collisionTreeOfType(COLLISION_ONLY_SOLID);
        break;
    case MOTIONPLANNING_ALL:
        rtree = scr_collisionSystem_collisionTreeOfType(COLLISION_ALL);
        break;
    case MOTIONPLANNING_WADING:
        rtree = scr_collisionSystem_collisionTreeOfType(COLLISION_WADING);
        break;
    default:
        show_error("Invalid MotionPlanning type: " + string(type), true);
        break;
}

// Get section to clear
var shape_type = shape[0];
var sx = shape[2];
var sy = shape[3];
var left, right, top, bottom;
if (shape_type == SAT_SHAPE_AABB) {
    var swh = shape[4];
    var swv = shape[5];
    left = sx - swh;
    right = sx + swh;
    top = sy - swv;
    bottom = sy + swv;   
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    var srad = shape[4];
    left = floor((sx - srad) / MPGRID_W) * MPGRID_W;
    top = floor((sy - srad) / MPGRID_W) * MPGRID_W;
    right = (floor((sx + srad) / MPGRID_W) * MPGRID_W) + MPGRID_W;
    bottom = (floor((sy + srad) / MPGRID_W) * MPGRID_W) + MPGRID_W;
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    var px1 = shape[@ 4] + sx
    var py1 = shape[@ 5] + sy
    var px2 = shape[@ 6] + sx
    var py2 = shape[@ 7] + sy
    var px3 = shape[@ 8] + sx
    var py3 = shape[@ 9] + sy
    left = min(px1, px2, px3)
    right = max(px1, px2, px3)
    top = min(py1, py2, py3)
    bottom = max(py1, py2, py3)
}

// Clear section
mp_grid_clear_rectangle(mpg, left, top, right, bottom);

// Recalculate section (Welcome to Heavy Computations Inc., how may I help you)
var colshape = sat_make_shape_rect(left + MPGRID_WH, top + MPGRID_WH, MPGRID_WH, MPGRID_WH);
for (var _x = floor(left/MPGRID_W)*MPGRID_W; _x <= right; _x += MPGRID_W) {
    for (var _y = floor(top/MPGRID_W)*MPGRID_W; _y <= bottom; _y += MPGRID_W) {
        if (sat_check_place_collision(rtree, colshape, _x + MPGRID_WH, _y + MPGRID_WH, ZMIN, ZMAX)) {
            if (inverted) {
                mp_grid_clear_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
            }
            else {
                mp_grid_add_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
            }
        }
    }
}
