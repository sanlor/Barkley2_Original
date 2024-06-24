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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_slurp, _bullet);
        conf[? "lifesteal"] = (floor(gun[? "pAffix"] / 2) + 4);
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;
var popup = false;

// GENERATE SOME DEFAULT VALUES //
if (command == "generate") then 
    {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_slurp, 55);
    
    conf[? "lifesteal"] = 5;
    conf[? "slurpTimer"] = 10;
    conf[? "slurpTimerReset"] = 10;
    
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
    var currentLifesteal = scr_statusEffect_getFromCombatActor(actor, statusEffect_slurp);
        
    // Status effect being applied when the actor does not have it currently //
    if (currentLifesteal == -1) then 
        {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);           
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentLifesteal[? "timer"]);
        currentLifesteal[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STATUS EFFECT STEP //
else if (command == "step") then
    {
    // Slurp strength //
    var lifestealamount = conf[? "lifesteal"];
    var slurpTimer = conf[? "slurpTimer"]
    
    // Slurp //
    if slurpTimer > 0 then
        {
        // Tick down //
        slurpTimer -= dt();
        
        // Event //
        if slurpTimer <= 0 then
            {
            // Reset timer //
            slurpTimer = conf[? "slurpTimerReset"];
            
            // Does enemy have enough health? //
            if scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) >= lifestealamount then
                {
                scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, scr_stats_getCurrentStat(actor, STAT_CURRENT_HP)-lifestealamount);
                scr_stats_createDamageIndicators(actor,lifestealamount,DAMAGETYPE_BIO,c_red);
                scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP)+lifestealamount);
                scr_stats_createDamageIndicators(o_hoopz,0-lifestealamount,DAMAGETYPE_BIO,c_bio);
                }
                
            // If it doesn't... then just kill it //
            else
                {
                lifestealamount = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);
                scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, 0);
                scr_stats_createDamageIndicators(actor,lifestealamount,DAMAGETYPE_BIO,c_red);
                scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP)+lifestealamount);
                scr_stats_createDamageIndicators(o_hoopz,0-lifestealamount,DAMAGETYPE_BIO,c_bio);
                }  
            }
        }
        
    // Reset vars //
    conf[? "slurpTimer"] = slurpTimer;
    
    return 0;
    }
