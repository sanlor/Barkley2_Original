if (newStance) 
{
    if (BodySwap() == "prison")
    {
        scr_player_setStance(scr_player_stance_prison);
        exit;
    }
    sprite_index = s_HoopzStagger;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    newStance = false;
}

scr_entity_setMoveXY(0,0);

if (scr_stats_getCurrentStat(self.id, STAT_CURRENT_STAGGER_TIME) <= 0) 
{
    global.stanceBeforeZauber = -1;
    global.stanceBeforeRoll = -1;
    if (scr_player_getGunHolstered()) 
    {
        if (BodySwap() == "diaper") scr_player_setStance(scr_player_stance_diaper);
        else scr_player_setStance(scr_player_stance_standard)
    }
    else scr_player_setStance(scr_player_stance_gunmode)
}

scr_player_setDrawScript(scr_player_draw_stagger)
