// event_chu_elevator

/* event_chu_elevator - NOTES
On Interact, when pushing the Up/Down button inside the elevator.

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
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var elevator = id;
    var begin_ride = scr_event_create_child(event);
    
    var event = scr_event_create_main();
    with (event) {
        //-----------------
        // X114JAM9 SEGMENT
        //-----------------
        if (scr_quest_state_get("playerX1") == 1) { // Player is X114JAM9.
            if (scr_quest_state_get("wiglafMission") == 1) { // Wiglaf's quest is accepted, but not completed.
                if (scr_quest_state_get("elevatorRide") == 0) { // Elevator has not been ridden.
                    scr_event_build_dialogue("NARRATOR", NULL, "X114JAM9 is riding the elevator for the first time, trying to kill Cuchulainn for Lft. Wiglaf.");
                    /* OPTIONS:
                    * Nothing?
                    * A remark about how he feels a "chilling power?"
                    * A remark about Wiglaf, Cyberdwarf, the mission, etc?
                    * Marquee scrolls?... about how long the elevator is?
                        ... about Wiglaf?
                        ... about Cyberdwarf?
                    */
                    scr_event_build_quest_state("elevatorRide", 1)
                } else { // Elevator has been ridden.
                    scr_event_build_dialogue("NARRATOR", NULL, "X114JAM9 is riding the elevator for the 2nd, 3rd, or Xth time, trying to kill Cuchulainn for Lft. Wiglaf.");
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
            } else if (scr_quest_state_get("wiglafMission") == 0) { // Wiglaf's quest has not been accepted.
                if (scr_quest_state_get("elevatorRide") == 0) { // Elevator has not been ridden.
                    scr_event_build_dialogue("NARRATOR", NULL, "X114JAM9 is riding the elevator for the first time, and aimlessly. Without Wiglaf's quest.");
                    /* OPTIONS:
                    * Nothing?
                    * A remark about how he feels a "chilling power?"
                    * Marquee scrolls?... about how long the elevator is?
                    */
                    scr_event_build_quest_state("elevatorRide", 1)
                } else { // Elevator has been ridden.
                    scr_event_build_dialogue("NARRATOR", NULL, "X114JAM9 is riding the elevator for the 2nd, 3rd, Xth time, and aimlessly. Without Wiglaf's quest.");
                    /* OPTIONS:
                    * Nothing?
                    * A remark about trying it again?
                    * Something about how boring the elevator is?
                    * Marquee scrolls?
                    */
                }
            }
            scr_event_build_event_snippet(begin_ride);
        }
        //--------------------
        // HOOPZ OR CC SEGMENT
        //--------------------
        else if (scr_quest_state_get("playerCC") == 1) || (scr_quest_state_get("playerHoopz") == 1) {
            if (scr_quest_state_get("cdwarfReformat") == 0) { // Cyberdwarf is not reformatted, is still with the player.
                if (scr_quest_state_get("csComplete") == 0) { // Cyberspear is not yet complete.
                    //-------------------
                    // CHASTISING SEGMENT
                    //-------------------
                    if (scr_quest_state_get("elevatorChastise") == 0) { // Have not been chastised by Cyberdwarf
                        switch (scr_quest_state_get("csPiecesTotal")) {
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
                        scr_event_build_quest_state("elevatorChastise", 1)
                        scr_event_build_quest_state("elevatorCSPieces", (scr_quest_state_get("csPiecesTotal"))
                    } else if (scr_quest_state_get("elevatorChastise") == 1) { // Have been chastised by Cyberdwarf
                        if (scr_quest_state_get(("csPiecesTotal") > (scr_quest_state_get("elevatorCSPieces")) { // More CS pieces found.
                            switch (scr_quest_state_get("csPiecesTotal")) {
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
                            scr_event_build_quest_state("elevatorCSPieces", (scr_quest_state_get("csPiecesTotal"))
                        } else if (scr_quest_state_get("csPiecesTotal") <= (scr_quest_state_get("elevatorCSPieces")) { // No more CS pieces found.
                            switch (scr_quest_state_get("csPiecesTotal")) {
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
                } else if (scr_quest_state_get("csComplete") == 1) { // Cyberspear is complete.
                    if (scr_quest_state_get(("elevatorCamp") == 1) { // Camp scene has already occured.
                        // Generic dialogue
                        // Nothing?
                        scr_event_build_event_snippet(begin_ride);
                    } else if (scr_quest_state_get(("elevatorCamp") == 0) {
                        // Campfire segment.
                        string(playerName) + "don't you think you should do some calisthenics?"
                        // TODO
                    }
                }
            //-----------------
            // REFORMAT SEGMENT
            //-----------------
            } else if (scr_quest_state_get("cdwarfReformat") == 1) {
                // Waiting
                // Marquee has stuff about the timer?
                // Marquee or Hoopz says FUCK THE SPEARS IMMA KILL CUCHU?
                // Nothing?
                // Who knows... yet?
                scr_event_build_event_snippet(begin_ride);
            }
        }
    }
    scr_event_advance(event);
}
