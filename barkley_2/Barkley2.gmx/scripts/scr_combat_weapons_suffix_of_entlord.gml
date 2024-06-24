/// scr_combat_weapons_suffix_of_entlord(action, bulletOrNoone, gunOrNull)
var _action = argument0;
var _bullet = argument1;
var gun = argument2;

switch(_action)
{
    case "applyBullet":

        var normal = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * 0.5
        var goofy = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * (0.1 + random(0.3));
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, normal);
            scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, goofy);            
        break;
}
