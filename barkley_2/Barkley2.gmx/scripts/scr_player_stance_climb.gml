if (newStance) {
    climbFrame = 0.99;
    climbSpeed = global.ladderSpeed;
    shadow_visible = false;
    sprite_index = s_HoopzClimb;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
    scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 0);
    scr_entity_animation_setSpeedPerPixel(ANIMATION_DEFAULT, 0);
    newStance = false;
}

var life, dead;
dead = 0;
life = scr_stats_getCurrentStat(self, STAT_CURRENT_HP);
if (life < 0 and stance != scr_player_stance_death) {
    if(global.godMode)
    {
        
    }
    else
    {
        dead = 1;
    }
}
if (dead == 1)
{
    if (place_meeting(x, y, o_map_ladder) == 1)
    {
        sprite_index = s_HoopzStagger;
        facing = 2;
        scr_entity_animation_setFrame(ANIMATION_DEFAULT, facing);
        scr_player_setDrawScript(scr_player_draw_stagger);
        y += dt() * 10;
    }
    else
    {
        // Death script
        lock_stance = false;
        scr_player_setStance(scr_player_stance_death);
    }
    exit;
}

var ku = scr_input_check_held(KEYID_UP, PLAYER1);
var kd = scr_input_check_held(KEYID_DOWN, PLAYER1);
var ky = ku - kd; // Y axis input, swapped to fix animation error
if (ky == 0)
{
    climbFrame = 0.99;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
}
else //Moving
{
    climbFrame += (climbSpeed * ky) * dt() / global.ladderAnimSpeed; //10;
    if (climbFrame < 0) climbFrame += 8;
    if (climbFrame >= 8) climbFrame -= 8;
    scr_entity_animation_setFrame(ANIMATION_DEFAULT, climbFrame);
}

// Move
move_x = 0;
if (scr_input_check_held(KEYID_UP, PLAYER1) && !scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = -1; }
else if (!scr_input_check_held(KEYID_UP, PLAYER1) && scr_input_check_held(KEYID_DOWN, PLAYER1)) { move_y = 1; }
else { move_y = 0; }

// Determine movement speed!
if !scr_path_active() {
    scr_math_normalizeVector(move_x, move_y);
    scr_entity_setMoveXY(__vx * climbSpeed, __vy * climbSpeed); // was spd
}

if (place_meeting(x, y, o_map_ladder) == 0)
{
    lock_stance = 0; //what about death? check ladder object
    shadow_visible = true;
    scr_player_setStance(scr_player_stance_standard);
}

scr_player_setDrawScript(scr_player_draw_climb);
