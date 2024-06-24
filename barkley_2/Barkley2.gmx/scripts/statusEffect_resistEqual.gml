// Periodic averages target resistences.
statusEffect_this = statusEffect_resistEqual; // MUST change this to be name of the script above

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
    if (changestat == STATGROUP_RESISTANCES)
    {
        var res = 0;
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER);
        res += scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER);
        res /= 5;
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL, res);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER, res);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER, res);
    }
    return 0;
}
