// Check if emitter exists
//show_debug_message("audio_bgm_step() - " + string(global.bgm_emitter));
if (!audio_emitter_exists(global.bgm_emitter)) {
    audio_bgm_reset();
}

// Check if need to change song
if (global.bgm_next_music != NULL_STRING) {
   if (global.bgm_next_music == global.bgm_current_music) {
       // If same as current song, wipe next song
       global.bgm_next_music = NULL_STRING;
   }
   else if (global.bgm_current_music == NULL_STRING or global.bgm_current_soundid == NULL) {
       // Play new song
       global.bgm_current_soundid = audio_play_sound_on_ext(global.bgm_emitter, global.bgm_next_music, true, 100);
       global.bgm_current_music = global.bgm_next_music;
       global.bgm_next_music = NULL_STRING;
       global.bgm_gain_current = 1;
   }
   else {
       // If not, fade out then switch song
       if (global.bgm_gain_current > 0) {
           if global.bgm_fast_fade = false then global.bgm_gain_current = max(0, global.bgm_gain_current - (dt() * 0.07));
           else global.bgm_gain_current = max(0, global.bgm_gain_current - (dt() * 0.5)); 
       }
       else {
           // Stop current music
           audio_stop_sound(global.bgm_current_soundid);
           //show_debug_message("audio_bgm_step - stop sound 28");
           
           // Play new song
           global.bgm_current_soundid = audio_play_sound_on_ext(global.bgm_emitter, global.bgm_next_music, true, 100);
           global.bgm_current_music = global.bgm_next_music;
           global.bgm_next_music = NULL_STRING;
           global.bgm_gain_current = 1;
       }
   }
}
else {
    // Resume gain levels
    if global.bgm_fast_fade = false then global.bgm_gain_current = min(1, global.bgm_gain_current + (dt() * 0.1));
    else global.bgm_gain_current = min(1, global.bgm_gain_current + (dt() * 0.5)); 
}

// Resume atmospheric gain
global.bgm_gain_atmospheric = min(1, global.bgm_gain_atmospheric + (dt() * 0.05));

// Adjust emitter gain
audio_emitter_gain(global.bgm_emitter, global.bgm_gain_master * global.bgm_gain_atmospheric * global.bgm_gain_current * global.bgm_interior_effect);
