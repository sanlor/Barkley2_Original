/// audio_bgm_reset()
show_debug_message("audio_bgm_reset()");

// Stop current sounds
audio_stop_sound(global.bgm_current_soundid);
global.bgm_current_soundid = NULL;

// Reset emitter
if (audio_emitter_exists(global.bgm_emitter)) {
    audio_emitter_free(global.bgm_emitter);
}
global.bgm_emitter = audio_emitter_create();

// Reset variables
global.bgm_next_music = NULL_STRING;
global.bgm_current_music = NULL_STRING;
global.bgm_disabled = false;
global.bgm_gain_current = 1.0;
