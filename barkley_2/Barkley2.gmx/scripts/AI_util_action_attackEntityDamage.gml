/// AI_util_action_attackEntityDamage(attacker, attackEntity, damageType, dmgBase, dmgRatioMight, dmgRatioWeight, dmgRatioPiety, knockback, stagger, staggerHardness)

var attacker   = argument0;
var attack     = argument1;
var damageType = argument2;

var dmgBase        = argument3;
var dmgRatioMight  = argument4;
var dmgRatioWeight = argument5;
var dmgRatioPiety  = argument6;

var knockback       = argument7;
var stagger         = argument8;
var staggerHardness = argument9;

var atkDmg = dmgBase + 
         dmgRatioMight  * scr_stats_getEffectiveStat(attacker, STAT_BASE_MIGHT) + 
         dmgRatioWeight * scr_stats_getEffectiveStat(attacker, STAT_BASE_WEIGHT) + 
         dmgRatioPiety  * scr_stats_getEffectiveStat(attacker, STAT_BASE_PIETY);
scr_stats_setAttackStat(attack, damageType, atkDmg);

scr_stats_setAttackStat(attack, STAT_ATTACK_KNOCKBACK, knockback);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER, stagger);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER_HARDNESS, staggerHardness);

