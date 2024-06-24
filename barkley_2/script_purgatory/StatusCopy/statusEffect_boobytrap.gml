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
        conf = scr_statusEffect_addToCombatAttack(statusEffect_boobytrap, _bullet);
        conf[? "explosionDamage"] = scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL) + 50;
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;

// GENERATE BASIC INFO //
if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_boobytrap, 20);
    
    // Basic data to prevent undefined variable crashes //
    conf[? "explosionDamage"] = 50;
    
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
    var currentBooby = scr_statusEffect_getFromCombatActor(actor, statusEffect_boobytrap);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentBooby == -1) then
        {
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Sound effect when applied //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_thorns"), false, 70);
        }
    else 
        {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, currentBooby[? "timer"]);
        currentBooby[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// STEP //
else if (command == "step") then
    {
    return 0;
    }

// CHANGESTATS //
else if (command == "changestat") then
    {
    return 0;
    }

// DAMAGE //
else if (command == "damage") then
    {
    return 0;
    }

// DRAW //
else if (command == "draw") then
    {
    // Return zero //
    return 0;
    }

// END OF THE AILMENT //
else if (command == "finish") then
    {
    // TODO //
    // Put explosion here //
    var bomb = instance_create(actor.x, actor.y, o_explosion);
    bomb.z = 0;
    bomb.sprite_index = s_effect_explo_32;
    scr_stats_setAttackStat(bomb, STAT_ATTACK_DMG_NORMAL, conf[? "explosionDamage"]);
    scr_stats_setAttackStat(bomb, STAT_ATTACK_KNOCKBACK, 20);
    ds_list_copy(bomb.target_list, target_list);
    //explode.weapon_from = weapon_from;
    
    // Play sound when applied //
    audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_thorns"),false,70);
      
    // Return zero //  
    return 0;
    }
