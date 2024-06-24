/// scr_statusEffect_applyOrRefreshOnCombatActor(script, conf, actor)

var script = argument0;
var conf = argument1;
var actor = argument2;

var current = scr_statusEffect_getFromCombatActor(actor, script);
if (current == -1) {
    // Apply new status effect
    script_execute(script, conf, actor, "apply");
}
else {
    // Refresh time on existing
    var timer = conf[? "timer"];
    timer = max(timer, current[? "timer"]);
    current[? "timer"] = timer;
    return current;
}
