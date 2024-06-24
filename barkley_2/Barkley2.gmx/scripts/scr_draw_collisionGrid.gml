/// scr_draw_collisionGrid(collision_map_grid,stairs_grid)
/// Draws the collision grid efficiently.

var __grid_coll, __grid_stairs;

__grid_coll = argument0;
__grid_stairs = argument1;

// Draw hitbox collisions
draw_set_alpha(0.4);

for(ix = floor(view_xview/8); ix <= ceil((view_xview+SCREEN_WIDTH)/8); ix += 1) {
    for(iy = floor(view_yview/8); iy <= ceil((view_yview+SCREEN_HEIGHT - HUD_HEIGHT)/8); iy += 1) {
        if (ds_grid_get(__grid_coll, ix, iy) != 0) {
            draw_set_color(c_red);
        } else {
            draw_set_color(c_green);
        }
        draw_rectangle( ix*8, iy*8, ix*8+7, iy*8+7, false);
    }
}

// Draw TECHNODROME COOL LINES
draw_set_color(c_green);
for(ix = floor(view_xview/8); ix <= ceil((view_xview+SCREEN_WIDTH)/8); ix += 1) {
    draw_line(ix * 8, view_yview, ix * 8, view_yview + SCREEN_HEIGHT - HUD_HEIGHT);
}
for(iy = floor(view_yview/8); iy <= ceil((view_yview+SCREEN_HEIGHT - HUD_HEIGHT)/8); iy += 1) {
    draw_line(view_xview, iy * 8, view_xview + SCREEN_WIDTH, iy * 8);
}

// Draw stairs
draw_set_alpha(1);
draw_set_color(c_white);
for(ix = floor(view_xview/8); ix <= ceil((view_xview+SCREEN_WIDTH)/8); ix += 1) {
    for(iy = floor(view_yview/8); iy <= ceil((view_yview+SCREEN_HEIGHT - HUD_HEIGHT)/8); iy += 1) {
        if (ds_grid_get(__grid_stairs,ix,iy) != 0) {
            draw_rectangle( ix*8, iy*8, ix*8+7, iy*8+7, true);
        }
    }
}
