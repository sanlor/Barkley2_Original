// event_bct_dilapidatedDoor01
/*
    This is the door to the Dilapidated Zone.
    Accessed at different states, it can...
        Offer an alignment / roundmound choice.
        Offer a fake quest for L.O.N.G.I.N.U.S.
        Be destroyed by the Super Robot.
        Be opened by the friendly Squatters.
*/

if (argument0 == SCRIPT_START) {} 
else if (argument0 == SCRIPT_STEP) {} 
else if (argument0 == SCRIPT_INTERACT) {
    var dilapidated_door = id;
    var event = scr_event_create_main();
    
    var wendyname = "Wendy";
    var kirshnikname = "Kirshnik";
    
    if (scr_quest_get_state("longinusFakeCover") == 1) {
        wendyname = "Gen. Wendy";
        kirshnikname = "Capt. Kirshnik";
    }
    
    var time_early = 10;
    
    //------------------------------------------------------
    //  main event
    //------------------------------------------------------
    with (event) {
        // never knocked, OR knocked & ended
        if (scr_quest_get_state("longinusFakeDoor") == 0) {
            // hey! open up in there!
            
        }
        // got quest, and...
        else if (scr_quest_get_state("longinusFakeDoor") == 1) {
            // mentioned longinus before giving item
            if (scr_quest_get_state("longinusMystery") == 1) {
            
            
            }
            // haven't given item
            else {
                // talked to longinus since then... WOULD lead to "longinusMystery"
                if (scr_quest_get_state("longinusTalked") == 1) {
            
                
                }
                // never talked to longinus
                else {
            
                    
                }
            }
        }
        // got quest and returned it
        else {
            // talked to longinus
            if (scr_quest_get_state("longinusTalked") == 1) {
                // already confronted
                if (scr_quest_get_state("dilapidatedKnockCount") == 1) {
                
                
                }
                // not yet confronted
                else {
                
                
                }     
            }
            // rejected normally
            else {
            
            
            }
        }
    }

    scr_event_advance(event);
}
