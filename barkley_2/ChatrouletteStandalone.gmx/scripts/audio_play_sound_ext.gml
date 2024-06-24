/// audio_play_sound_ext(string_sound, priority, loops)
/// scr_event_fade(fade [1 is in; 0 is out], seconds)
var str = "";
for (var i = 0; i < argument_count; i += 1)
{
    str += string(argument[i]) + " > ";
}
show_debug_message("audio_play_sound_ext() - " + str);
