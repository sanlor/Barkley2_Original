/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

var conf = argument0;
var actor = argument1;
var command = argument2;
var updateIcon = false;

if (command == "generate") {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_beehive, 4);
    ds_map_add(conf, "iconFrame", 0);
    ds_map_add(conf, "accInfestation", 1);
    ds_map_add(conf, "infTimer",10);
    ds_map_add(conf, "tickCount", 0);
    ds_map_add(conf, "beeforce", 0);
    ds_map_replace(conf,"timer",100);
    return conf;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply") {
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_beehive);
    var powtk = ds_map_find_value(conf,"beeforce");
    var targetGuts = scr_stats_getEffectiveStat(actor,STAT_BASE_GUTS);
    if (current == -1)
    {
        // Apply new status effect
        ds_map_replace(conf,"accInfestation",powtk*20/targetGuts);
        ds_map_replace(conf,"infTimer",0);///force check upon apply
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else
    {
        var curInfest = ds_map_find_value(current,"accInfestation");
        ds_map_replace(current, "accInfestation",(powtk*20/targetGuts)+curInfest/3);
        ds_map_replace(current,"infTimer",0);///force check upon apply
    }
    updateIcon = true;
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    var infTimer = ds_map_find_value(conf, "infTimer");
    var removedStat = false;
    infTimer -= dt();
    if(infTimer<0)
    {
        var curTick = ds_map_find_value(conf,"tickCount");
        var curInfest = ds_map_find_value(conf,"accInfestation");
        var targetGuts = scr_stats_getEffectiveStat(actor,STAT_BASE_GUTS);
        var targetLifeR = scr_stats_getCurrentStat(actor,STAT_CURRENT_HP) / scr_stats_getEffectiveStat(actor,STAT_EFFECTIVE_MAX_HP);
        if(targetLifeR*100<curInfest)
        {
            ////TURN INTO BEEHIVE!!
            scr_enemyTransform(actor,"beehive");
            curInfest = 0;///beehive doesnt need the status effect anymore
        }
        
        ///status buildup decreases over time
        curInfest-= 0.5 + targetGuts/50;
        if(curInfest<=0)///when buildup reaches zero, the status goes away.
        {
            ds_map_replace(conf,"timer",0);///let the stat effect die
            removedStat = true;
        }
        else
        {
            curTick+=1;
            if(curTick>12-(curInfest/10))
            {
                instance_create(x,y,o_enemy_tinyBee);
                ds_map_replace(conf,"tickCount",curTick);
                curTick = 0;
            }
    
        }
        
        infTimer+=5;
        ds_map_replace(conf, "tickCount", curTick);
        updateIcon = true;
        
        ds_map_replace(conf,"accInfestation",curInfest);
    }
    
    ds_map_replace(conf,"infTimer",infTimer);
    if(!removedStat){ds_map_replace(conf,"timer",100);}///timer doesnt make stat run out
    
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

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}

if(updateIcon) /////icon frame is to be updated
{
    var curInfest = ds_map_find_value(conf,"accInfestation");
    var targetLifeR = scr_stats_getCurrentStat(actor,STAT_CURRENT_HP) / scr_stats_getEffectiveStat(actor,STAT_EFFECTIVE_MAX_HP);
    ds_map_replace(conf, "iconFrame", min(floor((curInfest/targetLifeR*100)*10),10));
}
