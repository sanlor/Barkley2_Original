/// ailmentTotem_headqueue_reset(actor)

var actor = argument0;

if (instance_exists(actor) and isCombatActor(actor)) {
    actor.ailmentTotem_head_queue = 0;
}
