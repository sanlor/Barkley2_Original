var a = 1;

if(argument_count >= 1) { a = argument[0]; }

if(active)
{
    vx += (ax * a / 2) / 60;
    vy += (ay * a / 2) / 60;
    vz += (az * a / 2) / 60;
    vz += (TACTICS_GRAVITY * a / 2) / 60;
    
    x += vx * a;
    y += vy * a;
    z += vz * a;
    
    vx += (ax * a / 2) / 60;
    vy += (ay * a / 2) / 60;
    vz += (az * a / 2) / 60;
    vz += (TACTICS_GRAVITY * a / 2) / 60;

    if(x <= border_west || x >= border_east)
    {
        x = max(border_west, min(x, border_east));
        vx = -vx * ez;
    }
    
    if(y <= border_north || y >= border_south)
    {
        y = max(border_north, min(y, border_south));
        vy = -vy * ez;
    }
    
    if(z <= 0)
    {
        if(!toggle)
        {
            show_debug_message(string(current_time) + ": contact at " + string(x) + "," + string(y));
            toggle = true;
        }
        z = 0;
    }
    else if(!scr_mg_tactics_ball_isAtRest(self.id))
    {
        toggle = false;
    }
    
    if(z == 0) 
    {
        vz = -vz * ez;
        vy *= mu;
        vx *= mu;
    }
}
