//used by cow02 in Tir na Nog

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var cow02 = id;
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Cow", NULL, "....................");
            scr_event_build_dialogue("Matthias", s_port_matthias, "(Maybe I should just leave the cow alone...)");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Cow", NULL, "....................");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(I... I think the cow knows I'm not really the Governor!)");
    
        }else if (scr_quest_get_state("cowState") == 6) {
        //spoken six times.
            scr_event_build_dialogue("Cow", NULL, "...............");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well, thanks for listening, I guess... ");  
        } else if (scr_quest_get_state("cowState") == 5) {
        //spoken five times.
            scr_event_build_dialogue("Cow", NULL, ".............");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "This is gonna sound weird because you're a cow and all but, well... here goes... my name is " + P_NAME + ", or at least that's what the number of the back of my head says. I don't know who I am or where I came from or what I'm doing here. All I know is that I'm looking for the Cyberdwarf and he's the only one who knows who I am. I guess. I don't even know if that's true. I... I don't really know what's going on but... but basically I just feel so powerless. Everyone is telling me who I am and what I have to do and I don't know or want any of it. I just... wanna play vidcons and b-ball and go home... even though I don't know where that is. I don't want anything to do with this. I just wanna be a kid.");
            scr_event_build_dialogue("Cow", NULL, "...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Still nothing, huh... I guess you really are just a cow.");  
            scr_event_build_quest_state("cowState", 6);
        } else if (scr_quest_get_state("cowState") == 4) {
        //spoken four times.
            scr_event_build_dialogue("Cow", NULL, "...........");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe you're just a listener?");  
            scr_event_build_quest_state("cowState", 5);
        } else if (scr_quest_get_state("cowState") == 3) {
        //spoken three times.
            scr_event_build_dialogue("Cow", NULL, ".........");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess I'm not very interesting to you, huh...");  
            scr_event_build_quest_state("cowState", 4);
        } if (scr_quest_get_state("cowState") == 2) {
        //spoken twice.
            scr_event_build_dialogue("Cow", NULL, ".......");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "...");  
            scr_event_build_quest_state("cowState", 3);
        } else if (scr_quest_get_state("cowState") == 1) {
        //spoken once.
            scr_event_build_dialogue("Cow", NULL, ".....");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "O-oh...");  
            scr_event_build_quest_state("cowState", 2);
        } else if (scr_quest_get_state("cowState") == 0) {
        //never spoken.
            scr_event_build_dialogue("Cow", NULL, "...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh, hey there...");
            scr_event_build_quest_state("cowState", 1);
            }
    }
    scr_event_advance(event);
}
