/// audio_is_playing_ext(string_sound)
if (scr_soundbank_has(argument0)) then return audio_is_playing(scr_soundbank_pickSound(argument0))
else if (ds_map_exists(global.dsmSound, argument0) == 0)
{
    show_debug_message(object_get_name(object_index) + " > audio_is_playing_ext = No such sound >" + string(argument0) + "<");
    return 0;
}
else
{
    return audio_is_playing(global.dsmSound[? argument0]);
}
