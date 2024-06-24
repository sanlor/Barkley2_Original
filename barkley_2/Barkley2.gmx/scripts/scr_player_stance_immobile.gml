/* This is how we could do an 'immobile' 
stance which scripts and events can override */
if (newStance) {
    scr_player_setDrawScript(scr_player_draw_walking_standard)
    newStance = false
}
scr_entity_setMoveXY(0,0);
