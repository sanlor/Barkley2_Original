/// ailmentTotem_head_get(actor)

var actor = argument0;

if (instance_exists(actor) and isCombatActor(actor)) {
    return actor.ailmentTotem_head;
}
return 0;
