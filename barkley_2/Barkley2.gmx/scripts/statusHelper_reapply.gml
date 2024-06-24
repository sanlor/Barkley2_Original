/// statusHelper_reapply(actor, statusEffect, statusConfig)
// Returns 0 if never had it, 1 if it's reapplying
var current = scr_statusEffect_getFromCombatActor(argument0, argument1);
if (current == -1) // Apply new
{
    scr_statusEffect_applyNewToCombatActor(argument0, argument2);
    return 0;
}
else // Re-apply
{
    var timer = argument2[? "timer"];
    timer = max(timer, current[? "timer"]);
    current[? "timer"] = timer;
    current[? "timerTotal"] = timer;
    return 1;
}
