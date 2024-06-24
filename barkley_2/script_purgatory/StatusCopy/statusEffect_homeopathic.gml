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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_homeopathic, _bullet);
            
        // DURATION OF THIS AILMENT //
        conf[? "timer"] = 80;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_homeopathic, 80);
    
    conf[? "hplimit"] = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);
    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "timerStart"] = 0
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
    
// IF ACTOR DOES NOT EXIST RETURN 0 //
else if (!instance_exists(actor)) then
    {
    return 0;
    }
    
// APPLY THIS STATUS EFFECT //
else if (command == "apply") then
    {
    // Check if actor already has the status effect //
    var currentHomeo = scr_statusEffect_getFromCombatActor(actor, statusEffect_homeopathic);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentHomeo == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentHomeo[? "timer"]);
        currentHomeo[? "timer"] = timer;
        }
        
    // Return zero //     
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 6, 1);
    var limit = conf[? "hplimit"];
    
    // HP limit // 
    if scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) > limit then scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, limit); 
    if scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) < limit then conf[? "hplimit"] = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);  
    
    // Return zero // 
    return 0;
    }

// DRAW POST //
else if (command == "draw_post") then
    {
    //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_withering);
    return 0;
    }
