// Guy in TNN who's skeptical about the prize.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Ignacy", NULL, "G'day, Matthias! Have you heard anything about our prizes yet??? I'm really looking forward to my prize!!!");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Well I have heard that I'm completely, 100% Matthias. I think that's something to look forward to, since I am Matthias, and there's no question about it.");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Ignacy", NULL, "Oh, Mr. Governor, wait!! I wanted to ask about the prize!! Are the prizes ready yet?!? Can I have my prize now?!!?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Yes, definitely, absolutely. Very interesting developments. These developments would interest the governor, which is who I happen to be, the governor.");
            
        //Spoken to Ignacy 5 times.
        } else if (scr_quest_get_state("ignacyState") == 5) {
            scr_event_build_dialogue("Ignacy", NULL, "I bet everyone's got their prize already and they're just not telling. There's probably a prize with my name on it waiting for me and nobody's telling.");
            
        //Spoken to Ignacy 4 times.
        } else if (scr_quest_get_state("ignacyState") == 4) {
            scr_event_build_dialogue("Ignacy", NULL, "What do you have to do in this life to get a cool prize?");
            scr_event_build_quest_state("ignacyState", 5);
            
        //Spoken to Ignacy 3 times.
        } else if (scr_quest_get_state("ignacyState") == 3) {
            scr_event_build_dialogue("Ignacy", NULL, "You know, maybe I don't even want the stupid prize. If everyone's getting one, it won't be something special.\What are the odds that this prize will be something good and they'll have enough for everyone? Zero.");
            scr_event_build_quest_state("ignacyState", 4);
            
        //Spoken to Ignacy 2 times.
        } else if (scr_quest_get_state("ignacyState") == 2) {
            scr_event_build_dialogue("Ignacy", NULL, "I never get a prize. All I want is to have a prize once in my life, but that's too much to ask.");
            scr_event_build_quest_state("ignacyState", 3);
            
        //Spoken to Ignacy 1 time.
        } else if (scr_quest_get_state("ignacyState") == 1) {
            scr_event_build_dialogue("Ignacy", NULL, "I know what this prize rubbish is really about. Standing in line, dwarfs pushing, dwarfs shoving. And that's if I'm lucky. Probably I'll be in the bathroom when everyone gets their prize. When it comes time for me to show up at the desk to claim my prize, they'll be all out of prizes. Sorry Ignacy! No prize for you. Everyone else is having a great time with their prize. Hope you enjoy your NO PRIZE. Everyone will have a great prize, and I'll have no prize.");
            scr_event_build_quest_state("ignacyState", 2);
        
        //Never spoken to Ignacy before.
        } else {
            scr_event_build_dialogue("Ignacy", NULL, "I'm not fooled by this Cuchulainn's prize nonsense. I really know what that means. Don't let them fool you.");
            scr_event_build_quest_state("ignacyState", 1);
        }
    }
    scr_event_advance(event);
}
