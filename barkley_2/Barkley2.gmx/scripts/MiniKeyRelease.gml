/// MiniKeyRelease(up down left right action cancel pause any)
if (argument[0] == "up")
{
    return scr_input_check_released(KEYID_QUICKMENU_UP, PLAYER1) ||
        scr_input_check_released(KEYID_UP, PLAYER1); 
}
else if (argument[0] == "down")
{
    return scr_input_check_released(KEYID_QUICKMENU_DOWN, PLAYER1) ||
        scr_input_check_released(KEYID_DOWN, PLAYER1); 
}
else if (argument[0] == "left")
{
    return scr_input_check_released(KEYID_QUICKMENU_LEFT, PLAYER1) ||
        scr_input_check_released(KEYID_LEFT, PLAYER1);
}
else if (argument[0] == "right")
{
    return scr_input_check_released(KEYID_QUICKMENU_RIGHT, PLAYER1) ||
        scr_input_check_released(KEYID_RIGHT, PLAYER1); 
}
else if (argument[0] == "action")
{
    if (scr_input_check_released(KEYID_ACTION, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_DIALOGUE, PLAYER1)) return 1;
}
else if (argument[0] == "cancel")
{
    if (scr_input_check_released(KEYID_RUN, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_HOLSTER, PLAYER1)) return 1;
}
else if (argument[0] == "pause")
{
    return scr_input_check_released(KEYID_PAUSE, PLAYER1);
}
else if (argument[0] == "any")
{
    if (scr_input_check_released(KEYID_UP, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_DOWN, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_LEFT, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_RIGHT, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_QUICKMENU_UP, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_QUICKMENU_DOWN, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_QUICKMENU_LEFT, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_QUICKMENU_RIGHT, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_ACTION, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_DIALOGUE, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_RUN, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_HOLSTER, PLAYER1)) return 1;
    if (scr_input_check_released(KEYID_PAUSE, PLAYER1)) return 1;
}
return 0;
