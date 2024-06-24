/// audio_play_sound_on_ext(emitter, string_sound, loops, priority)
if (ds_map_exists(global.dsmSound, argument1) == 0)
{
    show_debug_message(object_get_name(object_index) + " > audio_play_sound_on_ext = No such sound >" + string(argument1) + "<");
    return -1;
}
else
{
    scr_sound_log(argument1);
    //show_debug_message("audio_play_sound_on_ext = " + argument1);
    return Sound("on", argument0, global.dsmSound[? argument1], argument2, argument3);
}
