/// soundOrNullstring(sound_name)
/// Checks for sound assets, and in sound bank. Returns a sound id, or null.

var name = argument0;

if (ds_map_exists(global.dsmSound, name)) {
    return name; //global.dsmSound[? name];
} else if (scr_soundbank_has(name)) {
    return scr_soundbank_pickSound(name);
} else {
    return NULL_STRING;
}

exit; // OLD BELOW

if (!is_string(name)) {
    return NULL;
} else if (asset_get_type(name) == asset_sound) {
    return asset_get_index(name);
} else if (scr_soundbank_has(name)) {
    return scr_soundbank_pickSound(name);
} else {
    return NULL;
}
