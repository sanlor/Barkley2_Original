if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER, scr_quest_get_state("playerDeaths")); 
    }
    return 1;
}
