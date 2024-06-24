// Event for Juicebox, part of Community Service Quest, pal of Cornrow.
// Disappears after time 2, and after comServ > 6.
// usage: event_tnn_juicebox01();

if (argument0 == SCRIPT_START)
{
    // Step
    if (scr_quest_get_state("comServ") > 6 || scr_time_get() > 2)
    {
        scr_event_interactive_deactivate();
    }
}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var juicebox = id;
    var event = scr_event_create_main();
    
    with (event)
    {
        //------------------------------------------
        // Body Swap States
        //------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Heh... hey kid...");
        }
        
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Heh heh... evening, Mr. Governor...");
        }
        
        //------------------------------------------
        // Normal States
        //------------------------------------------
        
        // Community Service ongoing.
        else if (scr_quest_get_state("comServ") == 6)
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Granny uhh... forgot her medicine.");
        } 
        // Community Service quest on.
        else if (scr_quest_get_state("comServ") == 4)
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Hey kid. Cornrow's teaching me about uh, numbers and stuff.");
        }
        // Community Service quest on.
        else if (scr_quest_get_state("comServ") == 2)
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Cornrow's teaching me to read, uh, words.");
        }
        // Haven't accepted Community Service quest.
        else
        {
            scr_event_build_dialogue("Juicebox", s_port_juicebox, "Uhh, hey kid.");
        }
    }
    scr_event_advance(event);
}
