var input;

input = argument[0];

if(global.keyinput_type == KEYINPUT_KEYBOARD_MOUSE)
{
    return INPUT_KBD;
}

if(global.keyinput_type == KEYINPUT_GAMEPAD)
{
    if(input == PLAYER1 && INPUT_PLAYER1 != NULL) { return INPUT_PLAYER1; }
    if(input == PLAYER2 && INPUT_PLAYER2 != NULL) { return INPUT_PLAYER2; }
}
