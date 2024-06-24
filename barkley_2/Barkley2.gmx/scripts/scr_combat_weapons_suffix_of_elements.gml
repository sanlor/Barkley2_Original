/// scr_combat_weapons_suffix_of_elements(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
 
switch(_action)
{
    case "applyBullet":

        var goofy = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL);
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0);
        var goofball = irandom(4);
        if (goofball == 0) then scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, goofy);
        else if (goofball == 1) then scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER, goofy);
        else if (goofball == 2) then scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL, goofy);
        else if (goofball == 3) then scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, goofy);
        else if (goofball == 4) then scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, goofy);
        break;
}
