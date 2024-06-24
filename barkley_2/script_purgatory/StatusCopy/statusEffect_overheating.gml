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
        var effectGrowth = 10;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 10;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 10;
        // effectTimeDivisor is how much to divide the pAffix by when calculating base duration
        var effectTimeDivisor = 2;
        // effectCyberDamageMultiplier is how much to multiply the pAffix by when calculating base effect strength
        var effectCyberDamageMultiplier = 2;
        // effectCyberDamageModifier is how much to add to the result of the pAffix * effectCyberDamageMultiplier
        var effectCyberDamageModifier = 40;
        
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_overheating, _bullet);
        
        // DAMAGE DEALT BY THIS AILMENT IF SUCCESSFUL //
        conf[? "cyberDamage"] = floor(gun[? "pAffix"] * effectCyberDamageMultiplier) + effectCyberDamageModifier;
        
        // DURATION OF THIS AILMENT //
        conf[? "timer"] = floor(gun[? "pAffix"] / effectTimeDivisor) + effectGrowth + effectCrest + effectDecay;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_overheating, 30);

    // Default values so there won't be undefined variable crashes //    
    conf[? "counter"] = 0;
    conf[? "cyberDamage"] = 50;
    
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
    var currentOverheat = scr_statusEffect_getFromCombatActor(actor, statusEffect_overheating);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentOverheat == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentOverheat[? "timer"]);
        currentOverheat[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // This is for the status effect visual flickering //
    scr_fx_statusFlicker(conf, 4, 1);
        
    // Reset //
    return false;
    }

// DAMAGE //
else if (command == "damage") then
    {
    // Increase counter //
    var count = conf[? "counter"];
    count += 1;
    if count >= 5 then
        {
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_DMG_CYBER] = conf[? "cyberDamage"];
        scr_stats_performAttack(atk, actor, false, NULL, true, true);
        count = -5
        conf[? "timer"] = conf[? "timerTotal"];
        }
    conf[? "counter"] = count;
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then
    {
    scr_fx_statusDrawEffect(conf, actor, s_effect_affix_malnourished);
    return 0;
    }
