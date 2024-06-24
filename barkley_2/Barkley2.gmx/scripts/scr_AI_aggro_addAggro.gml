/// scr_AI_aggro_addAggro(target, value)
/// Adds more aggro towards the target. E.g. when shot.

var target = argument0;
var aggro = argument1;

if (instance_exists(target)) {
    if (!ds_map_exists(I_aggro_map, target)) {
        // New aggro
        I_aggro_map[? target] = aggro
    }
    else {
        // Increased aggro
        aggro += I_aggro_map[? target]
        I_aggro_map[? target] = aggro
    }
}
