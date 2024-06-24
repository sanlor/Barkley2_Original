/// scr_stats_setCurrentStat(combatactor_id, stat, value)
/* Set the value of a Current stat.
Value will be capped to the min/max of the stat.

arg0 - id
arg1 - Stat to set
arg2 - value */

var actor, stat, value;
actor = argument0;
stat = argument1;
value = argument2;

var statmin, statmax;
statmin = -1;
statmax = -1;

switch (stat) {
    case STAT_CURRENT_HP:
        statmax = scr_stats_getEffectiveStat(actor, STAT_EFFECTIVE_MAX_HP);
        break;

    case STAT_CURRENT_KNOCKBACK:
        statmin = 0;
        statmax = 150;
        break;

    case STAT_CURRENT_STAGGER_INSTANT:
    case STAT_CURRENT_STAGGER_SOFT:
    case STAT_CURRENT_STAGGER_HARD:
    case STAT_CURRENT_STAGGER_TIME:
        statmin = 0;
        break;

    case STAT_CURRENT_STAGGER_HARDNESS:
        statmin = 0;
        statmax = 2;
        break;

    default:
        show_debug_message("Invalid stat for scr_stats_setCurrentStat: " + stat);
        break;
}

if (statmin != -1 && value < statmin) { value = statmin; }
if (statmax != -1 && value > statmax) { value = statmax; }

with (actor) {
    ds_map_replace(stats_current, stat, value);
    changedStatsCurrent = true;
}
