/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)*/

var conf = argument0;
var actor = argument1;
var command = argument2;
var changestat = argument3;
var popup = false;

if (command == "generate") {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_dracula, 20);
    conf[? "healingAmount"] = 2;
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
    var currentDracula = scr_statusEffect_getFromCombatActor(actor, statusEffect_dracula);
    if (currentDracula == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
        
        // Visual //
        if instance_exists(o_hoopz) then
            {
            var healamount = conf[? "healingAmount"];
            scr_stats_setCurrentStat(o_hoopz, STAT_CURRENT_HP, scr_stats_getCurrentStat(o_hoopz, STAT_CURRENT_HP)+healamount);
            scr_stats_createDamageIndicators(o_hoopz,0-healamount,DAMAGETYPE_NORMAL,c_teal);
            heal = instance_create(o_hoopz.x, o_hoopz.y, o_effect_affix_heal); 
            heal.target = o_hoopz;
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
       for reference on when this is called and with which arguments.*/ 
       
    return 0;
}

else if (command == "damage") {
    // -- Actor takes damage --
    /* This is called when the actor takes damage. The ID of the damaging
       CombatAttackEntity is provided as arg3. Here you can do things like
       return damage to attacker or other cool on-hit effects. 
    // Return 'true' to remove this status effect from the combatactor.*/
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
