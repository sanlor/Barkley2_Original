// Vortigern - random dancer in Booty Bass quest
// usage: event_tnn_vortigern01

if (argument0 == SCRIPT_INTERACT) {
    var vortigern = id;
    var event = scr_event_create_main();
    with (event) {
        if (scr_quest_get_state("bootyBassQuest") > 1) { // *** bootyBassQuest > 1 ***
            scr_event_build_dialogue("Vortigern", NULL, "Yeah, I guess you're alright.");
        }
        else { // *** no conditions ***
            scr_event_build_dialogue("Vortigern", NULL, "I respect what they're going for but to be honest, I'm more of a jazztronica fan.");
        }
    }
    scr_event_advance(event);
}
