#define statusEffect_zauber_zauber_starlight
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
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_zauber_zauber_starlight, 100);
    return conf;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply") {
    // Check if actor already has the status effect //
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_zauber_zauber_starlight);
    
    // Status effect being applied when the actor does not have it currently //
    if (current == -1)  {
        // Apply and initialize new status effect
        var newConf = scr_statusEffect_applyNewToCombatActor(actor, conf);
        __statusEffect_zauber_zauber_starlight_init(newConf, actor);
    } else {
        // Re-apply the status effect AKA reset the timer //
        var timer = conf[? "timer"];
        timer = max(timer, current[? "timer"]);
        current[? "timer"] = timer;
    }
    
    // Return zero //
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    __statusEffect_zauber_zauber_starlight_step(actor, conf)
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

else if (command == "draw_post") {
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    __statusEffect_zauber_zauber_starlight_draw(actor, conf)
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}

#define __statusEffect_zauber_zauber_starlight_init
// __statusEffect_zauber_zauber_starlight_init(conf)

var conf = argument0;
var actor = argument1;

// Set values based on PIETY
var piety = scr_stats_getEffectiveStat(actor, STAT_BASE_PIETY) / 99;
conf[? "fire_range"] = global.zauberStarlightRangeMinimum;
conf[? "fire_range"] += (global.zauberStarlightRangeMaximum - global.zauberStarlightRangeMinimum) * piety;
conf[? "fire_interval"] = global.zauberStarlightIntervalMaximum;
conf[? "fire_interval"] -= (global.zauberStarlightIntervalMaximum - global.zauberStarlightIntervalMinimum) * piety;
conf[? "fire_interval"] *= 10; // To compensate for dt * 10
conf[? "fire_damage"] = global.zauberStarlightDamageMinimum;
conf[? "fire_damage"] += (global.zauberStarlightDamageMaximum - global.zauberStarlightDamageMinimum) * piety;
conf[? "fire_knockback"] = global.zauberStarlightKnockbackMinimum;
conf[? "fire_knockback"] += (global.zauberStarlightKnockbackMaximum - global.zauberStarlightKnockbackMinimum) * piety;
conf[? "light_max"] = global.zauberStarlightAmountMinimum;
conf[? "light_max"] += round((global.zauberStarlightAmountMaximum - global.zauberStarlightAmountMinimum) * piety);

conf[? "light_count"] = conf[? "light_max"];
conf[? "light_rotate"] = 0;
conf[? "fire_timer"] = 0;

// Initialize light rendering pattern
//show_debug_message("LIGHT MAX = " + string(conf[? "light_max"]));
//show_debug_message("LIGHT COUNT = " + string(conf[? "light_count"]));
var light_bob = ds_list_create();
var light_bob_speed = ds_list_create();
var light_phase = ds_list_create();
var light_phase_speed = ds_list_create();
var light_dist = ds_list_create();
var light_rot_factor = ds_list_create();
var light_dx = ds_list_create();
var light_dy = ds_list_create();
var light_dz = ds_list_create();
var light_sub = ds_list_create();
var light_dir = ds_list_create();

var rotate_sign = choose(1, -1);
for (i = 0; i < conf[? "light_max"]; i++) {
    //show_debug_message("LIGHT ID = " + string(i));
    light_bob[| i] = random(2*pi);
    light_bob_speed[| i] = 0.2 + random(pi/6);
    light_phase[| i] = random(360);
    light_phase_speed[| i] = 4 + random(6);
    light_dist[| i] = random(4) + 16 + (i * 1.5);
    light_rot_factor[| i] = rotate_sign * (2 - (i/10));
    light_dx[| i] = 0;
    light_dy[| i] = 0;
    light_dz[| i] = 0;
    light_sub[| i] = irandom(2);
    rotate_sign *= -1;
    
    if (i >= 12) {
        light_dir[| i] = random(360);
    }
}

light_dir[| 0]  = 0;
light_dir[| 1]  = 180;
light_dir[| 2]  = 90;
light_dir[| 3]  = 270;

light_dir[| 4]  = 0   + 60;
light_dir[| 5]  = 180 + 60;
light_dir[| 6]  = 90  + 60;
light_dir[| 7]  = 270 + 60;

light_dir[| 8]  = 0   + 30;
light_dir[| 9]  = 180 + 30;
light_dir[| 10] = 90  + 30;
light_dir[| 11] = 270 + 30;

var light_target = ds_list_create();
ds_list_add(light_target, EnemyCombatActor);

// Save lists into conf
ds_map_add_list(conf, "light_bob", light_bob);
ds_map_add_list(conf, "light_bob_speed", light_bob_speed);
ds_map_add_list(conf, "light_phase", light_phase);
ds_map_add_list(conf, "light_phase_speed", light_phase_speed);
ds_map_add_list(conf, "light_dist", light_dist);
ds_map_add_list(conf, "light_rot_factor", light_rot_factor);
ds_map_add_list(conf, "light_dx", light_dx);
ds_map_add_list(conf, "light_dy", light_dy);
ds_map_add_list(conf, "light_dz", light_dz);
ds_map_add_list(conf, "light_sub", light_sub);
ds_map_add_list(conf, "light_dir", light_dir);
ds_map_add_list(conf, "light_target", light_target);


#define __statusEffect_zauber_zauber_starlight_step
// __statusEffect_zauber_zauber_starlight_step(actor, conf)

var actor = argument0;
var conf = argument1;

