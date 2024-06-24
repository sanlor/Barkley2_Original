/// audio_play_sound_AI(sound_or_soundbank)
/// Plays the sound on the actor that called this script.
/// Will pick a sound from a soundbank, or play a specific sound, based on the passed in argument.

if(is_string(argument0))
{
    return audio_play_sound_on_actor(id,scr_soundbank_pickSound(argument0),false,90);
}
else if(argument0 != NULL)
{
    return audio_play_sound_on_actor(id,argument0,false,90);
}
