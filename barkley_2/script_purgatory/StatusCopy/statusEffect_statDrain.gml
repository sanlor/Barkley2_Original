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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_statDrain, 80);
    ds_map_add(conf, "drainGuts",0);
    ds_map_add(conf, "drainMight",0);
    ds_map_add(conf, "drainAcro",0);
    ds_map_add(conf, "drainLuck",0);
    ds_map_add(conf, "drainPiety",0);
    ds_map_add(conf, "drainWeight",0);
    
    ds_map_add(conf, STAT_BASE_GUTS,0);
    ds_map_add(conf, STAT_BASE_MIGHT,0);
    ds_map_add(conf, STAT_BASE_AGILE,0);
    ds_map_add(conf, STAT_BASE_LUCK,0);
    ds_map_add(conf, STAT_BASE_PIETY,0);
    ds_map_add(conf, STAT_BASE_WEIGHT,0);
    
    ds_map_add(conf, "drainTimes",5);
    ds_map_add(conf, "hitInterval",5);
    ds_map_add(conf, "hitTimer", 5);
    ds_map_add(conf, "godless", 0);
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
    var godless = ds_map_find_value(conf, "godless");
        if godless ==1
            {
            var currentGodless = scr_statusEffect_getFromCombatActor(actor, statusEffect_statDrain);
            if (currentGodless == -1)
                {
                audio_play_sound_on_actor(actor,scr_soundbank_pickSound("affix_godless"),false,70);
                }
                else {
                    // Refresh time on existing
                    var timer = ds_map_find_value(conf, "timer");
                    timer = max(timer, ds_map_find_value(currentGodless, "timer"));
                    ds_map_replace(currentGodless, "timer", timer);
                }
            }
    var currentSlow = scr_statusEffect_getFromCombatActor(actor, statusEffect_statDrain);
    if (currentSlow == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = ds_map_find_value(conf, "timer");
        timer = max(timer, ds_map_find_value(currentSlow, "timer"));
        ds_map_replace(currentSlow, "timer", timer);
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    var hitTimer = ds_map_find_value(conf, "hitTimer");
    hitTimer -= dt();
    var drainTimes = ds_map_find_value(conf, "drainTimes");
    
    if (hitTimer <= 0 && drainTimes>0)
    {
        ds_map_replace(conf, STAT_BASE_GUTS,ds_map_find_value(conf, STAT_BASE_GUTS) + ds_map_find_value(conf, "drainGuts"));
        ds_map_replace(conf, STAT_BASE_MIGHT,ds_map_find_value(conf, STAT_BASE_MIGHT) + ds_map_find_value(conf, "drainMight"));
        ds_map_replace(conf, STAT_BASE_AGILE,ds_map_find_value(conf, STAT_BASE_AGILE) + ds_map_find_value(conf, "drainAcro"));
        ds_map_replace(conf, STAT_BASE_LUCK,ds_map_find_value(conf, STAT_BASE_LUCK) + ds_map_find_value(conf, "drainLuck"));
        ds_map_replace(conf, STAT_BASE_PIETY,ds_map_find_value(conf, STAT_BASE_PIETY) + ds_map_find_value(conf, "drainPiety"));
        ds_map_replace(conf, STAT_BASE_WEIGHT,ds_map_find_value(conf, STAT_BASE_WEIGHT) + ds_map_find_value(conf, "drainWeight"));
        
        //Code Specific to Godless
        hitTimer  = ds_map_find_value(conf, "hitInterval");
        drainTimes--;
        ds_map_replace(conf, "drainTimes", drainTimes);
    }
    
    ds_map_replace(conf, "hitTimer", hitTimer);
    
    if (drainTimes <= 0) {
        return true;
    }
    return false;
}

else if (command == "changestat") {
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
    if(changestat== STATGROUP_BASICS)
    {
        scr_stats_setEffectiveStat(actor, STAT_BASE_GUTS, scr_stats_getEffectiveStat(actor, STAT_BASE_GUTS)+ds_map_find_value(conf, STAT_BASE_GUTS));
        scr_stats_setEffectiveStat(actor, STAT_BASE_MIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_MIGHT)+ds_map_find_value(conf, STAT_BASE_MIGHT));
        scr_stats_setEffectiveStat(actor, STAT_BASE_AGILE, scr_stats_getEffectiveStat(actor, STAT_BASE_AGILE)+ds_map_find_value(conf, STAT_BASE_AGILE));
        scr_stats_setEffectiveStat(actor, STAT_BASE_LUCK, scr_stats_getEffectiveStat(actor, STAT_BASE_LUCK)+ds_map_find_value(conf, STAT_BASE_LUCK));
        scr_stats_setEffectiveStat(actor, STAT_BASE_PIETY, scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY)+ds_map_find_value(conf, STAT_BASE_PIETY));
    }
    if(changestat== STAT_BASE_WEIGHT)
    {
        scr_stats_setEffectiveStat(actor, STAT_BASE_WEIGHT, scr_stats_getEffectiveStat(actor, STAT_BASE_WEIGHT)+ds_map_find_value(conf, STAT_BASE_WEIGHT));
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
