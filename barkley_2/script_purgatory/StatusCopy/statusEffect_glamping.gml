if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var glampo = 0;
        glampo += scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_GUTS);
        glampo += scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_LUCK);
        glampo += scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_AGILE);
        glampo += scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_MIGHT);
        glampo += scr_stats_getEffectiveStat(PlayerCombatActor, STAT_BASE_PIETY);
        
        // SET BULLET DAMAGE TO BIO TYPE AND REMOVE NORMAL DAMAGE //
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_ZAUBER, glampo);  
    }
    return 1;
}
