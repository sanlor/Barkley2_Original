// SETUP STUFF //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_agonizing, _bullet);
        
        // DURATION OF THE AILMENT //
        conf[? "timer"] = (gun[? "pAffix"]/10) + 40;
        conf[? "timerTotal"] = conf[? "timer"];
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3; // Used only when command = "changestat"

if (command == "generate") then 
    {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_agonizing, 30);
    conf[? "hitTimer"] = 2;
    conf[? "hitInterval"] = 2;
    conf[? "cosmicDamage"] = 3;

    return conf;
    }

else if (!instance_exists(actor)) then
    {
    return 0;
    }

else if (command == "apply") then
    {
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    var currentAgony = scr_statusEffect_getFromCombatActor(actor, statusEffect_agonizing);
    if (currentAgony == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentAgony[? "timer"]);
        currentAgony[? "timer"] = timer;
    }
    return 0;
    } 

else if (command == "step") {
    // -- Effect to perform each step --
    
    // Poison //
    var hitTimer = conf[? "hitTimer"];
    hitTimer -= dt();
    if (hitTimer <= 0) then
        {
        // Copy attack stats into Conf so it can be used as an attack object
        if actor.move_x != 0 or actor.move_y != 0 then
            {
            var atk = scr_stats_newAttackStats();
            atk[? STAT_ATTACK_DMG_BIO] = conf[? "cosmicDamage"];
            scr_stats_performAttack(atk, actor, false, NULL, true, true);
            hitTimer  = conf[? "hitInterval"];
            }
        }
    conf[? "hitTimer"] = hitTimer;
    return 0;
}

else if (command == "draw") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    image_blend = make_color_rgb(230, 255, 230);
    return 0;
}
