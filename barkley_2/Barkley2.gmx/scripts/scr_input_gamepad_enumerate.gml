/*
    The input code should enumerate all gamepad slots and use player input or config data to determine 
    which slot contains a gamepad and which contains other devices. There are certain exception cases on
    non-Windows platforms where getting the first gamepad you can find will screw you up.
    
    For instance, on Ubuntu, it is possible for the OS's software accelerometer device to be assigned to 
    gamepad slot 0, making it impossible for a gamepad to be found if gamepad enumeration relies on the 
    first slot.
*/

// Search for gamepads

var debugstr = "Searching for gamepads...";

if(gamepad_is_supported())
{
    var gp_devices = 4;
    
    if(gp_devices <= 0) 
    {
        debugstr = "No gamepad device slots found.";
    }
    else
    {
        for(var i = 0; i < gp_devices; i++)
        {
            debugstr += "[";
            
            if(gamepad_is_connected(i))
            {
                if(global.keyinput_gp_slot[i] == NULL)
                {
                    show_debug_message("Gamepad slot " + string(i) + " connected.");
                    global.keyinput_gp_slot[i] = INPUT_GP1 + i;
                }
                
                debugstr += string(INPUT_GP1 + i);
            }
            
            debugstr += "]";
        }
    }
    
    if(global.keyinput_gp_player[0] != NULL)
    {
        var slot = global.keyinput_gp_player[0] - INPUT_GP1;
        if(!gamepad_is_connected(slot))
        {
            show_debug_message("Gamepad slot " + string(slot) + " disconnected.");
            global.keyinput_gp_slot[slot] = NULL;
            global.keyinput_gp_player[0] = NULL;
            global.keyinput_gp_player[1] = NULL;
        }
    }

    if(global.keyinput_gp_player[1] != NULL)
    {
        var slot = global.keyinput_gp_player[1] - INPUT_GP1;
        if(!gamepad_is_connected(slot))
        {
            show_debug_message("Gamepad slot " + string(slot) + " disconnected.");
            global.keyinput_gp_slot[slot] = NULL;
            global.keyinput_gp_player[0] = NULL;
            global.keyinput_gp_player[1] = NULL;
            
            /*if(global.keyinput_gp_player[0] != NULL && 
                gamepad_is_connected(global.keyinput_gp_player[0] - INPUT_GP1))
            {
                global.keyinput_gp_player[1] = global.keyinput_gp_player[0];
            }
            else
            {
                global.keyinput_gp_player[1] = NULL;
            }*/
        }
    }
    if(global.keyinput_gp_player[0] == NULL &&
        global.keyinput_gp_player[1] == NULL)
    {
        global.keyinput_type = KEYINPUT_KEYBOARD_MOUSE;
    }
}
else
{
    debugstr = "Gamepad not supported.";
}

debugstr += "{" + string(global.keyinput_gp_player[0]) + "}{" + 
    string(global.keyinput_gp_player[1]) + "}";

//show_debug_message(string(current_time) + ": " + debugstr);
