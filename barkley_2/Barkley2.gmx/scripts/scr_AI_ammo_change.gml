/// scr_AI_ammo_change(ammoType, ammoChange)
/// Change ammo count of type by a specific value.

var ammoType = argument0;
var ammoChange = argument1;

var count = scr_AI_ammo_get(ammoType) + ammoChange;
scr_AI_ammo_set(ammoType, count);
