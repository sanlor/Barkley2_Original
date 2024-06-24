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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_hiccuping, _bullet);
        
        // TOTAL DURATION OF THE AILMENT // 
        conf[? "timer"] = floor(gun[? "pAffix"] / 5) + 60;
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3; // Used only when command = "changestat"

// GENERATE BASIC INFO //
if (command == "generate") then
    {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_hiccuping, 60);

    // Basic data to prevent undefined variable crashes //
    conf[? "hitTimer"] = 5;
    conf[? "hitInterval"] = 20;
    conf[? "hitTimer2"] = 10;
    conf[? "hitInterval2"] = 20;
    conf[? "slowdown"] = 1;

     // Return configuration //
    return conf;
    }

// CHECK IF ACTOR EXISTS OR NOT //
else if (!instance_exists(actor)) then
    {
    return 0;
    }

// APPLY THIS AILMENT //
else if (command == "apply") then
    {    
    // Check if actor already has the status effect //
    var currentHiccup = scr_statusEffect_getFromCombatActor(actor, statusEffect_hiccuping);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentHiccup == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentHiccup[? "timer"]);
        currentHiccup[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STEP //
else if (command == "step") then
    {
    // Variables //
    var hitTimer = conf[? "hitTimer"];
    var hitTimer2 = conf[? "hitTimer2"];
    
    // Tick down //
    hitTimer -= dt();
    hitTimer2 -= dt();
    
    // Slowdown //
    if (hitTimer <= 0) 
        {
        conf[? "slowdown"] = 0.25;
        hitTimer  = conf[? "hitInterval"];
        
        // Effect //
        repeat (10) instance_create(actor.x, actor.y, o_effect_affix_adhesive);
        }
        
    // Restore //
    if (hitTimer2 <= 0) 
        {
        conf[? "slowdown"] = 1;
        hitTimer2  = conf[? "hitInterval2"];
        }
        
    // Reset variables //
    conf[? "hitTimer"] = hitTimer;
    conf[? "hitTimer2"] = hitTimer2;
    return 0;
    }

// CHANGESTATS //
else if (command == "changestat") then
    {
    if (changestat == STAT_BASE_SPEED) then 
        {
        scr_stats_setEffectiveStat( actor, STAT_BASE_SPEED, scr_stats_getEffectiveStat( actor, STAT_BASE_SPEED ) * conf[? "slowdown"] );
        }    
    return 0;
    }

// DRAW //
else if (command == "draw") then
    {
    image_blend = make_color_rgb(230, 255, 230);
    return 0;
    }
