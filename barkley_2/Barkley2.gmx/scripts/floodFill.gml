/// floodFill(rtree, gridW, x, y)
/* Created a new grid and, using a simple flood-fill algorithm, fills the
   area selected by the start point x,y. Cells in the area have value 1, cells
   outside the area have value 0. Returns the grid. */

var rtree = argument0;
var gridW = argument1;
var sx = argument2;
var sy = argument3;

var cellsW = ceil(room_width/gridW);
var cellsH = ceil(room_height/gridW);
var grid = ds_grid_create(cellsW, cellsH);

ds_grid_clear(grid, 0);
sx = floor(sx/gridW);
sy = floor(sy/gridW);
ds_grid_set(grid, sx, sy, 1);

var points = ds_list_create();
ds_list_add(points, sx + sy*cellsW);

var shape = sat_make_shape_rect(0, 0, gridW/2, gridW/2);

while (!ds_list_empty(points)) {
    
    var point = points[| 0];
    ds_list_delete(points, 0)

    var px = point mod cellsW;
    var py = floor(point/cellsW);

    if (px > 0 and ds_grid_get(grid, px-1, py) == 0 and
            !sat_check_place_collision(rtree, shape, (px-1)*gridW + (gridW/2), py*gridW + (gridW/2), ZMIN, ZMAX)) {
        ds_grid_set(grid, px-1, py, 1);
        ds_list_add(points, (px-1) + py*cellsW);
    }
    
    if (px < cellsW-1 and ds_grid_get(grid, px+1, py) == 0 and
            !sat_check_place_collision(rtree, shape, (px+1)*gridW + (gridW/2), py*gridW + (gridW/2), ZMIN, ZMAX)) {
        ds_grid_set(grid, px+1, py, 1);
        ds_list_add(points, (px+1) + py*cellsW);
    }
    
    if (py > 0 and ds_grid_get(grid, px, py-1) == 0 and
            !sat_check_place_collision(rtree, shape, px*gridW + (gridW/2), (py-1)*gridW + (gridW/2), ZMIN, ZMAX)) {
        ds_grid_set(grid, px, py-1, 1);
        ds_list_add(points, px + (py-1)*cellsW);
    }
    
    if (py < cellsH-1 and ds_grid_get(grid, px, py+1) == 0 and
            !sat_check_place_collision(rtree, shape, px*gridW + (gridW/2), (py+1)*gridW + (gridW/2), ZMIN, ZMAX)) {
        ds_grid_set(grid, px, py+1, 1);
        ds_list_add(points, px + (py+1)*cellsW);
    }
}

return grid;
