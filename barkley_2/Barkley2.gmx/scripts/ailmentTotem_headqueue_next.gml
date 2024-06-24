/// ailmentTotem_headqueue_next(actor)

var actor = argument0;

if (instance_exists(actor) and isCombatActor(actor)) {
    actor.ailmentTotem_head_queue += 8;
}
