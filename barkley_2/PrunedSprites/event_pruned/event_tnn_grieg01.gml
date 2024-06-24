/* Event for Grieg
    random dwarf waiting for the train, not knowing there isn't one.
    
    Variables
        knowTNNTrain
            0 = don't know about a train
            1 = heard about a train
            2 = know for a fact there is no train    
*/

if (argument0 == SCRIPT_STEP) {
    if (visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 3) {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 4) {
        scr_event_interactive_activate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    var grieg = id
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Grieg", NULL, "Excuse me. When is the next train leaving Tir na Nog?");
            scr_event_build_dialogue("Matthias", s_port_matthias, "You know, walking is pretty good too!! Maybe just walk!! I don't know!! I'm Matthias and I do pretty much whatever I want, just walk around everywhere. It's good for you! That's just a handy hint from me, your friend Matthias!");
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Grieg", NULL, "Excuse me. When is the next train leaving Tir na Nog?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Yes, yes, yes. I am the Governor so I ride the trains often. Thank you for bringing this to my attention.");
        } else if (scr_quest_get_state("griegState") == 0) { //never spoken
            scr_event_build_dialogue("Grieg", NULL, "Excuse me.");
            scr_event_build_dialogue("Grieg", NULL, "When is the next train leaving Tir na Nog?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know. Does this town have a train?");
            scr_event_build_dialogue("Grieg", NULL, "Yes, I'm sure of it. There must be a train. How else does anybody get back home?");
            scr_event_build_quest_state("griegState", 1);
            //Adding in TNN Train knowledge
            Quest("knowTNNTrain", 1);
        } else { //spoken
            scr_event_build_dialogue("Grieg", NULL, "I can't wait to go home.");
        }
    }
    scr_event_advance(event);
}
