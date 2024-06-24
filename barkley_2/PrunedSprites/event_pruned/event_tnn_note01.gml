// event_tnn_note01
// cornrow turns into this  
        

if (argument0 == SCRIPT_STEP) {
    // Step
    if (visible and !scr_event_etc_instance_on_screen(id) and scr_quest_get_state("comServ") <= 6) {
        scr_event_interactive_deactivate();
    }
    if (!visible and scr_quest_get_state("comServ") >= 7) {
        scr_event_interactive_activate();
    }
} else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    
    var event = scr_event_create_main();
    with (event) {   
        if (scr_quest_get_state("comServ") == 7) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Huh? Looks like Cornrow and Juicebox are gone and there's a note here. I wonder what it says...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, P_NAME_S + ", this is an emergency. We've been captured by our enemies and need you to break us out. I need to keep this short 'cuz they're getting suspicious. I've left my gun for you underneath a nearby loose brick. Take it and break us out of here - for the love of Clispaeth, save us! I can hear them torturing Juicebox! Oh Clispaeth, he's screaming! His screams are terrible. Please save us! I'm sorry about all those terrible things we made you do! Please help us, I'm begg-");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hmm? This brick feels pretty loose. Whoa! It's Mr. Cornrow's gun!");
            scr_event_build_dialogue_item("Got Cornrow's Gun!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "And who says hard work doesn't pay off! I had to get that fruit basket, get Juicebox's change and give granny her vitamins. I worked up a sweat running all over town and I'm tired out, but after a hard day's work, I finally got my dues! Sure it was tough, but in the end? I think it was worth it! And hey, I even got to help the community in the process. I consider this mission accomplished!");
            
            // TODO: [A really gaudy QUEST COMPLETED marquee scrolls across the screen and a goofy victory tune plays].
            scr_event_build_create_object(o_tnn_mission_complete, 0, 0);
            scr_event_build_wait(14);
            scr_event_build_wait_for_actions();
            //THIS IS THE WRONG EVENT
            
            scr_equipment_guns_bag_addGun(scr_combat_weapons_generate("shotgun","gold",300,100));
            scr_event_build_time_add(1);
            scr_event_build_quest_state("comServ", 8);
            scr_event_build_quest_state("concessionVal", scr_quest_get_state("concessionVal") + 20);
        }
        else if (scr_quest_get_state("comServ") == 8) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Here's Mr. Cornrow's thank you letter. Helping the community's tough, but it feels good and it's definitely rewarding. I learned a lot working for Mr. Cornrow and Mr. Juicebox. Wherever you guys are, thanks for showing me the ropes!");
        }
    }
    scr_event_advance(event);
}
