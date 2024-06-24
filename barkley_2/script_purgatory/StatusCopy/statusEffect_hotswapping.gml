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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_hotswapping, _bullet);
            
        // TOTAL DURATION OF THE AILMENT // 
        conf[? "timer"] = floor(gun[? "pAffix"] / 5) + 60;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_hotswapping, 80);
    
    // Default values so there won't be undefined variable crashes //
    conf[? "guts"] = scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS);
    conf[? "luck"] = scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK);
    conf[? "agile"] = scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE);
    conf[? "might"] = scr_stats_getEffectiveStat(actor, STAT_BASE_MIGHT);        
    conf[? "piety"] = scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY);

    var shuffle = ds_list_create();
    ds_list_add(shuffle, conf[? "guts"]);
    ds_list_add(shuffle, conf[? "luck"]);
    ds_list_add(shuffle, conf[? "agile"]);
    ds_list_add(shuffle, conf[? "might"]);
    ds_list_add(shuffle, conf[? "piety"]);
    ds_list_shuffle(shuffle);
    
    conf[? "guts"] = ds_list_find_value(shuffle, 0);
    conf[? "luck"] = ds_list_find_value(shuffle, 1);
    conf[? "agile"] = ds_list_find_value(shuffle, 2);
    conf[? "might"] = ds_list_find_value(shuffle, 3);
    conf[? "piety"] = ds_list_find_value(shuffle, 4);
    
    ds_list_destroy(shuffle);
        
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
    var currentMalnourished = scr_statusEffect_getFromCombatActor(actor, statusEffect_hotswapping);
    
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
    // Change GLAMP stats //
    if (changestat== STATGROUP_BASICS) then
        {
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, conf[? "guts"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, conf[? "luck"]);        
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, conf[? "agile"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, conf[? "might"]);
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, conf[? "piety"]);
        }
        
    // Return zero //
    return 0;
    }

// POST DRAW //
else if (command == "draw_post") then
    {
    // DEBUG //
    draw_text(actor.x, actor.y - 96, conf[? "guts"]);
    draw_text(actor.x + 16, actor.y - 96, conf[? "luck"]);
    draw_text(actor.x + 32, actor.y - 96, conf[? "agile"]);
    draw_text(actor.x + 48, actor.y - 96, conf[? "might"]);
    draw_text(actor.x + 64, actor.y - 96, conf[? "piety"]);
    return 0;
    }

