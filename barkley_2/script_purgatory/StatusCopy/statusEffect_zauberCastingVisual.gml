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
    scr_statusEffect_generateBasicInfo(conf, statusEffect_zauberCastingVisual, 10);
    conf[? "color"] = c_zauber;
    conf[? "level"] = 1;
    conf[? "time"] = 0;
    
    var chargeWind = ds_list_create();
    ds_list_add(chargeWind, 1.0, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    ds_list_add(chargeWind, 1.5, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    ds_list_add(chargeWind, 2.0, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    ds_list_add(chargeWind, 2.5, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    ds_list_add(chargeWind, 3.0, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    ds_list_add(chargeWind, 3.5, random(360), 35 + random(20), 2 + random(4), 180 + random(240), 0.75 + random(0.25));
    conf[? "chargeWind"] = chargeWind;
    
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
        // Refresh time on existing
        var timer = ds_map_find_value(conf, "timer");
        timer = max(timer, ds_map_find_value(current, "timer"));
        ds_map_replace(current, "timer", timer);
    }
    return 0;
} 

else if (command == "step") {
    // -- Effect to perform each step --
    conf[? "timer"] = 10;
    conf[? "time"] += dt();
    
    // Step Charge-wind
    var chargeWind = conf[? "chargeWind"];
    for (var i = 0; i < ds_list_size(chargeWind); i += 6) {
        var step = chargeWind[| i];
        step -= dt() * 0.25;
        if (step <= -1) {
            step += 3
            // Re-randomize parameters
            chargeWind[| i+1] = random(360);
            chargeWind[| i+2] = 35 + random(20);
            chargeWind[| i+3] = 2 + random(4);
            chargeWind[| i+4] = 180 + random(240);
            chargeWind[| i+5] = 0.75 + random(0.25);
        }
        chargeWind[| i] = step;
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
    var surf = surface_create(combatActor_getRenderSurfSize(), combatActor_getRenderSurfSize());
    surface_copy(surf, 0, 0, renderSurf);
    surface_set_target(renderSurf);
    draw_clear_alpha(c_black, 0);
    
        var str = 0.1 + (min(1, zauber_charge) * 0.4) + abs(sin(conf[? "time"] * 1.5))*0.5
    
        // Draw outline
        var offset = (0.5+str*1.5);
        draw_set_alpha(str);
        d3d_set_fog(true, make_color_rgb(80, 210, 255), 0, 0);    
        draw_surface(surf, -offset,  0);
        draw_surface(surf,  offset,  0);
        draw_surface(surf,  0, -offset);
        draw_surface(surf,  0,  offset);
        d3d_set_fog(false, 0, 0, 0);
        
        // Draw sprite
        draw_set_alpha(1);
        draw_surface(surf, 0, 0);
        
        // Draw color overlay
        var offset = (0.5+str*1.5);
        draw_set_alpha(str * 0.5);
        draw_set_blend_mode(bm_add);
        d3d_set_fog(true, make_color_rgb(80, 210, 255), 0, 0);    
        draw_surface(surf, 0,  0);
        d3d_set_fog(false, 0, 0, 0);
        draw_set_blend_mode(bm_normal);  
        draw_set_alpha(1);
        
        // Draw charge winds
        var chargeWind = conf[? "chargeWind"];
        for (var i = 0; i < ds_list_size(chargeWind); i += 6) {
            if (chargeWind[| i] < 1) {
                var stop = chargeWind[| i];
                var start = stop + 0.4;
                var dir = chargeWind[| i+1];
                var len = chargeWind[| i+2];
                var thickness = chargeWind[| i+3];
                var rotate = chargeWind[| i+4];
                var perspective = chargeWind[| i+5];
                
                var dx = combatActor_getRenderSurfSize() * 0.50;
                var dy = combatActor_getRenderSurfSize() * 0.75 - 14;
                scr_fx_windSwoop(dx, dy, dir, len,
                                 start, stop, 4, rotate, 3, perspective)
            }
        }
        
    surface_reset_target();
    surface_free(surf);
    palr = 0; palg = 0; palb = 0;
    
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}
