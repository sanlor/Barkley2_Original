/// scr_combat_weapons_suffix_of_healthy(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
  
switch(_action)
{
    case "applyBullet":
        var normal = scr_stats_getEffectiveStat(o_hoopz, STAT_EFFECTIVE_MAX_HP) * 0.12;
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, normal);
        break;
}
