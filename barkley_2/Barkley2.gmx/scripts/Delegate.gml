/// Delegate()
if (argument[0] == "sound play") return audio_play_sound_ext(argument[1], 0, 0);
else if (argument[0] == "sound loop") return audio_play_sound_ext(argument[1], 0, 1);
else if (argument[0] == "sound stop") audio_stop_sound_ext(argument[1]);
