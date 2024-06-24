///scr_combat_weapons_suffix_of_lich(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":
        var goofy = min(Quest("totalDeaths"), 100);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, goofy);
        break;
}
