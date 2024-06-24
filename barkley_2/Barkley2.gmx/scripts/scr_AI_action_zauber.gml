var _action, conf;
_action = argument0;

if (_action = "config")
{
    conf = ds_map_create();
    conf[? "zauber"] = NULL; // Must be defined manually
    conf[? "targetList"] = target_list; // Same as enemy target list by default
    conf[? "chargeSpd"] = 0.1;
    conf[? "chargeUntil"] = 1;
    conf[? "targetSpd"] = 10;
    conf[? "maxRange"] = 240;
    conf[? "actionOnCast"] = NULL;
    conf[? "fallthrough"] = false;
    
    conf[? "attackName"] = "zauber";
    
    return conf;
}

if (_action == "reset")
{
    conf = argument1;
    I_atk_zauber_charge = 0;
    I_atk_zauber_targetlist = conf[? "targetList"];
    I_atk_attackName = conf[? "attackName"];
    I_atk_zauber_targetX = 0;
    I_atk_zauber_targetY = 0;
    I_atk_targetCharge = conf[? "chargeUntil"];
}

if (_action = "execute")
{
    conf = argument1;
    
    if (!conf[? "fallthrough"]) {
        scr_entity_setMoveXY(0, 0);
    }
    
    a_attackName = I_atk_attackName;
    
    // Aim towards target
    var target = scr_actor_getNearestOfTypeList(I_atk_zauber_targetlist, x, y);
    if (target != noone && instance_exists(target)) {
        var dx = target.x - x;
        var dy = target.y - y;
        var dir = point_direction(I_atk_zauber_targetX, I_atk_zauber_targetY, dx, dy);
        var dist = point_distance(I_atk_zauber_targetX, I_atk_zauber_targetY, dx, dy);
        if (dist <= conf[? "targetSpd"]*dt()) {
            I_atk_zauber_targetX = dx;
            I_atk_zauber_targetY = dy;
        }
        else {
            I_atk_zauber_targetX += lengthdir_x(conf[? "targetSpd"]*dt(), dir);
            I_atk_zauber_targetY += lengthdir_y(conf[? "targetSpd"]*dt(), dir);
        }
    }
    
    // Cap aiming at maxRange
    var dir = point_direction(0, 0, I_atk_zauber_targetX, I_atk_zauber_targetY);
    var dist = point_distance(0, 0, I_atk_zauber_targetX, I_atk_zauber_targetY);
    if (dist > conf[? "maxRange"]) {
        I_atk_zauber_targetX = lengthdir_x(conf[? "maxRange"], dir)
        I_atk_zauber_targetY = lengthdir_y(conf[? "maxRange"], dir)
    }
    
    I_atk_zauber_charge += conf[? "chargeSpd"] * dt();
    
    // Place decals to draw
    scr_zauber_placeAimDecals(conf[? "zauber"], self.id, x + I_atk_zauber_targetX, y + I_atk_zauber_targetY, z);
    
    // If charge is full... release! Brast that gunk!
    if (I_atk_zauber_charge >= I_atk_targetCharge) {
        
        if (I_atk_zauber_charge >= 1) {
            // Cast zauber if charged up to at least LVL1
            var cast_x = x + I_atk_zauber_targetX;
            var cast_y = y + I_atk_zauber_targetY;
            var cast_z = z;
            scr_zauber_cast(conf[? "zauber"], conf[? "chargeUntil"], self.id, cast_x, cast_y, cast_z);
        }
        
        a_attackName = "";
        
        // Push followup stance if applicable
        if (conf[? "actionOnCast"] != NULL) {
            scr_AI_statePush(conf[? "actionOnCast"]);
        }
        
        // Escape this hellhole
        if (conf[? "fallthrough"]) {
            return AI_STATERESULT_FALLTHROUGH_REMOVE;
        } else {
            return AI_STATERESULT_REMOVE;
        }
    }
    
    if (conf[? "fallthrough"]) {
        return AI_STATERESULT_FALLTHROUGH;
    } else {
        return AI_STATERESULT_CONTINUE;
    }
}

