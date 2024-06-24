/*
Returns the axis value of the key (typically 0.0 to 1.0)
arg0 - key ID
*/
var __id = argument[0];
var __input = argument[1];

with(o_input)
{
    if(__input == PLAYER1 || __input == PLAYER2)
    {
        return key_value[scr_input_type_getDefault(__input), __id];
    }
    else if(__input == INPUT_GAMEPAD)
    {
        return key_value[INPUT_GP1, __id];
    }
    else
    {
        return key_value[__input, __id];
    }
}
