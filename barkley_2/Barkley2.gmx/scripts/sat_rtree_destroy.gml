/// sat_rtree_destroy(rtree)

var rtree = argument0;

// Destroy grids and their contents
for (var i = 6; i < ds_list_size(argument0); i++) {
    var grid = rtree[| i];
    
    var w = ds_grid_width(grid);
    var h = ds_grid_height(grid);
    for (var wi = 0; wi < w; wi++) {
        for (var hi = 0; hi < h; hi++) {
            var list = grid[# wi, hi];
            
            if (list != NULL) {
                // Destroy SAT Shapes, which are arrays
                for (var j = 0; j < ds_list_size(list); j += 3) {
                    var shape = list[| j+2];
                    shape = 0; // Clear array from memory
                }
                
                ds_list_destroy(list);
            }
        }
    }
    
    ds_grid_destroy(grid);
} 

// Destroy R-Tree
ds_list_destroy(rtree);

