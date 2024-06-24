var _action, _retvar, conf, _obj;

/// Grabs nearest part, pulls toward me, and attaches it

_action = argument0;

if(_action=="config")
{
    conf = ds_map_create();
    conf[? "attackName"] = "pickupPart";
    conf[? "time"] = 10;
    conf[? "range"] = 120;
    conf[? "particleDelay"] = 0.1;
    conf[? "soundPickup"] = "junkbot_pickuppart";
    conf[? "soundConnect"] = "junkbot_connectpart";
    return conf;
}

if(_action=="reset")
{
    conf = argument1;
    conf[? "part"] = noone;
    conf[? "partx"] = 0;
    conf[? "party"] = 0;
    conf[? "partz"] = 0;
    conf[? "timer"] = 0;
    conf[? "particleTimer"] = 0;
    return 0;
}

if(_action = "execute")
{
    conf = argument1;
    a_attackName = conf[? "attackName"];
    scr_entity_setMoveXY(0, 0);
    
    if (conf[? "part"] == noone) {
    
        // Attempt to find part
        var nearest = instance_nearest(x, y, o_wasteland_junk_enemypart);
        if (nearest != noone and point_distance(x, y, nearest.x, nearest.y) <= conf[? "range"]) {
            conf[? "part"] = nearest;
            conf[? "partx"] = nearest.x;
            conf[? "party"] = nearest.y;
            conf[? "partz"] = nearest.z;
            if (nearest.partType == "legs") {
                conf[? "partzConnect"] = z;
            } else if (nearest.partType == "head") {
                var legs = parts[? "legs"];
                var body = parts[? "body"];
                conf[? "partzConnect"] = z + legs.height + body.height;
            } else {
                var legs = parts[? "legs"];
                conf[? "partzConnect"] = z + legs.height;
            }
            
            // Play sound on start
            audio_play_sound_AI(conf[? "soundPickup"]);
        }
        else {
            // Failed. Abort.
            a_attackName = "";
            return AI_STATERESULT_REMOVE;
        }
    }
    
    if (!instance_exists(conf[? "part"])) { // Safety check
        a_attackName = "";
        return AI_STATERESULT_REMOVE;
    }
    
    if (conf[? "timer"] < conf[? "time"]) {
        // Move part towards me
        var part = conf[? "part"];
        var ratio = 1 - cos(conf[? "timer"] / conf[? "time"] * (pi/2));
        part.x = conf[? "partx"] + (x - conf[? "partx"])*ratio;
        part.y = conf[? "party"] + (y - conf[? "party"])*ratio;
        part.z = conf[? "partz"] + (conf[? "partzConnect"] - conf[? "partz"])*ratio;
        with (part) {
            scr_entity_setMoveXYZ(0,0,0);
        }
        
        // Render spark particles
        conf[? "particleTimer"] -= dt();
        while (conf[? "particleTimer"] <= 0) {
            var sparkDist = random(1-ratio);
            var sparkDistX = x + (conf[? "partx"] - x) * sparkDist + 8 - random(16);
            var sparkDistY = y + (conf[? "party"] - y) * sparkDist + 8 - random(16);
            var sparkDistZ = conf[? "partzConnect"] + (conf[? "partz"] - conf[? "partzConnect"]) * sparkDist + random(16);
            var spark = instance_create(sparkDistX, sparkDistY, o_effect_generic_animateOnce);
            spark.z = sparkDistZ;
            spark.sprite_index = s_effect_electricspark;
            with spark {
                scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 2.5 + random(2));
                scr_entity_setMoveXY(0, 0);
            }
            conf[? "particleTimer"] += conf[? "particleDelay"];
        }
        
        conf[? "timer"] += dt();
        a_attackAnim = conf[? "timer"];
        return AI_STATERESULT_CONTINUE;
    } else {
        // Attach part
        var part = conf[? "part"]; 
        repeat (40) {
            var dir = random(360);
            var spd = 8 + random(4);
            var spark = instance_create(
                    part.x + lengthdir_x(spd * 3, dir),
                    part.y + lengthdir_y(spd * 3, dir),
                    o_effect_generic_animateOnce);
            spark.z = part.z + random(16);
            spark.sprite_index = s_effect_electricspark;
            with spark {
                scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1.5 + random(2));
                scr_entity_setDirSpd(dir, spd);
            }
            
        }
        
        scr_enemy_junkbot_attachPartFromJunk(conf[? "part"]);
        audio_play_sound_AI(conf[? "soundConnect"]);
        a_attackName = "";
        scr_AI_stateClearAll();
        
        return AI_STATERESULT_REMOVE;
    }
}
