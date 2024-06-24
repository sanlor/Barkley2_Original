// event_swp_safiatouDash01
// This event is a collision surrounding Safiatou.
// It should have the coordinates to run to written in its creation code
/* 
_edge_x = the x coordinate of the edge of the current map
_edge_y = the y coordinate of the edge of the current map
_room = the room to teleport to after the event
_x = the x coordinate for the teleport event
_y = the y coordinate for the teleport event

*/
/*
if (argument0 == SCRIPT_START) {
    scr_actor_unsetRigid(id);
}
if (argument0 == SCRIPT_STEP) {
    if (scr_quest_get_state("safiatouDine") >= 3) {
        instance_destroy()
    }
}
else if (argument0 == SCRIPT_COLLISION_HOOPZ) {
    
    // pull coordinates from creation code
    var run_x = _edge_x;
    var run_y = _edge_y;
    var t_room = _room;
    var t_x = _x;
    var t_y = _y;
    
    var juke_x = ((o_hoopz.x * 5) + (run_x)) / 6;
    var juke_y = ((o_hoopz.y * 5) + (run_y)) / 6;
    
    // temp
    if t_room = _room { t_room = r_bct_commonArea02; }
    
    var safiatouDash = id;
    
    // portrait
    var safiaport = "s_port_safiatou";
    
    // events & snippets
    var event = scr_event_create_main();
    var dash_snippet = scr_event_create_child(event);
    
    //------------------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------------------
    with (event) {
        if (scr_quest_get_state("safiatouDash") == 11) {
            scr_event_build_event_snippet(dash_snippet);
        }
        // if there is an outstanding bill
        else if (scr_quest_get_state("safiatouBill") > 0) && (scr_quest_get_state("safiatouDine") >= 1) {
            // first try
            if (scr_quest_get_state("safiatouDash") == 0) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I can't just run out on the check like that... or can I?)");
                scr_event_build_quest_state("safiatouDash", 1);
            }
            // out of money
            else if (scr_quest_get_state("safiatouDash") == 10) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I can't believe I'm thinking about this... but what else do I do?)");
            }
            /*
            // choices
            var dash_choice = scr_event_build_choice("Really dine and dash?", s_port_hoopz);
            
            // don't dash
            var dash_no = scr_event_build_add_choice(dash_choice, "No, stand and face F.A.T.E.");
            with (dash_no) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I... I can't!)");
                scr_event_build_end();
            }
            // dash!!!!!!!!!!!!!!!!!!!!!!!
            var dash_yes = scr_event_build_add_choice(dash_choice, "Yep, haul keister out of here.");
            with (dash_yes) {
                scr_event_build_quest_state("safiatouDash", 11);
                scr_event_build_execute_event_script(event_swp_safiatouDash01);
            }
            */
            //temp
            //scr_event_build_quest_state("safiatouDash", 11);
            //scr_event_build_execute_event_script(event_swp_safiatouDash01);
/*        }
    } 
    
    //------------------------------------------------------------------------------------------
    // dash_snippet
    //------------------------------------------------------------------------------------------
    with (dash_snippet) {
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Ok... here goes nothing...)");
        scr_event_build_wait_for_actions();
        scr_event_build_move_to_point(o_cts_hoopz, juke_x, juke_y);
        scr_event_build_wait_for_actions();
        scr_event_build_dialogue("Safiatou", safiaport, "Hey! Hey! The check! You forgot the check!");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "!!!");
        scr_event_build_wait_for_actions();
        scr_event_build_move_to_point(o_cts_hoopz, run_x, run_y);
        //scr_event_build_wait_for_actions();
        scr_event_build_fade(true, 1);
        scr_event_build_wait(0.25);
        scr_event_build_teleport(t_room, t_x, t_y);
    }
    
    scr_event_advance(event);
}
