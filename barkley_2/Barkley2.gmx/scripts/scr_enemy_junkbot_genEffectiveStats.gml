scr_stats_genEffectiveStats();

// Apply part stats
var key = ds_map_find_first(parts);
for (var i = 0; i < ds_map_size(parts); i++) {
    part = parts[? key];
    
    if (part != noone and instance_exists(part)) {
        ds_map_replace(stats_effective, STAT_BASE_SPEED, scr_stats_getEffectiveStat(self, STAT_BASE_SPEED) + part.statbonus_speed); 
        ds_map_replace(stats_effective, STAT_BASE_HP, scr_stats_getEffectiveStat(self, STAT_BASE_HP) + part.statbonus_health); 
        ds_map_replace(stats_effective, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(self, STAT_BASE_WEIGHT) + part.statbonus_weight);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_STAGGER, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_STAGGER) + part.statbonus_knockback);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_KNOCKBACK, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_KNOCKBACK) + part.statbonus_stagger);
        
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_NORMAL, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_NORMAL) + part.statbonus_resistance_normal);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_BIO, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_BIO) + part.statbonus_resistance_bio);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_CYBER, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_CYBER) + part.statbonus_resistance_cyber);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_MENTAL, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_MENTAL) + part.statbonus_resistance_mental);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_ZAUBER, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_ZAUBER) + part.statbonus_resistance_zauber);
        ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_COSMIC, scr_stats_getEffectiveStat(self, STAT_BASE_RESISTANCE_COSMIC) + part.statbonus_resistance_cosmic); 
    }
    
    key = ds_map_find_next(parts, key);
}
