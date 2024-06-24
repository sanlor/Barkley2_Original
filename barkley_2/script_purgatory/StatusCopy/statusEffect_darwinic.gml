// GET THE STRONGEST GLAMP VALUE //
// SET BULLET DAMAGE TO BIO TYPE AND REMOVE NORMAL DAMAGE //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        // GET THE STRONGEST GLAMP VALUE //
        var glampo = 0;
        glampo = max(
            scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_GUTS),
            scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_LUCK),
            scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_AGILE),
            scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_MIGHT),
            scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_PIETY));
        
        // SET BULLET DAMAGE TO BIO TYPE AND REMOVE NORMAL DAMAGE //
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_MENTAL, glampo); 
    }
    return 1;
}
