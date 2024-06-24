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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_pushover, _bullet);
        
        // DURATION OF THIS AFFIX // 3 seconds + Affix power //
        conf[? "timer"] = floor(gun[? "pAffix"] / 10) + 20;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_pushover, 80);

    // Default values so there won't be undefined variable crashes //    
    conf[? "halvedKnock"] = scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_KNOCKBACK) * 0.5;
    conf[? "halvedWeight"] = scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT) * 0.5;
    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerStart"] = 0;
    conf[? "timerEnd"] = 0;

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
    var currentPushover = scr_statusEffect_getFromCombatActor(actor, statusEffect_pushover);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentPushover == -1)
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
        timer = max(timer, currentPushover[? "timer"]);
        currentPushover[? "timer"] = timer;
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
    // Change GLAMP Guts //
    if(changestat== STATGROUP_RESISTANCES)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_RESISTANCE_KNOCKBACK, scr_stats_getEffectiveStat(actor, STAT_BASE_RESISTANCE_KNOCKBACK) - conf[? "halvedKnock"]);
        }
        
    // Change Weight //
    if(changestat== STAT_BASE_WEIGHT)
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT) - conf[? "halvedWeight"]);
        }
        
    // Return zero //    
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then
    {
    scr_fx_statusDrawEffect(conf, actor, s_effect_affix_tubercular2);
    return 0;
    }
