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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_godless, _bullet);
        
        // DURATION OF THE AILMENT //
        conf[? "timer"] = (gun[? "pAffix"]/10) + 100;
        conf[? "timerTotal"] = conf[? "timer"];
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_godless, 80);
    
    // Default values so there won't be undefined variable crashes //
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 5;
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
    var currentGodless = scr_statusEffect_getFromCombatActor(actor, statusEffect_godless);
            
    // Status effect being applied when the actor does not have it currently //
    if (currentGodless == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_godless"),false,70);
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentGodless[? "timer"]);
        currentGodless[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 0, 0.75);
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {
    // Change GLAMP stats //
    if (changestat== STATGROUP_BASICS) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, min(scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY), 1));
        }
        
    // Return zero //
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_godless);
    return 0;
    }
