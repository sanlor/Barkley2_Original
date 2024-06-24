/// scr_items_draw(item, x, y, alpha?)
var alpha = 1;
if (argument_count > 3) alpha = argument[3];
scr_items_draw_ext(argument[0], argument[1], argument[2], 1, 1, 0, c_white, alpha);
