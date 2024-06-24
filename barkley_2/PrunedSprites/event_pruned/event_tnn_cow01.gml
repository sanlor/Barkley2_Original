//used by cow01 in Tir na Nog

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var cow01 = id;
    var event = scr_event_create_main();
    with (event) {
            scr_event_build_dialogue("Cow", NULL, "MOOOOOOOOOO!");
            scr_event_build_dialogue("Marina", NULL, "Settle down now, Bess! Don't mind her, she's just a little hungry.");  
        }
    scr_event_advance(event);
}
