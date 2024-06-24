// Event for Ooze Time 1.
// NOTE: FUCK OFF THIS IS ~OOZE~ YOU'RE DEALING WITH!
// usage: event_tnn_ooze01();

// TODO figure this out // What does Ooze do //
if (argument0 == SCRIPT_STEP) {
    // Step
    /*if (scr_quest_get_state("govQuest") == 6) {
        x = 996;
        y = 1745;
    }
    else if (scr_time_get() == 2) {
        x = 1552;
        y = 1072;
    }
    else if (scr_time_get() == 3) {
        x = 872;
        y = 1200;
    }
    else if (scr_time_get() == 4) {
        x = 1960;
        y = 1504;
    }
    else if (scr_time_get() == 5) {
        x = 996;
        y = 1745;
    } */
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var ooze = id;
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Ooze", s_port_ooze, "Fuck off. Don't have time for hanger-ons.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Gulp!)");
        
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Ooze", s_port_ooze, "/'Governor/'.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(???)");
        
        } else if (scr_quest_get_state("govQuest") == 6) {
            //Completed Governor's Quest.
                scr_event_build_dialogue("Ooze", s_port_ooze, "It's not so fun out there. Don't get killed.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Huh, you've been outside Tir na Nog?");
                scr_event_build_dialogue("Ooze", s_port_ooze, "Fuck off.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "...");
                scr_event_build_quest_state("oozeSpoken", 1);
                scr_event_build_quest_state("oozeTirNaNog", 1);

        } else {
        //if you're controlling X114JAM9
            if (scr_time_get() == 1) || (scr_quest_get_state("oozeTirNaNog") == 0) { 
            // Time = 1, OR first time talking
                scr_event_build_dialogue("Ooze", s_port_ooze, "Piss off, kid.");
                scr_event_build_quest_state("oozeSpoken", 1);
                scr_event_build_quest_state("oozeTirNaNog", 1);
            }
            
            else if (scr_time_get() == 2) {
            // Time = 2, already talked
                scr_event_build_dialogue("Ooze", s_port_ooze, "I told you to piss off.");
            }
            
            else if (scr_time_get() == 3) {
            // Time = 3, already talked
                scr_event_build_dialogue("Ooze", s_port_ooze, "I'm busy. Fuck off.");
            }
            
            else if (scr_time_get() == 4) {
            // Time = 4, already talked
                scr_event_build_dialogue("Ooze", s_port_ooze, "I told you to leave me alone.");
            }
            
            else if (scr_time_get() == 5) {
            // Time = 5, already talked
                scr_event_build_dialogue("Ooze", s_port_ooze, "It's not so fun out there. Don't get killed.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Huh, you've been outside Tir na Nog?");
                scr_event_build_dialogue("Ooze", s_port_ooze, "Fuck off.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "...");
                scr_event_build_quest_state("oozeSpoken", 1);
                scr_event_build_quest_state("oozeTirNaNog", 1);
            }
        }
    }
    scr_event_advance(event);
}
