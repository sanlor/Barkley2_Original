/// Deal extra CYBER damage based on player deaths
statusEffect_this = statusEffect_deathbound;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        var deathBonus = scr_savedata_get("player.deaths.total");
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_CYBER, deathBonus);  
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate")
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_this, 0);
    return conf;
}
