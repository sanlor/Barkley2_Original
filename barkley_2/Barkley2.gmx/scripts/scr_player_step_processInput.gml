/// scr_player_step_processInput()
input_active = !global.event;
if (oBlack.alpha != 0) input_active = 0;
if (!input_active) scr_input_disableFor(id);
else scr_input_enableFor(id);

// Read look direction
if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) 
{
    // Get cursor position
    cursor_x = o_curs.x + view_xview;
    cursor_y = o_curs.y + view_yview + z + global.cursorShift;
    cursor_dir = scr_math_mod(point_direction(x, y, cursor_x, cursor_y), 360);
    
    // Don't update the look directions if you are in an event.
    if (!global.event) 
    {
        look_x = cursor_x - x;
        look_y = cursor_y - y;
        var trnSpd = (global.settingTurnSpeedBase + (scr_stats_getEffectiveStat(self, STAT_BASE_AGILE) * global.settingTurnSpeedBonus)) * dt_sec();
        if (stance == scr_player_stance_gunmode) cursor_dir = look_dir + (clamp(angle_difference(cursor_dir, look_dir), -trnSpd, +trnSpd));
        look_dir = cursor_dir;
        look_dist = point_distance(x,y,cursor_x,cursor_y);
    }
}
else 
{
    var lx = 0;
    var ly = 0;
    var LOOK_SENSITIVITY = 0.10; // was 0.15
    
    if (scr_input_check_value(KEYID_LOOK_LEFT, PLAYER1) > 0) 
        lx -= scr_input_check_value(KEYID_LOOK_LEFT, PLAYER1);
    if (scr_input_check_value(KEYID_LOOK_RIGHT, PLAYER1) > 0) 
        lx += scr_input_check_value(KEYID_LOOK_RIGHT, PLAYER1);
    if (scr_input_check_value(KEYID_LOOK_UP, PLAYER1) > 0) 
        ly -= scr_input_check_value(KEYID_LOOK_UP, PLAYER1);
    if (scr_input_check_value(KEYID_LOOK_DOWN, PLAYER1) > 0) 
        ly += scr_input_check_value(KEYID_LOOK_DOWN, PLAYER1);
    
    var plx, ply, pld;
    pld = look_dir;
    if (point_distance(0, 0, lx, ly) > LOOK_SENSITIVITY) // Player is aiming with right stick
    {
        pld = point_direction(0, 0, lx, ly); // look_dir
        look_dist = (point_distance(0, 0, lx, ly) - LOOK_SENSITIVITY) * 100; // CZ - Added sensitivity minus
        plx =  cos(degtorad(pld)) * look_dist; // look_dir
        ply = -sin(degtorad(pld)) * look_dist; // look_dir
    }
    else // Player is not currently aiming, keep same look dir
    {
        look_dist = 1;
        plx =  cos(degtorad(look_dir)) * look_dist;
        ply = -sin(degtorad(look_dir)) * look_dist;
    }
    // Smooth?
    var trnSpd = (global.settingTurnSpeedBase + (scr_stats_getEffectiveStat(self, STAT_BASE_AGILE) * global.settingTurnSpeedBonus)) * dt_sec();
    if (stance == scr_player_stance_gunmode) look_dir = look_dir + (clamp(angle_difference(pld, look_dir), -trnSpd, +trnSpd));
    // For smoothness, only move if over...
    if (point_distance(plx, ply, look_x, look_y) > 1.5)
    {
        look_x = plx;
        look_y = ply;
    }
}
