/// scr_AI_attackScript_addMalnourished(attack, attacker)

var attack   = argument0;
var attacker = argument1;

var conf = scr_statusEffect_addToCombatAttack(statusEffect_slow, attack)
var piety = scr_stats_getEffectiveStat(attacker, STAT_BASE_PIETY);
conf[? "affixPower"] = piety * 0.0095;

