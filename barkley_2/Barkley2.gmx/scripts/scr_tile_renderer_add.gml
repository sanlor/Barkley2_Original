/// scr_tile_renderer_add(renderer_id, tileid)

var renderid = argument0
var tileid = argument1

var tx = tile_get_x(tileid)
var ty = tile_get_y(tileid)
var tw = tile_get_width(tileid)
var th = tile_get_height(tileid)
var tlft = tile_get_left(tileid)
var ttop = tile_get_top(tileid)
var tbg = tile_get_background(tileid)
var tscx = tile_get_xscale(tileid)
var tscy = tile_get_yscale(tileid)

var isScaled = (tscx != 1) or (tscy != 1)
var grid = renderid.grid
var tileid

// Keep track of maximum tile size
with (renderid) {
    tw_max = max(tw, tw_max);
    th_max = max(th, th_max);
}

//GZ ADDED Add eligible tiles to footstep grid - DISABLED UNTIL SNOW TILES
/*
if (tbg == tls_swp_swamp01)
{
    var tl = tlft / 16;
    var tt = ttop / 16;
    stepDo = 0;
    if ((tl >= 5 && tl <= 8) && tt == 0) stepDo = 1;
    else if ((tl >= 5 && tl <= 10) && (tt >= 1 && tt <= 4)) stepDo = 1; //6 - 9, 5 - 10
    if (stepDo == 1)
    {
        //here
        var til_lft = tx / 16;
        var til_top = ty / 16;
        var til_rgt = (tx + (tw * tscx)) / 16;
        var til_btm = (ty + (th * tscy)) / 16;
        for (var _x = til_lft; _x < til_rgt; _x += tw) 
        {
            for (var _y = til_top; _y < til_btm; _y += th) 
            {
                ds_grid_add(sys_collision.c_footgrid, _x, _y, 1);
            }
        }
    }
}
*/
//GZ ADDED Add eligible tiles to footstep grid

if (isScaled) {
    // Tile is scaled
    // Split into one-by-one unscaled tiles   
    var tile_lft = tx
    var tile_top = ty
    var tile_rgt = tx + (tw * tscx)
    var tile_btm = ty + (th * tscy)
    
    for (var _x = tile_lft; _x < tile_rgt and floor(_x/TILEGRID_SIZE) < renderid.gridw; _x += tw) {
        for (var _y = tile_top; _y < tile_btm and floor(_y/TILEGRID_SIZE) < renderid.gridh; _y += th) {
            var list = ds_grid_get(grid, floor(_x / TILEGRID_SIZE), floor(_y / TILEGRID_SIZE))
            
            tileid = renderid.next_tileid
            with renderid next_tileid += 1
            
            ds_list_add(list, tileid)
            ds_list_add(list, _x)
            ds_list_add(list, _y)
            ds_list_add(list, tw)
            ds_list_add(list, th)
            ds_list_add(list, tlft)
            ds_list_add(list, ttop)
            ds_list_add(list, tbg)
        }
    } 
}
else {
    // Tile is non-scaled, possibly bulked
    // Add it into the tilegrid spots that it covers
    var grid_lft = floor(tx / TILEGRID_SIZE)
    var grid_top = floor(ty / TILEGRID_SIZE)
    var grid_rgt = floor((tx + (tw * tscx) - 1) / TILEGRID_SIZE)
    var grid_btm = floor((ty + (th * tscx) - 1) / TILEGRID_SIZE)
    
    tileid = renderid.next_tileid
    with renderid next_tileid += 1
    
    for (var _x = grid_lft; _x <= grid_rgt and _x < renderid.gridw; _x++) {
        for (var _y = grid_top; _y <= grid_btm and _y < renderid.gridh; _y++) {
            var list = ds_grid_get(grid, _x, _y)
            
            ds_list_add(list, tileid)
            ds_list_add(list, tx)
            ds_list_add(list, ty)
            ds_list_add(list, tw)
            ds_list_add(list, th)
            ds_list_add(list, tlft)
            ds_list_add(list, ttop)
            ds_list_add(list, tbg)
        }
    }
}
