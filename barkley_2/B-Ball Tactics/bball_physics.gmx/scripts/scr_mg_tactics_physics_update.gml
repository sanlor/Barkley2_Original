if(!instance_exists(o_mg_tactics_ball)) { exit; }

var interval = 1000 / 60;       //one physics step will be taken every 16 + 2/3 ms

with(o_mg_tactics_ball)
{
    var frametime = global.__dt_raw;
    
    physicsTime += frametime; // _dt * 100;
    
    if(physicsTime >= interval)
    {        
        //CATCH-UP: if there's a large amount of time between dt steps, take additional physics
        //steps to compensate
        
        while(physicsTime > 60)
        {
            scr_mg_tactics_ball_step();
            physicsTime -= 60;
        }
        
        //NORMAL: normal fixed-time physics step
        
        scr_mg_tactics_ball_step();
        physicsTime -= interval;
        
        //ALPHA: if there's time left over at the end of the step, interpolate physics frames to get
        //the true state of the system.
        
        var alpha = physicsTime / interval;
        
        if(alpha > 0 && alpha < 1)
        {
            scr_mg_tactics_ball_step(alpha);
            physicsTime -= physicsTime;
        }
    }
}
