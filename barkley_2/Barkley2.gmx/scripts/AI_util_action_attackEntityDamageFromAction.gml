/// AI_util_action_attackEntityDamageFromAction(attacker, conf, attackEntity, damageType)

var attacker = argument0;
var conf = argument1;
var attack = argument2;
var damageType = argument3;

var atkDmg = conf[? "dmgBase"] + 
         conf[? "dmgRatioMight"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_MIGHT) + 
         conf[? "dmgRatioWeight"] * scr_stats_getEffectiveStat(attacker, STAT_BASE_WEIGHT) + 
         conf[? "dmgRatioPiety"]  * scr_stats_getEffectiveStat(attacker, STAT_BASE_PIETY);
scr_stats_setAttackStat(attack, damageType, atkDmg);

scr_stats_setAttackStat(attack, STAT_ATTACK_KNOCKBACK, conf[? "knockback"]);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER, conf[? "stagger"]);
scr_stats_setAttackStat(attack, STAT_ATTACK_STAGGER_HARDNESS, conf[? "staggerHardness"]);

if (conf[? "attackScript"] != NULL) {
    script_execute(conf[? "attackScript"], attack, attacker);
}

