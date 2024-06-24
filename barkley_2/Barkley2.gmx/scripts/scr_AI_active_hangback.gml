var action, conf, _retvar;

action = argument0;

if(action == "config")
{
    conf = ds_map_create();
    conf[? "walkScript"] = NULL;
    conf[? "moveTimeMax"] = 20;
    conf[? "hangbackDist"] = 96;
    conf[? "hangbackDistRnd"] = 64;
    conf[? "hangbackAngle"] = 30;
    conf[? "pauseTime"] = 2;
    conf[? "pauseTimeRnd"] = 2;
    conf[? "doPauses"] = true;
    conf[? "quantizeDirections"] = NULL;
    return conf;
}

if(action == "reset")
{
    conf = argument1;
    I_aAI_movesTimer = 0;
    I_aAI_pauseTimer = 0;
    I_aAI_moveLeft = 0;
    I_aAI_moveDir = 0;
    I_aAI_moveX = 0;
    I_aAI_moveY = 0;
    
    if (conf[? "walkScript"] == NULL) {
        conf[? "walkScript"] = scr_AI_movement_init(scr_AI_movementType_standard_strafing);
    }
}

if(action == "execute")
{
    conf = argument1;
    
    if (I_aAI_movesTimer > 0 or I_aAI_pauseTimer > 0)
    { 
        if(I_aAI_moveLeft > 0 and I_aAI_movesTimer > 0)
        {
            // Move
            scr_AI_movement_doMove(conf[? "walkScript"], I_aAI_moveX, I_aAI_moveY);
            a_walking = true;
            I_aAI_movesTimer -= dt();
            I_aAI_moveLeft -= move_dist * dt();
        }
        else if (conf[? "doPauses"])
        {
            // Finished moving, pause
            scr_AI_movement_doStop(conf[? "walkScript"])
            I_aAI_movesTimer = 0;
            I_aAI_moveLeft = 0;
            I_aAI_pauseTimer -= dt();
        } else {
            // Instantly move again
            I_aAI_pauseTimer = 0;
        }
    } 
    else
    { 
        // Find new hangback point
        I_aAI_movesTimer = conf[? "moveTimeMax"];
        I_aAI_pauseTimer = conf[? "pauseTime"] + random(conf[? "pauseTimeRnd"]);
        
        if(instance_exists(I_AI_target))
        {
            var pickRndDist = conf[? "hangbackDist"] - (conf[? "hangbackDistRnd"]/2) + random(conf[? "hangbackDistRnd"]);
            var targetDir = point_direction(x,y,I_AI_target.x,I_AI_target.y);
            var foundSpot = false;
            var tries = 0;
            
            while(!foundSpot && tries<4)
            {
                // Pick a random direction perpendicular to the target
                var dir = targetDir - 90 - (conf[? "hangbackAngle"]/2) + random(conf[? "hangbackAngle"]);
                dir += choose(0, 180);
                
                // Quantize direction to a set number of directions, if configured
                if (conf[? "quantizeDirections"] > 0) {
                    var q = round(conf[? "quantizeDirections"]);
                    dir = round(dir / (360/q)) * (360/q)
                }
                
                dir = (dir + 360) mod 360;       
                I_aAI_moveX = x + lengthdir_x(pickRndDist,dir);
                I_aAI_moveY = y + lengthdir_y(pickRndDist,dir);
                
                // A good spot is a place around the target which has a clear straight line between the spot and the target itself.
                if(!scr_collision_line(I_AI_target.x, I_AI_target.y, I_aAI_moveX, I_aAI_moveY, collision_check, ZMAX-1) and
                        scr_collision_point_free(I_aAI_moveX, I_aAI_moveY, collision_check, z)) {
                    // The spot is picked!
                    foundSpot = true; 
                    I_aAI_moveLeft = pickRndDist;
                }
                tries++;   
            }
            
            // If no spot was picked, it will walk a approach target instead.
            if (!foundSpot) {
                I_aAI_moveX = I_AI_target.x;
                I_aAI_moveY = I_AI_target.y;
                I_aAI_moveLeft = point_distance(x, y, I_aAI_moveX, I_aAI_moveY) / 6;
                I_aAI_pauseTimer = 0;
            } 
        } else {
            // No target, remove state.
            scr_entity_setMoveXY(0, 0);
            scr_path_delete();
            return AI_STATERESULT_REMOVE;
        }
    }
    
    return AI_STATERESULT_CONTINUE;
}
