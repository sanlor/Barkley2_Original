var stats_attack = ds_map_create();
ds_map_add(stats_attack, STAT_ATTACK_DMG_NORMAL, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_BIO, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_CYBER, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_MENTAL, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_ZAUBER, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_COSMIC, 0);
ds_map_add(stats_attack, STAT_ATTACK_DMG_RANDOMPERC, 0.15);
ds_map_add(stats_attack, STAT_ATTACK_KNOCKBACK, 10);
ds_map_add(stats_attack, STAT_ATTACK_STAGGER, 0);
ds_map_add(stats_attack, STAT_ATTACK_STAGGER_HARDNESS, STAGGER_HARDNESS_SOFT);

return stats_attack;
