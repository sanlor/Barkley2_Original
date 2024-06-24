// Event for Doris.
// NOTE: govQuest = 6 means the main Tir na Nog Governor Quest has been completed.
// usage: event_A_DwarfPunkGirl();

if (argument0 == SCRIPT_START)
{
    if (scr_tnn_curfew("during"))
    {
        if (scr_inside()) scr_event_interactive_activate();
        else scr_event_interactive_deactivate();
    }
    else
    {
        scr_event_interactive_deactivate();
        scr_npc_mover(1, r_tnn_residentialDistrict01, o_doris01, 344, 584);
        scr_npc_mover(2, r_tnn_warehouseDistrict01, o_doris01, 640, 496);
        // scr_npc_mover(3, r_tnn_residentialDistrict01, o_doris01, 344, 584);
        scr_npc_mover(4, r_tnn_residentialDistrict01, o_doris01, 104, 932);
        scr_npc_mover(5, r_tnn_residentialDistrict01, o_doris01, 344, 584);
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        // If you're Matthias
        if (BodySwap() == "matthias") {
        
            scr_event_build_dialogue("Doris", NULL, "G'day, Matt. The Fruit of the Month Club hasn't sent me any fruit yet and it's been 5 months. I'm starting to think there isn't any fruit.");
        } 
        // If you're Governor
        else if (BodySwap() == "governor") {
            //scr_event_build_dialogue("Doris", NULL, "What do we want? Grapes. When do we want it? Grapes.");
            scr_event_build_dialogue("Doris", NULL, "So you're the new Duergar Governor? Here's a hardball for you: What's your fruit policy?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "It's my staunch belief that all fruits are equal. Expect to hear more, when I, your new Duergar Governer, deliver my speech.");
        } 
        // After Gov speech
        else if (scr_quest_get_state("govQuest") == 6) {
            scr_event_build_dialogue("Doris", NULL, "Wow! The new Duergar Governor wasn't so bad after all. I'm glad he talked about fruit. Maybe things are getting better around here.");
        } else if (scr_tnn_curfew("during")) {
            scr_event_build_dialogue("Doris", NULL, "Hi. Have you heard the latest rumor going around? It's about grapes. I haven't heard it yet.");
        } else {
            scr_event_build_dialogue("Doris", NULL, "Have you heard the news? The new Duergar Governor is coming soon and he's going to make a speech! Do you think it'll be about Cuchulainn's prize? Do you think it will be about grapes?");
        }
    }
    scr_event_advance(event);
}
