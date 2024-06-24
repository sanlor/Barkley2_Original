/// audio_play_sound_at_ext(string_sound, x, y, z, falloff_ref, falloff_max, falloff_factor, loop, priority);
if (ds_map_exists(global.dsmSound, argument0) == 0)
{
    show_debug_message(object_get_name(object_index) + " > audio_play_sound_at_ext = No such sound >" + string(argument0) + "<");
    return -1;
}
else
{
    scr_sound_log(argument0);
    //show_debug_message("audio_play_sound_at_ext = " + argument0);
    return Sound("at", global.dsmSound[? argument0], argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
}
