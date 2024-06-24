// Periodic respecs target GLAMP randomly.
statusEffect_this = statusEffect_respeccing;

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
    conf[? "sp0"] = random(100);
    conf[? "sp1"] = random(100);
    conf[? "sp2"] = random(100);
    conf[? "sp3"] = random(100);
    conf[? "sp4"] = random(100);
    var tot = conf[? "sp0"] + conf[? "sp1"] + conf[? "sp2"] + conf[? "sp3"] + conf[? "sp4"];
    conf[? "sp0"] /= tot;
    conf[? "sp1"] /= tot;
    conf[? "sp2"] /= tot;
    conf[? "sp3"] /= tot;
    conf[? "sp4"] /= tot;
    
    statusHelper_applyFresh(actor, conf);
    
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
        //res /= 5;
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS,  res * conf[? "sp0"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK,  res * conf[? "sp1"]);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, res * conf[? "sp2"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, res * conf[? "sp3"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, res * conf[? "sp4"]);
    }
    return 0;
}
