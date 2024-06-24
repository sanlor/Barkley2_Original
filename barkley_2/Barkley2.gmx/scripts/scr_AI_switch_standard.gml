/* This is the default switch for most regular enemies.
This switch handles:
 - attack states with preconditionals and cooldowns.
 - active states with preconditionals and priorities - picks highes
 - switching to active or passive states when aggroing or deaggroing
   */

var command = argument0;

if (command == "config")
{
    var attacks;
    conf = ds_map_create();
    conf[? "attacks"] = ds_list_create();
    conf[? "chargeRnd"] = 20;
    conf[? "passiveState"] = NULL;
    conf[? "activeState"] = NULL;
    conf[? "actionOnActive"] = NULL;
    
    return conf;
}

if (command == "new_attack") {
    // Generates a new barebones attack that you can modify as you wish
    var conf = argument1;
    var attack = scr_AI_util_newSwitchAttack()
    ds_list_add(conf[? "attacks"], attack);
    return attack;
}

if (command == "reset")
{
    var conf = argument1;
    
    // Make sure a passive and active default state is defined
    if (conf[? "activeState"] == NULL) {
        conf[? "activeState"] = AI_states_active[| 0];
    }
    
    if (conf[? "passiveState"] == NULL) {
    conf[? "passiveState"] = AI_states_passive[| 0];
    }
    
    // Initial state
    scr_AI_stateClearAll();
    scr_AI_statePush(conf[? "passiveState"]);
    I_swAI_recharge = 0;
    
    // Initial cooldown for each attack is based on recharge
    var list = conf[? "attacks"];
    for (i = 0; i < ds_list_size(list); i += 1)
    {
        var atk = list[| i];
        if (atk[? "cooldownStart"] <= 0) {
            // TODO: Remove this special case once cooldownStart is more widely used
            atk[? "cooldownCurrent"] = atk[? "rechargeTime"] + random(atk[? "rechargeTimeRnd"]);
        }
        else {
            atk[? "cooldownCurrent"] = atk[? "cooldownStart"];
        }
    }
    
    return 0;
}


if (command == "destroy")
{
    var conf = argument1;
    
    var attacks = conf[? "attacks"];
    while (ds_list_size(attacks) > 0) {
        var atk = attacks[| 0];
        ds_map_destroy(atk);
        ds_list_delete(attacks, 0);
    }
    ds_list_destroy(attacks);
}


