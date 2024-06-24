/// Turns knockback into an actual movement vector change

var knockback_current = scr_stats_getCurrentStat(self, STAT_CURRENT_KNOCKBACK);
if (knockback_current > 0) {
    var knockback = scr_stats_knockback_getForce();
    var knockback_v = scr_stats_knockback_getVector();
    var dir = point_direction(0, 0, knockback_v[@ 0], knockback_v[@ 1]);
    scr_entity_addDirSpd(dir, knockback);
    // Cap it
    // scr_entity_setMoveXY(lengthdir_x(clamp(move_dist, -8, 8), dir), lengthdir_y(clamp(move_dist, -8, 8), dir));
    scr_stats_setCurrentStat(self, STAT_CURRENT_KNOCKBACK, 0);
}
