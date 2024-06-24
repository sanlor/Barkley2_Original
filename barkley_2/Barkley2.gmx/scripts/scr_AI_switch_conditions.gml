/* This is an AI Switch for enemies that have many attacks that all have specific conditions to em.
real good*/

var _action, conf;
_action = argument0;

if (_action == "config")
{
    var attacks, attack;
    conf = ds_map_create();
    attacks = ds_list_create();
    ds_map_add(conf, "attacks", attacks);
    ds_map_add(conf, "attackInterval", 30);///time elapsed after an attack before it tries to pick a next one.
    ds_map_add(conf, "passiveState", -1);
    ds_map_add(conf, "activeState", -1);
    
    // Example of how to add an attack to the Conditions switch
    /*
    attack = ds_map_create();
    ds_map_add(attack, "action", scr_AI_action_charge); // Action to perform
    
    ds_map_add(attack, "attackPriority", 100); // arbitrary number, 0 to 9999. Higher means attack is more likely to happen.
        ///0 means attack will NEVER be picked UNLESS no other attacks are enabled at all. So you could give a single attack a 0 priority and no conditions
            if you want to ensure the monster always does *something*.
        ///the priority of all attacks currently enabled is added together to form their relative likelihood.
        ///Example: Two attacks are enabled, attackA with 10 priority, and attackB with 2 priority. This means attackA has 10/12 chance to be picked, attackB 2/12.
    
    ///CONFIG Properties for attack conditions:
    ds_map_add(attack, "disabled", false); // set to true to manually disable the attack. Good if you want really direct control over things, but shouldnt need it.
    ds_map_add(attack, "distMin", 30); // min attack range in pixels. Leave to 0 to ignore value
    ds_map_add(attack, "distMax", 80); // max attack range in pixels. Leave to 0 to ignore value
    ds_map_add(attack, "lifePercBelow", 80); // Life remaining needs to be below this
    ds_map_add(attack, "lifePercAbove", 30); // Life remaining needs to be above this
    ds_map_add(attack, "statEffect", statusEffect_slow); // Currently affected by status effect
    ds_map_add(attack, "noRepeat", false); // Does not allow attack to be picked twice in a row
    ds_map_add(attack, "ammo", 2); // Attack has limited uses. You can make it recover ammo over time in the object's code, can allow you to reduce how often an attack is used
    
    ///the two next ones are there so you can activate or deactivate specific attacks based on arbitrary things controlled at the object's level.
    ///for instance, maybe ai_curState is set to 1 if the enemys' target is at its left, and 2 if the enemys' target is at its right.
    ///dont set those conf vars if you want to ignore that part of the system. Also, note that the two are kind of mutuallly exclusive:
    ds_map_add(attack, "needState", "targetClose"); //attack enabled only if ai_curState is set to this specific value
    ds_map_add(attack, "needStateAlt1", "targetClose"); //secondary value ai_curState can have
    ds_map_add(attack, "needStateAlt2", "targetClose"); //secondary value ai_curState can have
    ds_map_add(attack, "needStateAlt3", "targetClose"); //secondary value ai_curState can have
    ds_map_add(attack, "avoidState", "targetBehind"); //attack disabled if ai_curState is NOT set to this specific value
    
    ds_list_add(attacks, attack);
    */
    
    return conf;
}

if (_action == "reset")
{
    var list, atk;
    conf = argument1;
    
    // Make sure a passive and active default state is defined
    var state;
    state = ds_map_find_value(conf, "activeState");
    if (state == -1) { state = ds_list_find_value(AI_states_active, 0); }
    ds_map_replace(conf, "activeState", state);
    
    state = ds_map_find_value(conf, "passiveState");
    if (state == -1) { state = ds_list_find_value(AI_states_passive, 0); }
    ds_map_replace(conf, "passiveState", state);
    
    // Initial state
    scr_AI_stateClearAll();
    scr_AI_statePush(ds_map_find_value(conf, "passiveState"));
    I_swAI_attackPicked = 0;
    I_swAI_attackInterval = ds_map_find_value(conf,"attackInterval");
    I_swAI_prevAttack = "";///name of previous attack picked, to avoid repeats if attack is configured to
    ai_curState = 0;

    return 0;
}

