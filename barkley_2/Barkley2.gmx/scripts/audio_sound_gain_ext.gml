/// audio_sound_gain_ext(string_sound, volume, time)
if (ds_map_exists(global.dsmSound, argument0) == 0)
{
    //show_error(string(audio_exists(argument0)) + " " + string(argument0), false);
    //show_debug_message(object_get_name(object_index) + " > audio_sound_gain = No such sound >" + string(argument0) + "<");
    audio_sound_gain(argument0, argument1 * global.sfx_gain_master, argument2);
}
else
{
    audio_sound_gain(global.dsmSound[? argument0], argument1 * global.dsmSoundVolume[? argument0] * global.sfx_gain_master, argument2);
}
