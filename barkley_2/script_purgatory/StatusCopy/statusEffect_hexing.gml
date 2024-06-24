// Compares your health when you got the ailment to what it is when it ends and //
// deals damage equal to their difference // ZAUBER DAMAGE //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_hexing, _bullet);
        
        // TOTAL DURATION OF THE AILMENT // 
        conf[? "timer"] = floor(gun[? "pAffix"] / 5) + 30;
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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_hexing, 30);
    
    // Basic data to prevent undefined variable crashes //
    conf[? "healthStart"] = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);
    conf[? "healthEnd"] = 0;
    
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
    var currentHexing = scr_statusEffect_getFromCombatActor(actor, statusEffect_hexing);
    
    // Status effect being applied when the actor does not have it currently //
    if (currentHexing == -1) then
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
        timer = max(timer, currentHexing[? "timer"]);
        currentHexing[? "timer"] = timer;
        }
        
    // Return zero //
    return 0;
    } 

// DRAW //
else if (command == "draw") then
    {
    // Flash green //
    image_blend = make_color_rgb(255, 200, 200);
    draw_text(actor.x, actor.y - 80, conf[? "healthStart"]);
    draw_text(actor.x, actor.y - 96, conf[? "healthEnd"]);
    return 0;
    }

// END OF THE AILMENT //
else if (command == "finish") then
    {
    // START HEALTH //
    var healthEnd = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);
    conf[? "healthEnd"] = healthEnd;
    
    // START AND END HEALTHS //
    var healthS = conf[? "healthStart"];
    var healthE = conf[? "healthEnd"];
    
    // COMPARISON //
    if healthE < healthS then
        {
        // Copy attack stats into Conf so it can be used as an attack object
        var damageTotal = healthS - healthE;
        var atk = scr_stats_newAttackStats();
        atk[? STAT_ATTACK_DMG_ZAUBER] = damageTotal;
        scr_stats_performAttack(atk, actor, false, NULL, true, true);
        }
        
    // Play sound when applied //
    audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_thorns"), false, 70);
      
    // Return zero //  
    return 0;
    }
