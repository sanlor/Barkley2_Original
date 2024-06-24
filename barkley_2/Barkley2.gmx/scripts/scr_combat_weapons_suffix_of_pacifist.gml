///scr_combat_weapons_suffix_of_pacifist(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":

        var normal = 0;
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, normal);
        break;
}
