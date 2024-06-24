/// ailmentTotem_core_x_get(actor)

var actor = argument0;

if (instance_exists(actor) and isCombatActor(actor)) {
    return actor.ailmentTotem_core_x;
}
return 0;
