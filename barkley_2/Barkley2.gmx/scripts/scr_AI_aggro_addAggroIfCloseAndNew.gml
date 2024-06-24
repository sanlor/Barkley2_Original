/// scr_AI_aggro_addAggro(target, source, value)
/// Adds more aggro towards the target. E.g. when shot.

var target = argument0;
var source = argument1;
var aggro = argument2;

if (instance_exists(target)) {
    with source {
        var dist = point_distance(x, y, target.x, target.y);
        if (dist <= I_aggro_range_increase) {
            if (!ds_map_exists(I_aggro_map, target)) {
                I_aggro_map[? target] = aggro
            }
        }
    }
}
