/// scr_collision_heightmap_floodfill(rtree, x, y, height)
/* rtree:  the index of the collision r-tree that will be used for the fill
   sx:     start x position
   sy:     start y position
   height: the height to be filled
   
   How to use:
   
   Calling this will floodfill the cells of sys_collision.height_grid with the height provided.
   Since this is a floodfill, it will only touch cells that are not completely blocked by collision objects.
   
   Hint: you should call this from o_zsurvey, which is an object that should be placed somewhere in the map.

*/

var rtree = argument0;
var sx = argument1;
var sy = argument2;
var height = argument3;

var cellsW = floor(room_width/ZHEIGHT_GRID_W);
var cellsH = floor(room_height/ZHEIGHT_GRID_W);
var grid = sys_collision.height_grid;
var grid_stairs = sys_collision.height_stairs_grid;

// Set starting point
sx = floor(sx/ZHEIGHT_GRID_W);
sy = floor(sy/ZHEIGHT_GRID_W);
ds_grid_set(grid, sx, sy, height);

// Flood fill
var points = ds_queue_create();
ds_queue_enqueue(points, sx + sy*cellsW);

var shape = sat_make_shape_rect(0, 0, ZHEIGHT_GRID_W/2, ZHEIGHT_GRID_W/2);

while(!ds_queue_empty(points))
{
    var point = ds_queue_dequeue(points);
    
    var px = point mod cellsW;
    var py = floor(point/cellsW);
    
    var height_current = grid[# px, py];

    if (px > 0 and is_undefined(grid[# px-1, py]) and
            !sat_check_place_collision(rtree, shape, (px-1)*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), py*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), ZMIN, ZMAX)) {
        var hset = height_current;
        var zstair = grid_stairs[# px-1, py];
        if (!is_undefined(zstair)) {
            if (zstair == ZSTAIRS_LEFT) hset += ZHEIGHT_GRID_W;
            if (zstair == ZSTAIRS_RIGHT) hset -= ZHEIGHT_GRID_W;
        }
        grid[# px-1, py] = hset;
        ds_queue_enqueue(points, (px-1) + py*cellsW);
    }
    
    if (px < cellsW-1 and is_undefined(grid[# px+1, py]) and
            !sat_check_place_collision(rtree, shape, (px+1)*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), py*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), ZMIN, ZMAX)) {
        var hset = height_current;
        var zstair = grid_stairs[# px+1, py];
        if (!is_undefined(zstair)) {
            if (zstair == ZSTAIRS_LEFT) hset -= ZHEIGHT_GRID_W;
            if (zstair == ZSTAIRS_RIGHT) hset += ZHEIGHT_GRID_W;
        }
        grid[# px+1, py] = hset;
        ds_queue_enqueue(points, (px+1) + py*cellsW);
    }
    
    if (py > 0 and is_undefined(grid[# px, py-1]) and
            !sat_check_place_collision(rtree, shape, px*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), (py-1)*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), ZMIN, ZMAX)) {
        var hset = height_current;
        var zstair = grid_stairs[# px, py-1];
        if (!is_undefined(zstair)) {
            if (zstair == ZSTAIRS_UP) hset += ZHEIGHT_GRID_W * 2;
        }
        grid[# px, py-1] = hset;
        ds_queue_enqueue(points, px + (py-1)*cellsW);
    }
    
    if (py < cellsH-1 and is_undefined(grid[# px, py+1]) and
            !sat_check_place_collision(rtree, shape, px*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), (py+1)*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2), ZMIN, ZMAX)) {
        var hset = height_current;
        var zstair = grid_stairs[# px, py+1];
        if (!is_undefined(zstair)) {
            if (zstair == ZSTAIRS_UP) hset -= ZHEIGHT_GRID_W * 2;
        }
        grid[# px, py+1] = hset;
        ds_queue_enqueue(points, px + (py+1)*cellsW);
    }
}

ds_queue_destroy(points);
