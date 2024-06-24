/// scr_event_interactive_activate()
/// Makes the interactive object active.

visible = true;
_active = true;

// For InteractiveActors, make them rigid
if (object_is_ancestor(object_index, InteractiveActor)) {
    scr_actor_setRigid(id);
}
