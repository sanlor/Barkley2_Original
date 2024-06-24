///scr_combat_weapons_suffix_of_triskelion(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
        if (scr_area_get() = "tri") scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 9999);
        break;
}
