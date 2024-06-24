/// scr_combat_weapons_suffix_from_heck(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, irandom(scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * 2.5));
        break;
}
