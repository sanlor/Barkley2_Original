// event_chu_vestibule

/* event_chu_vestibule - NOTES
TODOS:
    1. Incorporate Start and/or Step events to destroy the event when unused.
*/
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_HOOPZ_COLLISION) {
    var playerX1 = scr_quest_state_get("playerX1")
    var playerHoopz = scr_quest_state_get("playerHoopz")
    var playerCC = scr_quest_state_get("playerCC")
    var cdwarfReformat = scr_quest_state_get("cdwarfReformat")
    var cdwarfJoined = scr_quest_state_get("cdwarfJoined")
    var csComplete = scr_quest_state_get("csComplete")
    
    var vestibule = id;
    
    var event = scr_event_create_main();
    with (event) {  
        if (scr_quest_get_state("vestibuleScene") == 0) {
            if (cdwarfJoined == 1) {
                scr_event_build_dialogue("NARRATOR", NULL, "Here in the vestibule, the player gets a warning if they do not have the complete Cyberspear. This is the least fleshed-out part of the whole thing. It would be a good chance to introduce dialogue based on your goal, if we wanted to do that.");
                //------------------------------------------------------------------
                // CHASTISING SEGMENT (INCOMPLETE CYBERSPEAR)
                //------------------------------------------------------------------
                if (csComplete == 0) { // Cyberspear is not yet complete.
                    scr_event_build_dialogue("NARRATOR", NULL, "Cyberspear is incomplete, so the message shows. Not sure exactly how we should do this. Only one time, no matter what? Should Hoopz mutter something under his breath about his goal? Dunno. But it's a chance for Cdwarf to say /'NO YOU FOOL GET THE SPEAR/' yet again.");
                }
                //------------------------------------------------------------------
                // CAMPFIRE SEGMENT (CYBERSPEAR COMPLETED)
                //------------------------------------------------------------------ 
                else if (csComplete == 1) { // Cyberspear is complete.
                    scr_event_build_dialogue("NARRATOR", NULL, "Cyberspear is complete, so we don't have to do much.");
                }
                scr_event_build_quest_state("vestibuleScene", 1);
            }   
        }
        else {
            scr_event_build_destroy_object(o_vestibule);
        }
    }
    scr_event_advance(event);
}
