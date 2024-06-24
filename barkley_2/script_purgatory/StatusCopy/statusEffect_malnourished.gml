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
        var effectGrowth = 30;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 100;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 30;
        
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_malnourished, _bullet);
        
        // TOTAL DURATION OF THE AILMENT // GUN AMOUNT + 5 SECONDS + 6 SECONDS FOR THE DROP/RESTORE //
        conf[? "timer"]         = floor(gun[? "pAffix"] / 10) + effectGrowth + effectCrest + effectDecay;
        conf[? "timerTotal"]    = conf[? "timer"];
        
        // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
        conf[? "timerStart"]    = conf[? "timer"] - effectGrowth; 
        
        // LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
        conf[? "timerEnd"]      = effectDecay;
        
        // AFFIX POWER // THIS DECIDES THE OVERALL STRENGTH OF THIS AFFIX // 
        // TOTAL DROP IN STATS IS GUN STRENGTH + 5 PERCENT //
        conf[? "affixPower"]    = (floor(gun[? "pAffix"] / 7) + 5) / 100; 
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_malnourished, 80);
    
    // Default values so there won't be undefined variable crashes //
    conf[? "affixPower"]        = 0;

    conf[? "guts"]              = 0;
    conf[? "might"]             = 0;
    conf[? "agile"]             = 0;
    conf[? "luck"]              = 0;
    conf[? "piety"]             = 0;

    conf[? "perc_gut"]          = 0;
    conf[? "perc_mig"]          = 0;
    conf[? "perc_agi"]          = 0;
    conf[? "perc_luc"]          = 0;
    conf[? "perc_pie"]          = 0;
    
    conf[? "hitInterval"]       = 5;
    conf[? "hitTimer"]          = 1;
    conf[? "hitNumber"]         = 6;
    conf[? "restorationNumber"] = 0;
    conf[? "drainSet"]          = false;

    conf[? "timerTotal"]        = conf[? "timer"];
    conf[? "timerStart"]        = conf[? "timer"] - 30;
    conf[? "timerEnd"]          = 30;

    conf[? "effectImage"]               = 0;
    conf[? "effectImageMin"]            = 0;
    conf[? "effectImageMax"]            = 5;
    conf[? "effectY"]                   = 0;
    conf[? "effectFlickerTimer"]        = 0;
    conf[? "effectFlickerTimerReset"]   = 5;
    conf[? "effectFlickerToggle"]       = 1;
    conf[? "effectSprite"]              = s_effect_affix_TEMP;

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
    var currentMalnourished = scr_statusEffect_getFromCombatActor(actor, statusEffect_malnourished);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentMalnourished == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_malnourished"), false, 70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentMalnourished[? "timer"]);
        currentMalnourished[? "timer"] = timer;
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
    var restorationNumber = conf[? "restorationNumber"];
    
    // Set the drain variables //
    if conf[? "drainSet"] = false then
        {
        conf[? "perc_gut"] = (scr_stats_getBaseStat(actor, STAT_BASE_GUTS) * conf[? "affixPower"]) / conf[? "hitNumber"];
        conf[? "perc_luc"] = (scr_stats_getBaseStat(actor, STAT_BASE_LUCK) * conf[? "affixPower"]) / conf[? "hitNumber"];
        conf[? "perc_agi"] = (scr_stats_getBaseStat(actor, STAT_BASE_AGILE) * conf[? "affixPower"]) / conf[? "hitNumber"];
        conf[? "perc_mig"] = (scr_stats_getBaseStat(actor, STAT_BASE_MIGHT) * conf[? "affixPower"]) / conf[? "hitNumber"];
        conf[? "perc_pie"] = (scr_stats_getBaseStat(actor, STAT_BASE_PIETY) * conf[? "affixPower"]) / conf[? "hitNumber"];
        conf[? "drainSet"] = true;
        }   
    
    // Drain stats from actor // This happens on the first few seconds of the ailment //
    if conf[? "timer"] >= conf[? "timerStart"] then
        {
        // Timer ticks down //
        hitTimer -= dt();
    
        // Timer hits zero and there are hits left //
        if (hitTimer <= 0 and hitNumber > 0) then
            {
            // Percent changes to the stats //
            conf[? "guts"] = conf[? "guts"]     - (conf[? "perc_gut"]);
            conf[? "might"] = conf[? "might"]   - (conf[? "perc_mig"]);
            conf[? "agile"] = conf[? "agile"]   - (conf[? "perc_agi"]);
            conf[? "luck"] = conf[? "luck"]     - (conf[? "perc_luc"]);
            conf[? "piety"] = conf[? "piety"]   - (conf[? "perc_pie"]);        
            
            // Reset interval stuff //
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
            conf[? "guts"] = conf[? "guts"]     + (conf[? "perc_gut"]);
            conf[? "might"] = conf[? "might"]   + (conf[? "perc_mig"]);
            conf[? "agile"] = conf[? "agile"]   + (conf[? "perc_agi"]);
            conf[? "luck"] = conf[? "luck"]     + (conf[? "perc_luc"]);
            conf[? "piety"] = conf[? "piety"]   + (conf[? "perc_pie"]);
            
            // Reset interval stuff //
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
    // Change GLAMP stats //
    if (changestat== STATGROUP_BASICS) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS)     +conf[? "guts"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK)     +conf[? "luck"]);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE)   +conf[? "agile"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_MIGHT)   +conf[? "might"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY)   +conf[? "piety"]);
        }
        
    // Return zero //
    return 0;
    }
// POST DRAW //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, conf[? "effectSprite"]);
    return 0;
    }
