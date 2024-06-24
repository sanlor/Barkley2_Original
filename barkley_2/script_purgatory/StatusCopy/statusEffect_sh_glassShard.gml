// SETUP //
var conf = argument0;
var actor = argument1;
var command = argument2;

// GENERATE BASIC INFO //
if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_sh_glassShard, 5);
    
    // Default values so there won't be undefined variable crashes //    
    conf[? "hitTimer"] = 1;
    conf[? "hitInterval"] = 5;
    conf[? STAT_ATTACK_DMG_NORMAL] = 3;
    
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
    var currentGlassShards = scr_statusEffect_getFromCombatActor(actor, statusEffect_sh_glassShard);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentGlassShards == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentGlassShards[? "timer"]);
        currentGlassShards[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then
    {    
    // Set up some variables needed down below //
    var hitTimer = conf[? "hitTimer"];
    
    // Blood drops //
    if irandom(100) <= 20 then instance_create(actor.x, actor.y - 12, o_effect_blooddrop);
    
    // Timer ticks down //
    hitTimer -= dt();
    
    // Event //
    if (hitTimer <= 0) then 
        {
        scr_stats_performAttack(conf, actor, false, NULL, true, true);
        hitTimer = conf[? "hitInterval"];
        }
    
    // Reset the timer //
    conf[? "hitTimer"] = hitTimer;
    
    // Return zero //
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

// POST DRAW //
else if (command == "finish") then 
    {
    return 0;
    }
