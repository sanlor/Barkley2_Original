// Periodic averages target GLAMP.
statusEffect_this = statusEffect_equalizing;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate")
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, global.statusDuration * 10);    
    return conf;
}
else if (instance_exists(actor) == 0) { return 0; }
else if (command == "apply")
{
    var reapply = statusHelper_reapply(actor, statusEffect_this, conf);
    if (reapply == 0)
    {
        audio_play_sound_on_actor(actor, scr_soundbank_pickSound("affix_malnourished"), false, 70);
    }
    return 0;
} 
else if (command == "changestat")
{
    if (changestat == STATGROUP_BASICS)
    {
        var res = 0;
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_MIGHT);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY);
        res /= 5;
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, res);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, res);
    }
    return 0;
}
