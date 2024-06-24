// === Base stats ===
stats_base = ds_map_create();

// Character level
stats_base[? STAT_BASE_LEVEL] = 1;

// The Magic Five a.k.a. The Power Rangers
stats_base[? STAT_BASE_GUTS] = 1;
stats_base[? STAT_BASE_MIGHT] = 1;
stats_base[? STAT_BASE_AGILE] = 1;
stats_base[? STAT_BASE_LUCK] = 1;
stats_base[? STAT_BASE_PIETY] = 1;

// Abilities
stats_base[? STAT_BASE_HP] = 1;
stats_base[? STAT_BASE_SPEED] = 0;
stats_base[? STAT_BASE_WEIGHT] = 0;

// Resistances
stats_base[? STAT_BASE_RESISTANCE_KNOCKBACK] = 0;
stats_base[? STAT_BASE_RESISTANCE_STAGGER] = 0;

stats_base[? STAT_BASE_RESISTANCE_NORMAL] = 0;
stats_base[? STAT_BASE_RESISTANCE_BIO] = 0;
stats_base[? STAT_BASE_RESISTANCE_CYBER] = 0;
stats_base[? STAT_BASE_RESISTANCE_MENTAL] = 0;
stats_base[? STAT_BASE_RESISTANCE_ZAUBER] = 0;
stats_base[? STAT_BASE_RESISTANCE_COSMIC] = 0;

stats_base[? STAT_BASE_VULN_NORMAL] = 3;
stats_base[? STAT_BASE_VULN_BIO] = 3;
stats_base[? STAT_BASE_VULN_CYBER] = 3;
stats_base[? STAT_BASE_VULN_MENTAL] = 3;
stats_base[? STAT_BASE_VULN_ZAUBER] = 3;
stats_base[? STAT_BASE_VULN_COSMIC] = 3;


// === Effective stats ===
stats_effective = ds_map_create();
ds_map_copy(stats_effective, stats_base);

// Effective stats
stats_effective[? STAT_EFFECTIVE_MAX_HP] = 1;
stats_effective[? STAT_EFFECTIVE_ENCUMBERANCE] = 0;

// === Current stats ===
stats_current = ds_map_create();
stats_current[? STAT_CURRENT_HP] = stats_effective[? STAT_EFFECTIVE_MAX_HP];
stats_current[? STAT_CURRENT_KNOCKBACK] = 0;
stats_current[? STAT_CURRENT_STAGGER_INSTANT] = 0;
stats_current[? STAT_CURRENT_STAGGER_SOFT] = 0;
stats_current[? STAT_CURRENT_STAGGER_HARD] = 0;

scr_stats_genEffectiveStats();
scr_stats_resetCurrentStats();

// Boss Alignment
alignment_ethical = undefined;
alignment_moral = undefined;

doGenEffectiveStats = false;
changedStatsBase = false;
changedStatsCurrent = false;

