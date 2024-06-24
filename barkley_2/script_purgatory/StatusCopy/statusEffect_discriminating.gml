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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_discriminating, _bullet);
            
        // DAMAGE DEALT PER COMBAT ACTOR //
        conf[? "damageIncrease"] = (floor(gun[? "pAffix"] / 2) + 5);
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_discriminating, 1);

    // Default values so there won't be undefined variable crashes //    
    conf[? "damageIncrease"] = 5;
    
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
    var currentDiscriminate = scr_statusEffect_getFromCombatActor(actor, statusEffect_discriminating);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentDiscriminate == -1) then
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Calculate damage //
        // Number of combat actors within 200 range //
        dis_count = 0;
        if instance_exists(CombatActor) then
            {
            with CombatActor
                {
                if instance_exists(PlayerCombatActor) then 
                    {
                    if distance_to_object(PlayerCombatActor) <= 200 then other.dis_count += 1;
                    }
                }
            }        
        var damage = dis_count * conf[? "damageIncrease"];
        
        // Deal damage //
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_DMG_MENTAL] = damage;
        scr_stats_performAttack(atk, actor, false, NULL, true, true);
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
