/// sat_rtree_get(rtree, left, top, width)
/// Get all rigids within the specified bbox

var rtree   = argument0;
var left    = argument1;
var top     = argument2;
var width   = argument3;

// Determine maximum necessary grid size to cover indicated area
var pow, gridw;
var log_min = rtree[| 4];
if (width <= rtree[| 2]) {
    pow = log_min;
    gridw = rtree[| 2];
}
else {
    pow = ceil(log2(width));
    var log_max = rtree[| 5];
    pow = min(pow, log_max);
    gridw = power(2,pow);
}



// Optimization: Shrink grid size as much as possible
if (pow > log_min) {
    var gridw_half = gridw/2;
    var c1 = left div gridw_half;
    var c2 = (left + width) div gridw_half;
    var c3 = top div gridw_half;
    var c4 = (top + width) div gridw_half;
    if ((c1 == c2 || c1 == c2-1) && (c3 == c4 || c3 == c4-1)) {
        gridw = gridw_half;
        pow -= 1;
    }
}

var grid_count = rtree[| 3] div gridw;

var index = 6 + (pow - log_min);
var grid = rtree[| index];

var grid_left, grid_top;
if (left <= 0) {
    grid_left = 0;
}
else {
    grid_left = left div gridw;
    if (grid_left >= grid_count) {
        grid_left = grid_count - 1;
    }
}
if (top <= 0) {
    grid_top = 0;
}
else {
    grid_top = top div gridw;
    if (grid_top >= grid_count) {
        grid_top = grid_count - 1;
    }
}

// Temp
__gridw = gridw
__gridleft = grid_left * gridw
__gridtop = grid_top * gridw

return grid[# grid_left, grid_top];
