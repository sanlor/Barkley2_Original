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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_antisocial, _bullet);
        
        // SLOWDOWN INCREASE PER COMBAT ACTOR //
        conf[? "slowIncrease"] = 0.05;
        
        // DURATION OF THIS AFFIX // 3 seconds + Affix power //
        conf[? "timer"] = floor(gun[? "pAffix"] / 10) + 50;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_antisocial, 1);

    // Default values so there won't be undefined variable crashes //    
    conf[? "slowIncrease"] = 0.02;
    conf[? "slowdown"] = 0;
    
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
    var currentDiscriminate = scr_statusEffect_getFromCombatActor(actor, statusEffect_antisocial);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentDiscriminate == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentDiscriminate[? "timer"]);
        currentDiscriminate[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // Calculate slowdown //
    dis_count = 0;
    target = actor;
    if instance_exists(CombatActor) then
        {
        with CombatActor
            {
            if distance_to_object(other.target) <= 150 then other.dis_count += 1;
            }
        }        
    var slowdown = dis_count * conf[? "slowIncrease"];
    conf[? "slowdown"] = slowdown;
    
    // Reset //
    return false;
    }

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {    
    // Change SPEED //
    if (changestat == STAT_BASE_SPEED) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_SPEED, scr_stats_getEffectiveStat(actor, STAT_BASE_SPEED) * conf[? "slowdown"]);
        }
        
    // Return zero //
    return 0;
    }
