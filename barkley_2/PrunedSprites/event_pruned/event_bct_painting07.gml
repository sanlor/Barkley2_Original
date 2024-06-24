// Painting //

if (argument0 == SCRIPT_START) {
    // Init!
} else if (argument0 == SCRIPT_STEP) {
    // Step logic.
} else if (argument0 == SCRIPT_INTERACT) {
    var event = scr_event_create_main();
    with (event) {
            scr_event_build_create_object(o_mg_artgallery, 6, 0);
    }
    scr_event_advance(event);
}
