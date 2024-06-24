// Doubles damage and cosmic

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) * 2); 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0); 
    }
    return 1;
}
