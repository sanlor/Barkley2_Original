// Character level
ds_map_replace(stats_base, STAT_BASE_LEVEL, 1);

// The Magic Five a.k.a. The Power Rangers
ds_map_replace(stats_base, STAT_BASE_GUTS, 1);
ds_map_replace(stats_base, STAT_BASE_MIGHT, 1);
ds_map_replace(stats_base, STAT_BASE_AGILE, 1);
ds_map_replace(stats_base, STAT_BASE_LUCK, 1);
ds_map_replace(stats_base, STAT_BASE_PIETY, 1);

// Abilities
ds_map_replace(stats_base, STAT_BASE_HP, 1);
ds_map_replace(stats_base, STAT_BASE_SPEED, 0);
ds_map_replace(stats_base, STAT_BASE_WEIGHT, 0);

// Resistances
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_KNOCKBACK, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_STAGGER, 0);

ds_map_replace(stats_base, STAT_BASE_RESISTANCE_NORMAL, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_BIO, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_CYBER, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_MENTAL, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_ZAUBER, 0);
ds_map_replace(stats_base, STAT_BASE_RESISTANCE_COSMIC, 0);

ds_map_replace(stats_base, STAT_BASE_VULN_NORMAL, 3);
ds_map_replace(stats_base, STAT_BASE_VULN_BIO, 3);
ds_map_replace(stats_base, STAT_BASE_VULN_CYBER, 3);
ds_map_replace(stats_base, STAT_BASE_VULN_MENTAL, 3);
ds_map_replace(stats_base, STAT_BASE_VULN_ZAUBER, 3);
ds_map_replace(stats_base, STAT_BASE_VULN_COSMIC, 3);

// === Effective stats ===
stats_effective = ds_map_create();
// The Magic Five a.k.a. The Power Rangers
ds_map_replace(stats_effective, STAT_BASE_GUTS, 1);
ds_map_replace(stats_effective, STAT_BASE_MIGHT, 1);
ds_map_replace(stats_effective, STAT_BASE_AGILE, 1);
ds_map_replace(stats_effective, STAT_BASE_LUCK, 1);
ds_map_replace(stats_effective, STAT_BASE_PIETY, 1);

// Abilities
ds_map_replace(stats_effective, STAT_BASE_HP, 1);
ds_map_replace(stats_effective, STAT_BASE_SPEED, 0);

// Resistances
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_KNOCKBACK, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_STAGGER, 0);

ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_NORMAL, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_BIO, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_CYBER, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_MENTAL, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_ZAUBER, 0);
ds_map_replace(stats_effective, STAT_BASE_RESISTANCE_COSMIC, 0);

ds_map_replace(stats_effective, STAT_BASE_VULN_NORMAL, 3);
ds_map_replace(stats_effective, STAT_BASE_VULN_BIO, 3);
ds_map_replace(stats_effective, STAT_BASE_VULN_CYBER, 3);
ds_map_replace(stats_effective, STAT_BASE_VULN_MENTAL, 3);
ds_map_replace(stats_effective, STAT_BASE_VULN_ZAUBER, 3);
ds_map_replace(stats_effective, STAT_BASE_VULN_COSMIC, 3);

// Effective stats
ds_map_replace(stats_effective, STAT_EFFECTIVE_MAX_HP, 1);


scr_stats_genEffectiveStats();

scr_stats_resetCurrentStats();
