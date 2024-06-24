/// audio_play_sound_on_actor(actor_id,soundbank_or_sound_id,loops,priority)
/// Plays a sound on the given actor.

var actor = argument0;
var soundid = argument1;
var loops = argument2;
var prio = argument3;
var _ret = noone;

if (ds_map_exists(global.dsmSound, soundid)) soundid = soundid; //global.dsmSound[? soundid];
else if (scr_soundbank_has(soundid)) { soundid = scr_soundbank_pickSound(soundid); }
else { show_debug_message(object_get_name(object_index) + " > audio_play_sound_on_actor: No such sound = " + string(soundid)); return noone; }

//if (soundid == NULL) return noone; // OLD

var emitter = NULL;
if (instance_exists(actor)) {
    emitter = actor.sound_emitter;
} else {
    show_debug_message("audio_play_sound_on_actor: Attempted to play sound but no actor");
    return noone;
}


if (emitter != NULL) {
    _ret = audio_play_sound_on_ext(emitter, soundid, loops, prio);   
}
else {
    show_debug_message("audio_play_sound_on_actor: Attempted to play sound but no sound emitter for object " + string(actor));
}

return _ret;
