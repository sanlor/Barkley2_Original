// Old lady in Tir na Nog.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Bea", NULL, "Oh, Matthias, let me have a look at you... Oh dear... your color is not good. You should get home this instant.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Wow, you are absolutely correct, I am definitely Matthias, no doubt about that one. Great eye you got there!!!");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Bea", NULL, "....");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Hmmm... yes... I hope you are having the most excellent day.\This has been a special greeting from me, the governor. I hope you like all the governor wishes I sent you.");
            if (scr_quest_get_state("beaState") == 1) {
                scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(I hope that helped... Bea deserves better than this crap world...)");
            }
            
        //Spoken to Bea 1 time.
        } else if (scr_quest_get_state("beaState") == 1) {
            //HUNDLEY: scr_event_build_dialogue("Bea", NULL, "The nightmares just stopped too... I thought I was past all that.... Well, it was a nice couple of days I guess.");
            scr_event_build_dialogue("Bea", NULL, "The nightmares just stopped too... I thought I was past all that.... Well, it was a nice couple of days I guess.");
        
        //Never spoken to Bea before.
        } else {
            scr_event_build_dialogue("Bea", NULL, "Hey youngster, want a piece of advice?");
            var beaChoice1 = scr_event_build_choice("Do I have time for advice?", s_port_hoopz);
            
            //Want advice.
            with scr_event_build_add_choice(beaChoice1, "Sure, shoot.") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sure, shoot.");
                scr_event_build_dialogue("Bea", NULL, "What? Shoot what?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Just go ahead and tell me.");
                scr_event_build_dialogue("Bea", NULL, "What's this about shooting?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "It's... what?");
                scr_event_build_dialogue("Bea", NULL, "All of my closest friends were executed by the Duergars. Everyone I know. Gone. Shot. They lined them all up against the wall and shot them... It was just that one little word that did it. One moment my friends were all up against the wall, crying... then... SHOOT!!!! Then they were all gone, a mound of bloody corpses slumped against each other. I would have been next but they thought they'd rather use me for torture practice instead. They'd probably still have me in the cell if I didn't run out of hair, toenails, eyebrows, eyelashes, and teeth to pull out. I was pretty once, even. And now... now... this...");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh... I'm... uh... it's just a saying... like... uh...");
                scr_event_build_dialogue("Bea", NULL, "Is that how you talk to everyone? To just go around reminding them of all the horrors they spend every waking moment of their life trying to forget?!?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm really sorry. I didn't know. Is there something you wanted to tell me?");
                scr_event_build_dialogue("Bea", NULL, "I think you should think a little more about the things you're saying before you say them.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm really, really sorry. I didn't know...");
                scr_event_build_dialogue("Bea", NULL, "...");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I really blew that one...)");
                scr_event_build_quest_state("beaState", 1);
            }
            
            //No advice.
            with scr_event_build_add_choice(beaChoice1, "No thanks.") {
                scr_event_build_dialogue("Bea", NULL, "Oh. I was just trying to help. Come let me know if you change your mind. I could really help you out.");
            }
            
        }
    }
    scr_event_advance(event);
}
