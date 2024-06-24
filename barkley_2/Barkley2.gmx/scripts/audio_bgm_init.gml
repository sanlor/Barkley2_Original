// Wipe all sounds
audio_stop_all();

// Create the music emitter
global.bgm_emitter = audio_emitter_create();
audio_emitter_falloff(global.bgm_emitter, 10000, 1000000, 1); //Fix for Ticket #1365

// Define gain variables
global.bgm_gain_master = 1.0;
global.bgm_gain_atmospheric = 1.0;
global.bgm_gain_current = 1.0;

// Define current and next music variables
global.bgm_current_music = NULL_STRING;
global.bgm_next_music = NULL_STRING;
global.bgm_current_soundid = NULL;
global.bgm_disabled = false;

// Other //
global.bgm_gain_current = false;
