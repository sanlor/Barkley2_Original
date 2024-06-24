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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_shocking, _bullet);
        conf[? "timer"]         = floor(gun[? "pAffix"] / 5) + 30;
        conf[? "cyberDamage"]    = (floor(gun[? "pAffix"] / 5) + 5); 
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_shocking, 30);
    
    conf[? "hitTimer"] = 1;
    conf[? "hitInterval"] = 10;
    conf[? "cyberDamage"] = 15;

    return conf;
    }

// IF ACTOR DOES NOT EXIST RETURN 0 //
else if (!instance_exists(actor)) then
    {
    return 0;
    }
    
// APPLY THIS STATUS EFFECT //
else if (command == "apply") then
    {
    var currentShocking = scr_statusEffect_getFromCombatActor(actor, statusEffect_shocking);
    if (currentShocking == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // STAGGER //
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_STAGGER] = 100;
        atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_MEDIUM;
        scr_stats_performAttack(atk, actor, false, NULL, false, true);
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentShocking[? "timer"]);
        currentShocking[? "timer"] = timer;
        }
        
    // Return zero //     
    return 0;
    } 
    
// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // Shyte //
    var hitTimer = conf[? "hitTimer"];
    hitTimer -= dt();
    
    if (hitTimer <= 0) then
        {
        // Copy attack stats into Conf so it can be used as an attack object
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_DMG_CYBER] = conf[? "cyberDamage"];
        atk[? STAT_ATTACK_STAGGER] = 100;
        atk[? STAT_ATTACK_STAGGER_HARDNESS] = STAGGER_HARDNESS_SOFT;
        scr_stats_performAttack(atk, actor, false, NULL, false, true);
        hitTimer  = conf[? "hitInterval"];
        }
        
    // RESET VARS //
    conf[? "hitTimer"] = hitTimer;
    return 0;
    }
