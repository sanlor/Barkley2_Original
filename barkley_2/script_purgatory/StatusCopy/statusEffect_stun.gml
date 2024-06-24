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
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_sleep, 100);
    return 0;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply") {
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_sleep);
    if (current == -1) {
        // Apply new status effect
        sleep_particle=instance_create(actor.x,actor.y-32,o_narcotizing);
        sleep_particle.target = actor;
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = ds_map_find_value(conf, "timer");
        timer = max(timer, ds_map_find_value(current, "timer"));
        ds_map_replace(current, "timer", timer);
    }
    
    // If enemy:
    if (object_is_ancestor(actor.object_index, EnemyCombatActor)) {
        // Set Sleep AI state
        with (actor) {
            scr_AI_setSwitchEnabled(false);
            scr_AI_stateClearAll();
            // Get and push Sleep state
            var state = scr_AI_findState(scr_AI_global_sleep);
            if (state == NULL) {
                state = scr_AI_addGlobalState(scr_AI_global_sleep);
            }
            scr_AI_statePush(state);
        }
    }
    
    // If player:
    if (object_is_ancestor(actor.object_index, PlayerCombatActor)) {
        // Set Sleep state
        with (actor) {
            scr_player_setStance(scr_player_stance_statusEffect_sleep);
        }
    }
    
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
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
    image_blend = c_blue;
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
