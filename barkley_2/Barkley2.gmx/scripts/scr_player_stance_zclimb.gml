if (newStance) {
    climbFrame = 0;
    climbFrameStep = 0;
    z_at = z;
    sprite_index = s_HoopzClimb;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    newStance = false;
    audio_play_sound_on_actor(id, "ladder_metal", 0, 0);
}

x = (z_ladder.bbox_left + z_ladder.bbox_right) / 2;
y = ((z_ladder.bbox_top + z_ladder.bbox_bottom) / 2) + 16;
scr_entity_setMoveXY(0, 0);

if (scr_input_check_held(KEYID_UP,   PLAYER1)) {
    climbFrameStep += 1.4 * dt();
}
if (scr_input_check_held(KEYID_DOWN, PLAYER1)) {
    climbFrameStep -= 1.4 * dt();
}

// Nice, frame-by-frame movement
while (climbFrameStep >= 1) {
    climbFrameStep -= 1;
    climbFrame += 1;
    if (climbFrame >= 8) climbFrame = 0;
    if (climbFrame mod 4 != 3) {
        z_at += 3;
    } else {
        audio_play_sound_on_actor(id, "ladder_metal", 0, 0);
    }
}
while (climbFrameStep < 0) {
    climbFrameStep += 1;
    climbFrame -= 1;
    if (climbFrame < 0) climbFrame = 7;
    if (climbFrame mod 4 != 3) {
        z_at -= 3;
    } else {
        audio_play_sound_on_actor(id, "ladder_metal", 0, 0);
    }
}
scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);

move_z = 0;
if (z_at >= z_ladder.z_climb_top) {
    x = z_ladder.x + 16;
    y = z_ladder.y + 4;
    z = z_ladder.z_climb_top;
    scr_player_setStance(scr_player_stanceUtil_getWalkingStance());
} else if (z_at <= z_ladder.z_climb_bottom) {
    x = z_ladder.x + 16;
    y = z_ladder.y + 16;
    z = z_ladder.z_climb_bottom;
    scr_player_setStance(scr_player_stanceUtil_getWalkingStance());
} else {
    z = z_at;
}

scr_player_setDrawScript(scr_player_draw_climb);
