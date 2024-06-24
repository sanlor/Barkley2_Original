/* Template for status effects.

arg0 - Configuration map
arg1 - Actor to target
arg2 - Command to execute ("generate", "apply", "step", "draw", "finish")
arg3 - Other data (e.g. changestat, damaging CombatAttackEntity...)
*/

var conf = argument0;
var actor = argument1;
var command = argument2;

if (command == "generate") {
    // Copy attack stats into Conf so it can be used as an attack object
    var atk = scr_stats_newAttackStats();
    ds_map_copy(conf, atk);
    ds_map_destroy(atk);
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_burning, 16);
    ds_map_add(conf, "hitTimer", 3);
    ds_map_add(conf, "hitInterval", 3);
    ds_map_add(conf, "puffTimer", 0);
    ds_map_replace(conf, STAT_ATTACK_DMG_NORMAL, 5);
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
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_burning);
    if (current == -1) {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    }
    else {
        // Refresh time an on existing
        var timer = ds_map_find_value(conf, "timer");
        var hitTimer = ds_map_find_value(conf, "hitTimer");
        timer = max(timer, ds_map_find_value(current, "timer"));
        hitTimer = min(hitTimer, ds_map_find_value(current, "hitTimer"));
        ds_map_replace(current, "timer", timer);
        ds_map_replace(current, "hitTimer", hitTimer);
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    var hitTimer = ds_map_find_value(conf, "hitTimer");
    hitTimer -= dt();
    if (hitTimer <= 0) {
        scr_stats_performAttack(conf, actor, false, NULL, true, true);
        hitTimer =  ds_map_find_value(conf, "hitInterval");
    }
    ds_map_replace(conf, "hitTimer", hitTimer);
    
    conf[? "puffTimer"] -= dt();
    while (conf[? "puffTimer"] < 0) {
        var w;
        with actor w = scr_entity_getMovementCollisionShapeRadius();
        var dir = random(180)+180;
        var dist = random(w);
        var puff = instance_create(actor.x + lengthdir_x(dist, dir),
                                   actor.y + 1 + lengthdir_y(dist, dir),
                                   o_effect_generic_animateOnce);
        puff.z = actor.z + random(actor.hitbox_z_top);
        puff.gravity_z = 0;
        puff.move_z = 0 + random(5);
        puff.image_xscale = .35;
        puff.image_yscale = .35;
        puff.image_angle = random(360);
        puff.sprite_index = s_enemy_crabotron_flame;
        with puff {
            scr_entity_setDirSpd(dir, random(2));
            scr_entity_animation_setSpeed(ANIMATION_DEFAULT, 1 + random(.5));
            scr_entity_animation_setFrame(ANIMATION_DEFAULT, 2);
        }
        conf[? "puffTimer"] += .3;
    }
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

else if (command == "draw_fx") {
    // -- Draw effect to perform after CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    var surf = surface_create(128, 128);
    surface_copy(surf, 0, 0, renderSurf);
    surface_set_target(renderSurf);
    draw_clear_alpha(c_black, 0);
    
    var palr = 0; var palg = 0; var palb = 0;
    palr[0]=255.0/255.0; palg[0]=255.0/255.0; palb[0]=255.0/255.0;
    palr[1]=255.0/255.0; palg[1]=255.0/255.0; palb[1]=  0.0/255.0;
    palr[2]=255.0/255.0; palg[2]=201.0/255.0; palb[2]= 44.0/255.0;
    palr[3]=228.0/255.0; palg[3]=151.0/255.0; palb[3]= 11.0/255.0;
    palr[4]=246.0/255.0; palg[4]= 38.0/255.0; palb[4]= 71.0/255.0;
    palr[5]=198.0/255.0; palg[5]= 14.0/255.0; palb[5]=  0.0/255.0;
    palr[6]= 32.0/255.0; palg[6]= 32.0/255.0; palb[6]= 32.0/255.0;
    
    shader_set(shader_status_fire);
    uTime = shader_get_uniform(shader_status_fire, "time");
    uPalR = shader_get_uniform(shader_status_fire, "pal_r");
    uPalG = shader_get_uniform(shader_status_fire, "pal_g");
    uPalB = shader_get_uniform(shader_status_fire, "pal_b");
    shader_set_uniform_f(uTime, current_time);
    shader_set_uniform_f_array(uPalR, palr);
    shader_set_uniform_f_array(uPalG, palg);
    shader_set_uniform_f_array(uPalB, palb);
    
    draw_surface(surf, 0, 0);
    
    shader_reset();
    surface_reset_target();
    surface_free(surf);
    palr = 0; palg = 0; palb = 0;
    
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
