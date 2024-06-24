// event_swp_safiatouDash01
// This event is a collision in the maps before Safiatou.
// If the player does a Dine and Dash, they cannot return for some amount of time units.
// It should have the coordinates to teleport to written in its creation code
/* 
_run_x = the x coordinate to return to after triggering the event
_run_y = the y coordinate to return to after triggering the event
*/
/*
if (argument0 == SCRIPT_START) {
    scr_actor_unsetRigid(id);
    // delete if dash is off
    if (scr_quest_get_state("safiatouDash") == 0) {
        instance_destroy();
    }
}
if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_COLLISION_HOOPZ) {
    
    // pull coordinates from creation code
    var x_var = _run_x;
    var y_var = _run_y;
    
    var safiatouReturn = id;
    
    // events & snippets
    var event = scr_event_create_main();
    
    //------------------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------------------
    with (event) {
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I really shouldn't return after I ran out on the bill like that.)");
        scr_event_build_move_to_point(o_cts_hoopz, x_var, y_var);
    } 
    
    scr_event_advance(event);
}
