00. Lobby Call Button
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
    var playerX1 = scr_quest_state_get("playerX1")
    var playerHoopz = scr_quest_state_get("playerHoopz")
    var playerCC = scr_quest_state_get("playerCC")
    var elevatorRide = scr_quest_state_get("elevatorRide")
    var cdwarfReformat = scr_quest_state_get("cdwarfReformat")
    var elevatorChastise = scr_quest_state_get("elevatorChastise")
    var elevatorCamp = scr_quest_state_get("elevatorCamp")
    var elevatorCSPieces = scr_quest_state_get("elevatorCSPieces")
    var csComplete = scr_quest_state_get("csComplete")

    var elevator_exterior = id;
    var door_open = scr_event_create_child(event);
    var event = scr_event_create_main();
    
    with (event) {
        if (playerX1 == 1) {
            if (scr_quest_state_get("wiglafMission") == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "You talked to Wiglaf, so it gets opened... however that occurs.");
            }
            else {
                scr_event_build_dialogue("NARRATOR", NULL, "Idiot! Talk to Wiglaf. But... assuming you haven't... do you have a secret way to get in?");
                var secret_choice = "Do you have a secret way in?" YES/NO
                var yes
                var no
                with (yes) {
                    // scr_event_build_event_snippet(door_open);
                }
                with (no) {
                    // end event
                }
            }
        }
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
            else if (csComplete == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "You got the pieces of the Cyberspear! Cdwarf appears for a sec to say let's do this shit. Or nothing, and you go right to Campfire.");
            }
        }
        //-----------------
        // REFORMAT SEGMENT
        //-----------------
        else if (cdJoined == 0) {
            scr_event_build_dialogue("NARRATOR", NULL, "You reformatted Cyberdwarf so nothing happens.");
        }
        scr_event_build_event_snippet(door_open);
    }
    
    with (door_open) {
        // The door opens, and possibly reveals a teleporter
        //      or maybe the player automatically runs in in a cutscene?
    }
    scr_event_advance(event);
}
//-----------------------------------------------------------------------------------------------------------
01. Elevator
/* event_chu_elevator - NOTES
Autostart, in Elevator
Has a background event that advances a graphic from 1 to 666 over 5m. 
    133.2 per minute, 2.22 per second. There are 3 things that can happen:
    
1. X114JAM9: Nothing. A 5 minute wait as the elevator rides up.
2. With Cyberdwarf, with incomplete Cyberspear: Chided, told you're not ready, etc.
3. With Cyberdwarf, with incomplete Cyberspear: Campfire, told to do suicides.

// TODO:
    1. Text/writing, obviously
    2. Time logic, perhaps, for the Chastising and Campfire
    3. Some acknowledgement of the first time returning to the Lair (exterior?)
    4. Complete scripting of Campfire scene.
    5. Distinguish between ElevatorUp and ElevatorDown
*/
with (event) {
    //-----------------
    // X114JAM9 SEGMENT
    //-----------------
    if (QVAR("playerX1") == 1) { // Player is X114JAM9.
        if (QVAR("wiglafMission") == 1) { // Wiglaf's quest is accepted, but not completed.
            if (QVAR("elevatorRide") == 0) { // Elevator has not been ridden. 
                // WITH Wiglaf's Quest on.
                // Riding elevator for the first time.
                /* OPTIONS:
                * Nothing?
                * A remark about how he feels a "chilling power?"
                * A remark about Wiglaf, Cyberdwarf, the mission, etc?
                * Marquee scrolls?... about how long the elevator is?
                    ... about Wiglaf?
                    ... about Cyberdwarf?
                */
                QSET("elevatorRide", 1)
            } else { // Elevator has been ridden. 
                // WITH Wiglaf's Quest on.
                // Riding elevator for a second, third, xth time. 
                /* OPTIONS:
                * Nothing?
                * A remark about trying it again?
                * A remark about Wiglaf, Cyberdwarf, the mission, etc?
                * Marquee scrolls? ... about how long the elevator is?
                    ... about Wiglaf?
                    ... about Cyberdwarf?
                    ... about how this was suicide?
                    ... about his past failed attempt?
                */
            }
        } else if (QVAR("wiglafMission") == 0) { // Wiglaf's quest has not been accepted.
            if (QVAR("elevatorRide") == 0) { // Elevator has not been ridden.
                // Riding elevator for the first time. No quest.
                /* OPTIONS:
                * Nothing?
                * A remark about how he feels a "chilling power?"
                * Marquee scrolls?... about how long the elevator is?
                */
                QSET("elevatorRide", 1)
            } else { // Elevator has been ridden.
                // Riding elevator for a second, third, xth time. No quest.
                /* OPTIONS:
                * Nothing?
                * A remark about trying it again?
                * Something about how boring the elevator is?
                * Marquee scrolls?
                */
            }
        }
    }
    //--------------------
    // HOOPZ OR CC SEGMENT
    //--------------------
    else if (QVAR("playerCC") == 1) || (QVAR("playerHoopz") == 1) {
        if (QVAR("cdwarfReformat") == 0) { // Cyberdwarf is not reformatted, is still with the player.
            if (QVAR("csComplete") == 0) { // Cyberspear is not yet complete.
                //-------------------
                // CHASTISING SEGMENT
                //-------------------
                if (QVAR("elevatorChastise") == 0) { // Have not been chastised by Cyberdwarf
                    switch (QVAR("csPiecesTotal")) {
                        case 0:
                            
                            break;
                        case 1:
                        
                            break;
                        case 2:
                            
                            break;
                        case 3:
                            
                            break;
                        case 4:
                            
                            break;
                    }
                    QSET("elevatorChastise", 1)
                    QSET("elevatorCSPieces", (QVAR("csPiecesTotal"))
                } else if (QVAR("elevatorChastise") == 1) { // Have been chastised by Cyberdwarf
                    if (QVAR(("csPiecesTotal") > (QVAR("elevatorCSPieces")) { // More CS pieces found.
                        switch (QVAR("csPiecesTotal")) {
                            case 0:
                                
                                break;
                            case 1:
                            
                                break;
                            case 2:
                                
                                break;
                            case 3:
                                
                                break;
                            case 4:
                                
                                break;
                        }
                        QSET("elevatorCSPieces", (QVAR("csPiecesTotal"))
                    } else if (QVAR("csPiecesTotal") <= (QVAR("elevatorCSPieces")) { // No more CS pieces found.
                        switch (QVAR("csPiecesTotal")) {
                            // These COULD all be generic.
                            case 0:
                                
                                break;
                            case 1:
                            
                                break;
                            case 2:
                                
                                break;
                            case 3:
                                
                                break;
                            case 4:
                                
                                break;
                        }
                    }
                }
            //-----------------
            // CAMPFIRE SEGMENT
            //----------------- 
            } else if (QVAR("csComplete") == 1) { // Cyberspear is complete.
                if (QVAR(("elevatorCamp") == 1) { // Camp scene has already occured.
                    // Generic dialogue
                    // Nothing?
                    // Who knows... yet...
                } else if (QVAR(("elevatorCamp") == 0) {
                    // Campfire segment.
                    string(playerName) + "don't you think you should do some calisthenics?"
                    // TODO
                }
            }
        //-----------------
        // REFORMAT SEGMENT
        //-----------------
        } else if (QVAR("cdwarfReformat") == 1) {
            // Waiting
            // Marquee has stuff about the timer?
            // Marquee or Hoopz says FUCK THE SPEARS IMMA KILL CUCHU?
            // Nothing?
            // Who knows... yet?
        }
    }
}
//-----------------------------------------------------------------------------------------------------------
02. Crustacea Door
/* event_chu_crustacea_door - NOTES
Interact, on the door to CuchuCrustacea
*/
with (event) {
    //-----------------------
    // CRUSTACEA DEAD SEGMENT
    //-----------------------
    if (QVAR("crustDead") == 1) { // CuchuCrustacea has been killed
        teleport
    }
    //-----------------
    // X114JAM9 SEGMENT
    //-----------------
    else if (QVAR("playerX1") == 1) { // Player is X114JAM9
        if (QVAR("crustDoorSolo") == 0) { // Have not approached door before
            if (QVAR("wiglafMission") >= 1) { var bossname = "Is this where Cuchulainn is? I could fight him" } // On Wiglaf's quest
            else if (QVAR("wiglafMission") == 0) { var bossname = "Maybe this is where I'll find the Cyberdwarf" } // Not on Wiglaf's quest
            "(Whoa... I can feel a chilling power behind this door. " + string(bossname) + "... or maybe this is where I stop...)"
            var door_choice: "Open the door?"
            var yes
            var no
            with (yes) {
                "All right, here goes nothing!"
                // Door opens, battle begins
                QSET("crustDoorSolo", 2);
                QSET("crustDoorAny", 2);
                teleport
            } with (no) {
                "I don't know... maybe I'll come back later."
                QSET("crustDoorSolo", 1);
                QSET("crustDoorAny", 1);
            }
        } else if (QVAR("crustDoorSolo") == 1) { // Approached door, did not enter
            /*
            if (QVAR("wiglafMission") >= 1) { var bossname = "Is this where Cuchulainn is? I could fight him" }
            else if (QVAR("wiglafMission") == 0) { var bossname = "Maybe this is where I'll find the Cyberdwarf" }
            "(Whoa... I can feel a chilling power behind this door. " + string(bossname) + "... or maybe this is where I stop...)"
            */
            "SAY SOMETHING OR OTHER... I DUNNO"
            var door_choice: "Open the door?"
            var yes
            var no
            with (yes) {
                "All right, here goes nothing!"
                // Door opens, battle begins
                QSET("crustDoorSolo", 2)
                QSET("crustDoorAny", 2);
                teleport
            } with (no) {
                "I don't know... maybe I'll come back later."
            }
        }
        else if (QVAR("crustDoorSolo") == 2) { // Entered door, fought CuchuCrustacea, and lost
            if (QVAR("wiglafMission") >= 1) { var bossname = "that Cuchulainn thing is bad. Wiglaf is insane. He's insane..." }
            else if (QVAR("wiglafMission") == 0) { var bossname = "that thing said it was Cuchulainn, not a Cyberdwarf... is this the right way?" }
            "(I don't think I wanna go back in there..." + string(bossname)
            var door_choice: "Open the door?"
            var yes
            var no
            with (yes) {
                "(Oh boy... here it goes...)"
                // Door opens, battle begins
                teleport
            } with (no) {
                "(I'm not ready for this... maybe I should just tell Lft. Wiglaf)."
            }
        }
    }
    //--------------------
    // HOOPZ OR CC SEGMENT
    //--------------------
    else if (QVAR("playerCC") == 1 )|| (QVAR("playerHoopz") == 1) { // Hoopz or CreatedCharacter 
        //---------------------
        // COMPLETED CYBERSPEAR
        //---------------------
        if (QVAR("csComplete") == 1) { // Cyperspear complete
            if (QVAR("crustDoorComplete") == 0) { // First time with complete spear.
                if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 0) { 
                // Solo = approached or not. With incomplete spear = not approached.
                    "This is it. Are you ready, *NAME*?"
                    "Cuchulainn has ignored us for now, but if we cross beyond this point, he will surely show us his worst."
                    var refusetext = 
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = approached or not. With incomplete spear = approached but not entered.
                    "NOW we are ready my child. Open the door and face Cuchulainn. Destroy him once and for all!"
                    var refusetext = 
                } else if (QVAR("crustDoorSolo" == 2) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = fought. With incomplete spear = not approached.
                    "Now you are ready, child. Crush him!"
                    var refusetext = 
                } else if (QVAR("crustDoorSolo" == 2) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = fought. With incomplete spear = approached but not entered.
                    "This is it. Are you ready, *NAME*?"
                    "Cuchulainn has ignored us for now, but if we cross beyond this point, he will surely show us his worst."
                    var refusetext = 
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 2) {
                // Solo = approached or not. With incomplete spear = fought.
                    "This is it. Are you ready, *NAME*?"
                    "Cuchulainn has ignored us for now, but if we cross beyond this point, he will surely show us his worst."
                    var refusetext = 
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 2) {
                // Solo = fought. With incomplete spear = fought.
                    "This is it. Are you ready, *NAME*?"
                    "Cuchulainn has ignored us for now, but if we cross beyond this point, he will surely show us his worst."
                    var refusetext = 
                }
                CHOICE: "Open the door?" YES/NO
                if YES {
                    // Door opens, battle begins
                    QSET("crustDoorComplete", 2)
                } else (NO) {
                    string(refusetext)
                    QSET("crustDoorComplete", 1)
                }
            } else if (QVAR("crustDoorComplete") == 1) {
                if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 0) { 
                
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = approached, maximum. With incomplete spear = approached but not entered.
                   
                } else if (QVAR("crustDoorSolo" == 2) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = fought. With incomplete spear = not approached.
                    
                } else if (QVAR("crustDoorSolo" == 2) && (QVAR("crustDoorIncomplete") == 1) {
                // Solo = fought. With incomplete spear = approached but not entered.
                    
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 2) {
                // Solo = approached, maximum. With incomplete spear = fought.
                    
                } else if (QVAR("crustDoorSolo" <= 1) && (QVAR("crustDoorIncomplete") == 2) {
                // Solo = fought. With incomplete spear = fought.
                    
                }
            
            }
            else if (QVAR("crustDoorComplete") == 2) {
                "Let's do it!"
                teleport
            }
        } 
        
        //----------------------
        // INCOMPLETE CYBERSPEAR
        //----------------------
        else (QVAR("csComplete") == 0) {
            if (QVAR("crustDoorIncomplete" == 0)) {
                if (QVAR("crustDoorSolo") <= 1) {
                
                } else if (QVAR("crustDoorSolo") == 2) {
                
                }
            } else if (QVAR("crustDoorIncomplete" == 1)) {
                if (QVAR("crustDoorSolo") <= 1) {
                    
                } else if (QVAR("crustDoorSolo") == 2) {
                
                }
            } else if (QVAR("crustDoorIncomplete" == 2)) {
                if (QVAR("crustDoorSolo") <= 1) {
                
                } else if (QVAR("crustDoorSolo") == 2) {
                
                }
            } 
        }
    }
}
//-----------------------------------------------------------------------------------------------------------
03. Crustacea Entrance
/* event_chu_crustacea_entrance - NOTES
Start, upon entering CuchuCrustacea's Room
*/
with (event) {
    //---------------------------
    // HE DEAD... CUCHU'S DEAD!!!
    //---------------------------
    if (QVAR("crustDead") == 1) {
        // Destroy Event
    }
    /*
     .----------------. 
    | .--------------. |
    | |     __       | |
    | |    /  |      | |
    | |    `| |      | |
    | |     | |      | |
    | |    _| |_     | |
    | |   |_____|    | |
    | |              | |
    | '--------------' |
     '----------------' 
    */
    if (QVAR("crustFightAny") == 0) {
        // animation, intro
        // Normal Cuchulainn taunt
        // XXXplosions
        // A flash of light, whatever
        // Scanline-version appears just in front of the screen
        //---------
        // X114JAM9
        //---------
        if (QVAR("playerX1") == 1) {    
            if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
            
            }
            else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
            
            }
            QSET("crustFightAny", 1);
            QSET("crustFightSolo", 1);
        } 
        //------------
        // HOOPZ OR CC
        //------------
        else if (QVAR("playerCC") == 1) || (QVAR("playerHoopz") = 1) {
            //-----------
            // INCOMPLETE
            //-----------
            if (QVAR("csComplete") == 0) {
                // Unconfident Cyberdwarf response
                QSET("crustFightAny", 1);
                QSET("crustFightIncomplete", 1);
            } 
            //---------
            // COMPLETE
            //---------
            else {
                // Confident Cyberdwarf response
                QSET("crustFightAny", 1);
                QSET("crustFightComplete", 1);
            } 
        }
    }
    /*
     .----------------------------. 
    | .--------------------------. |
    | |    _____         _       | |
    | |   / ___ `.      | |      | |
    | |  |_/___) |   ___| |___   | |
    | |   .'____.'  |___   ___|  | |
    | |  / /____        | |      | |
    | |  |_______|      |_|      | |
    | |                          | |
    | '--------------------------' |
     '----------------------------' 
    */
    else if (QVAR("crustFightAny" >= 1) {
        // "Back for more?" taunt
        
        //---------
        // X114JAM9
        //---------
        if (QVAR("playerX1") == 1) {
            // Nothing?
            if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
            
            }
            else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
            
            }
        } 
        //------------
        // HOOPZ OR CC
        //------------
        else if (QVAR("playerCC") == 1) || (QVAR("playerHoopz") = 1) {
            //-----------
            // INCOMPLETE
            //-----------
            if (QVAR("csComplete") == 0) {
                if (QVAR("crustFightSolo") == 1) && (QVAR("crustFightIncomplete") == 0) {
                    // Unconfident Cyberdwarf response
                    QSET("crustFightIncomplete", 1);
                } else if (QVAR("crustFightSolo") == 0) && (QVAR("crustFightIncomplete") == 1) {
                    // Nothing?
                } else if (QVAR("crustFightSolo") == 1) && (QVAR("crustFightIncomplete") == 1) {
                    // Nothing?
                }
            } 
            //---------
            // COMPLETE
            //---------
            else {
                if (QVAR("crustFightComplete") == 0) {
                    if (QVAR("crustFightSolo") == 1) && (QVAR("crustFightIncomplete") == 0) {
                        // Very confident Cyberdwarf response
                    } else if (QVAR("crustFightSolo") == 0) && (QVAR("crustFightIncomplete") == 1) {
                        // Returned, more confident Cyberdwarf response
                        
                    } else if (QVAR("crustFightSolo") == 1) && (QVAR("crustFightIncomplete") == 1) {
                        // Returned, more confident Cyberdwarf response
                    }
                    // Confident Cyberdwarf response
                    QSET("crustFightComplete", 1);
                } else {
                    // Repeated Cyberdwarf response
                }
            }
        }
    }
    // Fight!!!!
}
//-----------------------------------------------------------------------------------------------------------
04. Crustacea Victory
/* event_chu_crustacea_victory - NOTES
Start, called, upon killing CuchuCrustacea
*/
with (event) {
    // Regular death animation and taunt
    if (QVAR("cdwarfJoined") == 0) {
        if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
        
        }
        else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
        
        }
    } else if (QVAR("cdwarfJoined") == 1) {
        if (QVAR("csComplete") == 0) {
        
        } else if (QVAR("csComplete") == 1 {
        
        }
    }
}
//-----------------------------------------------------------------------------------------------------------
05. Point No Return
/* event_chu_point_no_return - NOTES
Interact, upon touching door to Point of No Return
*/ 
with (event) {
    //--------------------------------------------------------------------------------
    // REFORMATTED SEGMENT
    //--------------------------------------------------------------------------------
    if (QVAR("cdwarfReformat") == 1) {
        //----------------------
        // CYBERSPEAR INCOMPLETE
        //----------------------
        if (QVAR("csComplete") == 0) {
            var travel_choice = "Travel through the screen?" YES/NO
            var yes
            var no
            with (yes) {

            } with (no) {

            }
        } 
        //--------------------
        // CYBERSPEAR COMPLETE
        //--------------------
        else if (QVAR("csComplete") == 1) {
            var travel_choice = "Travel through the screen?" YES/NO
            var yes
            var no
            with (yes) {

            } with (no) {

            }
        }
    } 
    //--------------------------------------------------------------------------------
    // X114JAM9 SEGMENT
    //--------------------------------------------------------------------------------
    else if (QVAR("playerX1") == 1) {
        if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
        
        }
        else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
        
        }
        "Whoa... I won't be able to come back from this."
        var travel_choice = "Travel through the screen?" YES/NO
        var yes
        var no
        with (yes) {

        } with (no) {

        }
    } 
    //--------------------------------------------------------------------------------
    // HOOPZ OR CC SEGMENT
    //--------------------------------------------------------------------------------
    else if (QVAR("playerHoopz") == 1) && (QVAR("playerCC") == 1) {
        //----------------------
        // CYBERSPEAR INCOMPLETE
        //----------------------
        if (QVAR("csComplete") == 0) {
            if (QVAR("cuchuPNR") == 0) {
                "What are you doing, *NAME*? The Cyberspear is not yet complete!"
                var travel_choice = "Travel through the screen?" YES/NO
                var yes
                var no
                with (yes) {
                    "I can beat him Cyberdwarf. I know I can beat him."
                    "You cannot, child! If you proceed without the Cyberspear, then this was all for nothing! Don't be a fool! I will not let you enter!"
                    SFX/ANIMATION: *ZZZZZAP*
                    // Hoopz should back up 2 spaces
                    QSET("cuchuPNR", 2);
                    // POSSIBLY WARP TO REFORMAT CHOICE!!!
                } with (no) {
                    "Cyberdwarf's right... I should wait."
                    QSET("cuchuPNR", 1);
                }
            } else if (QVAR("cuchuPNR") == 1) {
                "What are you doing, *NAME*? The Cyberspear is not yet complete!"
                var travel_choice = "Travel through the screen?" YES/NO
                var yes
                var no
                with (yes) {
                    "I can beat him Cyberdwarf. I know I can beat him."
                    "You cannot, child! If you proceed without the Cyberspear, then this was all for nothing! Don't be a fool! I will not let you enter!"
                    SFX/ANIMATION: *ZZZZZAP*
                    // Hoopz should back up 2 spaces
                    QSET("cuchuPNR", 2);
                    // POSSIBLY WARP TO REFORMAT CHOICE!!!
                } with (no) {
                    "Cyberdwarf's right... I should wait."
                }
            } else if (QVAR("cuchuPNR") == 2) {
                //----------------
                // REFORMAT CHOICE
                //----------------
                var reformat_choice: "Proceed?" REFORMAT DISK AND PROCEED / HEED CYBERDWARF'S WARNING
                var reformat
                var heed
                with reformat {
                    "Quit holding me back, Cyberdwarf! You keep saying it's my destiny... so let me do it already!" 
                    *REFORMAT*
                    *DISK FLIES OUT*
                    // Free to continue, anywhere in game, without Cyberdwarf
                    QSET("cdwarfJoined", 0);
                } with HEED {
                    "Okay... I'll find the Cyberspear."
                }
            }
        //--------------------
        // CYBERSPEAR COMPLETE
        //--------------------
        } else if (QVAR("csComplete") == 1) {
            "Whoa... I won't be able to come back from this."
            var door_choice = "Travel through the screen?" YES/NO
            var yes
            var no
            with (yes) {

            } 
            with (no) {

            }
        }
    }
}
//-----------------------------------------------------------------------------------------------------------
06. Ziggurat Entrance
/* event_chu_ziggurat_entrance - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
07. Primordia Confrontation - X114JAM9
/* event_chu_confrontation_x1 - NOTES
Collision. Should destroy itself if player is not X114JAM9.
*/
with (event) {
    "dialogue"
    "dialogue"
    if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
        // Looking to kill Cuchulainn
        "dialogue"
        "dialogue"
    }
    else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
        // Looking for Cyberdwarf
        "dialogue"
        "dialogue"
    }
    "dialogue"
    "dialogue"
    // BATTLE BEGINS
}
//-----------------------------------------------------------------------------------------------------------
07. Primordia Confrontation - REFORMATTED
/* event_chu_confrontation_reformat - NOTES
Collision. Should destroy itself if player did not reformat Cyberdwarf.
Could also handle various "weird cases." Lich, Robot, etc.
*/
with (event) {
    "dialogue"
    "dialogue"
    if (QVAR("csComplete") == 0) {
        "I can kill you anyway!"
        // NO CHOICE: Fight
    }
    else if (QVAR("csComplete") == 1) {
        // CHOICES: Throw, Keep?
        // CHOICES: Throw, Destroy?
        // NO CHOICE: Throw?
        var throw_choice = "What do you do?" THROW CYBERSPEAR/DESTROY CYBERSPEAR
        var throw
        var destroy
        with throw {
            "Take this!"
            // cyberspear bounces off
            // possibly seals him in spear
        }
        with destroy {
            "I don't need a Cyberspear... I've got my gun's!"
            // destroys cyberspear
        } 
    } 
    // BATTLE BEGINS
}
//-----------------------------------------------------------------------------------------------------------
07. Primordia Confrontation - CYBERDWARF
/* event_chu_confrontation_cyberdwarf - NOTES
Collision. Should destroy itself if player does not have Cyberdwarf.
*/
with (event) {
    "dialogue"
    "dialogue"
    // CHOICES: Throw, Inject, Destroy
    var cs_choice = "Do what?" THROW/INJECT/DESTROY
    var throw 
    var inject
    var destroy
    with throw {
        // THROW CYBERSPEAR, OMNIDWARF BATTLE
    }
    with inject {
        // INJECT CYBERSPEAR, CYBERDWARF TAKEOVER (BLACK SCREEN, FOR NOW)
    }
    with destroy {
        // DESTROY CYBERSPEAR, REGULAR PRIMORDIA BATTLE
    }
}
//-----------------------------------------------------------------------------------------------------------
08. Primordia Defeat
/* event_chu_primordia_defeat - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
08. Omnidwarf Defeat
/* event_chu_omnidwarf_defeat - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
09. Primordia Victory 
/* event_chu_primordia_victory - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
09. Omnidwarf Victory
/* event_chu_omnidwarf_victory - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
10. Cuchulainn Oldman
/* event_chu_cuchulainn_oldman - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
10. Cyberdwarf Oldman
/* event_chu_cyberdwarf_oldman - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------
11. Throne
/* event_chu_throne - NOTES

*/
with (event) {

}

//-----------------------------------------------------------------------------------------------------------
12. Ending
/* event_end_ending_switch - NOTES

*/
with (event) {

}

//-----------------------------------------------------------------------------------------------------------
13. Scoring
/* event_end_scoring - NOTES

*/
with (event) {

}
//-----------------------------------------------------------------------------------------------------------