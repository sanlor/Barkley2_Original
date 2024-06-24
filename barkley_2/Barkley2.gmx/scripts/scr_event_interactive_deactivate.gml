/// scr_event_interactive_deactivate()
/// Turns the interactive object invisible, and deactivates them.

// For making arrest object exception
if (global.duergarPatrol == 0) return 0;

visible = false;
_active = false;

// For InteractiveActors, make them not rigid
if (object_is_ancestor(object_index, InteractiveActor)) {
    scr_actor_unsetRigid(id);
    //scr_actor_instantRigid(id);
}

move_x = 0;
move_y = 0;
move_z = 0;
