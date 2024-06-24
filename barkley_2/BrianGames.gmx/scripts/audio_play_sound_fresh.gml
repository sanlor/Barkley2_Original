/// audio_play_sound_fresh(sound_id,priority,loops)
/// Plays the sound as normal, and also stops all other running
/// instances of the sound.

var snd = argument0;
var prio = argument1;
var loop = argument2;
var _ret = noone;
if (audio_is_playing(snd)) {
    audio_stop_sound(snd);
}
_ret = audio_play_sound(snd, prio, loop);
return _ret;
