/* event_gbl_cyberspearCount

This is a generic script that shoudl be run after you get each Cyberspear Piece
It will count the number of spears and give flavor text depending on certain knowledge variables

csQuest
    0 = Have not started quest
    1 = Discussed the AI Ruins Hoopz has started his journey there
    2 = Hoopz talks to cdwarf after turning on the Wifi. Cyberdwarf and is compelled to descend into the ruins
    3 = Cyberdwarf repeating dialogue
    4 = Hoopz finds the Cyberspear altar empty
    5 = Cyberdwarf asks him to descend further into the ruins
    6 = Cyberdwarf repeating dialogue
    7 = Hoopz has found the first piece
    8 = Hoopz talks to Cyberdwarf and is on a quest to find the remaining 3 pieces
    9 = repeating dialogue. (this will be tracked by csPiecesTotal)
   10 = Hoopz has all 4 pieces
   11 = Hoopz has been told to go back to Cyberdwarf to assemble the pieces
   12 = Repeating dialogue
    
csComplete
    0 - the Cyberspear is not complete and Hoopz doesn't have knowledge to complete it
    1 - the Cyberspear pieces been collected and Cyberdwarf has told you to go assemble them
    2 - Hoopz has assembled the Cyberspear

csPieceFactory
    0 = Hoopz has not seen the Factory Piece
    1 = Hoopz seen the Factory Piece
    2 = Hoopz now realizes that the Factory Piece is a CS Piece and decides to go get it
    3 = Cyberdwarf filler dialogue to go get the piece
    4 = Cyberdwarf looping dialogue to go get the piece
    5 = Hoopz has the piece

csPieceGrem
    0 = Hoopz has not completed the cybergremlin quest
    1 = Hoopz has completed the cybergremlin quest
    2 = Hoopz now realizes that the Clispeathian relic is a CS Piece, Cdwarf has told him to go retrieve it
    3 = Cyberdwarf filler dialogue
    4 = Cyberdwarf repeating dialogue
    5 = Hoopz has the piece

csDaisSeen
    1 = you've seen the empty dais
    2 = you've seen and talked to C-dwarf about the empty dais
*/

/*if (argument0 == SCRIPT_START) {

}
if (argument0 == SCRIPT_STEP) {

}
if (argument0 == SCRIPT_INTERACT) {
    var cscount = id;
    
    //Main Event
    var event = scr_event_create_main();
    
    //Cyberspear Variables
    var csQuest = scr_quest_get_state("csQuest");
    var csPieceAIRuins = scr_quest_get_state("csPieceAIRuins");
    var csPieceFactory = scr_quest_get_state("csPieceFactory");
    var csPieceGrem = scr_quest_get_state("csPieceGrem");
    var csPiecesTotal = scr_quest_get_state("csPiecesTotal");
    var csComplete = scr_quest_get_state("csComplete");
    
    with (event) {
        // Count the number of Cyberspear Pieces, there are a few different approaches to this, but 
        // If this is your 4th Cyberspear Piece
        if csPiecesTotal == 3 {
            //TODO: add dialogue
            scr_event_build_dialogue_debug("bhroom", "s_port_bhroom01", "This is the final dialogue from getting the 4th Cyberspear Piece.");
            Quest("csQuest", 9);
        }
        
        //If this is your 1st Cyberspear Piece
        else if csPiecesTotal == 0 {
            Dialogue(P_NAME, "This is it!");
            Wait(1);
            Dialogue(P_NAME, "Wait a gosh darn minute!  This isn't the spear...", s_port_hoopzAngry);
            Dialogue(P_NAME, "It's all broken!", s_port_hoopzSurprise);
            Dialogue(P_NAME, "There has gotta be more to this thing. I better get back to Cyberdwarf and tell him that I only found this one piece!");
            Wait(1);
            
            // Hoopz considers what he's seen before
            
            // If you don't know that the place you saw in the tutorial is the Factory (as in not been back to Factory)
            if (csPieceFactory == 1) {
                Dialogue(P_NAME, "In fact, didn't I see something like this after I was boosted out of that egg?");
                //TODO: think we could do a quick flashback to that scene? (we also do it in csPieceFactory == 2 below
                Dialogue(P_NAME, "That's gotta be where another piece is!", s_port_hoopzSurprise);
                //Look down contemplation
                scr_event_build_wait(0.25);
                scr_event_build_look(o_cts_hoopz, WEST);
                scr_event_build_wait(0.25);
                scr_event_build_look(o_cts_hoopz, SOUTHWEST);
                scr_event_build_wait(0.25);
                scr_event_build_look(o_cts_hoopz, SOUTH);
                scr_event_build_wait(0.25);
                scr_event_build_animation_play_and_set(o_cts_hoopz, "sad0", "sad1");
                Dialogue(P_NAME, "If only I knew where that was...", s_port_hoopzSad);
                Wait(0.25);
                scr_event_build_look(o_cts_hoopz, SOUTH);
                Dialogue(P_NAME, "Maybe The Cyberdwarf knows! Gotta get back!", s_port_hoopzHappy);
            }
            //If you know that the place you saw the piece in the tutorial is the factory
            else if (csPieceFactory == 2) {
                Dialogue(P_NAME, "Hold the phone...");
                Wait(0.5);
                Dialogue(P_NAME, "I've seen another piece before!");
                //TODO: think we could do a quick flashback to that scene? (we also do it in csPieceFactory == 1 abov
                Dialogue(P_NAME, "That's right! It was in the Factory... that must be the same place I got boosted out of that egg!");
                Dialogue(P_NAME, "I gotta get back there and figure out where that piece is!");
                Quest("csPieceFactory", 3);
            }
            
            //If you already have the Cyberspear Piece from the Factory.
            else if (csPieceFactory == 5) {
                Dialogue(P_NAME, "By George, I found a piece just like this in the Factory!");
                Wait(1);
                Dialogue(P_NAME, "Looks like this is the same thing I already have! Great, now I have two pieces and I'm a leg up on that Ole Cuchu! The Cyberdwarf is sure to give me some mad props! Time to kick the tyres and lyght the fyres!");
            }
        }
    }
    scr_event_advance(event);    
}
