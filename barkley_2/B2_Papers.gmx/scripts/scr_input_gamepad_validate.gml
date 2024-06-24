///scr_input_gamepad_validate(real slot)
var slot;

slot = argument[0];

if(global.keyinput_gp_player[0] == NULL || global.keyinput_gp_player[0] == global.keyinput_gp_player[1])
{
    if(global.keyinput_gp_player[1] != slot)
    {
        show_debug_message("Validated input on gamepad slot " + string(slot-INPUT_GP1));
        show_debug_message("Gamepad slot " + string(slot-INPUT_GP1) + " assigned to Player 1.");
        global.keyinput_gp_player[0] = slot;
        global.keyinput_type = KEYINPUT_GAMEPAD;
    }
}

if(global.keyinput_gp_player[1] == NULL || global.keyinput_gp_player[0] == global.keyinput_gp_player[1])
{
    if(global.keyinput_gp_player[0] != slot)
    {
        show_debug_message("Validated input on gamepad slot " + string(slot-INPUT_GP1));
        show_debug_message("Gamepad slot " + string(slot-INPUT_GP1) + " assigned to Player 2.");
        global.keyinput_gp_player[1] = slot;
        global.keyinput_type = KEYINPUT_GAMEPAD;
    }    
}
