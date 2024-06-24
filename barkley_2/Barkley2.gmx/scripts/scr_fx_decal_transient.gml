/// scr_fx_decal_transient(sprite_index, image_index, x, y, z, xscale, yscale, angle, blend, alpha)
var dx = argument2;
var dy = argument3;
var dz = argument4;
var d = instance_create(dx, dy, o_effect_decal_transient);
d.z = dz;
d.sprite_index = argument0;
d.image_index = argument1;
d.image_xscale = argument5;
d.image_yscale = argument6;
d.image_angle = argument7;
d.image_blend = argument8;
d.image_alpha = argument9;
return d;
