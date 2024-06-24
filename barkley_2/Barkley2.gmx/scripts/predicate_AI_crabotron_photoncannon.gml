if (instance_exists(I_AI_target)) {
    // Check if target is in flamethrower path
    var check1 = sat_collision_point_rect(I_AI_target.x, I_AI_target.y, x-150, y-150, 100, 100);
    var check2 = sat_collision_point_rect(I_AI_target.x, I_AI_target.y, x+150, y-150, 100, 100);
    var check3 = sat_collision_point_rect(I_AI_target.x, I_AI_target.y, x-150, y+150, 100, 100);
    var check4 = sat_collision_point_rect(I_AI_target.x, I_AI_target.y, x+150, y+150, 100, 100);
    return check1 or check2 or check3 or check4;
}
return false;
