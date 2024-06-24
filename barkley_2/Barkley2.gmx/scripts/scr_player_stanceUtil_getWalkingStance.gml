if (scr_player_getGunHolstered()) {
    return scr_player_stance_standard;
}
else {
    return scr_player_stance_gunmode;
}
