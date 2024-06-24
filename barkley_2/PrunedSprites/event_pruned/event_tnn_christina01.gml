// Event for Christina, woman in tnn.
// appears at times 2 and 4.

if (argument0 == SCRIPT_START) {
    if (scr_tnn_curfew("during")) {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 1) {
        scr_event_interactive_deactivate();
    }
    else if scr_quest_get_state("mortgageOver") != 2 {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 2) {
        scr_event_interactive_activate();
    }
    else if (scr_time_get() == 4) {
        scr_event_interactive_activate();
    }
    else if (scr_time_get() >= 5) {
        scr_event_interactive_deactivate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {

        scr_event_build_dialogue("Christina", NULL, "Man, looks like I got here too late. I was going to ask for a new apartment - my neighbor's always blasting vidcons all night and I can barely sleep, but it's closed! I can't go another night with those noisy vidcons! What am I gonna do?");
    }
    scr_event_advance(event);
}
