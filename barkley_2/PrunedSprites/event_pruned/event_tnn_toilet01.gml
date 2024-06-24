// Toilet in TNN blockhouse, connects the pleyr to diving game//
if (argument0 == SCRIPT_START) {
    // Init!
} else if (argument0 == SCRIPT_STEP) {
    // Step logic.
} else if (argument0 == SCRIPT_INTERACT) {
    var event = scr_event_create_main();
    with (event) {
        // Build events!
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Time to see how the other half lives...");
        scr_event_build_create_object(o_mg_diving_start, o_hoopz.x, o_hoopz.y);
        
        // Question //
        //Give yourself a swirlie? //
        
        // Yes //
        //scr_event_build_dialogue(P_NAME, s_port_hoopz, "So desu ne....");
        // Teleport to diving game //
            
        // No //
        //scr_event_build_dialogue(P_NAME, s_port_hoopz, "No... I... I can't do it."); 
    }
    scr_event_advance(event);
}
