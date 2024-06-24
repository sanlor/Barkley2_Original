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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_thornmail, 1);
    ds_map_add(conf, "reflect_ratio", 0.2);
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
    var currentThornmail = scr_statusEffect_getFromCombatActor(actor, statusEffect_thornmail);
    if (currentThornmail == -1) {
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = ds_map_find_value(conf, "timer");
        timer = max(timer, ds_map_find_value(currentThornmail, "timer"));
        ds_map_replace(currentThornmail, "timer", timer);
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
    var damage_return_ratio = ds_map_find_value(conf, "reflect_ratio");
    var attackingActor = attackEntity.attack_from;
    if (attackingActor != noone && instance_exists(attackingActor)) {
        var newAttackMap = ds_map_create();
        ds_map_copy(newAttackMap, attackEntity.stats_attack);
        newAttackMap[? STAT_ATTACK_DMG_NORMAL] = newAttackMap[? STAT_ATTACK_DMG_NORMAL] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_BIO] = newAttackMap[? STAT_ATTACK_DMG_BIO] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_CYBER] = newAttackMap[? STAT_ATTACK_DMG_CYBER] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_MENTAL] = newAttackMap[? STAT_ATTACK_DMG_MENTAL] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_ZAUBER] = newAttackMap[? STAT_ATTACK_DMG_ZAUBER] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_COSMIC] = newAttackMap[? STAT_ATTACK_DMG_COSMIC] * damage_return_ratio;
        newAttackMap[? STAT_ATTACK_DMG_OCTORUNE] = newAttackMap[? STAT_ATTACK_DMG_OCTORUNE] * damage_return_ratio;
        scr_stats_performAttack(newAttackMap, attackingActor, false, 0, true, true);
        ds_map_destroy(newAttackMap);
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
