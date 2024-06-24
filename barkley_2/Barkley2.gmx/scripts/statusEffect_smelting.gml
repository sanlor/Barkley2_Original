/// statusEffect_smelting()
// Periodic makes target drop a candy.
statusEffect_this = statusEffect_smelting;

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_this, _bullet);
        conf[? "strength"] = (gun[? "pAffix"] / 50) * 2;
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
    conf[? "strength"] = 0;
    return conf;
}
if (command == "apply")
{
    if (actor.prefixDropAmmo == 0)
    {
        instance_create(actor.x, actor.y, oPickUpAmmo);
        actor.prefixDropAmmo = 1;
    }
    return 0;
}
