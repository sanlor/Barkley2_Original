//-----------------
// FIRST CHASTENING
//-----------------
if (elevatorChastise == 0) { 
    scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf appears to chastise.");
    switch (csPiecesTotal) {
        case 0:
            scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for not having ANY pieces of the Cyberspear.");
            break;
        case 1:
            scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for not having only 1 piece of the Cyberspear.");
            break;
        case 2:
            scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for not having only 2 pieces of the Cyberspear.");
            break;
        case 3:
            scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for not having only 3 pieces of the Cyberspear.");
            break;
        case 4:
            scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for not having all 4 pieces of the Cyberspear, but not having forged it yet (very optional).");
            break;
    }
    scr_event_build_quest_state("elevatorChastise", 1)
    scr_event_build_quest_state("elevatorCSPieces", csPiecesTotal)
    scr_event_build_dialogue("NARRATOR", NULL, "The current value of Cyberspear pieces is set at " + string(csPiecesTotal) + ". No chastising will then occur until the amount is increased.");
} 
//---------------
// 2+ CHASTENINGS
//---------------
else if (elevatorChastise == 1) {
    //------------
    // NEW PIECES!
    //------------
    if (csPiecesTotal > (elevatorCSPieces) { 
        switch (csPiecesTotal) {
            case 0:
                scr_event_build_dialogue("NARRATOR", NULL, "Impossible to occur, but will prevent a crash.");
                break;
            case 1:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for now only having 1 piece. There's still more!");
                break;
            case 2:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for now only having 2 pieces. There's still more!");
                break;
            case 3:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for now only having 3 pieces. There's still more!");
                break;
            case 4:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chastises player for now only having 4 pieces. It still must be formed!");
                break;
        }
        scr_event_build_quest_state("elevatorCSPieces", csPiecesTotal)
    } 
    //--------------
    // NO NEW PIECES
    //--------------
    else if (csPiecesTotal <= (elevatorCSPieces) { 
        switch (csPiecesTotal) {
            // These COULD all be generic.
            case 0:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chides again. On way up could be generic, on way down could be a /'thanks for listening./'");
                break;
            case 1:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chides again. On way up could be generic, on way down could be a /'thanks for listening./'");
                break;
            case 2:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chides again. On way up could be generic, on way down could be a /'thanks for listening./'");
                break;
            case 3:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chides again. On way up could be generic, on way down could be a /'thanks for listening./'");
                break;
            case 4:
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf chides again. On way up could be generic, on way down could be a /'thanks for listening./'");
                break;
        }
    }
}
scr_event_build_event_snippet(begin_ride);
