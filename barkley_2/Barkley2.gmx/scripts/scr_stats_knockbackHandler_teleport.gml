/// Turns knockback into an actual movement vector change

var knockback_current = scr_stats_getCurrentStat(self, STAT_CURRENT_KNOCKBACK);
if (knockback_current > 0) {
    scr_stats_setCurrentStat(self, STAT_CURRENT_KNOCKBACK, 0);
    CombatBlink(32 + irandom(32));
}
