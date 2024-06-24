/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_zaubric, _bullet);
        
        // DAMAGE DEALT //
        conf[? "damage"] = gun[? "pAffix"];
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;

if (command == "generate") {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_zaubric, 4);
    conf[? "damage"] = 5;
    return conf;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply") {
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    var currentZaubric = scr_statusEffect_getFromCombatActor(actor, statusEffect_zaubric);
    if (currentZaubric == -1) {
    
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);

        // Visual //
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_zaubric"),false,70);
        effect_affix = instance_create(actor.x, actor.y - actor.z - ailmentTotem_core_y_get(actor), o_effect_affix_zaubric);
        effect_affix.target = actor;
        
        // Deal damage //
        stat = scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY) * 1.5;
        scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, scr_stats_getCurrentStat(actor,STAT_CURRENT_HP) - (conf[? "damage"] + stat));
        scr_stats_createDamageIndicators(actor, conf[? "damage"], DAMAGETYPE_ZAUBER, c_purple);
    }
    else {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentZaubric[? "timer"]);
        currentZaubric[? "timer"] = timer;
    }
    return 0;
} 

else if (command == "draw") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
       image_blend = make_color_rgb(255, 180, 255);
    return 0;
}

