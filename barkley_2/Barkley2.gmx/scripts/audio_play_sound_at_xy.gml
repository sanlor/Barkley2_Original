/// audio_play_sound_at_xy(soundbank_or_sound_id,loops,priority,x,y)
/// Plays a sound on the given actor.

var soundid = argument0;
var loops = argument1;
var prio = argument2;
var _x = argument3;
var _y = argument4;

if (ds_map_exists(global.dsmSound, soundid)) 
{
    //show_debug_message(object_get_name(object_index) + " > audio_play_sound_ext = global.dsmSound >" + string(soundid) + "<");
    soundid = soundid; //global.dsmSound[? soundid];
}
else if (scr_soundbank_has(soundid)) 
{ 
    //show_debug_message(object_get_name(object_index) + " > audio_play_sound_ext = soundbank >" + string(soundid) + "<");
    soundid = scr_soundbank_pickSound(soundid); 
}
else 
{ 
    show_debug_message(object_get_name(object_index) + " > audio_play_sound_at_xy: No such sound = " + string(soundid)); 
    return -1; // was return noone
}

return audio_play_sound_at_ext(soundid, _x, _y, 0,
                                    AUDIO_FALLOFF_REF,
                                    AUDIO_FALLOFF_MAX,
                                    AUDIO_FALLOFF_FACTOR,
                                    loops, prio);   
                                    
//if (is_string(soundid)) soundid = scr_soundbank_pickSound(soundid);
//if (soundid <= NULL) return noone;
                                     
