/// scr_AI_ammo_hasOfAnyType()
/// Check if AI has any ammo at all.

if (ds_map_size(AI_ammo) == 0) {
    return false;
}

var key = ds_map_find_first(AI_ammo);
for (var i = 0; i < ds_map_size(AI_ammo); i++) {
    if (AI_ammo[? key] > 0) {
        return true;
    }
    key = ds_map_find_next(AI_ammo, key);
}

return false;
