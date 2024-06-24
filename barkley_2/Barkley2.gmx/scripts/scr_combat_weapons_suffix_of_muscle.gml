///scr_combat_weapons_suffix_of_muscle(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
  
switch(_action)
{
    case "applyBullet":

        // TODO damage increase is based on your current transhumanism level
        var normal = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * (0.8 + random(0.4));
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, normal);
        break;
}
