/// statusHelper_damageSingle(bullet, damageType, multiplier)
var bulDmg = 0;

bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_NORMAL);
bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_COSMIC); 
bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_MENTAL); 
bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_BIO); 
bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_CYBER); 
bulDmg += scr_stats_getAttackStat(argument0, STAT_ATTACK_DMG_ZAUBER);

scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_NORMAL, 0); 
scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_COSMIC, 0); 
scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_MENTAL, 0); 
scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_BIO,    0); 
scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_CYBER,  0); 
scr_stats_setAttackStat(argument0, STAT_ATTACK_DMG_ZAUBER, 0);

scr_stats_setAttackStat(argument0, argument1,  bulDmg * argument2); 
