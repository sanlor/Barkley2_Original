var action, conf, _retvar;

action = argument0;
_retvar = false; 
///will return true once, at the start of each cycle of hanging back.

//Set up the controlling values of the script
if(action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "walkSpdMod", 1); 
    ds_map_add(conf, "movesInterval", 10);
    ds_map_add(conf, "draftDist", 32); //Distance from Shield unit, 
    ds_map_add(conf, "draftDistRnd", 16); //and random value added to it
    ds_map_add(conf, "draftCone", 15); //The cone behind target for which the script moves to
    ds_map_add(conf, "doPauses", 0); // was true);
    ds_map_add(conf, "coverDest", o_enemy_catfish_shield); //The destination for cover/where it goes to find protection
    ds_map_add(conf, "coverDist", 256); //The maximum distance Shield/Cover has to be until the unit won't run towards it for protection
    return conf;
}

if(action == "reset") ///prepare the variables this ai state uses
{
    conf = argument1;
    I_aAI_movesTimer = 0;
    I_aAI_moveLeft = 0;
    
    _target = instance_nearest(x, y, ds_map_find_value(conf, "coverDest")); //Grab the nearest object of coverdest
    _distance = ds_map_find_value(conf, "coverDist");
    
    if (_target != noone and point_distance(x,y,_target.x,_target.y) <= _distance) //If the target is within the distance set
    {
        I_aAI_destinationx = _target.x; //Set the target-destination to the target's x and y
        I_aAI_destinationy = _target.y; //Dito for above
    }
    else
    {
        I_aAI_destinationx = x;
        I_aAI_destinationx = y;
    }
        
        
    I_aAI_walkSpdMod = ds_map_find_value(conf, "walkSpdMod");
    
    ////(setting ANGLE high (like to 360) will make the monsters try to quickly surround the target quickly)
}


