/// scr_collision_heightmap_coverHoles(rtree)
var rtree = argument0;

var cellsW = floor(room_width/ZHEIGHT_GRID_W);
var cellsH = floor(room_height/ZHEIGHT_GRID_W);
var grid = sys_collision.height_grid;

// Iterate from bottom-to-up then left-to-right, it's odd but gives best results I can see so far...
for (var _y = cellsH - 2; _y >= 1; _y--) {
    for (var _x = 1; _x < cellsW - 1; _x++) {
        var value = grid[# _x, _y ];
        if (is_undefined(value)) {
        
            var vTop = grid[# _x, _y-1 ];
            var vBtm = grid[# _x, _y+1 ];
            var vLft = grid[# _x-1, _y ];
            var vRgt = grid[# _x+1, _y ];
        
            if (!is_undefined(vTop) and !is_undefined(vBtm)) {
                var zMin = min(vTop, vBtm);
                var zMax = max(vTop, vBtm);
                if (zMin < 0) {
                    zMax = zMin;
                }
                grid[# _x, _y ] = zMax;
                var shape = sat_make_shape_rect(_x*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2),
                                                _y*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2),
                                                ZHEIGHT_GRID_W/2, ZHEIGHT_GRID_W/2);
                scr_collisionSystem_add_shape_solid(shape, ZMIN, zMax, false);
            }
            
            else if (!is_undefined(vLft) and !is_undefined(vRgt)) {
                var zMin = min(vLft, vRgt);
                var zMax = max(vLft, vRgt);
                if (zMin < 0) {
                    zMax = zMin;
                }
                grid[# _x, _y ] = zMax;
                var shape = sat_make_shape_rect(_x*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2),
                                                _y*ZHEIGHT_GRID_W + (ZHEIGHT_GRID_W/2),
                                                ZHEIGHT_GRID_W/2, ZHEIGHT_GRID_W/2);
                scr_collisionSystem_add_shape_solid(shape, ZMIN, zMax, false);
            }
        }
    }
}
