/// scr_fx_decal_transient_script(x, y, z, draw_script)

var dx = argument0;
var dy = argument1;
var dz = argument2;
var script = argument3;

var d = instance_create(dx, dy, o_effect_decal_transient_script);
d.z = dz;
d.draw_script = script;

return d;

