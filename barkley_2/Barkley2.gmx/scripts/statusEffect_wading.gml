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

if (command == "generate")
{
    // Append basic information
    scr_statusEffect_generateBasicInfo(conf, statusEffect_wading, 10);
    conf[? "wadingSlow"] = 0;
    conf[? "wadingDepth"] = 12;
    conf[? "wadingDepthCurrent"] = 0;
    conf[? "wadingSlowpow"] = 0.6;
    conf[? "wadingSplashShow"] = false;
    return conf;
}

else if (!instance_exists(actor)) {
    return 0;
}

else if (command == "apply")
{
    // -- On-hit effects --
    /* In this part, we can take into consideration resistances,
       the current state of the CombatActor (such as if he already
       has the status effect on him), etc. */
    var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_wading);
    if (current == -1)
    {
        // Apply new status effect
        scr_statusEffect_applyNewToCombatActor(actor, conf);
    
        // Re-apply falloff timer //
        conf[? "timer"] = 10;
        
        // PASTY EDIT
        // Don't show splash if the actor was already wading on create
        if(conf[? "wadingSplashShow"])
        {
            statusEffect_wading(conf, actor, "splash_in", 0);
        }
        
        // Calculate wading depth //
        var wadingratio;
        var maxw = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(actor));
        if (scr_collision_place_free(actor.x, actor.y, COLLISION_WADING)) {
    
            // Not wading
            conf[? "wadingDepthCurrent"] = 0;
            wadingratio = 0;
        }
        else {
            // In water
            var minDepth = max(scr_collision_line_distance_absolute(actor.x - maxw, actor.y - maxw, actor.x, actor.y, z, COLLISION_WADING),
                               scr_collision_line_distance_absolute(actor.x - maxw, actor.y + maxw, actor.x, actor.y, z, COLLISION_WADING),
                               scr_collision_line_distance_absolute(actor.x + maxw, actor.y - maxw, actor.x, actor.y, z, COLLISION_WADING),
                               scr_collision_line_distance_absolute(actor.x + maxw, actor.y + maxw, actor.x, actor.y, z, COLLISION_WADING));
            var hypotenuse = sqrt(maxw*maxw*2)
                               
            if (hypotenuse == 0) wadingratio = 1; // avoid division by zero
            else wadingratio = ((hypotenuse - minDepth) / hypotenuse);
            conf[? "wadingDepthCurrent"] = conf[? "wadingDepth"] * wadingratio;
        }
    }
    else
    {    
        current[? "timer"] = 10;
    }
    return 0;
} 

else if (command == "step")
{
    // -- Effect to perform each step --
    // Calculate wading depth //
    var wadingratio = 0;
    var maxw = sat_util_shapemaxwidth(scr_entity_getMovementCollisionShape(actor));
    if (z > base_z) {
        if(conf[? "wadingDepthCurrent"] != 0)
        {
            // Not wading
            conf[? "wadingDepthCurrent"] = 0;
            wadingratio = 0;
            
            // Show splash when jumping out of the water
            statusEffect_wading(conf, actor, "splash_out", 0);
        }
    }
    else if (scr_collision_place_free(actor.x, actor.y, COLLISION_WADING)) {
        // Not wading
        conf[? "wadingDepthCurrent"] = 0;
        wadingratio = 0;
    }
    else {
        // In water
        var minDepth = max(scr_collision_line_distance_absolute(actor.x - maxw, actor.y - maxw, actor.x, actor.y, z, COLLISION_WADING),
                           scr_collision_line_distance_absolute(actor.x - maxw, actor.y + maxw, actor.x, actor.y, z, COLLISION_WADING),
                           scr_collision_line_distance_absolute(actor.x + maxw, actor.y - maxw, actor.x, actor.y, z, COLLISION_WADING),
                           scr_collision_line_distance_absolute(actor.x + maxw, actor.y + maxw, actor.x, actor.y, z, COLLISION_WADING));
        var hypotenuse = sqrt(maxw*maxw*2)
                           
        if (hypotenuse == 0) wadingratio = 1; // avoid division by zero
        else wadingratio = ((hypotenuse - minDepth) / hypotenuse);
        conf[? "wadingDepthCurrent"] = conf[? "wadingDepth"] * wadingratio;
    }
    
    // Falloff //
    var falloff = conf[? "timer"];
    var wadingit = conf[? "wadingSlowpow"];
    var wadingspd_max = wadingit * wadingratio;
    var wading_speed = conf[? "wadingSlow"];
    if (wading_speed < wadingspd_max) wading_speed = wadingspd_max;
    
    if falloff < 7.5 {
        wading_speed = max(wading_speed - 0.06 * dt(), 0);
    }
    
    conf[? "wadingSlow"] = wading_speed;
    return 0;
}

else if (command == "changestat")
{
    // -- Change RPG stats --
    /* This is called when a stat should be changed, with the stat (or statgroup)
       to change in the 'changestat' argument. See scr_stats_genEffectiveStats
       for reference on when this is called and with which arguments. */
    if (changestat == STAT_BASE_SPEED) {
        var wading_speed = conf[? "wadingSlow"];
        var spd = scr_stats_getEffectiveStat( actor, STAT_BASE_SPEED );
        spd *= (1 - wading_speed);
        scr_stats_setEffectiveStat( actor, STAT_BASE_SPEED, spd );
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

else if (command == "draw")
{
    // -- Draw effect to perform before CombatActor is drawn --
    /* This can apply draw effects to the actor, such as change
       rendering colors, configure a shader, particle effects, etc. */
    return 0;
}

else if (command == "finish") {
    // -- Action to perform when status effect ends --
    return 0;
}

else if (command == "splash_in" || command == "splash_out")
{
    if (wadeSplash)
    {
        var splash_fx;
        var splash_radius = actor.shadow_radius;
        if (splash_radius == NULL)
        {
            with (actor) splash_radius = scr_entity_getMovementCollisionShapeRadius() / 2;
        }
        if (splash_radius <= 5)
            splash_fx = scr_fx_simple(actor.x, actor.y, actor.z, s_effect_splash_small);
        else if (between(splash_radius, 5, 10))
            splash_fx = scr_fx_simple(actor.x, actor.y, actor.z, s_effect_splash_medium);
        else 
            splash_fx = scr_fx_simple(actor.x, actor.y, actor.z, s_effect_splash_big);
        splash_fx.image_speed = dt();
        splash_fx.dny = splash_fx.y + 2;// + 99;
        audio_play_sound_AI(command);
    }
}
