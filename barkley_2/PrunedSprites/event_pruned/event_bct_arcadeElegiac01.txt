// Elegiac 0rd (Arcade Game)
// event_bct_arcadeElegiac01
/*
This is the script for the Arcade Game Elegiac 0rd.
It will call a minigame object, but right now I am just dropping in bits of dialogue.

Variables Used:
    topScoreGame
        0 = haven't yet talked
        1 = didn't play
        2 = lost
        3 = tied
        4 = won
        5 = won with cheating, by a lot
    topScoreTime
        X = the time variable at the time you won the game
    elegiacScore
        X = score in the game
    elegiacPaused
        0 = didn't pause
        1 = paused the game
*/

/*if (argument0 == SCRIPT_START) {
    // Init!

} 
else if (argument0 == SCRIPT_STEP) {
    // Step logic.
    if (!visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 4) {
        // TIME = 4, reappear
        scr_event_interactive_activate();
    }
    else if (visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 3) {
        // TIME = 3, disappear
        scr_event_interactive_deactivate();
    }
}

else if (argument0 == SCRIPT_INTERACT) {
    var elegiac = id;
    
    var event = scr_event_create_main();
    var after_game = scr_event_create_child(event);
    
    //-----------
    // after_game
    //-----------
    with (snippet) {
        if (elegiacScore <= 8) {
            scr_event_build_dialogue("Top Score", NULL, "Gotta get up earlier than that to beat me... They don't call me Top Score for nothing!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Dang... I need to practice.");
            scr_event_build_dialogue("Top Score", NULL, "This is my machine!");
            scr_event_build_quest_state("topScoreGame", 2);
        } 
        else if (elegiacScore == 10) {
            scr_event_build_dialogue("Top Score", NULL, "A tie... you're as good as me? Can't be... I got it first!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I've got your score on the ropes, /'Top Score/'!");
            scr_event_build_dialogue("Top Score", NULL, "(Jeez... I'm sweating...)");
            scr_event_build_quest_state("topScoreGame", 3);
        }
        else if (elegiacScore >= 11) {
            // *KNEES SHAKING EFFECT*
            scr_event_build_dialogue("Top Score", NULL, "D... dear Clispaeth. Top Score has fallen...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, yeah! I don't pretend to contend! I do it for real!");
            scr_event_build_dialogue("Top Score", NULL, "What impeccable play!... please accept my apology!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Heh... don't sweat it, but also don't doubt me! At least not when it comes to vidcons.");
            scr_event_build_dialogue("Top Score", NULL, "Of course, of course!");
            if (elegiacScore >= 20) && (elegiacPaused == 1) { scr_event_build_quest_state("topScoreGame", 5); } 
            else { scr_event_build_quest_state("topScoreGame", 4); }
        }
    }  
    
    //-----------
    // MAIN EVENT
    //-----------
    with (event) {
        // After Game Ends
        scr_event_build_dialogue("Elegiac 0rd", NULL, "0rd");
    }
    scr_event_advance(event);
}
