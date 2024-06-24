/// sat_rtree_add_shape(rtree, shape, zBottom, zTop)

var rtree   = argument0;
var shape   = argument1;
var zBottom = argument2;
var zTop    = argument3;

var shape_type, sx, sy, swh, swv, srad;
var px1, py1, px2, py2, px3, py3;

shape_type = shape[@ 0];
sx = shape[@ 2];
sy = shape[@ 3];

// Calculate bounding box
var bb_left, bb_top, bb_width;
if (shape_type == SAT_SHAPE_AABB) {
    swh = shape[@ 4];
    swv = shape[@ 5];
    bb_left = sx - swh;
    bb_top = sy - swv;
    bb_width = max(swh * 2, swv * 2);
}
else if (shape_type == SAT_SHAPE_CIRCLE) {
    srad = shape[@ 4];
    bb_left = sx - srad;
    bb_top = sy - srad;
    bb_width = srad * 2;
}
else if (shape_type == SAT_SHAPE_POLYGON) {
    px1 = shape[@ 4] + sx
    py1 = shape[@ 5] + sy
    px2 = shape[@ 6] + sx
    py2 = shape[@ 7] + sy
    px3 = shape[@ 8] + sx
    py3 = shape[@ 9] + sy
    xmin = min(px1, px2, px3)
    xmax = max(px1, px2, px3)
    ymin = min(py1, py2, py3)
    ymax = max(py1, py2, py3)
    bb_left = xmin
    bb_top = ymin
    bb_width = max(xmax-xmin, ymax-ymin)
}


// Add shape to each layer
var rtree_w         = rtree[| 0];
var rtree_h         = rtree[| 1];
var rtree_gridw_min = rtree[| 2];
var rtree_gridw_max = rtree[| 3];
var rtree_log_min   = rtree[| 4];
var rtree_log_max   = rtree[| 5];

var index = 6;
var pow = rtree_log_min;
while (pow <= rtree_log_max) {
    
    var grid = rtree[| index++];
    var gridw = power(2, pow);
    var grid_cells = rtree_gridw_max div gridw;

    var left = bb_left div gridw;
    var right = (bb_left + bb_width) div gridw;
    var top = bb_top div gridw;
    var bottom = (bb_top + bb_width) div gridw;
    
    for (var _x = max(left-1, 0); _x <= min(right, grid_cells); _x++) {
        for (var _y = max(top-1, 0); _y <= min(bottom, grid_cells); _y++) {
            // Check if contained in area
            var contained;
            var area_cx = (_x + 1) * gridw;
            var area_cy = (_y + 1) * gridw;
            if (shape_type == SAT_SHAPE_AABB) {
                contained = sat_collision_rect_rect(
                    sx, sy, swh, swv,
                    area_cx, area_cy, gridw, gridw)
            }
            else if (shape_type == SAT_SHAPE_CIRCLE) {
                contained = sat_collision_circle_rect(
                    sx, sy, srad,
                    area_cx, area_cy, gridw, gridw)
            }
            else if (shape_type == SAT_SHAPE_POLYGON) {
                contained = sat_collision_rect_polygon(
                    area_cx, area_cy, gridw, gridw,
                    shape)
            }

            // If contained - add to list in grid
            if (contained) {
                var list = grid[# _x, _y];
                if (list == NULL) {
                    list = ds_list_create();
                    list[| 0] = zBottom;
                    list[| 1] = zTop;
                    list[| 2] = shape;
                    grid[# _x, _y] = list;
                }
                else {
                    var len = ds_list_size(list);
                    list[| len]   = zBottom;
                    list[| len+1] = zTop;
                    list[| len+2] = shape;
                }
            }
        }
    }
    
    pow++;
}
