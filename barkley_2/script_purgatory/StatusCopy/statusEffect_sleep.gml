/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

if (string(argument[0]) == "applyStats") return 0;
if (string(argument[0]) == "apply") return 0;
if (string(argument[0]) == "applyBullet")
{
    var _bullet = argument[1];
    var gun = argument[2];
    if (gun[? "pChargeRatio"] == 1)
    {
        // effectGrowth is how long in tenths of seconds effect takes to reach crest (maximum effect) -- it will increase during this time
        var effectGrowth = 30;
        // effectCrest is how long in tenths of seconds effect stays at maximum effect
        var effectCrest = 60;
        // effectDecay is how long in tenths of seconds effect takes to return from crest (maximum effect) -- it will decrease during this time
        var effectDecay = 30;
        // effectTimeDivisor is how much to divide the pAffix by when calculating base duration
        var effectTimeDivisor = 10;
        
        var conf;
        conf = scr_statusEffect_addToCombatAttack(statusEffect_sleep, _bullet);
        
        // DURATION OF THE AILMENT //
        // TOTAL DURATION OF THE AILMENT // GUN POWER + effectGrowth + effectCrest + effectDecay //
        conf[? "timer"]         = floor(gun[? "pAffix"] / effectTimeDivisor) + effectGrowth + effectCrest + effectDecay;
        conf[? "timerTotal"]    = conf[? "timer"];
        
        // FIRST SECONDS OF THE AILMENT // USED FOR INCREASING THE AILMENT POWER //
        conf[? "timerStart"]    = conf[? "timer"] - effectGrowth; 
        
        /// LAST SECONDS OF THE AILMENT // USED FOR DECREASING THE AILMENT POWER BEFORE IT IS REMOVED //
        conf[? "timerEnd"]      = effectDecay;
    }
    return 1;
}

var conf = argument0;
var actor = argument1;
var command = argument2;

if (command == "generate") {
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_sleep, 100);
    conf[? "stunTime"] = 5;
    conf[? "sleepEffectTimer"] = 5;
    conf[? "sleepEffectTimerReset"] = 7;
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
    var currentSleep = scr_statusEffect_getFromCombatActor(actor, statusEffect_sleep);
    if (currentSleep == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time on existing
        var timer = conf[? "timer"];
        timer = max(timer, currentSleep[? "timer"]);
        currentSleep[? "timer"] = timer;
        //currentSleep[? "stunTime"] = conf[? "stunTime"];
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
    conf[? "stunTime"] -= dt();
    if conf[? "sleepEffectTimer"] > 0 conf[? "sleepEffectTimer"] -= dt();
    else
        {
        instance_create(actor.x - choose(-irandom(8), irandom(8)), actor.y - actor.z - ailmentTotem_headqueue_get(actor) + choose(-irandom(8), irandom(8)), o_effect_affix_narcotizing);
        ailmentTotem_headqueue_next(actor);
        conf[? "sleepEffectTimer"] = conf[? "sleepEffectTimerReset"] + irandom(4);
        }
    return 0;
}
else if (command == "damage") {
    // -- Actor takes damage --
    /* This is called when the actor takes damage. The ID of the damaging
       CombatAttackEntity is provided as arg3. Here you can do things like
       return damage to attacker or other cool on-hit effects. */
    // Return 'true' to remove this status effect from the combatactor.
    if (conf[? "stunTime"] <= 0) {
        return true;
    }
    return 0;
}

else if (command == "draw") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
       image_blend = make_color_rgb(200, 210, 255);
    return 0;
}
