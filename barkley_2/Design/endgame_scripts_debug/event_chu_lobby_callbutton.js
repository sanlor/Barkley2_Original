// event_chu_lobby_callbutton

/* event_chu_lobby_callbutton - NOTES
Interact, the button on the elevator door.
The elevator will always be at floor 1, L, G, whatever it's called.
There are a few events that can occur:
    1.  Assuming you have no way into the elevator, it can be locked.
    2.  If you have opened the elevator door somehow, through a quest
        or through getting Wiglaf's quest. Or whatever the task may be...
        it will be open, for your first ride up.
    3.  If you have Cyberdwarf with you, he will either:
            A. Chide you for not having all parts of the Cyberspear.
            B. Encourage you to go up.
    4.  There can be special events for Wiglaf's quest. Perhaps a dwarf
        runs up and blows a circuit panel to let you in. You can make it
        "permanently" open while inside? Or with power diversion?
        
TODOS:
    Door object and graphic.
    Teleport to elevator interior.
*/

if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
} else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_get_state("playerX1")
    var playerHoopz = scr_quest_get_state("playerHoopz")
    var playerCC = scr_quest_get_state("playerCC")
    var elevatorRide = scr_quest_get_state("elevatorRide")
    var cdwarfReformat = scr_quest_get_state("cdwarfReformat")
    var elevatorChastise = scr_quest_get_state("elevatorChastise")
    var elevatorCamp = scr_quest_get_state("elevatorCamp")
    var elevatorCSPieces = scr_quest_get_state("elevatorCSPieces")
    var csComplete = scr_quest_get_state("csComplete")

    var elevator_exterior = id;
    var door_open = scr_event_create_child(event);
    var event = scr_event_create_main();
    
    with (event) {
        //------------------------------------------------------------------
        // X114JAM9 SEGMENT
        //------------------------------------------------------------------
        if (playerX1 == 1) {
            if (scr_quest_get_state("wiglafMission") == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "You talked to Wiglaf, so it gets opened... however that occurs.");
            }
            else {
                scr_event_build_dialogue("NARRATOR", NULL, "Idiot! Talk to Wiglaf. But... assuming you haven't... do you have a secret way to get in?");
                var secret_choice = scr_event_build_choice("Do you have a secret way in?", s_port_hoopz);
                var yes = scr_event_build_add_choice("Yep, I'm great at Barkley 2! I know all the secrets!");
                var no = scr_event_build_add_choice("Nope... better talk to Wigs.");
                with (yes) {
                    scr_event_build_event_snippet(door_open);
                }
                with (no) {
                    // end event
                }
            }
        }
        //------------------------------------------------------------------
        // HOOPZ OR CREATEDCHARACTER SEGMENT
        //------------------------------------------------------------------
        else if (cdJoined == 1) {
            if (csComplete == 0) {
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
                    if (csPiecesTotal > elevatorCSPieces) { 
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
                    else if (csPiecesTotal <= elevatorCSPieces) { 
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
            } 
            //--------------------
            // COMPLETE CYBERSPEAR
            //--------------------
            else if (csComplete == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "You got the pieces of the Cyberspear! Cdwarf appears for a sec to say let's do this shit. Or nothing, and you go right to Campfire.");
            }
        }
        //------------------------------------------------------------------
        // REFORMAT SEGMENT
        //------------------------------------------------------------------
        else if (cdJoined == 0) {
            scr_event_build_dialogue("NARRATOR", NULL, "You reformatted Cyberdwarf so nothing happens.");
        }
        scr_event_build_event_snippet(door_open);
    }
    //------------------------------------------------------------------
    // DOOR OPEN SNIPPET
    //------------------------------------------------------------------
    with (door_open) {
        // The door opens, and possibly reveals a teleporter
        //      or maybe the player automatically runs in in a cutscene?
    }
    scr_event_advance(event);
}