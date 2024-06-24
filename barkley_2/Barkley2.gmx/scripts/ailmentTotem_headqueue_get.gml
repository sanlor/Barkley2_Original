/// ailmentTotem_headqueue_get(actor)

var actor = argument0;

if (instance_exists(actor) and isCombatActor(actor)) {
    return actor.ailmentTotem_head + actor.ailmentTotem_head_queue;
}
return 0;
