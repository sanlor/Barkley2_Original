// SETUP STUFF //
var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

// GENERATE SOME DEFAULT VALUES //
if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_sh_sewerSludge, 3);
    
    // Default values so there won't be undefined variable crashes //
    conf[? STAT_BASE_AGILE] = 0.8;
    conf[? STAT_BASE_WEIGHT] = 1.4;
    conf[? "speed"] = 0.65;
    
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
    var currentSludge = scr_statusEffect_getFromCombatActor(actor, statusEffect_sh_sewerSludge);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentSludge == -1) then 
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentSludge[? "timer"]);
        currentSludge[? "timer"] = timer;
        }
    
    // Return zero //
    return 0;
    }    

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //    
else if (command == "changestat") then
    {
    // Change weight //
    /*if (changestat == STAT_BASE_WEIGHT) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT) * conf[? STAT_BASE_WEIGHT]);
        }
    
    // Change acrobatics //
    if (changestat == STATGROUP_BASICS) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE) * conf[? STAT_BASE_AGILE]);
        }*/
        
    // Change speed //
    if (changestat == STAT_BASE_SPEED) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_SPEED, scr_stats_getEffectiveStat(actor, STAT_BASE_SPEED) * conf[? "speed"]);
        }
    
    // Return zero //
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
    
// POST DRAW //
else if (command == "draw_post") then
    {
    return 0;
    }

// AILMENT ENDS //
else if (command == "finish") then  
    {
    return 0;
    }
