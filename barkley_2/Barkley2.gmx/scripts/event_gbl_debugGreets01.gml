/*
This is the Global Greeting for all who start Barkley 2.  This is starting in the debug mode as a way to
remind everyone to keep out of Wilmer's house when testing (unless you are testing Wilmer directly.)

Eventually this can be moved over to the Normal Mode and will be used to leave notes to players, specifically
external testers, who might want some notes before starting the game.
*/

/*if (argument0 == SCRIPT_START) {
    scr_event_hoopz_switch_cutscene(); //to face right way
    scr_entity_look(o_cts_hoopz, SOUTH); //to face right way
    var event;
    if (scr_quest_get_state("demoComplete") == 0) event = scr_event_create_main();
    else event = scr_event_find_main();
    with (event) {
        if (scr_quest_get_state("demoComplete") > 0)
        {
            if (scr_quest_get_state("demoComplete") == 1)
                scr_event_build_dialogue(NULL_STRING, NULL, "Congratulations, you have completed the demo. Now your greatest challenge awaits...");
            if (scr_quest_get_state("demoComplete") == 2)
                scr_event_build_dialogue(NULL_STRING, NULL, "Congratulations, you were arrested. Now your greatest challenge awaits...");
            scr_event_build_minigame("10 in 1");
            scr_event_build_wait(10000000000); //_for_actions();
        }
        else
        {
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "Ah ha! You weren't expecting this were ya?");
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "You're seeing this because I'm including a little buffer between the beginning of the game and Wilmer. This will eventually act as a welcome to both external testers and GOG Build players, but for now, it's serving as a reminder to not mess with Wilmer!");
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "If you'd like to move to Wilmer's house let me know, else you can head to the Gauntlet where proper testing should take place (there is even a spot to the left that is an 'NPC Villa' where you can drop Actors to talk to.");
            //Players can say where they want to go.
            var question = scr_event_build_choice("Where do you want to go?", NULL);
            with (scr_event_build_add_choice(question, "Wilmer's")) { scr_event_build_teleport(r_tnn_wilmer01, 256, 352); }     
            with (scr_event_build_add_choice(question, "The Gauntlet")) { scr_event_build_teleport(r_gau_01_entrance01, 232, 224); }
        }
    }
    if (scr_quest_get_state("demoComplete") == 0) scr_event_advance(event);
}