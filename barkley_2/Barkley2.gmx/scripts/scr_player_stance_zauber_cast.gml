/// scr_player_stance_zauber_cast()
if (newStance) 
{
    zauber_charge = 0;
    zauber_casted = 0;
    zauber_dir = look_dir;
    //scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    //scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    //scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    newStance = false;
    wadesound = 0;
}

// Can't move
scr_entity_setMoveXY(0, 0);

scr_player_setDrawScript(scr_player_draw_zauber_cast);

// Basic cast
zauber_charge += dt_sec() / global.zauberCastTime; //script_execute(zauber, "cast time", NULL, NULL, NULL, NULL);
if (zauber_charge >= 0.666 && zauber_casted == 0)
{
    zauber_casted = 1;
    Zauber("cast", zauber_casting, id, x + look_x, y + look_y, z);
}
if (zauber_charge >= 1)
{
    if (global.stanceBeforeZauber != -1)
    {
        scr_player_setStance(global.stanceBeforeZauber);
        global.stanceBeforeZauber = -1;
    }
    else
    {
        scr_player_setStance(scr_player_stance_gunmode);
    }
}
