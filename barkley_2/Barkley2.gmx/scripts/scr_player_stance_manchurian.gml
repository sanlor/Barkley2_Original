if (newStance) {
    climbSpeed = 6;
    climbFrame = 0;
    sprite_index = s_HoopzWalkSE;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    //scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    newStance = false;
}

var key = 0;
key += scr_input_check_held(KEYID_UP, PLAYER1);
key += scr_input_check_held(KEYID_DOWN, PLAYER1);
key += scr_input_check_held(KEYID_LEFT, PLAYER1);
key += scr_input_check_held(KEYID_RIGHT, PLAYER1);

if (key && manchurianProgress != 1)
{
    //Move
    climbFrame += climbSpeed * dt_sec(); //10;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
    // Move
    var crx = o_hoopz.x;
    var cry = o_hoopz.y;
    var dis = 50 * dt_sec();
    var jjj = 0;
    while (point_distance(crx, cry, o_hoopz.x, o_hoopz.y) < dis)
    {
        manchurianProgress += 0.0005;
        manchurianProgress = clamp(manchurianProgress, 0, 1);
        o_hoopz.x = path_get_x(manchurianPath, manchurianProgress);
        o_hoopz.y = path_get_y(manchurianPath, manchurianProgress);
        jjj += 1;
        if (jjj >= 100) { manchurianProgress = 1; exit; }
    }
    move_dist = point_distance(crx, cry, o_hoopz.x, o_hoopz.y);
    shuffle = 1;
    facing = floor(point_direction(crx, cry, o_hoopz.x, o_hoopz.y) / 45) mod 8;
}
else
{
    climbFrame = 0;
    move_dist = 0;
    shuffle = 0;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, 0);
}

//if (manchurianProgress == 1)
scr_player_interact();

scr_player_setDrawScript(scr_player_draw_walking_standard);