if (command == "execute")
{
    var conf = argument1;
    var passive = (I_AI_target == noone or !instance_exists(I_AI_target));
    
    /* First, check if state list is empty.
       If it is, add a state */
    if (AI_stateCount == 0)
    {
        // State list empty, add passive or active state
        if (!passive)
        {
            scr_AI_statePush(conf[? "activeState"]);
            return NULL;
        }
        else
        {
            scr_AI_statePush(conf[? "passiveState"]);
            return NULL;
        }
    }
    
    // Reduce attack recharge timer
    I_swAI_recharge = max(0, I_swAI_recharge - dt())

    /* Next, we perform separate AI logic depending on the
       type of the top state - passive, active or action */
    switch (AI_stateTopType)
    {
        case AI_STATETYPE_PASSIVE: // Passive
            // Reduce recharge timer
            I_swAI_recharge = max(0, I_swAI_recharge - dt())
            
            // Reset cooldown timers on attacks when passive
            var list = conf[? "attacks"];
            for (i = 0; i < ds_list_size(list); i += 1)
            {
                var atk = list[| i];
                atk[? "cooldownCurrent"] = max(atk[? "cooldownCurrent"], atk[? "cooldownStart"]);
            }
                
            if (!passive)
            {
                // Go alert! Wipe states and push active state
                scr_AI_stateClearAll();
                if (conf[? "actionOnActive"] != NULL) {
                    scr_AI_statePush(conf[? "activeState"]);
                    scr_AI_statePush(conf[? "actionOnActive"]);
                }
                else {
                    scr_AI_statePush(conf[? "activeState"]);
                }
            }
            break;
            
        case AI_STATETYPE_ACTIVE: // Active
            if (passive)
            {
                // Go passive. Wipe states and push passive state
                scr_AI_stateClearAll();
                scr_AI_statePush(conf[? "passiveState"]);
            }
            else
            {
                var dist = point_distance(x, y, I_AI_target.x, I_AI_target.y);
                var attacks = conf[? "attacks"];
                
                // Clear state if its predicate is no longer true
                var currentStatePredicate = AI_stateTop[? "switchPredicate"];
                if (currentStatePredicate != NULL and !script_execute(currentStatePredicate, self.id)) {
                    scr_AI_stateClearAll();
                }
                
                // Decide highest priority pickable active state
                var activeStatePicked = NULL;
                var activeStatePrio = -1;
                for (var i = 0; i < ds_list_size(AI_states_active); i += 1) {
                    var state = AI_states_active[| i];
                    if (!state[? "switchDisablePush"] and
                            state[? "switchAddMaxDist"] >= dist and
                            state[? "switchAddMinDist"] <= dist and
                            state[? "switchPriority"] > activeStatePrio) {
                        var predicate = state[? "switchPredicate"];
                        if (predicate == NULL or script_execute(predicate, self.id)) {
                            activeStatePicked = state;
                            activeStatePrio = state[? "switchPriority"];
                        }
                    }
                }
                
                // Check if found a new active state to switch to
                if (activeStatePicked != NULL and activeStatePicked != AI_stateTop) {
                    if (AI_stateTop == NULL) {
                        scr_AI_statePush(activeStatePicked);
                    } else if (dist > AI_stateTop[? "switchRemoveMaxDist"] or dist < AI_stateTop[? "switchRemoveMinDist"]) {
                        scr_AI_statePop(0);
                        scr_AI_statePush(activeStatePicked);
                    } else { 
                        var currentState = AI_stateTop;
                        var currentStatePrio = AI_stateTop[? "switchPriority"];
                        if (currentStatePrio < activeStatePrio or (currentStatePredicate != NULL and
                                !script_execute(currentStatePredicate, self.id))) {
                            scr_AI_statePop(0);
                            scr_AI_statePush(activeStatePicked);
                        }
                    }
                }
            
                if (I_swAI_recharge <= 0) {
                    // ========= HANDLE ATTACKING ========
                    
                    // Try to find an attack which meets all attacking conditions
                    var attack = NULL;
                    
                    for (var i = 0; i < ds_list_size(attacks) && attack == NULL; i += 1) {
                        // If not disabled and not on cooldown
                        var atk = attacks[| i];
                        if (atk[? "disabled"] == false and atk[? "cooldownCurrent"] <= 0) {
                            // If has ammo
                            if (atk[? "ammoType"] == NULL_STRING or scr_AI_ammo_hasOfType(atk[? "ammoType"])) {
                                // If in range
                                if (dist >= atk[? "distMin"] and dist <= atk[? "distMax"]) {
                                    // If in cone of radius
                                    var dirToTarget = point_direction(x, y, I_AI_target.x, I_AI_target.y);
                                    var dirDiff = abs(scr_math_rdif(faceDir, dirToTarget));
                                    if (dirDiff >= atk[? "coneAngleMin"] and dirDiff <= atk[? "coneAngleMax"]) {
                                        // If predicate is true or undefined
                                        var predicate;
                                        if (atk[? "predicate"] == NULL) { predicate = true; }
                                        else { predicate = script_execute(atk[? "predicate"], self.id); }
                                    
                                        if (predicate) {
                                            // Valid attack, do it!
                                            attack = atk
                                        }
                                    }
                                }
                            }
                        } 
                    }
                    
                    if (attack != NULL) {
                        // Perform attack
                        var action = attack[? "action"];
                        attack[? "cooldownCurrent"] = attack[? "cooldownTime"] + random(attack[? "cooldownTimeRnd"])
                        I_swAI_recharge = attack[? "rechargeTime"] + random(attack[? "rechargeTimeRnd"])
                        if (attack[? "ammoType"] != NULL_STRING) {
                            scr_AI_ammo_change(attack[? "ammoType"], -1);
                        }
                        scr_AI_statePush(action);
                    }
                }
                
                // Reduce cooldown of all attacks
                for (i = 0; i < ds_list_size(attacks); i += 1) {
                    // If not on cooldown
                    var atk = attacks[| i];
                    atk[? "cooldownCurrent"] = max(0, atk[? "cooldownCurrent"] - dt());
                }
            }
            break;
            
        case AI_STATETYPE_ACTION:
        case AI_STATETYPE_GLOBAL:
            break; // Do nothing
        
        default:
            // Unknown state, PANIC!
            scr_AI_stateClearAll();
            scr_AI_statePush(conf[? "passiveState"]);
            break;
    }
} 
