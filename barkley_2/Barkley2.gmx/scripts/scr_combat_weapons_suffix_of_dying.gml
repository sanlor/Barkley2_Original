/// scr_combat_weapons_suffix_of_dying(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
   
switch(_action)
{
    case "applyBullet":
        var maxhp = scr_stats_getEffectiveStat(o_hoopz, STAT_EFFECTIVE_MAX_HP);
        var curhp = scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP);
        var missinghp = (maxhp - curhp) * 0.4;
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, missinghp);
        break;
}
