if (instance_exists(I_AI_target)) {
    // Check if target is in flamethrower path
    var check = sat_collision_point_rect(I_AI_target.x, I_AI_target.y, x, y, 140, 140);
    return check
}
return false;
