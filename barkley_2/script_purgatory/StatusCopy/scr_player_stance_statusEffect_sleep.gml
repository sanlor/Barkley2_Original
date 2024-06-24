if (newStance) {
    sprite_index = s_HoopzStagger;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    newStance = false;
}

var statusSleep = scr_statusEffect_getFromCombatActor(self.id, statusEffect_sleep);
var statusStun = scr_statusEffect_getFromCombatActor(self.id, statusEffect_stun);
if (statusSleep == NULL and statusStun == NULL) {
    if (scr_player_getGunHolstered()) {
        scr_player_setStance(scr_player_stance_standard)
    }
    else {
        scr_player_setStance(scr_player_stance_gunmode)
    }
}

scr_player_setDrawScript(scr_player_draw_walking_standard)
