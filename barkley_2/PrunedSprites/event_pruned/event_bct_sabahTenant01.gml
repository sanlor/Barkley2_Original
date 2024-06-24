// event_bct_sabahTenant01

if (argument0 == SCRIPT_START) {
    
}
else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var sabahTenant = id;
    var event = scr_event_create_main();
    
    with (event) {
        scr_event_build_dialogue_debug("Sabah", NULL, "Sabah says something here!");
    }
    scr_event_advance(event);  
}
