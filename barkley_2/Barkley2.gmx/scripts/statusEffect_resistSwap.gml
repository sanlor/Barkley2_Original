// SETUP STUFF //
statusEffect_this = statusEffect_resistSwap; // MUST change this to be name of the script above

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
    var shuffle = ds_list_create();
    ds_list_add(shuffle, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC));
    ds_list_add(shuffle, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL));
    ds_list_add(shuffle, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO));
    ds_list_add(shuffle, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER));
    ds_list_add(shuffle, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER));
    ds_list_shuffle(shuffle);
    conf[? "cosmic"] = ds_list_find_value(shuffle, 0);
    conf[? "mental"] = ds_list_find_value(shuffle, 1);
    conf[? "bio"] = ds_list_find_value(shuffle, 2);
    conf[? "cyber"] = ds_list_find_value(shuffle, 3);
    conf[? "zauber"] = ds_list_find_value(shuffle, 4);
    ds_list_destroy(shuffle);
    
    statusHelper_applyFresh(actor, conf);
    
    return 0;
} 
else if (command == "changestat")
{
    if (changestat == STATGROUP_RESISTANCES)
    {
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC, conf[? "cosmic"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL, conf[? "mental"]);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO,    conf[? "bio"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER,  conf[? "cyber"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER, conf[? "zauber"]);
    }
    return 0;
}