/// scr_combat_attack_actor(combat_actor, combat_attack_entity, force_hit)

var actor = argument0;
var attack_entity = argument1;
var force_hit = argument2; // Force hit regardless of hit_list

if (!instance_exists(actor) or !instance_exists(attack_entity)) {
    return 0;
}

with(attack_entity) {
    if (!disabled) {
        if (instantkill == false) {
            if ((force_hit or ds_list_find_index(hit_list, actor) == -1) // Have I hit this actor before?
                && scr_entity_zcollision(id, actor)) // Collides on Z-axis?
            {
                // Is this actor part of my Target list?
                var is_target;
                is_target = false;
                if (ds_list_size(target_list) == 0) {
                    // No target list = I target all CombatActors
                    is_target = true;
                } else {
                    // Check if any of target list is a match
                    var i, type, target_type;
                    for (i = 0; i < ds_list_size(target_list) and !is_target; i++) {
                        type = ds_list_find_value(target_list, i);
                        target_type = actor.object_index;
                        if (target_type == type or object_is_ancestor(target_type, type)) {
                            is_target = true;
                        }
                    }
                }

                // If is target, do damage!
                if (is_target && !actor.invulnerable) {
                    var allowHit = true;
                    var allowDamage = true;
                    var allowStatusApply = true;
                    var me = id;

                    // Execute onHit hooks if they are defined
                    if (actor.hook_onHit_script != NULL) {
                        actor.callback_allowHit = true;
                        actor.callback_allowDamage = true;
                        actor.callback_allowStatusApply = true;
                        
                        with actor {
                            script_execute(hook_onHit_script, me);
                        }
                        allowHit = allowHit && actor.callback_allowHit;
                        allowDamage = allowDamage && actor.callback_allowDamage;
                        allowStatusApply = allowStatusApply && actor.callback_allowStatusApply;
                    }

                    if (actor.hook_onHit_event != NULL) {
                        actor.argument_attackId = me;
                        actor.callback_allowHit = true;
                        actor.callback_allowDamage = true;
                        actor.callback_allowStatusApply = true;
                        
                        with actor {
                            _other = attack_entity;
                            event_user(hook_onHit_event);
                        }
                        allowHit = allowHit && actor.callback_allowHit;
                        allowDamage = allowDamage && actor.callback_allowDamage;
                        allowStatusApply = allowStatusApply && actor.callback_allowStatusApply;
                    }

                    if (!instance_exists(actor)) exit;
                    
                    if(allowStatusApply)
                    {
                        // Apply my status effects
                        var i;
                        for (i = 0; i < ds_list_size(status_effects); i++) {
                            var conf = ds_list_find_value(status_effects, i);
                            var script = ds_map_find_value(conf, "script");
                            if(!is_undefined(script))
                            {
                                var statusActor = actor;
                                if (isBlockingCombatActor(actor)) statusActor = actor.parent.id;
                                if (!statusEffect_immunity_isImmune(statusActor, script))
                                {
                                    var goodEntity = (attack_entity.object_index == o_advBullet || attack_entity.object_index == o_explosion_rocket || attack_entity.object_index == o_explosion_flaregun);
                                    if (goodEntity) { if (object_is_ancestor(actor.object_index, DestructibleCombatActor)) goodEntity = 0; }
                                    if (goodEntity && attack_entity.prefix2Has && script == attack_entity.prefix2Script) 
                                    {
                                        statusActor.periodicHit = 1;
                                        statusActor.periodicColor = attack_entity.prefix2Color;
                                        var ind = instance_create(statusActor.x, statusActor.y - statusActor.ailmentTotem_head - 8, o_entity_indicatorText);
                                        ind.x = statusActor.x;
                                        ind.y = statusActor.y - statusActor.ailmentTotem_head - 8;
                                        ind.name = "";
                                        ind.color = attack_entity.prefix2Color;
                                        ind.text = attack_entity.prefix2Name; //string_replace_all(script_get_name(script), "statusEffect_", "");
                                    }
                                    script_execute(script, conf, statusActor, "apply");
                                }
                            }
                            else
                                show_debug_message("Tried to fire a status effect but it was not implemented.");
                        }
                    }

                    if (allowDamage) {
                        if (deal_damage) {
                            // Play damage sound
                            if (instance_exists(actor)) // gz
                            {
                                if (actor.damageSound != NULL_STRING) {
                                    audio_play_sound_on_actor(actor, actor.damageSound, false, 0);
                                }
                            }
                        
                            // Calculate knockback
                            var do_kb = false;
                            var kb_dir = 0;
                            if (knockback_type == KNOCKBACKTYPE_MOVEMENT_DIRECTION) {
                                do_kb = true;
                                kb_dir = move_dir;
                            } else if (knockback_type == KNOCKBACKTYPE_SPECIFIED_DIRECTION) {
                                do_kb = true;
                                kb_dir = knockback_dir;
                            } else if (knockback_type == KNOCKBACKTYPE_FROM_CENTER) {
                                do_kb = true;
                                kb_dir = point_direction(x, y, actor.x, actor.y);
                            } else if (knockback_type == KNOCKBACKTYPE_NONE) {
                                kb_dir = move_dir;
                            }
                            
                            // Boss alignment: send ETHICAL modifier out with attack
                            if (actor.object_index == o_hoopz && global.alignmentDamageTaken != 1)
                            {
                                var dmg_normal = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_NORMAL);
                                var dmg_bio = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_BIO);
                                var dmg_cyber = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_CYBER);
                                var dmg_mental = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_MENTAL);
                                var dmg_cosmic = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_COSMIC);
                                var dmg_zauber = ds_map_find_value(stats_attack, STAT_ATTACK_DMG_ZAUBER);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_NORMAL, dmg_normal * global.alignmentDamageTaken);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_BIO, dmg_bio * global.alignmentDamageTaken);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_CYBER, dmg_cyber * global.alignmentDamageTaken);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_MENTAL, dmg_mental * global.alignmentDamageTaken);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_COSMIC, dmg_cosmic * global.alignmentDamageTaken);
                                scr_stats_setAttackStat(id, STAT_ATTACK_DMG_ZAUBER, dmg_zauber * global.alignmentDamageTaken);
                                //show_debug_message("HOOPZ IS TAKING " + string(global.alignmentDamageTaken) + " % DAMAGE");
                            }
                            
                            // Perform attack
                            lastDmg = scr_stats_performAttack(stats_attack, actor, do_kb, kb_dir, damageIndicator, true);
                            if (!instance_exists(actor)) {
                                lastHitKilled = true;
                                return 0;
                            }
                            if (scr_stats_getCurrentStat(actor, STAT_CURRENT_HP) <= 0) {
                                lastHitKilled = true;
                            }

                            // Execute "damage" step of status effects on CombatActor
                            actor.lastDmg = lastDmg;
                            with(actor) {
                                for (i = 0; i < ds_list_size(list_status_effect); i += 1) {
                                    var map = ds_list_find_value(list_status_effect, i);
                                    var scr = ds_map_find_value(map, "script");
                                    //show_debug_message("damage > " + script_get_name(scr));
                                    var remove = script_execute(scr, map, actor, "damage", me);
                                    if (remove) {
                                        script_execute(scr, map, self.id, "finish", NULL);
                                        ds_map_destroy(map);
                                        ds_list_delete(list_status_effect, i);
                                        i -= 1;
                                    }
                                    if (!instance_exists(actor)) exit;
                                }
                            }
                            
                            // Execute hit FX hook, if it is defined
                            if (actor.hook_hitfx != NULL) { with (actor) script_execute(hook_hitfx, me, kb_dir, other.stats_attack); }
                        }
                    }

                    if (allowHit) {
                        // Execute pre-defined user event if such an event was defined
                        if (event_user_on_hit != -1) {
                            _other = actor;
                            event_user(event_user_on_hit);
                        }
                    }

                    // Save actor to hitlist
                    if (!force_hit) {
                        ds_list_add(hit_list, actor);
                        if (instance_exists(actor) && instance_exists(attack_entity))
                        {
                            if (attack_entity.object_index == o_rollDamage) actor.rollHurt = 1;
                        }
                    }
                }
            }

        } else //Else this is instant kill
        {
            if ((force_hit or ds_list_find_index(hit_list, actor) == -1) // Have I hit this actor before?
                && scr_entity_zcollision(id, actor)) // Collides on Z-axis?
            {
                // Is this actor part of my Target list?
                var is_target;
                is_target = false;
                if (ds_list_size(target_list) == 0) {
                    // No target list = I target all CombatActors
                    is_target = true;
                } else {
                    // Check if any of target list is a match
                    var i, type, target_type;
                    for (i = 0; i < ds_list_size(target_list) and !is_target; i++) {
                        type = ds_list_find_value(target_list, i);
                        target_type = actor.object_index;
                        if (target_type == type or object_is_ancestor(target_type, type)) {
                            is_target = true;
                        }
                    }
                }

                // If is target, do damage!
                if (is_target && !actor.invulnerable) {
                    var allowHit = true;
                    var allowDamage = true;
                    var me = id;

                    // Execute onHit hooks if they are defined
                    if (actor.hook_onHit_script != NULL) {
                        actor.callback_allowHit = true;
                        actor.callback_allowDamage = true;
                        with actor {
                            script_execute(hook_onHit_script, me);
                        }
                        allowHit = actor.callback_allowHit;
                        allowDamage = actor.callback_allowDamage;
                    } else if (actor.hook_onHit_event != NULL) {
                        actor.argument_attackId = me;
                        actor.callback_allowHit = true;
                        actor.callback_allowDamage = true;
                        with actor {
                            _other = attack_entity;
                            event_user(hook_onHit_event);
                        }
                        allowHit = actor.callback_allowHit;
                        allowDamage = actor.callback_allowDamage;
                    }

                    if (allowDamage && deal_damage) {
                    
                        // Play damage sound
                        if (actor.damageSound != NULL_STRING) {
                            audio_play_sound_on_actor(actor, actor.damageSound, false, 0);
                        }

                        // Calculate knockback
                        var do_kb = false;
                        var kb_dir = 0;
                        if (knockback_type == KNOCKBACKTYPE_MOVEMENT_DIRECTION) {
                            do_kb = true;
                            kb_dir = move_dir;
                        } else if (knockback_type == KNOCKBACKTYPE_SPECIFIED_DIRECTION) {
                            do_kb = true;
                            kb_dir = knockback_dir;
                        } else if (knockback_type == KNOCKBACKTYPE_FROM_CENTER) {
                            do_kb = true;
                            kb_dir = point_direction(x, y, actor.x, actor.y);
                        } else if (knockback_type == KNOCKBACKTYPE_NONE) {}

                        // Perform attack
                        lastDmg = scr_stats_getCurrentStat(actor, STAT_CURRENT_HP);
                        scr_stats_setCurrentStat(actor, STAT_CURRENT_HP, -1);
                        
                        actor.lastDmg = lastDmg;
                        lastHitKilled = true;
                        if (actor.hook_onInstantKill_script != NULL) {
                            with actor {
                                script_execute(hook_onInstantKill_script);
                            }
                        }
                    }

                    if (allowHit) {
                        // Execute pre-defined user event if such an event was defined
                        if (event_user_on_hit != -1) {
                            _other = actor;
                            event_user(event_user_on_hit);
                        }
                    }

                    // Save actor to hitlist
                    if (!force_hit) {
                        ds_list_add(hit_list, actor);
                        if (instance_exists(actor) && instance_exists(attack_entity))
                        {
                            if (attack_entity.object_index == o_rollDamage) actor.rollHurt = 1;
                        }
                    }
                }
            }
        }
    }
}
