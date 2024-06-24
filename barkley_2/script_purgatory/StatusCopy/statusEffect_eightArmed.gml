/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3; // Used only when command = "changestat"

if (command == "generate") {
    conf = scr_statusEffect_generateBasicInfo(conf, statusEffect_eightArmed, 150);
    conf[? "totalStats"] = 0;
    conf[? "healAmount"] = 0;
    
    conf[? "timerTotal"] = conf[? "timer"];
    conf[? "effectImage"] = 0;
    conf[? "effectImageMin"] = 0;
    conf[? "effectImageMax"] = 1.5;
    conf[? "effectY"] = 0;

    conf[? "effectFlickerTimer"] = 0;
    conf[? "effectFlickerTimerReset"] = 5;
    conf[? "effectFlickerToggle"] = 1;

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

    var current8armed = scr_statusEffect_getFromCombatActor(actor, statusEffect_eightArmed);
    if (current8armed == -1) {
        // Apply new status effect
        var newconf = scr_statusEffect_applyNewToCombatActor(actor, conf);
        var tot = 0;
        tot += scr_stats_getEffectiveStat( actor, STAT_BASE_MIGHT );
        tot += scr_stats_getEffectiveStat( actor, STAT_BASE_AGILE );
        tot += scr_stats_getEffectiveStat( actor, STAT_BASE_LUCK );
        tot += scr_stats_getEffectiveStat( actor, STAT_BASE_PIETY );
        newconf[? "totalStats"] = tot;
        audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_eightarmed"),false,70);
    }
    else {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, current8armed[? "timer"]);
        current8armed[? "timer"] = timer;
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    scr_fx_statusFlicker(conf, 0, 0.25);
    return 0;
}

else if (command == "changestat") {
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
       
       /////Not sure how to make the logic of this fit within
       /////these separate calls for each stat. It would only fit a global call for all of them
    if(changestat==STATGROUP_BASICS)
    {
        var tot,guts;
        tot = 0;

        scr_stats_setEffectiveStat(actor,STAT_BASE_MIGHT,0);
        scr_stats_setEffectiveStat(actor,STAT_BASE_AGILE,0);
        scr_stats_setEffectiveStat(actor,STAT_BASE_LUCK,0);
        scr_stats_setEffectiveStat(actor,STAT_BASE_PIETY,0);
        
        tot = conf[? "totalStats"];
        guts = scr_stats_getEffectiveStat( actor, STAT_BASE_GUTS );
        scr_stats_setEffectiveStat(actor,STAT_BASE_GUTS,floor(guts+tot/2));
    }
    
    if(changestat==STAT_EFFECTIVE_MAX_HP)
    {
        var tot,hp;
        tot = conf[? "totalStats"];
        hp = scr_stats_getEffectiveStat( actor, STAT_BASE_HP );
        scr_stats_setEffectiveStat(actor,STAT_BASE_HP,floor(hp+tot/2));
        
        if(conf[? "healAmount"] == 0)
        {
            conf[? "healAmount"] = tot/2+tot*5;
            scr_stats_setCurrentStat(actor,STAT_CURRENT_HP,scr_stats_getEffectiveStat(actor,STAT_EFFECTIVE_MAX_HP));
        }
    }
    
    return 0;
}

else if (command == "damage") {
    // -- Actor takes damage --
    /* This is called when the actor takes damage. The ID of the damaging
       CombatAttackEntity is provided as arg3. Here you can do things like
       return damage to attacker or other cool on-hit effects. */
    // Return 'true' to remove this status effect from the combatactor.
    return 0;
}

else if (command == "draw") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
       draw_sprite_ext(s_effect_affix_eightarmed, conf[? "effectImage"], actor.x, actor.y - actor.z - ailmentTotem_headqueue_get(actor) + conf[? "effectY"], image_xscale * 0.5, image_yscale * 0.5, image_angle, image_blend, conf[? "effectFlickerToggle"]);
       ailmentTotem_headqueue_next(actor);
       return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    /////remove the extra HP the enemy temporarily gained
    //var tot = ds_map_find_value(conf,"healAmount");
    //scr_stats_setCurrentStat(actor,STAT_CURRENT_HP,scr_stats_getCurrentStat(actor,STAT_CURRENT_HP)-tot);
    scr_stats_setCurrentStat(actor,STAT_CURRENT_HP,min(scr_stats_getCurrentStat(actor,STAT_CURRENT_HP),scr_stats_getEffectiveStat(actor,STAT_BASE_HP)));
    return 0;
}
