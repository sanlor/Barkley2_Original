/// scr_combat_weapons_step_letsplay(gun)
var userId = argument0;
var gun = argument1;
if !instance_exists(o_suffix_letsplay) then instance_create(x, y, o_suffix_letsplay);
else with o_suffix_letsplay lifespan = 35;

