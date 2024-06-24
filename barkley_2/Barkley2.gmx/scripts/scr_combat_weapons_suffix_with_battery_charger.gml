/// scr_combat_weapons_suffix_with_battery_charger(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "apply":
        gun[? "stepScript"] = script_get_name(scr_combat_weapons_step_beamgun);
        gun[? "bAmmoChange"] = +2;
        break;
    case "applyBullet":
    
        var poofy = gun[? "pCurAmmo"] / gun[? "pMaxAmmo"];
        var goofy = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL);
        var doofy = poofy * goofy;
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, doofy);
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, doofy * 0.5);
        break;
}
