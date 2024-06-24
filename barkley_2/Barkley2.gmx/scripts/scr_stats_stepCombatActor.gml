
// Stagger handling
var stagger_time = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_TIME);
var stagger_inst = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_INSTANT);
var stagger_soft = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_SOFT);
var stagger_hard = scr_stats_getCurrentStat(self, STAT_CURRENT_STAGGER_HARD);

if (stagger_time > 0) {
    stagger_time = max(0, stagger_time - dt());
    scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_TIME, stagger_time);
    if (stagger_time <= 0) {
        // Cap stagger to 50
        if (stagger_hard > 50) {
            scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_HARD, 50);
            scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_SOFT, 0);
        } else if (stagger_hard + stagger_soft > 50) {
            scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_SOFT, 50 - stagger_hard);
        }
        scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_INSTANT, 0);
    }
} else {
    // Reduce stagger
   
    if (stagger_inst > 0) {
        scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_INSTANT, 0);
    }
    if (stagger_soft > 0) {
        stagger_soft = max(0, stagger_soft - (3  * dt()));
        scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_SOFT, stagger_soft);
    }
    if (stagger_hard > 0) {
        stagger_hard = max(0, stagger_hard - (.5 * dt()));
        scr_stats_setCurrentStat(self, STAT_CURRENT_STAGGER_HARD, stagger_hard);
    }
}


// Status effects
var decrease = true;
//if (scr_statusEffect_getFromCombatActor(self.id, statusEffect_faradyneCage) != NULL) {
//    decrease = false;
//}
var i;
for (i = 0; i < ds_list_size(list_status_effect); i += 1) {
    var map, scr, t;
    map = ds_list_find_value(list_status_effect, i);
    scr = ds_map_find_value(map, "script");
    
    var remove = script_execute(scr, map, self.id, "step", NULL);
    t = ds_map_find_value(map, "timer");
    
    // Tick down ailment timer //
    if (decrease) {
        t -= dt();
        ds_map_replace(map, "timer", t);
    }
    
    // Remove ailment //
    if (t <= 0 or remove) {
        script_execute(scr, map, self.id, "finish", NULL);
        ds_map_destroy(map);
        ds_list_delete(list_status_effect, i);
        i -= 1;
    }
}
