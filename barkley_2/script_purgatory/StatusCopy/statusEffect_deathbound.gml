/// Deal extra CYBER damage based on player deaths

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        //scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_BIO, scr_quest_get_state("playerDeaths"));  
        // get this from save file -> player.deaths.total
    }
    return 1;
}
