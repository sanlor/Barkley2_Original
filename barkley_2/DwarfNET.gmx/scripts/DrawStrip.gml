/// DrawStrip(sprite, sub, x, y, xscale [opt], yscale [opt], color [opt], alpha [opt])
// You must assign sprites to a NO CROP texture page for this to work right
var xcl = 1;
var ycl = 1;
var col = c_white;
var alp = 1;
if (argument_count > 4) xcl = argument[4];
if (argument_count > 5) ycl = argument[5];
if (argument_count > 6) col = argument[6];
if (argument_count > 7) alp = argument[7];
var wim = ds_map_find_value(global.dsmStripWidth, argument[0]);
var him = ds_map_find_value(global.dsmStripHeight, argument[0]);
var wub = floor(abs(argument[1])) mod wim;
var hub = (floor(abs(argument[1])) div wim) mod him;
var wid = sprite_get_width(argument[0]) / wim;
var hei = sprite_get_height(argument[0]) / him;
var xof = sprite_get_xoffset(argument[0]) * xcl;
var yof = sprite_get_yoffset(argument[0]) * ycl;
draw_sprite_part_ext(argument[0], 0, wub * wid, hub * hei, wid, hei, argument[2] - xof, argument[3] - yof, xcl, ycl, col, alp);
