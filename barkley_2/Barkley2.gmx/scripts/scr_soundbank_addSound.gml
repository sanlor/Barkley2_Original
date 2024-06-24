/// scr_soundbank_addSound(soundbank_name,sound)
/// Adds a sound to a sound bank, creating it if it doesn't exist.

var name = argument0;
var snd = argument1;

if (!ds_map_exists(global.soundbanks, name)) {
    var list = ds_list_create();
    ds_map_add(global.soundbanks, name, list);
}

var list = ds_map_find_value(global.soundbanks, name);
ds_list_add(list, snd);

// EXTERNAL SOUND: Make sure to set the sound as no longer an orphan
ds_map_replace(global.dsmSoundOrphan, snd, 0);
