/// scr_zauber_placeAimDecals(zauber, caster, aim_x, aim_y, aim_z)
// Place aim decals for zauber

var zauber = argument0;
var caster = argument1;
var cast_x = argument2;
var cast_y = argument3;
var cast_z = argument4;

// Place aim decals
script_execute(zauber, "aim_decals", caster, cast_x, cast_y, cast_z);

