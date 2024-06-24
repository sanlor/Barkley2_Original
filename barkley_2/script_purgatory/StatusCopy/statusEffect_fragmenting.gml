// SETUP STUFF //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var effectGrowth = 0;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 50;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 50;
        // effectTimeDivisor is how much to divide the pAffix by when calculating base duration
        var effectTimeDivisor = 10;
        // effectGLAMPModifier is the percentage to modify GLAMP by, using the pAffix as the base
        effectGLAMPModifier = 7;
        // effectGLAMPModifierBasePercentage is the base percentage to decrease GLAMP by -- it is not affected by pAffix
        effectGLAMPModifierBasePercentage = 50;
        // effectCYBRESModifier is the percentage to modify (incrase) CyberRes by, using the pAffix as the base -- formula multiplies
        effectCYBRESModifier = 3;
        
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_fragmenting, _bullet);
        
        // TOTAL DURATION //
        conf[? "timer"]         = floor(gun[? "pAffix"] / effectTimeDivisor) + effectGrowth + effectCrest + effectDecay;
        conf[? "timerTotal"]    = conf[? "timer"];
        
        // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
        conf[? "timerStart"]    = conf[? "timer"] - effectGrowth; 
        
        /// LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
        conf[? "timerEnd"]      = effectDecay;
        
        
        // AFFIX POWER // THIS DETERMINES HOW MUCH GLAMP DROPS BY , starting with 50 percent//
        conf[? "affixPower"]     = floor(gun[? "pAffix"] / effectGLAMPModifier) + effectGLAMPModifierBasePercentage;
        
        
        // Increase CYBER RES //
        conf[? "affixPower_2"]   = floor(gun[? "pAffix"] * effectCYBRESModifier) ;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_fragmenting, 80);

    // Default values so there won't be undefined variable crashes //
    conf[? "affixPower"] = 0;

    conf[? "resistanceAll"] = 0;
    
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
    var currentWithering = scr_statusEffect_getFromCombatActor(actor, statusEffect_fragmenting);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentWithering == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_withering"),false,70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentWithering[? "timer"]);
        currentWithering[? "timer"] = timer;
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
            conf[? "resistanceAll"] = conf[? "resistanceAll"] - (conf[? "affixPower"]);
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
            conf[? "resistanceAll"] = conf[? "resistanceAll"] + (conf[? "affixPower"]);
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
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_BIO) + conf[? "resistanceAll"]);  
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_CYBER) + conf[? "resistanceAll"]);  
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_MENTAL) + conf[? "resistanceAll"]);  
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_ZAUBER) + conf[? "resistanceAll"]);  
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_COSMIC) + conf[? "resistanceAll"]);   
        }
        
    // Return zero //
    return 0;
    }

// DRAW POST //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_withering);
    return 0;
    }
