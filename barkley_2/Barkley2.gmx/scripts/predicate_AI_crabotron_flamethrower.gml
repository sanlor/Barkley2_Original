if (instance_exists(I_AI_target)) {
    // Check if target is in flamethrower path
    var check1 = sat_collision_rect_rect(x, y, 24, 200,
               I_AI_target.x, I_AI_target.y,
               I_AI_target.bbox_right - I_AI_target.bbox_left, I_AI_target.bbox_bottom - I_AI_target.bbox_top);
    var check2 = sat_collision_rect_rect(x, y, 200, 24,
               I_AI_target.x, I_AI_target.y,
               I_AI_target.bbox_right - I_AI_target.bbox_left, I_AI_target.bbox_bottom - I_AI_target.bbox_top);
    return check1 != 0 or check2 != 0;
}
return false;
