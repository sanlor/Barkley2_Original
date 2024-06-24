// Periodic inflicts anguish that deals target MENTAL damage while moving.

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf = scr_statusEffect_addToCombatAttack(statusEffect_agonizing, _bullet);
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

if (command == "generate") then 
{
    scr_statusEffect_generateBasicInfo(conf, statusEffect_agonizing, global.statusDuration * 10);
    conf[? "hitTimer"] = 2;
    conf[? "hitInterval"] = 2;
    conf[? "damage"] = 2;
    return conf;
}
else if (instance_exists(actor) == 0)
{
    return 0;
}
else if (command == "apply") then
{
    var reapply = statusHelper_reapply(actor, statusEffect_agonizing, conf);
    return 0;
} 
else if (command == "step") 
{
    var hitTimer = conf[? "hitTimer"];
    hitTimer -= dt();
    if (hitTimer <= 0) then
    {
        if actor.move_x != 0 or actor.move_y != 0 then
        {
            var atk = scr_stats_newAttackStats();
            atk[? STAT_ATTACK_DMG_MENTAL] = conf[? "damage"];
            scr_stats_performAttack(atk, actor, false, NULL, true, true);
            hitTimer  = conf[? "hitInterval"];
            repeat (10) 
            {
                var obj = instance_create(actor.x, actor.y, o_effect_affix_adhesive);
                obj.color = c_mental;
            }
        }
    }
    conf[? "hitTimer"] = hitTimer;
    return 0;
}
else if (command == "draw") 
{
    image_blend = make_color_rgb(230, 255, 230);
    return 0;
}
