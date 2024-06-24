/* Returns strength of stagger (in stagger units above limit).
   0 if no stagger, positive number otherwise. */
   
var stagger_inst = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_INSTANT);
var stagger_soft = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_SOFT);
var stagger_hard = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_HARD);

return max(0, stagger_limit - stagger_inst - stagger_soft - stagger_hard);
