/// scr_draw_mpgrid(mpgrid, inverted)

var mpg = argument0;
var inverted = argument1;

var MPW = 8;

for(var ix = floor(view_xview/8); ix <= ceil((view_xview+SCREEN_WIDTH)/8); ix += 1) {
    for(var iy = floor(view_yview/8); iy <= ceil((view_yview+SCREEN_HEIGHT - HUD_HEIGHT)/8); iy += 1) {
        if (mp_grid_get_cell(argument0, ix, iy) == -1 and !inverted) {
            draw_rectangle( ix*8, iy*8, ix*8+7, iy*8+7, false);
        }
        else if inverted {
            draw_rectangle( ix*8, iy*8, ix*8+7, iy*8+7, false);
        }
    }
}
