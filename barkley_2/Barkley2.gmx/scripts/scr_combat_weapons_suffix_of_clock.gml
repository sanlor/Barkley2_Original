/// scr_combat_weapons_suffix_of_clock(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
        var goofy = ClockTime() * 2;
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, goofy);
        break;
}
