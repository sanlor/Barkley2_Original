// event_bct_wizardTenant01

if (argument0 == SCRIPT_START) {
    
}
else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var wizardTenant = id;
    var event = scr_event_create_main();
    
    with (event) {
        scr_event_build_dialogue("WIZARD", NULL, "I'M WIZARD.");
    }
    scr_event_advance(event);  
}
