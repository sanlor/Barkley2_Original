/*
Returns the number of milliseconds the key has been held
arg0 - key ID
*/
var __id = argument[0];
var __input = argument[1]; 

// Handle disabled instances
if (ds_list_contains(global.keyinput_disabled, id)) {
    return 0;
}

with(o_input)
{
    if(__input == PLAYER1 || __input == PLAYER2)
    {
        return key_holdtime[scr_input_type_getDefault(__input), __id];
    }
    else if(__input == INPUT_GAMEPAD)
    {
        return key_holdtime[INPUT_GP1, __id];
    }
    else
    {
        return key_holdtime[__input, __id];
    }
}
