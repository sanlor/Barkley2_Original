/// scr_sound_save()
// Saves sound.json file from global.dsmSoundVolume
var fil = file_text_open_write(working_directory + "\sound.json");
file_text_write_string(fil, json_encode(global.dsmSoundVolume));
file_text_close(fil);
show_debug_message("scr_sound_save(): Saved sound.json.");
