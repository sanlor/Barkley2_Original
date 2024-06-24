// script for Bethunia -- Generic Dancer in Booty Bass quest
// usage: event_tnn_bethunia01

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var bethunia = id;
    var event = scr_event_create_main();
    with (event) {
        // Build events!
        scr_event_build_dialogue("Bethunia", NULL, "Are you even old enough to be in here?");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Don't worry, I'm legal... (barely)...");
    }
    scr_event_advance(event);
}
