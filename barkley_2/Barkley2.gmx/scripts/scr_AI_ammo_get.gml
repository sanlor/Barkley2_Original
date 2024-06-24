/// scr_AI_ammo_get(ammoType)
/// Returns current ammo of type, or 0

var ammoType = argument0;

if (!ds_map_exists(AI_ammo, ammoType)) {
    return 0;
}

return AI_ammo[? ammoType];
