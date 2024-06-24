// A goofus in Tir na Nog. Talks a bunch of shit.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Tor", NULL, "His name was probably Lars the more I think about it. Could have been something different, but it was probably Lars.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Well I know it couldn't have been Matthias, because that's me, Matthias!! And I think it was probably Lars too!! What else could it have been?!?");
            scr_event_build_dialogue("Tor", NULL, "Hmm... but on the other hand...");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Tor", NULL, "The bellhop spilled wine all over my tuxedo.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Yes, yes, good, good. I am the governor and I am glad to see you are giving back to the community.");
        
        //Spoken to Tor 7 times.
        } else if (scr_quest_get_state("torState") == 7) {
            scr_event_build_dialogue("Tor", NULL, "Don't bother telling anyone. They'll never believe you.");
                
        //Spoken to Tor 6 times.
        } else if (scr_quest_get_state("torState") == 6) {
            scr_event_build_dialogue("Tor", NULL, "/'What's cookin'/'? Who says that, in this day and age? What's cookin'? Nobody says that, no real dwarfs say that. But it's what I said, and you can't take things like that back. Was sore for a long time after that. Choked me up just thinking about it, like getting the wind knocked out of you. All I ever wanted to be was a Cool Neighbor, but it wasn't meant to be.");
            scr_event_build_quest_state("torState", 7);
            
        //Spoken to Tor 5 times.
        } else if (scr_quest_get_state("torState") == 5) {
            scr_event_build_dialogue("Tor", NULL, "You know what I said to her? Do you know? Do you have any clue?");
            scr_event_build_quest_state("torState", 6);
            
        //Spoken to Tor 4 times.
        } else if (scr_quest_get_state("torState") == 4) {
            scr_event_build_dialogue("Tor", NULL, "It was that one night, had to keep all the windows shut to keep out the damp. She appeared in the doorway of the eleventh stop. I know it couldn't have been the twelfth stop. Had to be eleven. No other way it could be twelve. Thirty years on that route and she was my first passenger. Whole system had been dead for as long as I can remember, and probably a lot longer before that.");
            scr_event_build_quest_state("torState", 5);
            
        //Spoken to Tor 3 times.
        } else if (scr_quest_get_state("torState") == 3) {
            scr_event_build_dialogue("Tor", NULL, "I never really wanted to be a bus driver, but you don't get to choose those things. I was born a bus driver, and, by the grace of Clispaeth, I'll die a bus driver.");
            scr_event_build_quest_state("torState", 4);
            
        //Spoken to Tor 2 times.
        } else if (scr_quest_get_state("torState") == 2) {
            scr_event_build_dialogue("Tor", NULL, "You ever seen that before? Get to see that last glimmer of hope fade out of someone's eyes forever? Creepy.");
            scr_event_build_quest_state("torState", 3);
            
        //Spoken to Tor 1 time.
        } else if (scr_quest_get_state("torState") == 1) {
            scr_event_build_dialogue("Tor", NULL, "I didn't think I heard him right, I leaned closer, but that's the only words he said to me. I waited as long as I could, but he had nothing left.");
            scr_event_build_quest_state("torState", 2);
        
        //Never spoken to Tor before.
        } else {
            scr_event_build_dialogue("Tor", NULL, "I don't want to be me anymore. That's all he said to me. The only thing. Just that.");
            scr_event_build_quest_state("torState", 1);
        }
    }
    scr_event_advance(event);
}
