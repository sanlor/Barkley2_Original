/// scr_collision_zheight(x, y)
/// Get Z height at position, or undefined if no height defined

var _x = argument0;
var _y = argument1;

if (_x < 0 or _y < 0 or _x >= room_width or _y >= room_height) {
    return undefined;
}

// Get grid height
var gx = floor(_x/ZHEIGHT_GRID_W);
var gy = floor(_y/ZHEIGHT_GRID_W);
var grid = sys_collision.height_grid;
var height = grid[# gx,  gy];

// Apply stairs if applicable
if (!is_undefined(height)) {
    var grid_stairs = sys_collision.height_stairs_grid;
    var stair = grid_stairs[# gx, gy ];
    if (!is_undefined(stair)) {
        var xoff = (_x mod ZHEIGHT_GRID_W);
        var yoff = (_y mod ZHEIGHT_GRID_W);
        if (stair == ZSTAIRS_UP) {
            height -= yoff * 2;
        } else if (stair == ZSTAIRS_LEFT) {
            height -= xoff;
        } else if (stair == ZSTAIRS_RIGHT) {
            height += xoff - ZHEIGHT_GRID_W;
        }
    }
}

return height;
