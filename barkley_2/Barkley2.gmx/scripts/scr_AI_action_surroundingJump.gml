var _action, _retvar,_obj, conf;

_action = argument0;
_retvar = false;

if (_action = "config")
{
    conf = ds_map_create();
    conf[? "jumpAction"] = NULL;
//    conf[? "maxJumpRange"]

    return conf;
}

if(_action == "reset")
{
    conf = argument1;
    return 0;
}


if(_action = "execute")
{
    conf = argument1;
    
    if (instance_exists(I_AI_target)) {
        var tx = I_AI_target.x;
        var ty = I_AI_target.y;
        var tz = I_AI_target.z;
        
        // Abort if no direct line of sight (should already be predicated)
        if (scr_collision_line(x, y, tx, ty, tz, COLLISION_NORMAL)) {
            return AI_STATERESULT_FALLTHROUGH_REMOVE;
        }
        
        // Get all nearby catfish in a list
        var nearbyFish = ds_list_create();
        var me = id;
        with (o_enemygroup_catfish) {
            if (id != me and point_distance(x, y, tx, ty) < 220) {
                ds_list_add(nearbyFish, id);
            }
        }
        
        // If no catfish
        if (ds_list_size(nearbyFish) <= 0) {
            
            // Abort, for now
            // OR
            // Just pick jump direction as other side of player
            ds_list_destroy(nearbyFish);
            return AI_STATERESULT_FALLTHROUGH_REMOVE;
            
        } else {
        
            // Calculate their centre of mass
            var centre_x = 0;
            var centre_y = 0;
            for (var i = 0; i < ds_list_size(nearbyFish); i++) {
                var fish = nearbyFish[| i];
                centre_x += fish.x;
                centre_y += fish.y;
            }
            centre_x /= ds_list_size(nearbyFish);
            centre_y /= ds_list_size(nearbyFish);
        
            // Pick direction within 45 degree opposite of centre of mass,
            // whichever direction you're able to jump furthest in.
            
            // Pick a jump spot
            
            // Jump to it using the defined jump action
        }
            
    } else {
        return AI_STATERESULT_FALLTHROUGH_REMOVE;
    }
}

return _retvar;
