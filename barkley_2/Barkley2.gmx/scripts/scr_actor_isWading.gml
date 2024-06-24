/// scr_actor_isWading(actor)

var actor = argument0;

var am_wading = false;
var current = scr_statusEffect_getFromCombatActor(actor, statusEffect_wading);
if (current > 0) { // If has wading status effect
    if (current[? "wadingDepthCurrent"] > 0) { // If submerged in water
        am_wading = true;
    }
}
return am_wading;
