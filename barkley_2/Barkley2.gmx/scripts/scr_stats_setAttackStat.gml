/// scr_stats_setAttackStat(combatattackentity_id, stat, value)
/* Set the value of a Attack stat.
Value will be capped to the min/max of the stat.

arg0 - id
arg1 - Stat to set
arg2 - value */

var _id, stat, value;
_id = argument0;
stat = argument1;
value = argument2;

var statmin, statmax;
statmin = -1;
statmax = -1;

switch (stat) {
    case STAT_ATTACK_DMG_NORMAL:
    case STAT_ATTACK_DMG_BIO:
    case STAT_ATTACK_DMG_CYBER:
    case STAT_ATTACK_DMG_MENTAL:
    case STAT_ATTACK_DMG_ZAUBER:
    case STAT_ATTACK_DMG_COSMIC:
    case STAT_ATTACK_KNOCKBACK:
    case STAT_ATTACK_STAGGER:
        statmin = 0;
        break;
        
    case STAT_ATTACK_STAGGER_HARDNESS:
        statmin = STAGGER_HARDNESS_SOFT;
        statmax = STAGGER_HARDNESS_HARD;
        break;
        
    default:
        show_debug_message("Invalid stat for scr_stats_setAttackStat: " + stat);
        break;
}

if (statmin != -1 && value < statmin) { value = statmin; }
if (statmax != -1 && value > statmax) { value = statmax; }

ds_map_replace(_id.stats_attack, stat, value);