if(action == "execute")
{
    var walkSpd;
    drafting = 1;
    conf = argument1;
    
    _target = instance_nearest(x, y, ds_map_find_value(conf, "coverDest")); //Grab the nearest object of coverdest
    _distance = ds_map_find_value(conf, "coverDist");
    
    // Calculate walkspeed
    var walkSpd = I_aAI_walkSpdMod * scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
    
    if (I_aAI_movesTimer > 0) //If currently moving / not stopped
    { ///////STATE: CURRENTLY MOVING BETWEEN SHIELD DRAFT POINTS
        I_aAI_movesTimer -= dt(); //Tick down the timer for each move
        var _dist, _dir, _diff;
        _dist = point_distance(x,y,I_aAI_destinationx,I_aAI_destinationy);
        _dir = point_direction(x,y,I_aAI_destinationx,I_aAI_destinationy);
        
        if(_dist<4 or I_aAI_moveLeft <= 0) ////if arrived at destination, stop moving and turn to face the hero.
        {
            scr_entity_setMoveXY(0, 0);
            scr_path_delete();
            if (!ds_map_find_value(conf, "doPauses"))
            {
                I_aAI_movesTimer = 0; // Instantly move again
            }
            else if(instance_exists(_target) and _target != noone) ///turn to face target when not on a path
            {
                _dir = point_direction(x,y, I_aAI_destinationx, I_aAI_destinationy);
                _behind = _target.faceDir-180;
            }   
        }
        else
        {////if on a path, follow path until you reach it, or until time elapses.
            
            if(scr_path_active())
            {
                // Walking along a path
                scr_path_setSpeed(walkSpd);
            }
            else
            {
                // Freewalking/strafing, look towards target
                var lookdir;
                if (instance_exists(I_AI_target)) {
                    lookdir = point_direction(x,y, I_AI_target.x, I_AI_target.y);
                } else {
                    lookdir = point_direction(x,y,I_aAI_destinationx,I_aAI_destinationy);
                }
                faceDir = lookdir;
                
                // Move me
                scr_entity_setDirSpd(_dir, walkSpd);
                I_aAI_moveLeft -= dt();
            }
            
            a_walking = true;
        }
    } 
    else
    { ///////STATE: FIND A NEW POINT FOR THE TARGET TO MOVE
        I_aAI_movesTimer = ds_map_find_value(conf, "movesInterval");///reset the moving interval timer
       if instance_exists(_target) and _target != noone and point_distance(x,y,_target.x,_target.y) <= _distance //If the target is within the distance set
           {
           I_aAI_destinationx = _target.x; //Set the target-destination to the target's x and y
           I_aAI_destinationy = _target.y; //Dito for above
           }
       else {
           I_aAI_destinationx = I_AI_target.x;
           I_aAI_destinationy = I_AI_target.y;
           }
                
       var _tx,_ty,_pDir,_foundSpot,_tries,_targetSpotDir,_targetSpotDist,_tryDir,_tryx,_tryy,
                _attempt,_pickRndDist, _pickRndCone, _draftDist, _dratDistRnd, _draftCone, _destDirection;
                
       _tx = I_aAI_destinationx;
       _ty = I_aAI_destinationy;
       
       _draftDist = ds_map_find_value(conf, "draftDist");
       _draftDistRnd = ds_map_find_value(conf, "draftDistRnd");
       _draftCone = ds_map_find_value(conf, "draftCone");
       _destDirection= point_direction(x,y,_tx,_ty);
       _pickRndDist = _draftDist - _draftDistRnd/2 + random(_draftDistRnd);
       _pickRndCone = (_destDirection-180 - _draftCone/2 + random(_draftCone)) +360;
       ///the monster picks an angle away from the target to walk to, possibly flanking the target.
       _pDir = point_direction(_tx,_ty,x,y); ///find the angle the enemy is at from the targets perspective.
       
       _foundSpot = false;
       _tries = 0;
       _targetSpotDir = _pDir;
       _targetSpotDist = _pickRndDist;
       
       
       
            while(!_foundSpot && _tries<4) //tries 4 times to find a spot before giving up.
            {

            
                _tryDir = (_pickRndCone) mod 360; //pick a random angle around the target.
                
                _tryx = _tx + lengthdir_x(_pickRndDist,_tryDir);///find coordinates at a specific distance away from the target
                _tryy = _ty + lengthdir_y(_pickRndDist,_tryDir);///at the angle picked before.
                
                ///A good spot is a place around the target which has a clear straight line between the spot and the target itself.
                _attempt = scr_collision_line_distance(_tx, _ty, _tryx, _tryy, z, collision_check); ///returns the position where a solid is found in the line, or -1
                if(_attempt == -1 || _attempt>_pickRndDist/2)///if a solid is found but its far away, the direction is deemed good enough.
                {
                    ///A good spot has to also be free of collisions.
                    if(scr_collision_point_free(_tryx, _tryy, z, collision_check))
                    {
                        _foundSpot = true; _targetSpotDir = _tryDir; ///The spot is picked!
                        
                        if(_attempt != -1){_targetSpotDist = _attempt;}
                    }
                }
                _tries+=1;   
            }
            
            ///if no spot was picked, it will walk straight towards the target instead. (the default value given before the while loop)
            _tryx = _tx + lengthdir_x(_targetSpotDist,_targetSpotDir);
            _tryy = _ty + lengthdir_y(_targetSpotDist,_targetSpotDir);
            
            targetSpotDist = _targetSpotDist;
            
            targetSpotDir = _targetSpotDir;
            
            distAway = point_distance(_tx,_ty,x,y);
            
            if(distAway<_targetSpotDist/2 || distAway>_targetSpotDist*1.5) {
                walkSpd *= 1.2;
            }
            
            if(scr_collision_line(x, y, _tryx, _tryy, z, collision_check)) ///if theres a wall on the way, set a path.
            {
                scr_path_set(x,y,_tryx,_tryy,walkSpd,8,NULL)
                I_aAI_moveLeft = 999;
            }
            else {
                I_aAI_moveLeft = 1 + floor(point_distance(_tryx,_tryy,x,y)/walkSpd);
            }
            
            
            I_aAI_targetx = _tryx;
            I_aAI_targety = _tryy;
            }
    }


return _retvar;
