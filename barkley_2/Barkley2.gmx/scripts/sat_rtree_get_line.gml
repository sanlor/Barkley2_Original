/// sat_rtree_get_line(rtree, x1, y1, x2, y2)
/// Get all rigids within the specified bbox

var rtree = argument0;
var x1 = argument1;
var y1 = argument2;
var x2 = argument3;
var y2 = argument4;

// Line properties
var line_len = point_distance(x1, y1, x2, y2);
var line_dir = point_direction(x1, y1, x2, y2);
var line_sin = sin(degtorad(line_dir));
var line_cos = cos(degtorad(line_dir));

// Fetch a reasonably small grid size
var pow, gridw;
var log_min = rtree[| 4];
//var line_gridw = line_len / 16; // ADJUST THIS CONSTANT TO CONFIGURE PERFORMANCE
var line_gridw = 1;
if (line_gridw <= rtree[| 2]) {
    pow = log_min;
    gridw = rtree[| 2];
}
else {
    pow = ceil(log2(line_gridw));
    gridw = power(2,pow);
}

// Configure raycast
var len_remain = line_len;
var grid_count = rtree[| 3] div gridw;
var index = 6 + (pow - log_min);
var grid = rtree[| index];
var prev_left = -1;
var prev_top = -1;

// Union of all rigids found (array)
var rigids_all = ds_list_create();
var rigids_all_len = 0;
var loop = true;

while (loop) {
    // Final loop if at end of line
    if (len_remain <= 0) {
        loop = false;
    }

    // Find rigids at position
    var grid_left, grid_top;
    if (x1 <= 0) {
        grid_left = 0;
    }
    else {
        grid_left = x1 div gridw;
        if (grid_left >= grid_count) {
            grid_left = grid_count - 1;
        }
    }
    if (y1 <= 0) {
        grid_top = 0;
    }
    else {
        grid_top = y1 div gridw;
        if (grid_top >= grid_count) {
            grid_top = grid_count - 1;
        }
    }
    
    if (grid_left != prev_left || grid_top != prev_top) {
        // Add rigids to list
        rigids = grid[# grid_left, grid_top];
        if (rigids != NULL) {
            var rigids_len = ds_list_size(rigids);
            
            for (var i = 0; i < rigids_len; i++) {
                var val = rigids[| i];
                rigids_all[| rigids_all_len++] = val;
            }
        }
        prev_left = grid_left;
        prev_top = grid_top;
    }
        
    if (loop) {
        // Move point
        if (len_remain <= gridw) {
            // End
            x1 = x2;
            y1 = y2;
            len_remain = 0;   
        }
        else {
            x1 += line_cos * gridw;
            y1 -= line_sin * gridw;
            len_remain -= gridw;
        }
    }
}

return rigids_all;
