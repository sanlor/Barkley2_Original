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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_zauber_bio_miracleOfLife, 1);
    ds_map_add(conf, "absorb_ratio", 0.4);
    ds_map_add(conf, "absorb_actor", noone);
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
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauber_bio_miracleOfLife);
    if (current == -1) {
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
    return false;
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
    var attackEntity = argument3;
    
    if (instance_exists(actor)) {
        var absorb = actor.lastDmg * conf[? "absorb_ratio"];
        var absorbActor = conf[? "absorb_actor"];
        if (instance_exists(absorbActor)) {
            absorbActor.absorbed += absorb;
            var absorbDir = point_direction(actor.x, actor.y, absorbActor.x, absorbActor.y);
            
            var fx = scr_fx_simple_ext(actor.x, actor.y, actor.z, s_zauber_bio_miracleOfLife_absorbfx, 1 + random(2), 1, 1, absorbDir, c_white, 1);
            fx.dny = 200;
        }
    }
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
