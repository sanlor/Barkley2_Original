// Script for Top Score (Arcade Danmaku Player)
// event_bct_topScore01
/* Top Score is a player who is playing the Danmaku Game at the the Brain City Arcade. If you challenge him, you'll get to play Elegiac 0rd. 
Variables used:
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

}
else if (argument0 == SCRIPT_INTERACT) {
    var topscore = id;
    
    var timesince = scr_time_get() - scr_quest_get_state("topScoreTime");
    var topScoreGame = scr_quest_get_state("topScoreGame");
    
    var event = scr_event_create_main();
    //-----------
    // MAIN EVENT
    //-----------
    with (event) {    
        // won
        if (topScoreGame >= 4) {
            if (timesince <= 5) { scr_event_build_dialogue("Top Score", NULL, "Forgive my former arrogance, please!"); }
            else if (timesince <= 10) { scr_event_build_dialogue("Top Score", NULL, "It's been so long since I've had the top score..."); } 
            else { scr_event_build_dialogue("Top Score", NULL, "My name is Middle Score now."); }
            scr_event_build_end();
        }
        // tied
        else if (topScoreGame == 3) { scr_event_build_dialogue("Top Score", NULL, "You were close, " + P_NAME + "... but close doesn't cut it! Are you ready to plunge yourself back into the chaos of Elegiac 0rd?"); }
        // lost
        else if (topScoreGame == 2) { scr_event_build_dialogue("Top Score", NULL, "Back again, back again... ready to get drubbed, soundly?"); }
        // didn't play
        else if (topScoreGame == 1) { scr_event_build_dialogue("Top Score", NULL, "Finally gathered the courage? The courage to face defeat!?"); }
        // first time talking
        else if (topScoreGame == 0) {
            scr_event_build_dialogue("Top Score", NULL, "Well, what have we here? A challenger? A contender?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Contender...? Contend with what?");
            scr_event_build_dialogue("Top Score", NULL, "Contend with my score in Elegiac 0rd!");
        }            
        var choice = scr_event_build_choice("Contend with Top Score?", s_port_hoopz);
        var yes = scr_event_build_add_choice(choice, "I am the new contender.");
        with yes {
            // tied
            if (topScoreGame == 3) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm back, and I've learned from my mistakes. Move over!");
                scr_event_build_dialogue("Top Score", NULL, "Whoa!");
            }
            // lost
            if (topScoreGame == 2) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "There will be no such drubbing. I'm your contender, again!");
                scr_event_build_dialogue("Top Score", NULL, "Come and get me!");
            }
            // didn't play
            if (topScoreGame == 1) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm gonna give it a shot. I'm the new contender.");
                scr_event_build_dialogue("Top Score", NULL, "There's no chance. Not one in a million!");
            }
            // first time
            if (topScoreGame == 0) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll top you! I'll body your score! I'm the new contender!");
                scr_event_build_dialogue("Top Score", NULL, "Then bring it on!");
            }
            // RUN THE MINIGAME OBJECT!
        }
        var no = scr_event_build_add_choice(choice, "I am not the new contender.");
        with no {
            // tied
            if (topScoreGame == 3) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Not yet... not yet...");
                scr_event_build_dialogue("Top Score", NULL, "A tie is the farthest you'll ever get. Hold on to that feeling!");
            }
            // lost
            if (topScoreGame == 2) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "No... I'm not ready!");
                scr_event_build_dialogue("Top Score", NULL, "Take a lesson from your failure... and give up already! The /'Top Score/' will always stand!");
            }
            // didn't play
            if (topScoreGame == 1) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Nope, no challenge. Just looking.");
                scr_event_build_dialogue("Top Score", NULL, "I love a challenge, but I don't blame you... my /'Top Score/' is unreachable!");
            }
            // first time
            if (topScoreGame == 0) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "No thanks. No challenges from me today.");
                scr_event_build_dialogue("Top Score", NULL, "Can't approach the glorious summit of my high-level play? Then what are you doing? Make room for real contenders!");
                scr_event_build_quest_state("topScoreGame", 1);
            }
        }
    }
    scr_event_advance(event);
}
