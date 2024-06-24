/// sat_rtree_create(width, height, gridw_min)
/// Creates a new R-Tree and returns its ID

// Minimal grid size
var w = argument0;
var h = argument1;
var gridw_min = argument2;

// Maximal grid size
var log_min = ceil(log2(gridw_min));
var log_max = ceil(log2(max(w, h)));
var gridw_max = power(2, log_max);

// Create R-tree. Represented as array due to fastest read operations
var rtree = ds_list_create();
rtree[| 0] = w;
rtree[| 1] = h;
rtree[| 2] = gridw_min;
rtree[| 3] = gridw_max;
rtree[| 4] = log_min;
rtree[| 5] = log_max;

var index = 6;
for (var pow = log_min; pow <= log_max; pow++) {
    var w = power(2, pow);
    var size = (gridw_max / w);
    var grid = ds_grid_create(size + 1, size + 1);
    ds_grid_clear(grid, NULL);
    rtree[| index++] = grid;
}

return rtree;
