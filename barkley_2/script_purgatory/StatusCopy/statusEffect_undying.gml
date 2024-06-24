// SETUP STUFF //
var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

// GENERATE SOME DEFAULT VALUES //
if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    scr_statusEffect_generateBasicInfo(conf, statusEffect_undying, 2);
    return 0;
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
    var currentUndying = scr_statusEffect_getFromCombatActor(actor, statusEffect_undying);
    
    // Status effect being applied when the actor does not have it currently //    
    if (currentUndying == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentUndying[? "timer"]);
        currentUndying[? "timer"] = timer;
        }
        
    // Return zero // 
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // -- Effect to perform each step --    
    if scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) <= 1 then scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, 1);     
    return 0;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    return 0;
    }

// DAMAGE //
else if (command == "damage") then
    {    
    return 0;
    }

// DRAW //
else if (command == "draw") then
    {
    return 0;
    }
    
// DRAW POST //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_withering);
    return 0;
    }

// AILMENT ENDS //
else if (command == "finish") then
    {
    return 0;
    }
