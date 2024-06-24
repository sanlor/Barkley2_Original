/// Delegate()
if (argument[0] == "sound play")
{
    audio_play_sound(asset_get_index(argument[1]), 0, 0);
    return 1;
}
else if (argument[0] == "sound loop")
{
    audio_play_sound(asset_get_index(argument[1]), 0, 1);
    return 1;
}
else if (argument[0] == "sound stop")
{
    audio_stop_sound(asset_get_index(argument[1]));
    return 1;
}
