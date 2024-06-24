#define audio_stop_sound_ext
/// audio_stop_sound_ext(string_sound)
// Stops an external sound or all sounds in a soundbank

var soundString = argument0;

if (scr_soundbank_has(soundString))
{
    // Stop all sounds in soundbank
    var soundbank = scr_soundbank_getSounds(soundString);
    for (var i = 0; i < ds_list_size(soundbank); i++) {
        __stop_sound_ext(soundbank[| i]);
    }
}
else
{
    // Stop this sound only
    __stop_sound_ext(soundString);
}

#define __stop_sound_ext
/// __stop_sound_ext(sound)
// Stops an external sound

var sound = argument0;

if (ds_map_exists(global.dsmSound, sound))
{
    audio_stop_sound(global.dsmSound[? sound]);
}