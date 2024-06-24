// Event for Kathleen, woman in tnn.
// appears at times 4 and 5.

if (argument0 == SCRIPT_START) {
    if (scr_tnn_curfew("during")) {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 1) {
        scr_event_interactive_deactivate();
    }
    else if scr_quest_get_state("mortgageOver") != 2 {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 2) {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 4) {
        scr_event_interactive_activate();
    }
    else if (scr_time_get() == 5) {
        scr_event_interactive_activate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Kathleen", NULL, "Matt! What are you doing here? You know your Pa's been looking all over for you! You better go home unless you want a whoopin'! At least you've got a home to return to... I got here too late to pay rent and now I'm gonna get kicked out...");
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Kathleen", NULL, "I got here too late! I stood in line all day but the Department of Population and Housing is already closed! I just wanted to pay my rent, but now I'm gonna get kicked out!");
        } else {
            scr_event_build_dialogue("Kathleen", NULL, "I got here too late! I stood in line all day but the Department of Population and Housing is already closed! I just wanted to pay my rent, but now I'm gonna get kicked out!");
            //did quest
            if (scr_quest_get_state("wilmerEvict") >= 4) { 
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Phew, it's a good thing I got in before it closed...)");
            
            //didn't do quest.
            }else if (scr_quest_get_state("vikingstadTnn") == 1){
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(If only I hadn't spent Mr. Wilmer's money...)");
            }
            
            //didn't do quest.
            else{
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Wait, didn't Mr. Wilmer ask me to renew his mortgage for him? Uh oh...)");
            }
            
        }
    }
    scr_event_advance(event);
}
