// SETUP STUFF //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        // effectGrowth is how long in tenths of seconds effect takes to reach crest (maximum effect) -- it will increase during this time
        var effectGrowth = 50;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 100;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 30;
        // effectTimeDivisor is how much to divide the pAffix by when calculating base duration
        var effectTimeDivisor = 10;
        // effectGutsModifier is the percentage to modify Guts by, using the pAffix as the base
        effectGutsModifier = 7;
        // effectWeightModifier is the percentage to modify Weight by, using the pAffix as the base
        effectWeightModifier = 5;
        
        // APPLY THE AILMENT TO THE BULLET BEING FIRED //
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_tubercular, _bullet);
        
        // TOTAL DURATION OF THE AILMENT // GUN POWER + effectGrowth + effectCrest + effectDecay //
        conf[? "timer"]         = floor(gun[? "pAffix"] / effectTimeDivisor) + effectGrowth + effectCrest + effectDecay;
        conf[? "timerTotal"]    = conf[? "timer"];
        
        // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
        conf[? "timerStart"]    = conf[? "timer"] - effectGrowth; 
        
        /// LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
        conf[? "timerEnd"]      = effectDecay;
        
        // AFFIX POWER // THIS ONE IS USED FOR ALTERING GUTS // GUN STRENGTH / 7 AS PERCENT //
        conf[? "affixPower"]     = floor(gun[? "pAffix"] / effectGutsModifier) / 10;
        
        // AFFIX POWER 2 // THIS ONE IS USED FOR ALTERING WEIGHT // GUN STRENGTH / 5 AS PERCENT //
        conf[? "affixPower_2"]   = floor(gun[? "pAffix"] / effectWeightModifier) / 10; 
    }
    return 1;
}

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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_tubercular, 80);

    // Default values so there won't be undefined variable crashes //
    conf[? "affixPower"]        = 0;
    conf[? "affixPower_2"]      = 0;

    conf[? STAT_BASE_GUTS]      = 0;
    conf[? STAT_BASE_WEIGHT]    = 0;

    conf[? "perc_gut"]          = 0;
    conf[? "perc_wei"]          = 0;
    
    conf[? "hitInterval"]       = 5;
    conf[? "hitTimer"]          = 1;
    conf[? "hitNumber"]         = 10;
    conf[? "restorationNumber"] = 0;
    conf[? "drainSet"]          = false;

    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerStart"] = conf[? "timer"] - 50;
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

// DO THIS IF INFLICTED ACTOR DOES NOT EXIST //
else if (!instance_exists(actor)) then
    {
    return 0;
    }

// APPLY THIS AILMENT //
else if (command == "apply") 
    {
    // Check if actor already has the status effect //
    var currentTubercular = scr_statusEffect_getFromCombatActor(actor, statusEffect_tubercular);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentTubercular == -1)
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_tubercular"),false,70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentTubercular[? "timer"]);
        currentTubercular[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 
    
// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 4, 1);
    
    // Set the drain variables //
    if conf[? "drainSet"] = false then
        {
        conf[? "perc_gut"] = (scr_stats_getBaseStat(actor, STAT_BASE_GUTS) * (0.10 + conf[? "affixPower"])) / (50 / conf[? "hitInterval"]);
        conf[? "perc_wei"] = (scr_stats_getBaseStat(actor, STAT_BASE_WEIGHT) * (0.10 + conf[? "affixPower_2"])) / (50 / conf[? "hitInterval"]);
        conf[? "drainSet"] = true;
        }
        
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
            // Changes to the stats //
            conf[? STAT_BASE_GUTS] = conf[? STAT_BASE_GUTS] - (conf[? "perc_gut"]);
            conf[? STAT_BASE_WEIGHT] = conf[? STAT_BASE_WEIGHT] - (conf[? "perc_wei"]);
            
            // Reset interval stuff //
            hitTimer = conf[? "hitInterval"]; 
            restorationNumber += 1.666;       
            hitNumber -= 1;       
            }
        }
    
    // Return stats to actor // This happens during the last few seconds of the ailment //
    else if conf[? "timer"] <= conf[? "timerEnd"] then
        {
        // Timer ticks down //
        hitTimer -= dt();
    
        // Timer hits zero //
        if (hitTimer <= 0 and restorationNumber > 0) then
            {
            // Return stats to normal //
            conf[? STAT_BASE_GUTS] = conf[? STAT_BASE_GUTS] + (conf[? "perc_gut"]);
            conf[? STAT_BASE_WEIGHT] = conf[? STAT_BASE_WEIGHT] + (conf[? "perc_wei"]);
            
            // Reset itnerval stuff //
            hitTimer = conf[? "hitInterval"] * 0.6;    
            restorationNumber -= 1;       
            hitNumber += 1.666;   
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
    // Change GLAMP Guts //
    if(changestat== STATGROUP_BASICS)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS)       +conf[? STAT_BASE_GUTS]);
        }
        
    // Change Weight //
    if(changestat== STAT_BASE_WEIGHT)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT)   +conf[? STAT_BASE_WEIGHT]);
        }
        
    // Return zero //    
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_tubercular2);
    return 0;
    }

