// Periodic deals 0 - XX% KOSMIC instead of normal damage.
statusEffect_this = statusEffect_gambling;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        var dmg = random(2 + ((gun[? "pAffix"] / 50) * 6));
        statusHelper_damageSingle(_bullet, STAT_ATTACK_DMG_COSMIC, dmg);
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
