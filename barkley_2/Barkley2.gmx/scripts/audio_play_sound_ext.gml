/// audio_play_sound_ext(string_sound, priority, loops)
// Plays an external sound

var soundid = argument0;
var prio = argument1;
var loops = argument2;

if (ds_map_exists(global.dsmSound, soundid)) 
{
    //show_debug_message(object_get_name(object_index) + " > audio_play_sound_ext = global.dsmSound >" + string(soundid) + "<");
    soundid = global.dsmSound[? soundid];
}
else if (scr_soundbank_has(soundid)) 
{ 
    //show_debug_message(object_get_name(object_index) + " > audio_play_sound_ext = soundbank >" + string(soundid) + "<");
    soundid = scr_soundbank_pickSound(soundid); 
}
else
{
    show_debug_message(object_get_name(object_index) + " > audio_play_sound_ext = No such sound >" + string(soundid) + "<");
    return -1;
}

scr_sound_log(soundid);
return Sound("play", soundid, prio, loops);
