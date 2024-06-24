/// scr_soundbank_has(soundbank_name)
/// Checks if sound bank exists

var name = argument0;

return ds_map_exists(global.soundbanks, name);
