/// scr_player_interact()
if (global.battleMode) exit;
// 4 stance scripts use this, centralizing so we reduce code and errors
var iact = noone;
//GZ NOTE: If you are between Min and Max, it will do scr_collision_line to see if there is anything in the way
var hoopz_x = x;
var hoopz_y = y;
var distanceToActorMin = 32; //If you are under this distance, talking will always happen (ie. wall switch)
//var distanceToActorMax = 75; //Max distance you can be from an actor to activate
// ^^^ Above now defined in scr_event_interactive_init under _interactive_distance, per instance
// CONTROLLER
var least_dirdiff = 60;
var hoopz_lookdir = look_dir;

// Find eligible actors on HOVER / controller look range
if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) 
{
    with (InteractiveActor)
    {
        if (point_distance(hoopz_x, hoopz_y, other.cursor_x, other.cursor_y - global.cursorShift) <= _interactive_distance) 
        {
            if (_active)
            {
                var left = x - abs(sprite_xoffset);
                var top = y - abs(sprite_yoffset);
                var right = left + abs(sprite_width_edit);
                var bottom = top + abs(sprite_height_edit);
                if (other.cursor_x > left and
                        other.cursor_x < right and
                        other.cursor_y - global.cursorShift > top and
                        other.cursor_y - global.cursorShift < bottom) {
                    iact = id;
                }
            }
        }
    }
    // Special mouse image for hovering over an InteractiveActor
    if (instance_exists(iact)) o_curs.image_index = 2;
}
else // Controller
{
    var crt = global.settingInteractiveDistanceGamepad / global.settingInteractiveDistance;
    with (InteractiveActor) 
    {
        if (point_distance(x, y, hoopz_x, hoopz_y) <= _interactive_distance * crt) 
        {
            var dir = point_direction(hoopz_x, hoopz_y, x, y);
            var dirdiff = abs(scr_math_rdif(dir, hoopz_lookdir));
            if (dirdiff < least_dirdiff) 
            {
                least_dirdiff = dirdiff;
                iact = id;
            }
        }
    }
}

//GZ ADDED: Code checks for collision check when the distance exceeds distanceToActorMin
//To prevent talking through walls
if (instance_exists(iact))
{
    //show_debug_message("scr_player_stance_standard(): trying to engage actor");
    if (point_distance(x, y, iact.x, iact.y) > distanceToActorMin)
    {
        //GZ NOTE: I check the solid grid only, seems to work, if this is wrong maybe semi solid is the one?
        if (scr_collision_line(x, y, iact.x, iact.y, z, COLLISION_ONLY_SOLID)) iact = noone;
    }
}

// Execute interactive actor if it's eligible, clicked, and no event running
if (instance_exists(iact) && global.event == false) 
{
    iact._selectedOutline = true;
    if (scr_input_check_pressed(KEYID_ACTION, PLAYER1) and global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) or (scr_input_check_pressed(KEYID_DIALOGUE, PLAYER1) and global.keyinput_type == KEYINPUT_GAMEPAD) {
        if (iact.hook_onInteract_script != -1 and iact._active) {
            with (iact) {
                if (_interactive) {
                    global.eventInteract = true;
                    global.eventObject = id;
                    global.eventFrame = 1;
                    script_execute(hook_onInteract_script, SCRIPT_INTERACT);
                    with (other) scr_entity_setMoveXY(0, 0);
                    global.eventInteract = false;
                    global.eventFrame = 0;
                }
            }
        }
    }
}
