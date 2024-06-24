/*
Returns true if key ID was released this specific frame.
arg0 - key ID
*/
var __id = argument[0];
var __input = argument[1];

// Handle disabled instances
if (ds_list_contains(global.keyinput_disabled, id)) {
    return false;
}

var result = 0;

with(o_input)
{
    if(__input & PLAYER1)
    {
        if(INPUT_PLAYER1 != NULL)
        {
            result += (key_release[INPUT_KBD, __id] || key_release[INPUT_KBM, __id] || 
                    key_release[INPUT_PLAYER1, __id]);
        }
        else
        {
            result += (key_release[INPUT_KBD, __id] || key_release[INPUT_KBM, __id]);
        }
    }
    
    if(__input & PLAYER2)
    {
        if(INPUT_PLAYER2 != NULL)
        {
            result += (key_release[INPUT_KBD, __id] || key_release[INPUT_KBM, __id] || 
                    key_release[INPUT_PLAYER2, __id]);
        }
        else
        {
            result += (key_release[INPUT_KBD, __id] || key_release[INPUT_KBM, __id]);
        }
    }
    
    if(__input == INPUT_GAMEPAD)
    {
        result += (key_release[INPUT_GP1, __id] || key_release[INPUT_GP2, __id] || 
                key_release[INPUT_GP3, __id] || key_release[INPUT_GP4, __id]);
    }
    else if(__input <= INPUT_GAMEPAD)
    {
        result += key_release[__input, __id];
    }
}

return (result > 0);
