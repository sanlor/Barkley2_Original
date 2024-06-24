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
            
            __key_check[j] = false;
            __key_value[j] = 0;
            
            key_press[j, i] = 0;
            key_release[j, i] = 0;
            
            scr_input_process_checkKeyState(i, j);
            
            key_value[j, i] = __key_value[j];
            
            //check the state of the key bound to this key ID on input j
            if(__key_check[j])  //key is pressed
            {   
                if(key[j, i] == 0)  //if not held down previous frame
                {
                    key_press[j, i] = 1;
                    key_holdtime[j, i] = 0;
                }
                
                key[j, i] = 1;
                key_holdtime[j, i] += dt_msec();
            }
            else //key is not pressed
            {
                if(key[j, i] == 1)
                {
                    key_release[j, i] = 1;      //key was released this frame
                                                //note that key hold time is left as is
                }
                
                key[j, i] = 0;
            }
        }
    }
}
