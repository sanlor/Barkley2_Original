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
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_candySpeed, 25);
    conf[? "giveSpeed"] = scr_stats_getBaseStat(o_hoopz, STAT_BASE_SPEED) * 1.2;

    conf[? "drainTimes"] = 5;
    conf[? "hitInterval"] = 5;
    conf[? "hitTimer"] = 5;
    
    conf[? "timerTotal"] = conf[? "timer"];

    return conf;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply") {
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current_busting state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    
    var currentCSpeed = scr_statusEffect_getFromCombatActor(actor, statusEffect_candySpeed);
    if (currentCSpeed == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentCSpeed[? "timer"]);
        currentCSpeed[? "timer"] = timer;        
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    return false;
}


else if (command == "changestat") {
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
    if(changestat== STAT_BASE_SPEED)
    {
    scr_stats_setEffectiveStat(actor, STAT_BASE_SPEED, conf[? "giveSpeed"]);
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
       return 0;
}

else if (command == "draw_post") {
    // -- Draw effect to perform after CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
