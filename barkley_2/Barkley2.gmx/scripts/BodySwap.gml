//BodySwap("hoopz" / "matthias" / "governor" / "diaper" / "prison" / "refresh" / "init")
//Hoopz is the default body swap and will revert to him if this function has invalid args
if (argument_count == 0)
{
    return scr_savedata_get("player.body");
}
else
{
    if (argument[0] == "init")
    {
        scr_savedata_put("player.body", "hoopz");
    }
    else if (argument[0] == "refresh") // Called once every room load from scr_player_reset
    {
        if (scr_savedata_get("player.body") == "governor") { with (o_hoopz) scr_player_setStance(scr_player_stance_governor); }
        else if (scr_savedata_get("player.body") == "matthias") { with (o_hoopz) scr_player_setStance(scr_player_stance_matthias); }
        else if (scr_savedata_get("player.body") == "untamo") { with (o_hoopz) scr_player_setStance(scr_player_stance_untamo); }
        else if (scr_savedata_get("player.body") == "diaper") { with (o_hoopz) scr_player_setStance(scr_player_stance_diaper); }
        else if (scr_savedata_get("player.body") == "prison") { with (o_hoopz) scr_player_setStance(scr_player_stance_prison); }
        else { with (o_hoopz) scr_player_setStance(scr_player_stance_standard); }
    }
    else
    {
        scr_savedata_put("player.body", argument[0]);
        if (argument_count == 1) BodySwap("refresh");
    }
}
