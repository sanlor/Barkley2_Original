// Animayor // Animayor from the first game //
// Initialize //
if (argument0 == SCRIPT_START) {

} 

// Step //
if (argument0 == SCRIPT_STEP) {

}

// Interact //
else if (argument0 == SCRIPT_INTERACT) {

    // Variables //
    var event = scr_event_create_main();
    
    // Main event //
    with (event) {
            // bct_animayor //
            // 0 = First interaction //

            // First interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 0) {

                scr_event_build_dialogue_debug("Animayor", NULL, "Welcome friend. Welcome to Galerie der Kunst. Lose yourrself in the beauty of my collection. See the savagery of the beasts, feel their unsatiable bloodlust. ");
                scr_event_build_quest_state("bct_animayor", 1);
                }
                
            // Second interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 1) {

                scr_event_build_dialogue_debug("Animayor", NULL, "");
                scr_event_build_quest_state("bct_animayor", 2);
                }

            // Third interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 2) {

                scr_event_build_dialogue_debug("Animayor", NULL, "");
                scr_event_build_quest_state("bct_animayor", 3);
                }

            // Fourth interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 3) {

                scr_event_build_dialogue_debug("Animayor", NULL, "");
                scr_event_build_quest_state("bct_animayor", 4);
                }

            // Fifth interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 4) {

                scr_event_build_dialogue_debug("Animayor", NULL, "");
                scr_event_build_quest_state("bct_animayor", 5);
                }

            // Sixth interaction with Animayor //
            if (scr_quest_get_state("bct_animayor") == 5) {

                scr_event_build_dialogue_debug("Animayor", NULL, "");
                scr_event_build_quest_state("bct_animayor", 6);
                }
    }
    scr_event_advance(event);
}
