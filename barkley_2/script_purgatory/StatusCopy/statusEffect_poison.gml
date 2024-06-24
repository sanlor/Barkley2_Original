/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

var conf = argument0;
var actor = argument1;
var command = argument2;

if (command == "generate") {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_poison, 80);
    ds_map_add(conf, "hitTimer", 2);
    ds_map_add(conf, "hitInterval", 5);
    ds_map_replace(conf, STAT_ATTACK_DMG_BIO, 2);
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
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_poison);
    if (current == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = ds_map_find_value(conf, "timer");
        timer = max(timer, ds_map_find_value(current, "timer"));
        ds_map_replace(current, "timer", timer);
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    var hitTimer = ds_map_find_value(conf, "hitTimer");
    hitTimer -= dt();
    if (hitTimer <= 0) {
        scr_stats_performAttack(conf, actor, false, NULL, true, true);
        hitTimer  = ds_map_find_value(conf, "hitInterval");
    }
    ds_map_replace(conf, "hitTimer", hitTimer);
    return 0;
}

else if (command == "changestat") {
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
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
    image_blend = c_green;
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
