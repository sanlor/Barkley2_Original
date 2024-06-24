/// scr_soundbank_getSounds(soundbank_name)
// Returns the list of all sounds in soundbank, or NULL

var name = argument0;

if (!ds_map_exists(global.soundbanks, name)) {
    show_debug_message("scr_soundbank_pickSound: Unknown soundbank " + name);
    return NULL;
}

return ds_map_find_value(global.soundbanks, name);
