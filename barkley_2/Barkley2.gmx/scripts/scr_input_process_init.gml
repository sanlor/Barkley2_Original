/* Initialize keys processing */

with(o_input)
{
    for(var j = INPUT_KBD; j <= INPUT_GP4; j++)
    {
        __key_value[j] = 0;
        __key_check[j] = false;
        
        for(var i = 0; i < KEYIDS; i++)
        {
            key[j, i] = 0;
            key_release[j, i] = 0;
            key_press[j, i] = 0;
            key_holdtime[j, i] = 0;
        }
    }
}
