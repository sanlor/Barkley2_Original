/// scr_combat_weapons_prefix2_stupefying(action, bulletOrNoone, gunOrNull)
/*
// SETUP //
var _action = argument0;
var _bullet = argument1;
var gun = argument2;
var _retvar = 0;

// MINUS - MENTAL - PROPERTIES //    
switch(_action)
{
    // APPLY //
    case "apply": break;
    
    // APPLY TO BULLET //
    case "applyBullet":
    
        // CHARGED SHOT //
        if (gun[? "pChargeRatio"]==1) then
            {
            /// DEV NOTES ///
            // Drops MENTAL resistance over time. First 3 seconds is a drain, last 3 seconds is a restoration //
            // time to "trough" is 3 seconds, trough = floor(affx/10)+5 seconds, then regains for 3 seconds,
            // power of "trough" is bioRES -= affix + 5
            
            // SETUP CONF VARIABLE //
            var conf;
            
            // APPLY THIS AILMENT TO THE BULLET BEING FIRED //
            conf = scr_statusEffect_addToCombatAttack(statusEffect_stupefying, _bullet);
            
            // TOTAL DURATION //
            conf[? "timer"]         = floor(gun[? "pAffix"] / 10) + 50 + 60;
            conf[? "timerTotal"]    = conf[? "timer"];
            
            // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
            conf[? "timerStart"]    = conf[? "timer"] - 30; 
            
            /// LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
            conf[? "timerEnd"]      = 30;
            
            // AFFIX POWER // THIS DETERMINES HOW MUCH THE MENTAL RESISTANCE DROPS //
            conf[? "affixPower"]    = (floor(gun[? "pAffix"]) + 5) / 6;
            
            // FOR THIS AFFIX USE A     / 6     AT THE END OF THE AFFIX POWER FORMULA TO DIVIDE IT INTO 6 TICKS //
            }
    break;
        
    // AFFIX VALUE //
    case "checkval":
        _retvar = 20;
    break;
}
// end
return _retvar;
// SETUP STUFF //
/*
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_stupefying, 80);

    // Default values so there won't be undefined variable crashes //
    conf[? "affixPower"] = 0;
    conf[? "brainPointMod"] = -1;
    
    conf[? "resistanceMental"] = 0;
    
    conf[? "hitInterval"] = 5;
    conf[? "hitTimer"] = 1;
    conf[? "hitNumber"] = 6;
    conf[? "restorationNumber"] = 0;

    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerStart"] = conf[? "timer"] - 30;
    conf[? "timerEnd"] = 30;

    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 9;
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
    var currentStupefying = scr_statusEffect_getFromCombatActor(actor, statusEffect_stupefying);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentStupefying == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Change BRAINPOINTS //
        var attacker = conf[? "attackingEntity"];
        
        actor.AI_decisionFrequency = scr_stats_brainpoints_getThinkfluencing(attacker, 
            actor, conf[? "brainPointMod"]);
    
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_withering"),false,70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentStupefying[? "timer"]);
        currentStupefying[? "timer"] = timer;
        }
        
    // Return zero //    
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 6, 1);
    
    // Set up some variables needed down below //
    var hitTimer = conf[? "hitTimer"];
    var hitNumber = conf[? "hitNumber"];
    var restorationNumber = conf[? "restorationNumber"];

    // Drain stats from actor // This happens on the first few seconds of the ailment //
    if conf[? "timer"] >= conf[? "timerStart"] then
        {
        // Timer ticks down //
        hitTimer -= dt();
    
        // Timer hits zero and there are hits left //
        if (hitTimer <= 0 and hitNumber > 0) then
            {
            conf[? "resistanceMental"] = conf[? "resistanceMental"] - (conf[? "affixPower"]);
            hitTimer = conf[? "hitInterval"]; 
            restorationNumber += 1;       
            hitNumber -= 1;       
            }
        }
    
    // Return stats to actor // This happens during the last few seconds of the ailment //
    else if conf[? "timer"] <= conf[? "timerEnd"] then
        {
        // Timer ticks down //
        hitTimer -= dt();
    
        // Timer hits zero and there are restorations left //
        if (hitTimer <= 0 and restorationNumber > 0) then
            {
            // Percent changes to the stats //
            conf[? "resistanceMental"] = conf[? "resistanceMental"] + (conf[? "affixPower"]);
            hitTimer = conf[? "hitInterval"]; 
            restorationNumber -= 1;       
            hitNumber += 1;      
            }
        }
    
    // Get variables back for the next step coming up //
    conf[? "hitTimer"] = hitTimer;
    conf[? "hitNumber"] = hitNumber;
    conf[? "restorationNumber"] = restorationNumber;
    
    // Return zero //
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change RESISTANCES //
    if(changestat== STATGROUP_RESISTANCES)
        {
        //scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL) + conf[? "resistanceMental"]);   
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
    scr_fx_statusDrawEffect(conf, actor, s_effect_affix_withering);
    return 0;
    }

// AILMENT ENDS //
else if (command == "finish") then
    {
    // Reset BRAINPOINTS to normal
    
    var attacker = conf[? "attackingEntity"];
    actor.AI_decisionFrequency = scr_stats_brainpoints_getThinkfluencing(attacker, 
            actor, 0);
        
    return 0;
    }
