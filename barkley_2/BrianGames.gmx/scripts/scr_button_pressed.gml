//XBOX controller support - OPTIONAL: press keyboard to emulates button presses
//Button to check for, ID of controller
if (argument[0] != "init") //Check for key
{
    if (global.controlType == "pc") return 0;
    if (argument_count <= 1) _ind = 0; else _ind = argument[1];
    _but = ds_list_find_index(global.controlAction, argument[0]);
    if (global.controlEmulate == 1) { if (keyboard_check_pressed(ds_list_find_value(global.controlKey[_ind], _but))) return 1; }
    if (global.controlPad != -1)
    {
        if (gamepad_button_check_pressed(global.controlPad, ds_list_find_value(global.controlXbx[_ind], _but))) return 1;
    }
    return 0;
}
else //Init
{
    global.controlPad = -1;
    if (gamepad_is_supported())
    {
        var gp_num = gamepad_get_device_count();
        for (var _i = 0; _i < gp_num; _i += 1)
        {
            //if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false;
            if (gamepad_is_connected(_i)) { global.controlPad = _i; break; }
        }
    }
    
    global.controlEmulate = 0;
    global.controlAction = ds_list_create();
    global.controlKey[0] = ds_list_create();
    global.controlXbx[0] = ds_list_create();
    
    //DPADS
    ds_list_add(global.controlAction, "dpad left");
    ds_list_add(global.controlKey[0], ord('D'));
    ds_list_add(global.controlXbx[0], gp_padl);
    
    ds_list_add(global.controlAction, "dpad up");
    ds_list_add(global.controlKey[0], ord('W'));
    ds_list_add(global.controlXbx[0], gp_padu);
    
    ds_list_add(global.controlAction, "dpad right");
    ds_list_add(global.controlKey[0], ord('A'));
    ds_list_add(global.controlXbx[0], gp_padr);
    
    ds_list_add(global.controlAction, "dpad down");
    ds_list_add(global.controlKey[0], ord('S'));
    ds_list_add(global.controlXbx[0], gp_padd);
    
    //Face buttons
    ds_list_add(global.controlAction, "b");
    ds_list_add(global.controlKey[0], ord('L'));
    ds_list_add(global.controlXbx[0], gp_face2);
    
    ds_list_add(global.controlAction, "y");
    ds_list_add(global.controlKey[0], ord('I'));
    ds_list_add(global.controlXbx[0], gp_face4);
    
    ds_list_add(global.controlAction, "x");
    ds_list_add(global.controlKey[0], ord('J'));
    ds_list_add(global.controlXbx[0], gp_face3);
    
    ds_list_add(global.controlAction, "a");
    ds_list_add(global.controlKey[0], ord('K'));
    ds_list_add(global.controlXbx[0], gp_face1);
    
    //Bumpers
    ds_list_add(global.controlAction, "bumper left");
    ds_list_add(global.controlKey[0], ord('E'));
    ds_list_add(global.controlXbx[0], gp_shoulderl);
    
    ds_list_add(global.controlAction, "bumper right");
    ds_list_add(global.controlKey[0], ord('U'));
    ds_list_add(global.controlXbx[0], gp_shoulderr);
    
    ds_list_add(global.controlAction, "trigger left");
    ds_list_add(global.controlKey[0], ord('Q'));
    ds_list_add(global.controlXbx[0], gp_shoulderlb);
    
    ds_list_add(global.controlAction, "trigger right");
    ds_list_add(global.controlKey[0], ord('O'));
    ds_list_add(global.controlXbx[0], gp_shoulderrb);
}
