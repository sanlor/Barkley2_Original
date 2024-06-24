/// UtilityGrid(x_cell, y_cell, width_x8, height_x8)
// Draw a grid
var drx = 15 + (argument[0] * 8);
var dry = 16 + (argument[1] * 8);
var wid = argument[2] * 8;
var hei = argument[3] * 8;
var cl0 = make_color_rgb(4, 78, 11);
var cl1 = make_color_rgb(6, 56, 10);
cl0 = make_color_rgb(5, 47, 13);
cl1 = make_color_rgb(7, 21, 12);
cl0 = merge_color(cl0, c_lime, 0.1);
cl1 = merge_color(cl1, c_lime, 0.1);
if (argument_count > 4) { if (argument[4] != -999) cl0 = argument[4]; }
if (argument_count > 5) { if (argument[5] != -999) cl1 = argument[5]; }
if (argument_count > 4)
{
    if (argument[4] != -1) draw_sprite_ext(s1x1, 0, drx, dry, wid + 1, hei + 1, 0, cl0, 1);
}
else draw_sprite_ext(s1x1, 0, drx, dry, wid + 1, hei + 1, 0, cl0, 1);
if (argument_count > 5)
{
    if (argument[5] != -1) draw_sprite_ext(s1x1, 0, drx + 1, dry + 1, wid - 1, hei - 1, 0, cl1, 1);
}
else draw_sprite_ext(s1x1, 0, drx + 1, dry + 1, wid - 1, hei - 1, 0, cl1, 1);
