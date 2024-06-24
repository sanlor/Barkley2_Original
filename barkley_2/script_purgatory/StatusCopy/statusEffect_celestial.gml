// Deals small BIO damage and reduces BIO resistance //

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_celestial, _bullet);
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_COSMIC, (scr_stats_getAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL)) + gun[? "pAffix"]) 
        scr_stats_setAttackStat(_bullet, STAT_ATTACK_DMG_NORMAL, 0);
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

if (command == "generate") then
    {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_celestial, 80);
    
    // Default values so there won't be undefined variable crashes //
    conf[? "cosmicVuln"] = 2;
    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 9;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;
    
    return conf;
}

else if (!instance_exists(actor)) then 
    {
    return 0;
    }

else if (command == "apply") then 
    {
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    var currentComposting = scr_statusEffect_getFromCombatActor(actor, statusEffect_celestial);
    if (currentComposting == -1) then
        { 
        // Apply //
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    
        // Effect //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_composting"),false,70);
        }
    else 
        {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentComposting[? "timer"]);
        currentComposting[? "timer"] = timer;
        }
    return 0;
    } 

else if (command == "step") then
    {
    // -- Effect to perform each step --
    // Visual //
    scr_fx_statusFlicker(conf, 5, 1.25);

    return 0;
    }

else if (command == "changestat") then
    {
    scr_stats_setEffectiveStat(actor, STAT_BASE_VULN_COSMIC, scr_stats_getEffectiveStat(actor, STAT_BASE_VULN_COSMIC) + conf[? "cosmicVuln"]);
    return 0;
    }

else if (command == "draw_post") then
    {
    // -- Draw effect to perform after CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
       //scr_fx_statusDrawEffect(conf, actor, s_effect_affix_composting);
    return 0;
    }

