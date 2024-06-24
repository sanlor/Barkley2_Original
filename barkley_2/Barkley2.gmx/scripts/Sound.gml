/// Sound("play" / "at" / "on", etc...)

// Sound("play", 1 = soundID, 2 = priority, 3 = loops)
if (argument[0] == "play")
{
    if (Sound("check", argument[1], -999, -999) == 0)
    {
        audio_sound_gain_ext(argument[1],1,0);
        return audio_play_sound(argument[1], argument[2], argument[3]);
    }
    else return -1;
}

// Sound("at", 1 = soundID, 2 = x, 3 = y, 4 = z, 5 = fallDist, 6 = fallMax, 7 = fallFactor, 8 = loops, 9 = priority)
if (argument[0] == "at")
{
    if (Sound("check", argument[1], floor(argument[2] / 32) * 32, floor(argument[3] / 32) * 32) == 0)
    {
        audio_sound_gain_ext(argument[1],1,0);
        return audio_play_sound_at(argument[1], argument[2], argument[3], argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
    }
    else return -1;
}

// Sound("on", 1 = emitterID, 2 = soundID, 3 = loops, 4 = priority)
if (argument[0] == "on")
{
    if (Sound("check", argument[2], audio_emitter_get_x(argument[1]), audio_emitter_get_y(argument[1])) == 0)
    {
        audio_sound_gain_ext(argument[1],1,0);
        return audio_play_sound_on(argument[1], argument[2], argument[3], argument[4]);
    }
    else return -1;
}

// Clear sound history
if (argument[0] == "step")
{
    for (var _s = 0; _s < ds_list_size(global.soundPlayed); _s += 1)
    {
        var _v = ds_list_find_value(global.soundHealth, _s);
        _v -= dt_sec();
        if (_v <= 0)
        {
            ds_list_delete(global.soundPlayed, _s);
            ds_list_delete(global.soundHealth, _s);
            _s -= 1;
        }
        else
        {
            ds_list_replace(global.soundHealth, _s, _v);
        }
    }
}

// Check if this sound has been played too recently
// Sound("check", 1 = soundID, 2 = x, 3 = y)
if (argument[0] == "check")
{
    var _st = string(argument[1]) + "=" + string(floor(argument[2])) + "x" + string(floor(argument[3]));
    if (ds_list_find_index(global.soundPlayed, _st) != -1)
    {
        //show_debug_message("Sound('check') - Stopped " + string(_st) + " from playing to prevent sound overlap.");
        return 1;
    }
    else
    {
        //show_debug_message("Sound('check') - Played " + string(_st) + " and added to list.");
        ds_list_add(global.soundPlayed, _st);
        ds_list_add(global.soundHealth, 0.05);
        return 0;
    }
}

if (argument[0] == "init")
{
    global.soundPlayed = ds_list_create();
    global.soundHealth = ds_list_create();
}
