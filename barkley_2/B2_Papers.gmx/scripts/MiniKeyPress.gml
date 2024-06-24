if (argument_count == 2) _c = argument[1]; else _c = 0;
//return 0;
if (argument[0] == "up")
{
    if (_c == 0) 
    {
        return scr_input_check_pressed(KEYID_QUICKMENU_UP, PLAYER1) ||
            scr_input_check_pressed(KEYID_UP, PLAYER1); 
    }
    else 
    {
        return scr_input_check_held(KEYID_QUICKMENU_UP, PLAYER1) ||
            scr_input_check_held(KEYID_UP, PLAYER1);
    }
}
else if (argument[0] == "down")
{
    if (_c == 0) 
    {
        return scr_input_check_pressed(KEYID_QUICKMENU_DOWN, PLAYER1) ||
            scr_input_check_pressed(KEYID_DOWN, PLAYER1); 
    }
    else 
    {
        return scr_input_check_held(KEYID_QUICKMENU_DOWN, PLAYER1) ||
            scr_input_check_held(KEYID_DOWN, PLAYER1);
    }
}
else if (argument[0] == "left")
{
    if (_c == 0) 
    {
        return scr_input_check_pressed(KEYID_QUICKMENU_LEFT, PLAYER1) ||
            scr_input_check_pressed(KEYID_LEFT, PLAYER1);
    }
    else 
    {
        return scr_input_check_held(KEYID_QUICKMENU_LEFT, PLAYER1) ||
            scr_input_check_held(KEYID_LEFT, PLAYER1);
    }
}
else if (argument[0] == "right")
{
    if (_c == 0) 
    {
        return scr_input_check_pressed(KEYID_QUICKMENU_RIGHT, PLAYER1) ||
            scr_input_check_pressed(KEYID_RIGHT, PLAYER1); 
    }
    else 
    {
        return scr_input_check_held(KEYID_QUICKMENU_RIGHT, PLAYER1) ||
            scr_input_check_held(KEYID_RIGHT, PLAYER1);
    }
}
else if (argument[0] == "action")
{
    if (_c == 0) 
    {
        if (scr_input_check_pressed(KEYID_ACTION, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_DIALOGUE, PLAYER1)) return 1;
    }
    else 
    {
        if (scr_input_check_held(KEYID_ACTION, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_DIALOGUE, PLAYER1)) return 1;
    }
}
else if (argument[0] == "cancel")
{
    if (_c == 0) 
    {
        if (scr_input_check_pressed(KEYID_RUN, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_HOLSTER, PLAYER1)) return 1;
    }
    else 
    {
        if (scr_input_check_held(KEYID_RUN, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_HOLSTER, PLAYER1)) return 1;
    }
}
else if (argument[0] == "pause")
{
    if (_c == 0) return scr_input_check_pressed(KEYID_PAUSE, PLAYER1); else return scr_input_check_held(KEYID_PAUSE, PLAYER1);
}
else if (argument[0] == "any")
{
    if (_c == 0)
    {
        if (scr_input_check_pressed(KEYID_UP, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_DOWN, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_LEFT, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_RIGHT, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_ACTION, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_DIALOGUE, PLAYER1)) return 1;
        if (scr_input_check_pressed(KEYID_PAUSE, PLAYER1)) return 1;
    }
    else
    {
        if (scr_input_check_held(KEYID_UP, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_DOWN, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_LEFT, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_RIGHT, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_ACTION, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_DIALOGUE, PLAYER1)) return 1;
        if (scr_input_check_held(KEYID_PAUSE, PLAYER1)) return 1;
    }
}
return 0;
