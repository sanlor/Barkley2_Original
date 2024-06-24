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
        var effectGrowth = 30;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 50;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 30;
        // effectTimeDivisor is how much to divide the pAffix by when calculating base duration
        var effectTimeDivisor = 5;

        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_equalizing, _bullet);
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_equalizing, 80);

    conf[? "randomizer"] = irandom(4);
    
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
    var currentMalnourished = scr_statusEffect_getFromCombatActor(actor, statusEffect_equalizing);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentMalnourished == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_malnourished"), false, 70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentMalnourished[? "timer"]);
        currentMalnourished[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STAT CHANGES GET PROCESSED HERE //
else if (command == "changestat") then
    {       
    if changestat = STATGROUP_BASICS then
        { 
        var randomizer = conf[? "randomizer"];
        switch (randomizer)
            {
            case 0:
                scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, 1);
                scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, 100);
            break;
            case 1:
                scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, 1);
                scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, 100);
            break;
            case 2:
                scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, 1);
                scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, 100);
            break;
            case 3:
                scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, 1);
                scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, 100);
            break;
            case 4:
                scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, 1);
                scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, 100);
            break;
            }
        }
    
    // Return zero //
    return 0;
    }


// AILMENT ENDS //
else if (command == "finish") then  
    {
    // GUTS increase doublecheck //
    var hpc = scr_stats_getEffectiveStat(actor, STAT_CURRENT_HP);
    var hpm = scr_stats_getEffectiveStat(actor, STAT_EFFECTIVE_MAX_HP);
    if hpc > hpm then scr_stats_setEffectiveStat(actor, STAT_CURRENT_HP, hpm); 
    return 0;
    }
