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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_dooming, _bullet);
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
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_dooming, 600);

    conf[? "timeCounter"] = 10;
    conf[? "counter"] = 10;
    
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
    var currentZaubric = scr_statusEffect_getFromCombatActor(actor, statusEffect_dooming);
        
    // Status effect being applied when the actor does not have it currently //
    if (currentZaubric == -1) then
        {    
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);

        // Visual //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_zaubric"),false,70);
        effect_affix = instance_create(actor.x, actor.y - actor.z - ailmentTotem_core_y_get(actor), o_effect_affix_zaubric);
        effect_affix.target = actor;  
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then 
    {
    // -- Effect to perform each step -- 
    var counterTotal = conf[? "timeCounter"];
    var counter = conf[? "counter"];
    
    // TICK DOWN //
    if counter > 0 then 
        {
        // TICK DOWN //
        counter -= dt();
        
        // EVENT //
        if counter <= 0 then
            {       
            // TICK DOWN //
            counterTotal -= 1;
            counter = 10;
            
            // DOOMED //
            if counterTotal <= 0 then
                {     
                // Get damage //
                total = scr_stats_getEffectiveStat(actor, STAT_EFFECTIVE_MAX_HP);
                
                // DEAL DAMAGE //
                var atk = scr_stats_newAttackStats();
                atk[? STAT_ATTACK_DMG_CYBER] = total;
                scr_stats_performAttack(atk, actor, false, NULL, true, true);
                
                // END AILEMNT //
                conf[? "timer"] = 0;
                }
            }
        }
    
    // RESET VARS //
    conf[? "timeCounter"] = counterTotal;
    conf[? "counter"] = counter;
    return 0;
    }
