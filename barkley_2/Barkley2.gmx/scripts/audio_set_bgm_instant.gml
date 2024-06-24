/// audio_set_bgm_instant(bgm)
/// Sets the background music to the specified piece, without the fading effect.
//show_debug_message(object_get_name(object_index) + " > audio_bgm_instant");
global.bgm_fast_fade = false;
global.bgm_current_music = argument0;
global.bgm_next_music = NULL_STRING;
audio_stop_sound(global.bgm_current_soundid);
if (global.bgm_current_music != NULL_STRING) {
    global.bgm_current_soundid = audio_play_sound_on_ext(global.bgm_emitter, global.bgm_current_music, true, 100);
    global.bgm_gain_current = 1;
} else {
    global.bgm_current_soundid = NULL;
    show_debug_message("audio_bgm_instant: Null - room: " + string(room));
}
