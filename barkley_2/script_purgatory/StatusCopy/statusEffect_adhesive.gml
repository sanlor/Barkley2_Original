// Drops movespeed to basically non-existant for X duration //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_adhesive, _bullet);
        conf[? "timer"] = floor(gun[? "pAffix"] / 10) + 80;
    }
    return 1;
}

var conf = argument[0];
var actor = argument[1];
var command = argument[2];
if (argument_count > 3) var changestat = argument[3];

// GENERATE SOME DEFAULT VALUES //
if (command == "generate") then 
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_adhesive, 50);

    // Default values so there won't be undefined variable crashes //
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerEffect"] = 5;
    
    conf[? "slowdown"] = scr_stats_getEffectiveStat(actor, STAT_BASE_SPEED) * 0.001; //5;
    conf[? "visualEffect"] = true;
    
    // Return configuration //
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
    // Check if actor already has the status effect //
    var currentAdhesive = scr_statusEffect_getFromCombatActor(actor, statusEffect_adhesive);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentAdhesive == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Effect //
        var visualFX = conf[? "visualEffect"] = true;
        if visualFX = true then repeat (10) instance_create(actor.x, actor.y, o_effect_affix_adhesive);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentAdhesive[? "timer"]);
        currentAdhesive[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // This is for the status effect visual flickering //
    //scr_fx_statusFlicker(conf, 4, 1);
    
    // Setup //
    var time = conf[? "timerEffect"];
    
    // Timer ticks down //
    time -= dt();
    
    // Event //
    if time <= 0 then
        {
        var visualFX = conf[? "visualEffect"] = true;
        if visualFX = true then repeat (10) instance_create(actor.x, actor.y, o_effect_affix_adhesive);
        time = 5;
        }
        
    // Reset //
    conf[? "timerEffect"] = time;
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change SPEED //
    if (changestat == STAT_BASE_SPEED) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_SPEED, conf[? "slowdown"]);
        }
    
    // Return zero //
    return 0;
    }
