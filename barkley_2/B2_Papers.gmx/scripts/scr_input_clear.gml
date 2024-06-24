/*
Process the state of each key
*/

with(o_input)
{
    for(var j = INPUT_KBD; j <= INPUT_GP4; j++)
    { 
        for(var i = KEYID_ANYKEY; i < KEYIDS; i++)
        {
            if(j >= INPUT_GP1 && global.keyinput_gp_slot[j-INPUT_GP1] == NULL) { break; }
            key_press[j, i] = 0;
            key_release[j, i] = 0;
            key_value[j, i] = 0;
            key[j, i] = 1;
            key_holdtime[j, i] = 0;
        }
    }
}
