//Guy who dresses like a clown in Tir na Nog.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        // You're Matthias
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Zhang", NULL, "Hey. Who are you? Do you want to be a clown? I can teach you.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Nope! I'm fine being me; good old Matthias, son of Firas and lover of sewers.");
        }
        // You're the Governor
        else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Zhang", NULL, "Hey, Mr. Governor. What do you think about clowns?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Hmm... H-m-m... Clowns are great!");
            scr_event_build_dialogue("Zhang", NULL, "I always knew you were the clown's governor. Keep up the good work.");
        }
        //Never spoken to Zhang before.
        else if (scr_quest_get_state("zhangState") == 0) {
            scr_event_build_dialogue("Zhang", NULL, "Hey, welcome to my house. I'm Zhang. I like to dress up like a clown because I think it's real cool. I like to march around in the streets and go /'check me out fellas, I'm a clown/'. I think my clown clothes look good and cool. I'm a good and cool clown.");
            scr_event_build_quest_state("zhangState", 1);
        
        //Spoken to Zhang once.
        } else if (scr_quest_get_state("zhangState") == 1) {
            scr_event_build_dialogue("Zhang", NULL, "I like to kick back and goof off.");
            scr_event_build_quest_state("zhangState", 2);
            
        //Spoken to Zhang twice.
        } else if (scr_quest_get_state("zhangState") == 2) {
            scr_event_build_dialogue("Zhang", NULL, "I'm an authentic clown for goofing.");
            scr_event_build_quest_state("zhangState", 3);
            
        //Spoken to Zhang 3 times.
        } else if (scr_quest_get_state("zhangState") == 3) {
            scr_event_build_dialogue("Zhang", NULL, "The role of clowns in society is: goofing.");
            scr_event_build_quest_state("zhangState", 4);
            
        //Spoken to Zhang 4 times.
        } else if (scr_quest_get_state("zhangState") == 4) {
            scr_event_build_dialogue("Zhang", NULL, "I feel empowered when I dress like a clown.");
            scr_event_build_quest_state("zhangState", 5);
            
        //Spoken to Zhang 5 times.
        } else if (scr_quest_get_state("zhangState") == 5) {
            scr_event_build_dialogue("Zhang", NULL, "I spend 100% of my time dressed like a clown. I wear these clothes constantly. I think it's cool to dress like a clown.");
            scr_event_build_quest_state("zhangState", 6);
            
        //Spoken to Zhang 6 times.
        } else if (scr_quest_get_state("zhangState") == 6) {
            scr_event_build_dialogue("Zhang", NULL, "For me, dressing like a clown is a fashion statement.");
            scr_event_build_quest_state("zhangState", 7);
            
        //Spoken to Zhang 7 times.
        } else if (scr_quest_get_state("zhangState") == 7) {
            scr_event_build_dialogue("Zhang", NULL, "I'm working on a script for a movie - /'Good Clown, Bad Clown/'. So far I only have the title.");
            scr_event_build_quest_state("zhangState", 8);
            
        //Spoken to Zhang 8 times.
        } else if (scr_quest_get_state("zhangState") == 8) {
            scr_event_build_dialogue("Zhang", NULL, "It's so good to dress like a clown. I recommend it.");
            scr_event_build_quest_state("zhangState", 9);
            
        //Spoken to Zhang 9 times.
        } else if (scr_quest_get_state("zhangState") == 9) {
            scr_event_build_dialogue("Zhang", NULL, "So you like spending time with a clown, eh? Ahh.");
            scr_event_build_quest_state("zhangState", 10);
            
        //Spoken to Zhang 10 times.
        } else if (scr_quest_get_state("zhangState") == 10) {
            scr_event_build_dialogue("Zhang", NULL, "The one flaw with always dressing like a clown is that it prevents you from integrating with the rest of society.");
        }
    }
    scr_event_advance(event);
}
