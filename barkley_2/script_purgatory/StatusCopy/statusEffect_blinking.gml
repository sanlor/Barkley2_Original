/// Teleports enemy to nearby location

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_blinking, _bullet);
        conf[? "distance"] = 32 + gun[? "pAffix"];
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate") then 
{
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    scr_statusEffect_generateBasicInfo(conf, statusEffect_blinking, 0);
    conf[? "distance"] = 32;// + gun[? "pAffix"];
    return conf;
}
else if (command == "apply")
{    
    with (actor) CombatBlink(conf[? "distance"]);
    return 1;
}
