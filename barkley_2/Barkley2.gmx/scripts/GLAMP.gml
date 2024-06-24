/// GLAMP(guts / luck / acrobatics / might / piety, change)
var stt = "player.stats.base.";

if (argument[0] == "guts") stt += STAT_BASE_GUTS;
else if (argument[0] == "luck") stt += STAT_BASE_LUCK;
else if (argument[0] == "acrobatics") stt += STAT_BASE_AGILE;
else if (argument[0] == "might") stt += STAT_BASE_MIGHT;
else if (argument[0] == "piety") stt += STAT_BASE_PIETY;
else
{
    show_debug_message("GLAMP() - Invalid stat to raise >" + argument[0] + "<");
    return 1;
}

// Return stat is 1 argument
if (argument_count == 1)
{
    return scr_savedata_get(stt) + chg;
}

var chg = real(argument[1]);
scr_savedata_put(stt, scr_savedata_get(stt) + chg);

with (o_hoopz)
{
    scr_stats_genEffectiveStats();
    scr_stats_resetCurrentStats();
    scr_player_calculateWeight();
}
