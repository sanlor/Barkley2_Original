// event_tnn_onslow01
/*
    TEMPORARILY HOLDING DIALOGUE FROM
    event_tnn_duergarSlaver05
*/
if (argument0 == SCRIPT_START)
{
    if (scr_quest_get_state("govSpeechInitiate") >= 2 && scr_quest_get_state("govFinishInitiate") == 0)
    {
    
    }
    else
    {
        with (o_honus01) { scr_event_interactive_deactivate(); }
        with (o_lafferty01) { scr_event_interactive_deactivate(); }
        with (o_vikingstad01) { scr_event_interactive_deactivate(); }
        with (o_jeltsje01) { scr_event_interactive_deactivate(); }
    }
    if (scr_quest_get_state("govSpeechInitiate") == 1)
    {
        with (o_door_tech01) event_user(1);
        scr_event_set_object(o_onslow01, o_onslow01.x + 32, o_onslow01.y);
        scr_entity_look(o_onslow01, SOUTHWEST);
    }
}
else if (argument0 == SCRIPT_INTERACT)
{
    var onslow = id;
    var onsname = Duergar("getname", "onslow");
    var event = scr_event_create_main();
    //------------------------------------
    // Main Event
    //------------------------------------
    with (event)
    {
        //completed Governor's Quest.
        if (scr_quest_get_state("govQuest") > 5)
        {
            scr_event_build_dialogue(onsname, s_port_onslow, "Did... did you hear the new Governor's speech? He didn't even mention torture... not once...");
        } 
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            if (scr_quest_get_state("govSpeechInitiate") == 1)
            {
                scr_event_build_dialogue(onsname, s_port_onslow, "Right this way, Mr. Governor, sir...");
            }
            else
            {
                scr_event_build_dialogue(onsname, s_port_onslow, "Mr. Governor! W-welcome to Tir na Nog, sir! I've been guarding the palace in preparation for your arrival, dutifully pulling the teeth, hair and nails from anyone who dared to come within 20 feet of the door. All arrangements have been made - are you ready to give your speech?");
                
                var speech_choice = scr_event_build_choice("Am I ready to give the speech?", s_port_governor);
                
                // Not Ready
                var not_ready = scr_event_build_add_choice(speech_choice, "I'm not ready yet!");
                with (not_ready)
                {
                    scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Ah, hello my good man! Yes, yes, I am the governor! It's very astute of you to notice! I'll be back in a moment to give my address, I need to, uh, stretch my legs for a little bit!");
                }
                // Ready
                var ready = scr_event_build_add_choice(speech_choice, "I guess I'm ready...");
                with (ready)
                {
                    scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Ahh, good eye you've got, I am indeed the governor! Yes, yes, I believe it is time for me to give my address! What do I have to do?");
                    scr_event_build_dialogue(onsname, s_port_onslow, "Excellent, Mr. Governor, sir! You'll be giving your address from the balcony of the palace. Select the policies that most support your agenda - may I suggest an expanded torture regime and mandatory starvation cycles? Now, right this way, Mr. Governor, sir...");
                    scr_event_build_door_unlock("govDoor");
                    scr_event_build_wait(0.2);
                    if (o_hoopz.x < o_onslow01.x) //So Onslow doesn't get blocked by you
                    {
                        scr_event_build_move(o_onslow01, 28, 0);
                        scr_event_build_wait_for_actions();
                        scr_event_build_look(o_onslow01, SOUTHWEST);
                    }
                    else 
                    {
                        scr_event_build_move(o_onslow01, -32, 0);
                        scr_event_build_wait_for_actions();
                        scr_event_build_look(o_onslow01, SOUTHEAST);
                    }
                    scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Yes, yes, of course!");
                    scr_event_build_quest_state("govSpeechInitiate", 1);   
                } 
            }
        }
        // Normal
        else
        {
            scr_event_build_dialogue(onsname, s_port_onslow, "Back off, chump! Do you know where you are? This is the Governor's mansion and he's about to announce his new policies for Tir na Nog! No entry permitted!");   
        }
    }
    scr_event_advance(event);
}
