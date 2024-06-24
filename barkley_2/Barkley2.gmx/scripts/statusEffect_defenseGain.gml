// Periodic raises target DEFENSE by XX%, lowers BP by YY%.
statusEffect_this = statusEffect_defenseGain;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        conf[? "strength"] = (gun[? "pAffix"] / 50); // 0 - 1 value
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
    conf[? "strength"] = 0.5;
    return conf;
}
else if (instance_exists(actor) == 0) { return 0; }
else if (command == "apply")
{
    var reapply = statusHelper_reapply(actor, statusEffect_this, conf);
    actor.AI_decisionFrequency = actor.thinkfluencing * (1 + (0.5 * conf[? "strength"]));
    return 0;
} 
else if (command == "changestat")
{
    if (changestat == STATGROUP_RESISTANCES)
    {
        statusHelper_statMultiply(actor, STAT_BASE_RESISTANCE_NORMAL, 1 + (0.5 * conf[? "strength"]));
    }
    return 0;
}
else if (command == "finish")
{
    actor.AI_decisionFrequency = actor.thinkfluencing;
    return 0;
}
