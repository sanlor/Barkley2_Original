/// scr_collision_zstair(x, y)
// Returns stair at position (ZSTAIRS_RIGHT, ZSTAIRS_LEFT, ZSTAIRS_UP) or undefined

var _x = argument0;
var _y = argument1;

var gx = floor(_x/ZHEIGHT_GRID_W);
var gy = floor(_y/ZHEIGHT_GRID_W);
var grid_stairs = sys_collision.height_stairs_grid;
return grid_stairs[# gx, gy ];
