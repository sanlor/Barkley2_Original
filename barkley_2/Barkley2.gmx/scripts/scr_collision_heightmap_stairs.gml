/// scr_collision_heightmap_stairs()
// Parse all stair objects into stairs grid

var lft, top, rgt, btm;

var grid = sys_collision.height_stairs_grid;

with (o_map_zstairs_up) {
    lft = floor(bbox_left/ZHEIGHT_GRID_W);
    top = floor(bbox_top/ZHEIGHT_GRID_W);
    rgt = bbox_right/ZHEIGHT_GRID_W;
    btm = bbox_bottom/ZHEIGHT_GRID_W;
    for (var _x = lft; _x < rgt; _x++) {
        for (var _y = top; _y < btm; _y++) {
            ds_grid_set(grid, _x, _y, ZSTAIRS_UP);
        }
    }
    
    instance_destroy();
}

with (o_map_zstairs_left) {
    lft = floor(bbox_left/ZHEIGHT_GRID_W);
    top = floor(bbox_top/ZHEIGHT_GRID_W);
    rgt = bbox_right/ZHEIGHT_GRID_W;
    btm = bbox_bottom/ZHEIGHT_GRID_W;
    for (var _x = lft; _x < rgt; _x++) {
        for (var _y = top; _y < btm; _y++) {
            ds_grid_set(grid, _x, _y, ZSTAIRS_LEFT);
        }
    }
    
    instance_destroy();
}

with (o_map_zstairs_right) {
    lft = floor(bbox_left/ZHEIGHT_GRID_W);
    top = floor(bbox_top/ZHEIGHT_GRID_W);
    rgt = bbox_right/ZHEIGHT_GRID_W;
    btm = bbox_bottom/ZHEIGHT_GRID_W;
    for (var _x = lft; _x < rgt; _x++) {
        for (var _y = top; _y < btm; _y++) {
            ds_grid_set(grid, _x, _y, ZSTAIRS_RIGHT);
        }
    }
    
    instance_destroy();
}
