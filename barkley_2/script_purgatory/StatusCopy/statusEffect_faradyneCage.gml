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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_faradyneCage, 100);
    conf[? "diroffset"] = 0;
    conf[? "alpha"] = .4 + random(.4);
    conf[? "linew"] = 1 + random(5);
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
    scr_statusEffect_applyOrRefreshOnCombatActor(statusEffect_faradyneCage, conf, actor);
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    // Faradyne Cage disables status effect countdown - must count myself down manually
    conf[? "timer"] -= dt();
    
    conf[? "alpha"] = .4 + random(.4);
    conf[? "linew"] = 1 + random(5);
    conf[? "diroffset"] += dt() * 5;
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
    return 0;
}

else if (command == "draw_post") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    var radius;
    with actor radius = scr_entity_getMovementCollisionShapeRadius();
    var alpha = conf[? "alpha"] * min(1, conf[? "timer"] / 10);
    zauberfx_faradyne_cage(dx, dy, radius + 12, hitbox_z_top + 14,
                           conf[? "diroffset"], c_cyber, conf[? "linew"], alpha);
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
