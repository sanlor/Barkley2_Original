// event_mtn_ugra01

if (argument0 == SCRIPT_START) {}
else if (argument0 == SCRIPT_STEP) {}
else if (argument0 == SCRIPT_INTERACT) {
    var ugra = id;
    var event = scr_event_create_main();
    
    with (event) {
    
    }
    scr_event_advance(event);
}
