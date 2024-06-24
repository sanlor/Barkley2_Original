// Event for Babo, a random guy in a Tir na Nog interior.
// usage: event_tnn_babo01();

if (argument0 == SCRIPT_STEP) {
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var babo = id;
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Babo", NULL, "My friend. My friend. I worry for you, each day, each night. You see how Babo sweats. Is not good. You must take, how you say, vitamin. Listen. Use this knowledge only for good.");
           scr_event_build_dialogue("Matthias", s_port_matthias, "Vitamins, you say? Like the ones my pap-pap Firas takes? I'll be sure to do this!"); 
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Babo", NULL, "My friend, my friend. If you are worried, if you are nervous, you must think one thing - Babo. It will help you.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Being governor takes a toll. In my darkest hour I'll remember your words of wisdom.");
        } else if (scr_quest_get_state("baboState") == 0) {
            // Never talked to him.
            scr_event_build_dialogue("Babo", NULL, "My friend, my friend. You come my house, you see my riches, you see my floor, you sit my chair, you click my computer, we drink vitamin water, you ask /'what is the o'clock?/' I say /'look my clock./' Yes, I am the good man, I am the generous man. I am Babo.");
            scr_event_build_quest_state("baboState", 1);
        } else if (scr_quest_get_state("baboState") == 1) {
            // Talked to him once.
            scr_event_build_dialogue("Babo", NULL, "My friend, my friend. My friend. My friend. Come. Come. My friend. You have entered the abode of Babo. Yes, I am Babo. It is I. You do not believe? My friend, you must believe. It is truly I, Babo. Now go, tell them what you have heard.");
            scr_event_build_quest_state("baboState", 2);
        } else if (scr_quest_get_state("baboState") == 2) {
            // Talked 2 times.
            scr_event_build_dialogue("Babo", NULL, "Yes, yes, my friend. You seek Babo? Rest easy. I am Babo.");
        }
    }
    scr_event_advance(event);
}
