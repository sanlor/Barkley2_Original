///scr_combat_bulletDmgmod(bullet,powerAdd,powerMulti)
var _bult = argument0;
var _add = argument1;
var _multi = argument2;

scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_NORMAL, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_NORMAL)*_multi + _add);
scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_BIO, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_BIO)*_multi + _add);
scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_CYBER, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_CYBER)*_multi + _add);
scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_MENTAL, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_MENTAL)*_multi + _add);
scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_ZAUBER, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_ZAUBER)*_multi + _add);
scr_stats_setAttackStat(_bult, STAT_ATTACK_DMG_COSMIC, scr_stats_getAttackStat(_bult, STAT_ATTACK_DMG_COSMIC)*_multi + _add);
                
scr_stats_setAttackStat(_bult, STAT_ATTACK_KNOCKBACK, scr_stats_getAttackStat(_bult, STAT_ATTACK_KNOCKBACK)*_multi + _add);
