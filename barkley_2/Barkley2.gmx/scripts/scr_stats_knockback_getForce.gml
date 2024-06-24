/// scr_stats_knockback_getForce()

var knockback_current = scr_stats_getCurrentStat(self, STAT_CURRENT_KNOCKBACK);
if (knockback_current > 0) {
    return 2 + (log2((knockback_current/ 10) + 1) * 7);
}
return 0;
