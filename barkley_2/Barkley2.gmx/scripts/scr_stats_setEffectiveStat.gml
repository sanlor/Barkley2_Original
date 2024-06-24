/// scr_stats_setEffectiveStat(combatactor_id, stat, value)
/* Set the value of a Effective stat.
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
    case STAT_BASE_LEVEL:
        statmin = 0;
        break;

    case STAT_BASE_MIGHT:
    case STAT_BASE_GUTS:
    case STAT_BASE_AGILE:
    case STAT_BASE_LUCK:
    case STAT_BASE_PIETY:
        statmin = 1;
        statmax = 99;
        break;

    case STAT_BASE_HP:
        statmin = 1;
        break;

    case STAT_BASE_WEIGHT:
        statmin = 0;
        break;

    case STAT_BASE_SPEED:
        statmin = 0;
        break;

    case STAT_EFFECTIVE_MAX_HP:
        statmin = 1;
        break;

    case STAT_EFFECTIVE_ENCUMBERANCE:
        statmin = 0;
        statmax = 1;
        
    case STAT_BASE_RESISTANCE_KNOCKBACK:
    case STAT_BASE_RESISTANCE_NORMAL:
    case STAT_BASE_RESISTANCE_STAGGER:
    case STAT_BASE_RESISTANCE_BIO:
    case STAT_BASE_RESISTANCE_CYBER:
    case STAT_BASE_RESISTANCE_MENTAL:
    case STAT_BASE_RESISTANCE_ZAUBER:
    case STAT_BASE_RESISTANCE_COSMIC:
        statmin = -100;
        statmax = 200;
        break;

    case STAT_BASE_VULN_NORMAL:
    case STAT_BASE_VULN_BIO:
    case STAT_BASE_VULN_CYBER:
    case STAT_BASE_VULN_MENTAL:
    case STAT_BASE_VULN_ZAUBER:
    case STAT_BASE_VULN_COSMIC:
        statmin = 0;
        statmax = 6;
        break;

    default:
        show_debug_message("Invalid stat for scr_stats_setEffectiveStat: " + stat);
        return 0;
        break;
}

if (statmin != -1 && value < statmin) { value = statmin; }
if (statmax != -1 && value > statmax) { value = statmax; }

with (actor) {
    ds_map_replace(stats_effective, stat, value);
}
