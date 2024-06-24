/// AI_util_getJumpPoints_toLand()

if (instance_exists(I_AI_target)) {
    // Generate path to target on 'only solids' collision layer
    var prev_mp = path_grid;
    scr_path_setMotionPlanningType(MOTIONPLANNING_ONLY_SOLID);
    var res = scr_path_set(x, y, I_AI_target.x, I_AI_target.y, 1, 16, NULL);
    path_grid = prev_mp;
    
    if (res) {
        // Step along path until no longer wading or touching semisolids
        var len = path_get_length(path_walk);
        
        var _step = 4;
        
        var spot_from = NULL;
        var spot_to = NULL
        var spotx, spoty;
        for (var pos = 0; pos < len and (spot_from == NULL or spot_to == NULL); pos += _step) {
            // PASTY EDIT
            // skips "gaps" in wading solids
            var prev_point = scr_path_getPoint(max(0, pos - _step), 0);
            var next_point = scr_path_getPoint(min(len - 1, pos + _step), 0);
            
            var point_wading = !scr_collision_point_free(prev_point[@ 0], prev_point[@ 1], z, COLLISION_WADING) || 
                !scr_collision_point_free(next_point[@ 0], next_point[@ 1], z, COLLISION_WADING)
        
            var point_collision = !scr_collision_place_free(prev_point[@ 0], prev_point[@ 1], COLLISION_NORMAL) ||
                !scr_collision_place_free(next_point[@ 0], next_point[@ 1], COLLISION_NORMAL);
        
           //var point = scr_path_getPoint(pos, 0);
           //var point_wading = !scr_collision_point_free(point[@ 0], point[@ 1], z, COLLISION_WADING);
           //var point_collision = !scr_collision_place_free(point[@ 0], point[@ 1], COLLISION_NORMAL);
           
           if (point_wading and !point_collision) {
               spot_from = pos;
           }
           if (!point_wading and !point_collision) {
               spot_to = pos;
           }
        }
        
        if (spot_from == NULL or spot_to == NULL) {
            scr_path_delete();
            return false;
        }
        
        // path debugging
        scr_debug_movementVisualizer_addPath(path_walk);
        
        // Pick points from here
        var point_from = scr_path_getPoint(spot_from, 0);
        var point_to = scr_path_getPoint(spot_to, 0);
        jumpPoint_from_x = point_from[@ 0];
        jumpPoint_from_y = point_from[@ 1];
        jumpPoint_to_x = point_to[@ 0];
        jumpPoint_to_y = point_to[@ 1];
        point_from = 0;
        point_to = 0;
        
        return true;
    } else {
        return false;
    }
    
} else {
    return false;
}

