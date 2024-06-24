/// scr_shift_hsv(h,s,v)
/// Shift the draw color to the specified hue, saturation, and colour.

var c;
c = draw_get_color();

draw_set_color(make_color_hsv(color_get_hue(c)+argument0,color_get_saturation(c)+argument1,color_get_value(c)+argument2));
