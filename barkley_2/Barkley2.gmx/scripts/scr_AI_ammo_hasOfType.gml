/// scr_AI_ammo_hasOfType(ammoType)
/// Check if AI has any ammo of this type.

var ammoType = argument0;

if (!ds_map_exists(AI_ammo, ammoType)) {
    return false;
}

return AI_ammo[? ammoType] > 0;
