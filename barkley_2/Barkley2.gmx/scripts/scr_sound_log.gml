/// scr_sound_log
// Logs a sound played to last 10
//Check to see if sound is in list already, if so, reorder
//show_debug_message("scr_sound_log = " + argument0);
for (var i = 0; i < ds_list_size(global.dslSoundRecent); i += 1)
{
    if (global.dslSoundRecent[| i] == argument0)
    {
        ds_list_delete(global.dslSoundRecent, i);
        ds_list_insert(global.dslSoundRecent, 0, argument0);
        exit;
    }
}
ds_list_insert(global.dslSoundRecent, 0, argument0);
while (ds_list_size(global.dslSoundRecent) > 10)
{
    ds_list_delete(global.dslSoundRecent, 9);
}