if (command == "destroy")
{
    var conf = argument1;
    
    var attacks = conf[? "attacks"];
    while (!ds_list_empty(attacks)) {
        var atk = attacks[| 0];
        ds_map_destroy(atk);
        ds_list_delete(attacks, 0);
    }
    ds_list_destroy(attacks);
}

if (_action == "execute")
{
    conf = argument1;
    
    var passive = (I_AI_target == noone or !instance_exists(I_AI_target));
    
    /* First, check if state list is empty.
       If it is, add a state */
    if (AI_stateCount == 0)
    {
        // State list empty, add passive or active state
        if (AI_alertTimer > 0)
        {
            scr_AI_statePush(ds_map_find_value(conf, "activeState"));
        }
        else
        {
            scr_AI_statePush(ds_map_find_value(conf, "passiveState"));
        }
    }

    /* Next, we perform separate AI logic depending on the
       type of the top state - passive, active or action */
    var queue, state;
    switch (AI_stateTopType)
    {
        case AI_STATETYPE_PASSIVE: // Passive
            if (!passive)
            {
                // Go alert! Wipe states and push active state
                scr_AI_stateClearAll();
                scr_AI_statePush(ds_map_find_value(conf, "activeState"));
            }
            break;
            
        case AI_STATETYPE_ACTIVE: // Active
            if (passive)
            {
                // Go passive. Wipe states and push passive state
                scr_AI_stateClearAll();
                scr_AI_statePush(ds_map_find_value(conf, "passiveState"));
            }
            else
            {
                var circling, target, dist;
                isBlocking = true; // Blocks if has shield
            
                // ========= HANDLE ATTACKING ========
                var list;
                list = ds_map_find_value(conf, "attacks");
                I_swAI_attackInterval -= dt();
                
                if(I_swAI_attackInterval<=0) ///an interval passes between all attacks
                {
                    I_swAI_attackInterval = ds_map_find_value(conf,"attackInterval"); ///reset interval for next time
                    I_swAI_attackPicked = -1;
                    var enabledAttacks = ds_list_create();
                    var totalPriority = 0;
                    dist = point_distance(x, y, I_AI_target.x, I_AI_target.y);
                    var life = scr_stats_getCurrentStat(id,STAT_CURRENT_HP)/scr_stats_getEffectiveStat(id,STAT_EFFECTIVE_MAX_HP)*100;
                    
                    show_debug_message("finding new attack");
                    
                    ///go over all attacks and check their conditions
                    for(i = 0; i < ds_list_size(list); i += 1)
                    {
                        atk = ds_list_find_value(list, i);
                        var attackEnabled = true;
                        
                        if(ds_map_find_value(atk,"disabled")){attackEnabled = false;}
                        else
                        {
                            if(dist<ds_map_find_value(atk,"distMin")){attackEnabled = false;}
                            if(dist>ds_map_find_value(atk,"distMax") && ds_map_find_value(atk,"distMax")!=0){attackEnabled = false;}
                            if(life<ds_map_find_value(atk,"lifePercAbove")){attackEnabled = false;}
                            if(life>ds_map_find_value(atk,"lifePercBelow") && ds_map_find_value(atk,"lifePercBelow")!=0){attackEnabled = false;}
                            if(ds_map_find_value(atk,"ammo")== -1){attackEnabled = false;}
                            
                            var st1 = ds_map_find_value(atk,"needState");
                            var st2 = ds_map_find_value(atk,"needStateAlt1");
                            var st3 = ds_map_find_value(atk,"needStateAlt2");
                            var st4 = ds_map_find_value(atk,"needStateAlt3");
                            var stCount = 0;
                            
                            if(is_string(st1)){stCount +=1;}else{st1 = "";}
                            if(is_string(st2)){stCount +=1;}else{st2 = "";}
                            if(is_string(st3)){stCount +=1;}else{st3 = "";}
                            if(is_string(st4)){stCount +=1;}else{st4 = "";}
                            
                            if(stCount>0){if(ai_curState != st1 && ai_curState != st2 && ai_curState != st3 && ai_curState != st4){attackEnabled = false;}}
                            
                            if(is_string(ds_map_find_value(atk,"avoidState"))){if(ds_map_find_value(atk,"avoidState")== ai_curState){attackEnabled = false;}}
                            
                            if(ds_map_find_value(atk,"statEffect") != 0 && scr_statusEffect_getFromCombatActor(id,ds_map_find_value(atk,"statEffect"))==-1){attackEnabled = false;}
                            if(is_string(I_swAI_prevAttack)){if(I_swAI_prevAttack == ds_map_find_value(ds_map_find_value(atk,"actionMap"),"attackName") && ds_map_find_value(atk,"noRepeat")){attackEnabled = false;}}
                        }
                    
                        if (attackEnabled)
                        {
                            //after all this, attack is enabled:
                            prio = ds_map_find_value(atk,"attackPriority");
                            totalPriority += prio;
                            ds_list_add(enabledAttacks,atk);
                        }
                    }
                    
                    show_debug_message("attacks enabled: " + string(ds_list_size(enabledAttacks)));
                    ///all attacks whose conditions are met are in a list, time for the random draw.
                    if(!ds_list_empty(enabledAttacks))//first check if there are any attacks enabled at all.
                    {
                        ds_list_shuffle(enabledAttacks);
                        
                        if(totalPriority==0)
                        {
                            //no priority stacked up means all attacks have priority 0! Just pick the first attack on the list.
                            I_swAI_attackPicked = ds_list_find_value(enabledAttacks,0);
                        }
                        else
                        {
                            ///else, draw a random number and pick an attack from the list based off of it.
                            var randomDraw = random(totalPriority);
                            var prioCheck = 0;
                            while(ds_list_size(enabledAttacks>0))
                            {
                                var atk = ds_list_find_value(enabledAttacks,0);
                                var prio = ds_map_find_value(atk,"attackPriority");
                                if(prio!=0)
                                {
                                    prioCheck+= prio;
                                    if(randomDraw<prioCheck) ///the random draw picked this one!
                                    {
                                        I_swAI_attackPicked = atk;
                                        break;
                                    }
                                }
                            }
                            
                            if(I_swAI_attackPicked <= 0){show_debug_message("Random attack draw didnt work somehow");}///if it somehow didnt find an attack, not sure whats happening.
                        }
                    }
                    else
                    {
                        show_debug_message("Enabled attacks list was empty.");
                        ///no attacks whatsoever available! thats bad, must have done something wrong.
                    }
                    
                    ds_list_destroy(enabledAttacks);
                    show_debug_message("attack picked: " + string(I_swAI_attackPicked)); 
                    if (I_swAI_attackPicked > 0) ///a new attack was picked!
                    {
                        //Push new attack
                        var act,ammo;
                        act = ds_map_find_value(I_swAI_attackPicked, "actionMap"); ///scr_AI_findState(ds_map_find_value(I_swAI_attackPicked, "action"));
                        show_debug_message("attackname " + string(ds_map_find_value(act,"attackName")));
                        scr_AI_statePush(act);
                        I_swAI_prevAttack = ds_map_find_value(act,"attackName");
                        ammo = ds_map_find_value(I_swAI_attackPicked, "ammo"); /// if attack had ammo, subtract from it
                        if(ammo>0)
                        {
                            if(ammo==1){ammo = -1;}else{ammo-=1;} ///set ammo to -1 if it is empty instead of 0, because ammo = 0 is special code to mean ammo is infinite.
                            ds_map_replace(I_swAI_attackPicked,"ammo",ammo);
                        }
    
                        I_swAI_attackPicked = -1;
                    }
                }

            }
            break;
            
        case AI_STATETYPE_ACTION:
            isBlocking = false;
            break; // Action, do nothing
            
        case AI_STATETYPE_GLOBAL:
            isBlocking = false;
            break; // Action, do nothing
        
        default:
            // Unknown state, PANIC!
            scr_AI_stateClearAll();
            scr_AI_statePush(ds_map_find_value(conf, "passiveState"));
            break;
    }

    AI_alertTimer = max (0, AI_alertTimer - dt());
}
