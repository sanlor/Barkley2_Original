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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_formatting, 80);

    // Default values so there won't be undefined variable crashes //
    conf[? "affixPower"] = 1;
    
    conf[? STAT_BASE_RESISTANCE_CYBER] = 0;
    
    conf[? "hitInterval"] = 5;
    conf[? "hitTimer"] = 1;
    conf[? "hitNumber"] = 14;
    conf[? "restorationNumber"] = 0;

    conf[? "timerTotal"] = conf[? "timer"];

    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 4;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;

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
    var currentFormatting = scr_statusEffect_getFromCombatActor(actor, statusEffect_formatting);
            
    // Status effect being applied when the actor does not have it currently //        
    if (currentFormatting == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_formatting"),false,70);
        }
    else {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentFormatting[? "timer"]);
        currentFormatting[? "timer"] = timer;
        }
        
    // Return zero //  
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 4, 1);
    
    // Set up some variables needed down below //
    var hitTimer = conf[? "hitTimer"];
    var hitNumber = conf[? "hitNumber"];
    
    // Drain stats from actor // This happens on the first few seconds of the ailment //
    if conf[? "timer"] >= conf[? "timerStart"] then
        {
        // Timer ticks down //
        hitTimer -= dt();
    
        // Timer hits zero and there are hits left //
        if (hitTimer <= 0 and hitNumber > 0) then
            {
            conf[? STAT_BASE_RESISTANCE_CYBER] = conf[? STAT_BASE_RESISTANCE_CYBER] - (conf[? "affixPower"]);
            hitTimer = conf[? "hitInterval"];      
            hitNumber -= 1;        
            }
        }
    
    // Get variables back for the next step coming up //
    conf[? "hitTimer"] = hitTimer;
    conf[? "hitNumber"] = hitNumber;
    
    // Return zero //
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change RESISTANCES //
    if(changestat== STATGROUP_RESISTANCES)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER) + conf[? STAT_BASE_RESISTANCE_CYBER]);   
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
    
// DRAW POST //
else if (command == "draw_post") then
    {
    scr_fx_statusDrawEffect(conf, actor, s_effect_affix_TEMP);
    return 0;
    }

// AILMENT ENDS //
else if (command == "finish") then
    {
    return 0;
    }
