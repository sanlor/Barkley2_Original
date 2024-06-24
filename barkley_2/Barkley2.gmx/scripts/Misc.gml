/// Misc()
// Contains miscellaneous commands
if (argument[0] == "shadow")
{
    with (asset_get_index(argument[1])) shadow_visible = real(argument[2]);
}
else if (argument[0] == "visible") 
{
    with (asset_get_index(argument[1])) visible = real(argument[2]);
}
else if (argument[0] == "set") // 1 = object | 2 = object / x | 3 = y
{
    if (argument_count == 4) scr_event_set_object(asset_get_index(argument[1]), real(argument[2]), real(argument[3]));
    else
    {
        var desObj = asset_get_index(argument[2]);
        scr_event_set_object(asset_get_index(argument[1]), desObj.x, desObj.y);
    }
}
else if (argument[0] == "entity settings")
{
    scr_event_entity_settings(asset_get_index(argument[1]), real(argument[2]), 
    real(argument[3]), real(argument[4]));
}
else if (argument[0] == "music")
{
    audio_set_bgm(argument[1]);
    audio_sound_gain(argument[1], real(argument[2]) * global.bgm_gain_master, 0);
}
else if (argument[0] == "automatic animation")
{
    with (asset_get_index(argument[1])) _automatic_animation = real(argument[2]);
}
else if (argument[0] == "flip")
{
    with (asset_get_index(argument[1])) image_xscale = real(argument[2]);
}
else if (argument[0] == "flipx") // Special case for walking interactive actors
{
    with (asset_get_index(argument[1])) xFlip = real(argument[2]);
}
else if (argument[0] == "alpha") // 1 = object | 2 = alpha | 3 = time
{
    var _obj = instance_create(0, 0, o_object_alpha);
    with (_obj) 
    {
        if (is_string(argument[1])) obj = asset_get_index(argument[1]);
        else obj = real(argument[1]);
        alp = real(argument[2]);
        tim = real(argument[3]);
        event_user(0);
    }
}
else if (argument[0] == "backwards")
{
    var _obj = asset_get_index(argument[1]);
    _obj.walkBackwards = real(argument[2]);
}
else if (argument[0] == "dialogY")
{
    global.dialogY = real(argument[1]);
}
else if (argument[0] == "dnaCyber")
{
    var amt = real(argument[1]);
    scr_savedata_put("player.humanism.bio", scr_savedata_get("player.humanism.bio") - amt);
    scr_savedata_put("player.humanism.cyber", scr_savedata_get("player.humanism.cyber") + amt);
}
else if (argument[0] == "manchurian")
{
    with (o_hoopz)
    {
        scr_player_setStance(scr_player_stance_manchurian);
        manchurianPath = asset_get_index(argument[1]);
        manchurianProgress = 0;
        x = path_get_x(manchurianPath, manchurianProgress);
        y = path_get_y(manchurianPath, manchurianProgress);
    }
    o_cts_hoopz.x = o_hoopz.x;
    o_cts_hoopz.y = o_hoopz.y;
}
else
{
    show_debug_message("Misc() - GOOFED! Unknown command >" + string(argument[0]) + "<");
}
