///scr_input_process_clearKeyState(const keyid, const input_method)

var keyid = argument0;
var input_method = argument1;

with(o_input)
{
    key[input_method, keyid] = 0;
    key_release[input_method, keyid] = 0;
    key_press[input_method, keyid] = 0;
    key_holdtime[input_method, keyid] = 0;
    
    var button;
    
    switch(input_method)
    {
        case(INPUT_KBM):    button = global.key_km[keyid]; break;
        case(INPUT_KBD):    button = global.key_kb[keyid]; break;
        case(INPUT_GP1):    button = global.key_gp[keyid]; break;
        case(INPUT_GP2):    button = global.key_gp[keyid]; break;
        case(INPUT_GP3):    button = global.key_gp[keyid]; break;
        case(INPUT_GP4):    button = global.key_gp[keyid]; break;
    }
    
    if(input_method == INPUT_KBM)
    {
        switch(button)
        {
            case(KEY_MOUSE_LEFT):   mouse_clear(mb_left); break;
            case(KEY_MOUSE_RIGHT):  mouse_clear(mb_right); break;
            case(KEY_MOUSE_MID):    mouse_clear(mb_middle); break;
        }
    }
    
    if(input_method == INPUT_KBD)
    {
        keyboard_clear(button);
    }
}