if (instance_exists(actor) and conf[? "light_count"] > 0) 
{
    // GZ > KILL WHEN EVENT HAPPENS
    if (global.event || oBlack.roomTimer != 0) { conf[? "timer"] = 0; return 0; }
    
    // Get data lists
    var light_bob = conf[? "light_bob"];
    var light_bob_speed = conf[? "light_bob_speed"];
    var light_phase = conf[? "light_phase"];
    var light_phase_speed = conf[? "light_phase_speed"];
    var light_dist = conf[? "light_dist"];
    var light_rot_factor = conf[? "light_rot_factor"];
    var light_dx = conf[? "light_dx"];
    var light_dy = conf[? "light_dy"];
    var light_dz = conf[? "light_dz"];
    var light_dir = conf[? "light_dir"];
    
    // Dynamic
    var targetList = actor.target_list;
    if (global.zauberStarlightTargetDestructible == 0) targetList = conf[? "light_target"];
    //show_debug_message("INTERVAL: " + string(conf[? "fire_interval"]));

    // Increment light rendering pattern
    conf[? "light_rotate"] += 0.2 * dt();
    for (i = 0; i < conf[? "light_max"]; i++) {
        light_bob[| i] += light_bob_speed[| i] * dt();
        light_phase[| i] += light_phase_speed[| i] * dt();

        // Calculate new light position
        var dist = light_dist[| i];
        var dir = conf[? "light_rotate"] * light_rot_factor[| i] + light_dir[| i];
        var phase = light_phase[| i];
        var bob = sin(light_bob[| i]);
    
        light_dx[| i] = lengthdir_x(dist, dir) + lengthdir_x(6, phase);
        light_dy[| i] = (lengthdir_y(dist, dir) + lengthdir_y(6, phase)) * 0.7;
        light_dz[| i] = 8 - (dist / 8) + bob * 3;
    }
    
    conf[? "fire_timer"] -= dt();
    if (conf[? "fire_timer"] <= 0) {
    
        // Fire lights if enemies are nearby
        nearest = scr_actor_getNearestTargetableCombatActorOfTypeList(targetList, actor.x, actor.y); // actor.target_list
        if (instance_exists(nearest)) {
            var dist = point_distance(actor.x, actor.y, nearest.x, nearest.y);
            if (dist <= conf[? "fire_range"]) {
                // Fire light
                var light_i = conf[? "light_count"] - 1;
                
                var cx = actor.x + light_dx[| light_i];
                var cy = actor.y + light_dy[| light_i];
                var cz = actor.z + actor.hitbox_z_top + light_dz[| light_i];
                
                var light = instance_create(cx, cy, o_zauber_zauber_starlight_projectile);
                light.z = cz;
                light.follow = nearest;
                light.follow_dist = conf[? "fire_range"] * 1.1;
                
                scr_stats_setAttackStat(light, STAT_ATTACK_DMG_ZAUBER, conf[? "fire_damage"]);
                scr_stats_setAttackStat(light, STAT_ATTACK_KNOCKBACK, conf[? "fire_knockback"]);
                light.knockback_type = KNOCKBACKTYPE_FROM_CENTER;
                scr_stats_setAttackStat(light, STAT_ATTACK_STAGGER, 100);
                scr_stats_setAttackStat(light, STAT_ATTACK_STAGGER_HARDNESS, global.zauberStarlightStagger);
                
                if (global.zauberStarlightTargetDestructible == 0)
                {
                    ds_list_add(light.target_list, EnemyCombatActor);
                }
                else
                {
                    ds_list_copy(light.target_list, actor.target_list);
                }
                
                scr_fx_simple_ext(cx, cy, cz, s_zauber_zauber_starlight_impact, 0.8, 1, 1, 0, c_zauber, 1);
                
                conf[? "light_count"] -= 1;
                conf[? "fire_timer"] = conf[? "fire_interval"];
            }
        }
    }
    
    // Keep alive
    conf[? "timer"] = 999;
    
} else {
    // Remove
    conf[? "timer"] = 0;
}

#define __statusEffect_zauber_zauber_starlight_draw
// __statusEffect_zauber_zauber_starlight_draw(actor, conf)

var actor = argument0;
var conf = argument1;

if (instance_exists(actor) and conf[? "light_count"] > 0) {
    //show_debug_message("LIGHTS: " + string(conf[? "light_count"]));
    //show_debug_message("LIGHT LIST: " + string(ds_list_size(conf[? "light_dx"])));
    // Draw lights
    var light_dx = conf[? "light_dx"];
    var light_dy = conf[? "light_dy"];
    var light_dz = conf[? "light_dz"];
    var light_sub = conf[? "light_sub"];
    var zauCol = merge_color(c_white, c_zauber, 0.5);
    for (i = 0; i < conf[? "light_count"]; i++) {
        //show_debug_message("LIGHT DRAW: " + string(i));
        var draw_x = actor.x + light_dx[| i];
        var draw_y = actor.y - actor.z - actor.hitbox_z_top + light_dy[| i] - light_dz[| i];
        
        draw_sprite_ext(s_zauber_zauber_starlight, light_sub[| i], draw_x, draw_y, 1, 1, 0, c_zauber, 1);
        draw_sprite_ext(s_zauber_zauber_starlight, light_sub[| i], draw_x, draw_y, .5, .5, 0, zauCol, 1);
        //draw_sprite_ext(s1x1, 0, draw_x, draw_y, 1, 1, 0, c_white, 1);
    }
}