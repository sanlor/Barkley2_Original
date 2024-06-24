var _action, _retvar, conf;

_action = argument0;

if(_action == "config")
{
    conf = ds_map_create();
    ds_map_add(conf, "stopAtDistance", 16);
    ds_map_add(conf, "stopAtCroppedDistance", 8);
    ds_map_add(conf, "stateAfterStop", NULL);
    
    ds_map_add(conf, "cropLeft", 0);
    ds_map_add(conf, "cropRight", 100);
    ds_map_add(conf, "cropTop", 0);
    ds_map_add(conf, "cropBottom", 100);
    return conf;
}

if (_action = "reset")
{
    conf = argument1;
    I_aAI_oldx = x;
    I_aAI_oldy = y;
    I_aAI_targetx_prev = 0;
    I_aAI_targety_prev = 0;
    I_aAI_stopDist = ds_map_find_value(conf, "stopAtDistance");
    I_aAI_stopCropDist = ds_map_find_value(conf, "stopAtCroppedDistance");
    if (scr_path_active()) { scr_path_delete(); }
}

if (_action = "execute")
{
    var _retvar = AI_STATERESULT_CONTINUE;
    
    var _tx, _ty, _canseetarget, target;
    conf = argument1;
    _tx = I_AI_target.x;
    _ty = I_AI_target.y;
    
    _tx_crop = min(conf[? "cropRight"], max(conf[? "cropLeft"], _tx))
    _ty_crop = min(conf[? "cropBottom"], max(conf[? "cropTop"], _ty))
    
    var walkSpd = scr_stats_getEffectiveStat(self, STAT_BASE_SPEED);
     
    // Check which action to take
    if (point_distance(x, y, _tx, _ty) < I_aAI_stopDist or
        point_distance(x, y, _tx_crop, _ty_crop) < I_aAI_stopCropDist)
    {
        // I have reached my destination
        scr_path_delete();
        scr_entity_setMoveXY(0, 0);
        if (conf[? "stateAfterStop"] != NULL) {
            scr_AI_stateClearAll();
            scr_AI_statePush(conf[? "stateAfterStop"]);
        }
    }
    else 
    {
        /// ==== Walk using a path ====
        move_x = 0;
        move_y = 0;
        
        if (!scr_path_active())
        {
            // I need a new path
            I_aAI_path = scr_path_set_linear(x,y,_tx_crop,_ty_crop, walkSpd);
            I_aAI_targetx_prev = _tx_crop;
            I_aAI_targety_prev = _ty_crop;
        }
        else
        {
            // I am now walking towards my target
            if (x != I_aAI_oldx or y != I_aAI_oldy) {
                var _dx, _dy;
                _dx = x - I_aAI_oldx;
                _dy = y - I_aAI_oldy;
                faceDir = point_direction(0, 0, _dx, _dy);
            }
            // Check if target has moved, if so, recalculate path
            var target_dist = min(point_distance(x, y, _tx_crop, _ty_crop), 300);
            var target_dist_from_prev = point_distance(_tx_crop, _ty_crop, I_aAI_targetx_prev, I_aAI_targety_prev);
            if (target_dist_from_prev >= (12 + (target_dist / 10))) {
                // I need a new path
                I_aAI_path = scr_path_set(x,y,_tx_crop,_ty_crop, walkSpd, 8, NULL);
                I_aAI_targetx_prev = _tx_crop;
                I_aAI_targety_prev = _ty_crop;
            }
            scr_path_setSpeed(walkSpd);
        }
    }
    
    // Update vars
    I_aAI_oldx = x;
    I_aAI_oldy = y;
    
    return _retvar;
}
