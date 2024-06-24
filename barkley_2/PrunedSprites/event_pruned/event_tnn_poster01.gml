// Poster inh TNN about antibullying, tied into the entrance to diving game //
if (argument0 == SCRIPT_START) {
    // Init!
} else if (argument0 == SCRIPT_STEP) {
    // Step logic.
} else if (argument0 == SCRIPT_INTERACT) {
    var event = scr_event_create_main();
    with (event) {
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Matthias", s_port_matthias, "Huh, there's a flyer on the wall but I can't read it from up here... how did I even manage to get up these stairs?????");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Hmm, an old looking poster...");
            scr_event_build_dialogue("POSTER", NULL, "Announcement to all dwarfs and Duergars: Bullying is NOT cool. Don't give in to peer pressure, stand up for yourself and for others. You have the power in your hands. Only YOU can stop the vicious cycle. Take these words of wisdom to your heart:");
            scr_event_build_dialogue("POSTER", NULL, "Don't take me down with a punch, take me out to lunch. Stop the slander, increase the candor.");
            scr_event_build_dialogue("POSTER", NULL, "So remember, the next time you want to give someone a swirlie, give it to yourself.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Whoa... These words are so powerful. I think I should give myself a swirlie to even the odds.");
        }
                
    
        // Build events!
        else {
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hmm, an old looking poster...");
        scr_event_build_dialogue("POSTER", NULL, "Announcement to all dwarfs and duergars: Bullying is NOT cool. Don't give in to peer pressure, stand up for yourself and for others. You have the power in your hands. Only YOU can stop the vicious cycle. Take these words of wisdom to your heart:");
        scr_event_build_dialogue("POSTER", NULL, "Don't take me down with a punch, take me out to lunch. Stop the slander, increase the candor.");
        scr_event_build_dialogue("POSTER", NULL, "So remember, the next time you want to give someone a swirlie, give it to yourself.");
        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Whoa... These words are so powerful. I think I should give myself a swirlie to even the odds.");
        }
    }
    scr_event_advance(event);
}
