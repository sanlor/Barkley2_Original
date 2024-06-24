/*
Check the state of the given key ID, over keyboard and joypad mappings
arg0 - key ID
*/
var keyid = argument0;
var input_method = argument1;

//validate gamepads

with(o_input)
{
    if(input_method >= INPUT_GP1)
    {
        var button = global.key_gp[keyid];
        var slot = global.keyinput_gp_slot[input_method-INPUT_GP1];
        
        if(slot != NULL)
        {
            if(global.keyinput_gp_player[0] == NULL)
            {
                if(slot != global.keyinput_gp_player[0] && slot != global.keyinput_gp_player[1])
                {
                    if(gamepad_button_check_pressed(slot-INPUT_GP1, button))
                    {
                        scr_input_gamepad_validate(input_method);
                    }
                } 
            }
        
            if(global.keyinput_gp_player[1] == NULL)
            {
                if(slot != global.keyinput_gp_player[0] && slot != global.keyinput_gp_player[1])
                {
                    if(gamepad_button_check_pressed(slot-INPUT_GP1, button))
                    {
                        scr_input_gamepad_validate(input_method);
                    }
                } 
            }
        }
    }
    
    // == Keyboard / Mouse ==
    if (global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE) {
        
        //MOUSE
        
        var button = global.key_km[keyid];
        
        if(keyid == KEYID_ANYKEY)
        {
            if(mouse_check_button(mb_left) || mouse_check_button(mb_right) || mouse_check_button(mb_middle) ||
                mouse_wheel_up() || mouse_wheel_down())
            {
                __key_check[input_method] = true;
                __key_value[input_method] = 1;
            }
        }
        else if(button != KEY_NULL)
        {
            if (button == KEY_MOUSE_LEFT) {
                if (mouse_check_button(mb_left)) {
                    __key_check[input_method] = true;
                    __key_value[input_method] = 1;
                }
            }
            else if (button == KEY_MOUSE_RIGHT) {
                if (mouse_check_button(mb_right)) {
                    __key_check[input_method] = true;
                    __key_value[input_method] = 1;
                }
            }
            else if (button == KEY_MOUSE_MID) {
                if (mouse_check_button(mb_middle)) {
                    __key_check[input_method] = true;
                    __key_value[input_method] = 1;
                }
            }
            else if (button == KEY_MOUSE_WHEELUP) {
                if (mouse_wheel_up()) {
                    __key_check[input_method] = true;
                    __key_value[input_method] = 1;
                }
            }
            else if (button == KEY_MOUSE_WHEELDOWN) {
                if (mouse_wheel_down()) {
                    __key_check[input_method] = true;
                    __key_value[input_method] = 1;
                }
            }
        }
        
        //KEYBOARD
        
        if(button != KEY_NULL)
        {
            if keyboard_check(button) {
                __key_check[input_method] = true;
                __key_value[input_method] = 1;
            }
        }
        
        if(keyid == KEYID_ANYKEY)
        {
            if(keyboard_check(vk_anykey))
            {
                __key_check[input_method] = true;
                __key_value[input_method] = 1;
            }
        }
    }
    // == Gamepad slots 1-4 ==
    else if (global.keyinput_type == KEYINPUT_GAMEPAD) 
    {
        var button = global.key_gp[keyid];
        var slot = input_method-INPUT_GP1;
        
        if(gamepad_is_connected(slot))
        {
            if(keyid == KEYID_ANYKEY)
            {
                var check;
                
                for(var i = gp_face1; i <= gp_padr; i++)
                {
                    check = gamepad_button_check(slot, i);
                    
                    if(check)
                    {
                        __key_check[input_method] = check;
                        __key_value[input_method] = 1;
                    }
                }
            }
            else
            {
                if(button == KEY_NULL) { exit; }
                
                // Handle special identifiers for left stick
                if (button == KEY_GAMEPAD_AXISL_LEFT) {
                    var axis = gamepad_axis_value(slot, gp_axislh);
                    __key_check[input_method] = (axis <= -GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = -axis;
                }
                else if (button == KEY_GAMEPAD_AXISL_RIGHT) {
                    var axis = gamepad_axis_value(slot, gp_axislh);
                    __key_check[input_method] = (axis >= GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = axis;
                }
                else if (button == KEY_GAMEPAD_AXISL_UP) {
                    var axis = gamepad_axis_value(slot, gp_axislv);
                    __key_check[input_method] = (axis <= -GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = -axis;
                }
                else if (button == KEY_GAMEPAD_AXISL_DOWN) {
                    var axis = gamepad_axis_value(slot, gp_axislv);
                    __key_check[input_method] = (axis >= GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = axis;
                }
                // Handle special identifiers for right stick
                else if (button == KEY_GAMEPAD_AXISR_LEFT) {
                    var axis = gamepad_axis_value(slot, gp_axisrh);
                    __key_check[input_method] = (axis <= -GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = -axis;
                }
                else if (button == KEY_GAMEPAD_AXISR_RIGHT) {
                    var axis = gamepad_axis_value(slot, gp_axisrh);
                    __key_check[input_method] = (axis >= GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = axis;
                }
                else if (button == KEY_GAMEPAD_AXISR_UP) {
                    var axis = gamepad_axis_value(slot, gp_axisrv);
                    __key_check[input_method] = (axis <= -GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = -axis;
                }
                else if (button == KEY_GAMEPAD_AXISR_DOWN) {
                    var axis = gamepad_axis_value(slot, gp_axisrv);
                    __key_check[input_method] = (axis >= GAMEPAD_AXISTRESHOLD);
                    __key_value[input_method] = axis;
                }
                // Identifier is not one of the axes
                else if (button >= 0) {
                    // One of the actual gamepad buttons
                    __key_check[input_method] = gamepad_button_check(slot, button);
                    __key_value[input_method] = gamepad_button_value(slot, button);
                }
            }
        }
    }
}
