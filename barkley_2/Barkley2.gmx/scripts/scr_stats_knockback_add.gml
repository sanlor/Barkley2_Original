/// scr_stats_knockback_add(defender, knockbackForce, knockbackDirection)

var defender = argument0;
var knockbackForce = argument1;
var knockbackDir = argument2;

    
// Calculate knockback force
var knockback_res = scr_stats_getEffectiveStat(defender, STAT_BASE_RESISTANCE_KNOCKBACK);
var weight = scr_stats_getEffectiveStat(defender, STAT_BASE_WEIGHT);

knockbackForce *= max(0, 1 - (knockback_res / 100));
knockbackForce *= 1 / (1 + (weight / KNOCKBACK_WEIGHT_CUTOFF));

if (knockbackForce == 0)
    return 0;

var knockback_def = scr_stats_getCurrentStat(defender, STAT_CURRENT_KNOCKBACK);
var knockback_scale = 1;
if (knockback_def > 0) {
    knockback_scale = min(1, knockbackForce/((knockback_def/2) + knockbackForce));
}
knockbackForce *= knockback_scale;

// New Knockback vector
defender.knockback_vector_x = lengthdir_x(1, knockbackDir);
defender.knockback_vector_y = lengthdir_y(1, knockbackDir);

// New knockback value
scr_stats_setCurrentStat(defender, STAT_CURRENT_KNOCKBACK, knockback_def + knockbackForce);
