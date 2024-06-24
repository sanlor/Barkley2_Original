// Script for Zelda, a dwarf at the bar in Al-Akihabara
// usage: event_dz2_zelda01
/*
// description:
    Zelda is a dwarf that is hanging out in 
// variables used:

*/
if (argument0 == SCRIPT_START) {
    // Init!

} 
else if (argument0 == SCRIPT_STEP) {
    // Step logic.
    if (!visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 4) {
        // TIME = 4, reappear
        scr_event_interactive_activate();
    }
    else if (visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 3) {
        // TIME = 3, disappear
        scr_event_interactive_deactivate();
    }
}

else if (argument0 == SCRIPT_INTERACT) {
    var blank = id;
    
    var event = scr_event_create_main();
    var snippet = scr_event_create_child(event);
    
    //-------------
    // SNIPPET
    //-------------
    with (snippet) {
    
    }  
    
    //-----------
    // MAIN EVENT
    //-----------
    with (event) {
        scr_event_build_dialogue("", NULL, "");
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
        scr_event_build_dialogue("", NULL, "");
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
    
    
    
    }
    scr_event_advance(event);
} 