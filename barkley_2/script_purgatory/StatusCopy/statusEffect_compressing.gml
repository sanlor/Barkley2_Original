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
        var effectCrest = 70;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 30;
        
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_compressing, _bullet);
        
        // TOTAL DURATION //
        conf[? "timer"]         = floor(gun[? "pAffix"] / 10) + effectGrowth + effectCrest + effectDecay;
        conf[? "timerTotal"]    = conf[? "timer"];
        
        // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
        conf[? "timerStart"]    = conf[? "timer"] - effectGrowth; 
        
        // LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
        conf[? "timerEnd"]      = effectDecay;
        
        // AFFIX POWER // THIS DETERMINES HOW MUCH THE ARMOR DROPS //
        conf[? "resistanceNormal"] = -(floor(gun[? "pAffix"] / 4) + effectGrowth); 
        
        // AFFIX POWER 2 // THIS DETERMINES HOW MUCH THE WEIGHT DROPS //
        conf[? "weight"]  = -floor(gun[? "pAffix"] / 4);
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_compressing, 50);
    
    // Default values so there won't be undefined variable crashes //    
    conf[? "resistanceNormal"]  = 0;
    conf[? "weight"]            = 0;
    
    conf[? "timerTotal"] = conf[? "timer"];

    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 4;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;

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
    var currentCompressing = scr_statusEffect_getFromCombatActor(actor, statusEffect_compressing);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentCompressing == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect on apply //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_compressing"),false,70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentCompressing[? "timer"]);
        currentCompressing[? "timer"] = timer;
        }
    
    // Return zero //
    return 0;
    } 
    
// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 4, 1);
    
    // Return zero //
    return false;
    }
    
// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change RESISTANCES //
    if(changestat== STATGROUP_RESISTANCES)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_NORMAL, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_NORMAL) + conf[? "resistanceNormal"]);
        }
        
    // Change WEIGHT //
    if(changestat== STAT_BASE_WEIGHT)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT) + conf[? "weight"]);
        }
        
    // Return zero //
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then 
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_TEMP);
    return 0;
    }
