/// scr_combat_weapons_suffix_of_sacrifice(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "stepScript"] = script_get_name(scr_combat_weapons_step_sacrifice);
        break;
    case "applyBullet":
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, 5); 
        scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP) - 5);
        break;
}
