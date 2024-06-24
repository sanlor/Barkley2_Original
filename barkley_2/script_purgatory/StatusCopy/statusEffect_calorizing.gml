// SETUP STUFF //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_calorizing, _bullet);
        conf[? "weight"] = floor(gun[? "pAffix"] / 4) + 5;
        conf[? "weightDecrease"] = conf[? "weight"] / 20;
        conf[? "heal"] = floor(gun[? "pAffix"] / 10) + 2;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_calorizing, 100);
    
    // Default values so there won't be undefined variable crashes //
    conf[? "weight"]            = 10;
    conf[? "weightDecrease"]    = 1;
    conf[? "heal"]              = 3;
    
    conf[? "hitInterval"]       = 5;
    conf[? "hitTimer"]          = 1;

    conf[? "timerTotal"]        = conf[? "timer"];
    conf[? "timerStart"]        = 0;
    conf[? "timerEnd"]          = 0;

    conf[? "effectImage"]       = 0;
    conf[? "effectImageMin"]    = 0;
    conf[? "effectImageMax"]    = 4;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"]        = 0;
    conf[? "effectFlickerTimerReset"]   = 5;
    conf[? "effectFlickerToggle"]       = 1;

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
    var currentPagan = scr_statusEffect_getFromCombatActor(actor, statusEffect_calorizing);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentPagan == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_malnourished"), false, 60);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentPagan[? "timer"]);
        currentPagan[? "timer"] = timer;
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
    var weight = conf[? "weight"];
    var weightDecrease = conf[? "weightDecrease"];
    
    // Timer ticks down //
    hitTimer -= dt();

    // Timer hits zero and there are hits left //
    if (hitTimer <= 0) then
        {
        // Percent changes to the stats //
        if weight > 0 then weight -= weightDecrease;
        else weight = 0;    
        
        // Reset interval stuff //
        hitTimer = conf[? "hitInterval"]; 
        
        // Heal //
        var healamount = conf[? "heal"];
        scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, scr_stats_getCurrentStat(actor, STAT_CURRENT_HP)+healamount);
        scr_stats_createDamageIndicators(actor,0-healamount,DAMAGETYPE_NORMAL,c_teal);
        heal = instance_create(actor.x, actor.y, o_effect_affix_heal); 
        heal.target = actor;
        }
            
    // Get variables back for the next step coming up //
    conf[? "hitTimer"] = hitTimer;
    conf[? "weight"] = weight;
    
    // Return zero //
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change GLAMP stats //
    if (changestat== STAT_BASE_WEIGHT) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT) + conf[? "weight"]);
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
    scr_fx_statusDrawEffect(conf, actor, s_effect_affix_malnourished);
    return 0;
    }

// AILMENT ENDS //
else if (command == "finish") then  
    {
    return 0;
    }
