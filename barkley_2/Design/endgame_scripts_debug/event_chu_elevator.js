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
    5. Distinguish between ElevatorUp and ElevatorDown.
    6. Event/graphic for the room number and door.
    7. Event/graphic for player and Cyberdwarf by the campfire.
    8. Move chastising segment to Exterior.
        *DONE*
*/
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_state_get("playerX1")
    var playerHoopz = scr_quest_state_get("playerHoopz")
    var playerCC = scr_quest_state_get("playerCC")
    var elevatorRide = scr_quest_state_get("elevatorRide")
    var cdwarfReformat = scr_quest_state_get("cdwarfReformat")
    var elevatorChastise = scr_quest_state_get("elevatorChastise")
    var elevatorCamp = scr_quest_state_get("elevatorCamp")
    var elevatorCSPieces = scr_quest_state_get("elevatorCSPieces")
    var csComplete = scr_quest_state_get("csComplete")
    
    var elevator = id;
    var begin_ride = scr_event_create_child(event);
    
    var event = scr_event_create_main();
    with (event) {
        //------------------------------------------------------------------
        // X114JAM9 SEGMENT
        //------------------------------------------------------------------
        if (playerX1 == 1) { // Player is X114JAM9.
            //----------------
            // ON WIGLAF QUEST
            //----------------
            if (scr_quest_state_get("wiglafMission") == 1) { // Wiglaf's quest is accepted, but not completed.
                //------------
                // FIRST RIDE!
                //------------
                if (elevatorRide == 0) { // Elevator has not been ridden.
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
                } 
                //----------
                // 2+ RIDES!
                //----------
                else { // Elevator has been ridden.
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
            } 
            //-------------
            // NOT ON QUEST
            //-------------
            else if (scr_quest_state_get("wiglafMission") == 0) { // Wiglaf's quest has not been accepted.
                //------------
                // FIRST RIDE!
                //------------
                if (elevatorRide == 0) { // Elevator has not been ridden.
                    scr_event_build_dialogue("NARRATOR", NULL, "X114JAM9 is riding the elevator for the first time, and aimlessly. Without Wiglaf's quest.");
                    /* OPTIONS:
                    * Nothing?
                    * A remark about how he feels a "chilling power?"
                    * Marquee scrolls?... about how long the elevator is?
                    */
                    scr_event_build_quest_state("elevatorRide", 1)
                } 
                //----------
                // 2+ RIDES!
                //----------
                else { // Elevator has been ridden.
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
        
        //------------------------------------------------------------------
        // HOOPZ OR CC SEGMENT
        //------------------------------------------------------------------
        else if (playerCC == 1) || (playerHoopz == 1) {
            scr_event_build_dialogue("NARRATOR", NULL, "Player is Hoopz or CreatedCharacter.");
            
            //------------------
            // REFORMAT SEGMENT 
            //------------------
            if (cdwarfReformat == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf was reformatted.");
                // Waiting
                // Marquee has stuff about the timer?
                // Marquee or Hoopz says FUCK THE SPEARS IMMA KILL CUCHU?
                // Nothing?
                // Who knows... yet?
                scr_event_build_event_snippet(begin_ride);
            } 
            //-----------------
            // NOT REFORMATTED!
            //-----------------
            else if (cdwarfReformat == 0) { // Cyberdwarf is not reformatted, is still with the player.
                scr_event_build_dialogue("NARRATOR", NULL, "Cyberdwarf is not reformatted.");
                
                //------------------------------------------------------------------
                // CHASTISING SEGMENT (INCOMPLETE CYBERSPEAR)
                //------------------------------------------------------------------
                if (csComplete == 0) { // Cyberspear is not yet complete.
                    scr_event_build_dialogue("NARRATOR", NULL, "Cyberspear is not yet complete.");
                    
                    // this is being copied over to the exterior... commented out here for the time being.
                    // see chastise_segment.js
                    
                }
                //------------------------------------------------------------------
                // CAMPFIRE SEGMENT (CYBERSPEAR COMPLETED)
                //------------------------------------------------------------------ 
                else if (csComplete == 1) { // Cyberspear is complete.
                    scr_event_build_dialogue("NARRATOR", NULL, "Cyberspear is complete.");
                    if (elevatorCamp == 1) { // Camp scene has already occured.
                        // Generic dialogue
                        // Nothing?
                        scr_event_build_dialogue("NARRATOR", NULL, "Player has already seen the campfire scene.");
                        scr_event_build_event_snippet(begin_ride); 
                    } 
                    else if (elevatorCamp == 0) {
                        // Campfire segment.
                        scr_event_build_dialogue("NARRATOR", NULL, "Campfire scene begins here.");
                        // string(playerName) + "don't you think you should do some calisthenics?"
                        // TODO
                    }
                }

        }
    }
    
    with (begin_ride) {
        scr_event_build_dialogue("NARRATOR", NULL, "Begin ride makes the camera oscillate up and down to look like an elevator, plays noises, and starts the room number going from 666 to 1 or 1 to 666. Maybe it's "L" for Lobby? Anyway, player can run and wait and it will take 5m. The door then opens, and player can exit. Colliding with the door teleports to either the exterior of the elevator on the Lobby level, or at floor 666, Cuchulainn's Lair.");
        // teleport
    }
    scr_event_advance(event);
}
