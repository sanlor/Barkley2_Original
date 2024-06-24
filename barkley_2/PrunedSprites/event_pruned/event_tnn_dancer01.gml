// Dancer 1 - Generic Dancer in Booty Bass
// usage: event_tnn_dancer01


if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var dancer01 = id;
    var event = scr_event_create_main();
    with (event) {
        // Build events!
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(This guy is so cool... I can't wait until I'm old enough to dance like this...)");
    }
    scr_event_advance(event);
}
