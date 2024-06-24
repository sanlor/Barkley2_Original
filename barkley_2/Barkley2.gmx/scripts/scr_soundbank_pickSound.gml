/// scr_soundbank_pickSound(soundbank_name)
/// Picks a random sound from the given soundbank, or NULL

var name = argument0;

if (!ds_map_exists(global.soundbanks, name)) {
    show_debug_message("scr_soundbank_pickSound: Unknown soundbank " + name);
    return NULL_STRING;
}

return ds_list_choose(ds_map_find_value(global.soundbanks, name));
