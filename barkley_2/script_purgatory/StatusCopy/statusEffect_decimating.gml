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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_decimating, _bullet);
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_decimating, 100);
    
    // These percs need to be defined here since the actor does not exist before this happens // 10% / 10 seconds / hitinterval //
    conf[? "life_perc"] = scr_stats_getEffectiveStat(actor, STAT_EFFECTIVE_MAX_HP) * 0.10 / (100 / 5);
    
    conf[? "hitInterval"] = 5;
    conf[? "hitTimer"] = 1;

    conf[? "timerTotal"] = 1;

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
    var currentDecimating = scr_statusEffect_getFromCombatActor(actor, statusEffect_decimating);
            
    // Status effect being applied when the actor does not have it currently //
    if (currentDecimating == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Visuals //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_decimating"),false,70);
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

    // The actual apex //
    if conf[? "timerTotal"] = 1 then 
        {
        conf[? "timerTotal"] = conf[? "timer"];
        conf[? "life_perc"] = scr_stats_getEffectiveStat(actor, STAT_EFFECTIVE_MAX_HP) * 0.10 / (conf[? "timerTotal"] / 5);
        }

    // Timer shyte //
    hitTimer -= dt();
    
    // Stat changes //
    if (hitTimer <= 0) then
        {
        // Copy attack stats into Conf so it can be used as an attack object
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_DMG_COSMIC] = conf[? "life_perc"];
        scr_stats_performAttack(atk, actor, false, NULL, true, true);
        hitTimer = conf[? "hitInterval"]; 
        
        //scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) - conf[? "life_perc"]);
        //scr_stats_createDamageIndicators(actor, conf[? "life_perc"], DAMAGETYPE_COSMIC, c_cosmic);               
        }
    
    // Get variables back for the next step coming up //
    conf[? "hitTimer"] = hitTimer;

    // Return zero //
    return false;
    }

// DRAW POST //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_TEMP);
    return 0;
    }

