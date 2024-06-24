/// scr_sound_load()
// Loads volume from sound.json
if (file_exists(working_directory + "\sound.json") == 0)
{
    show_debug_message("scr_sound_load(): No sound.json, using default map (all 1 volume).");
}
else
{
    show_debug_message("scr_sound_load(): Loaded sound.json.");
    var fil = file_text_open_read(working_directory + "\sound.json");
    var str = "";
    while (file_text_eof(fil) == 0) { str += file_text_readln(fil); }
    file_text_close(fil);
    var dsmSou = json_decode(str);
    // Because as new sounds are added keys are missing, populate current map
    var siz = ds_map_size(dsmSou) - 1;
    var key = ds_map_find_first(dsmSou);
    for (var i = 0; i < siz; i++;)
    {
        if (ds_map_exists(global.dsmSoundVolume, key))
        {
            global.dsmSoundVolume[? key] = dsmSou[? key];
            audio_sound_gain(global.dsmSound[? key], dsmSou[? key], 0);
        }
        else
        {
            // Key is not present, meaning sound does not exist. Do not include.
        }
        key = ds_map_find_next(dsmSou, key);
    }
    ds_map_destroy(dsmSou);
}
