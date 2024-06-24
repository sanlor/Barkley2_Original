/// DrawStripExt(sprite, sub, x, y, xscale, yscale, rotation, color, alpha)
// You must assign sprites to a NO CROP texture page for this to work right
var xcl = argument4;
var ycl = argument5;
var rot = argument6;
var col = argument7;
var alp = argument8;
var wim = ds_map_find_value(global.dsmStripWidth, argument0);
var him = ds_map_find_value(global.dsmStripHeight, argument0);
var wub = floor(abs(argument1)) mod wim;
var hub = (floor(abs(argument1)) div wim) mod him;
var wid = sprite_get_width(argument0) / wim;
var hei = sprite_get_height(argument0) / him;
var xof = sprite_get_xoffset(argument0) * xcl;
var yof = sprite_get_yoffset(argument0) * ycl;
var xdr = argument2 + lengthdir_x(xof, 180 + rot) + lengthdir_x(yof, 90 + rot);
var ydr = argument3 + lengthdir_y(xof, 180 + rot) + lengthdir_y(yof, 90 + rot);
draw_sprite_general(argument0, 0, wub * wid, hub * hei, wid, hei, xdr, ydr, xcl, ycl, rot, col, col, col, col, alp);
