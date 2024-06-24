/// scr_AI_ammo_set(ammoType, ammoCount)
/// Set ammo count of type to a specific value.

var ammoType = argument0;
var ammoCount = argument1;

AI_ammo[? ammoType] = ammoCount;
show_debug_message(ammoType + " ammo now set to " + string(AI_ammo[? ammoType]))
