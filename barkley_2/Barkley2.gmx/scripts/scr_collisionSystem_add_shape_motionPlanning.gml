/// scr_collisionSystem_add_shape_motionPlanning(shape, motionPlanningGridType)
var shape = argument0;
var type = argument1;


var MPGRID_W = 8;
var MPGRID_WH = 4;

// Inverted for wading
var inverted = (type == MOTIONPLANNING_WADING);
// Get MP grid
var mpg = scr_collisionSystem_motionPlanningOfType(type);

// Add shape to grid
var shape_type = shape[@ 0];
var sx = shape[@ 2];
var sy = shape[@ 3];
if (shape_type == SAT_SHAPE_AABB) {
    var swh = shape[@ 4];
    var swv = shape[@ 5];
    var left = sx - swh;
    var right = sx + swh;
    var top = sy - swv;
    var bottom = sy + swv;   
    
    if (inverted) {
        mp_grid_clear_rectangle(mpg, left, top, right, bottom);
    }
    else {
        mp_grid_add_rectangle(mpg, left, top, right, bottom);
    }
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    var srad = shape[@ 4];
    var left = floor((sx - srad) / MPGRID_W) * MPGRID_W;
    var top = floor((sy - srad) / MPGRID_W) * MPGRID_W;
    var right = (floor((sx + srad) / MPGRID_W) * MPGRID_W) + MPGRID_W;
    var bottom = (floor((sy + srad) / MPGRID_W) * MPGRID_W) + MPGRID_W;
    for (var _x = left; _x < right; _x += MPGRID_W) {
        for (var _y = top; _y < bottom; _y += MPGRID_W) {
            if (sat_collision_circle_rect(sx, sy, srad, _x+MPGRID_WH, _y+MPGRID_WH, MPGRID_WH, MPGRID_WH)) {
                if (inverted) {
                    mp_grid_clear_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
                }
                else {
                    mp_grid_add_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
                }
            }
        }
    }
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    px1 = shape[@ 4] + sx
    py1 = shape[@ 5] + sy
    px2 = shape[@ 6] + sx
    py2 = shape[@ 7] + sy
    px3 = shape[@ 8] + sx
    py3 = shape[@ 9] + sy
    var left = floor(min(px1, px2, px3) / MPGRID_W) * MPGRID_W;
    var right = floor(max(px1, px2, px3) / MPGRID_W) * MPGRID_W;
    var top = floor(min(py1, py2, py3) / MPGRID_W) * MPGRID_W;
    var bottom = floor(max(py1, py2, py3) / MPGRID_W) * MPGRID_W;
    for (var _x = left; _x <= right; _x += MPGRID_W) {
        for (var _y = top; _y <= bottom; _y += MPGRID_W) {
            if (sat_collision_rect_polygon(_x + MPGRID_WH, _y + MPGRID_WH, MPGRID_WH, MPGRID_WH, shape)) {
                if (inverted) {
                    mp_grid_clear_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
                }
                else {
                    mp_grid_add_cell(mpg, round(_x/MPGRID_W), round(_y/MPGRID_W));
                }
            }
        }
    }
}
