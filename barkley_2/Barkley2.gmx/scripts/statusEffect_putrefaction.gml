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
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_putrefaction, 180);
    conf[? "puffTimer"] = 0;
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
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_putrefaction);
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
    if (is_undefined(ds_map_find_value(conf, "puffTimer"))) conf[? "puffTimer"] = 0;
    else conf[? "puffTimer"] -= dt();
    while (conf[? "puffTimer"] < 0) {
        var w;
        with actor w = scr_entity_getMovementCollisionShapeRadius();
        var dir = random(360);
        var dist = random(w);
        var puff = instance_create(actor.x + lengthdir_x(dist, dir), actor.y + lengthdir_y(dist, dir), o_effect_generic_animateOnce);
        puff.image_xscale = .25;
        puff.image_yscale = .25;
        puff.z = actor.z + random(actor.hitbox_z_top);
        puff.gravity_z = 0;
        puff.move_z = random(2);
        puff.sprite_index = s_putrefication_puff;
        with puff scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1 + random(1.5));
        conf[? "puffTimer"] += 1;
    }
    return 0;
}

else if (command == "changestat") {
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
    if(changestat== STATGROUP_BASICS)
    {
        var bioVuln = scr_stats_getEffectiveStat(actor, STAT_BASE_VULN_BIO);
        var modFade = min(1, conf[? "timer"] / 100);
        var statMod = max(0, 1 - (bioVuln * .2 * modFade));
        
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS) * statMod);
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_MIGHT) * statMod);
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE) * statMod);
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK) * statMod);
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY) * statMod);
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

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
