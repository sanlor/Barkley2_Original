/// scr_zauber_cast(zauber, zauber_level, caster, aim_x, aim_y, aim_z)
// Cast a zauber

var zauber       = argument0;
var zauber_level = argument1;
var caster       = argument2;
var cast_x       = argument3;
var cast_y       = argument4;
var cast_z       = argument5;

// Cast zauber
var res = script_execute(zauber, "cast", caster, cast_x, cast_y, cast_z);

// Reduce caster stats
if (zauber_level == 1) {
    scr_zauber_reduceStats(caster, 1, 1, 1, 1, 1);
} else if (zauber_level == 2) {
    scr_zauber_reduceStats(caster, 3, 3, 3, 3, 3);
} else if (zauber_level == 3) {
    scr_zauber_reduceStats(caster, 5, 5, 5, 5, 5);
}


return res;
