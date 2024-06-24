/// scr_combat_weapons_suffix_of_becker(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
 
switch(_action)
{
    case "apply":    
        var speedo = gun[? "pFireSpeed"] * 0.5;
        gun[? "pFireSpeed"] = speedo;
        gun[? "pBurstSpeed"] = speedo;
        break;
    case "applyBullet":
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * 3);            
        break;
}
