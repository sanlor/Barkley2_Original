/// scr_combat_weapons_suffix_of_today(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
  
switch(_action)
{
    case "applyBullet":

        var curhp = scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP) * 0.2;
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, curhp);
        break;
}
