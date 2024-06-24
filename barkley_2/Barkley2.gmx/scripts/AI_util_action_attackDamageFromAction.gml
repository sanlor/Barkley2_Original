/// AI_util_action_attackDamageFromAction(attacker, conf, attackMap, damageType)

var attacker = argument0;
var conf = argument1;
var attack = argument2;
var damageType = argument3;

var atkDmg = conf[? "dmgBase"] + 
         conf[? "dmgRatioMight"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_MIGHT) + 
         conf[? "dmgRatioWeight"] * scr_stats_getEffectiveStat(attacker, STAT_BASE_WEIGHT) + 
         conf[? "dmgRatioPiety"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_PIETY);
attack[? damageType] = atkDmg;

attack[? STAT_ATTACK_KNOCKBACK] = conf[? "knockback"];
attack[? STAT_ATTACK_STAGGER] = conf[? "stagger"];
attack[? STAT_ATTACK_STAGGER_HARDNESS] = conf[? "staggerHardness"];
