// event_tnn_amarkDoor01

if (argument0 == SCRIPT_START)
{
    // Default "amarkBody" to ""
    if (is_real(Quest("amarkBody"))) { scr_quest_set_state("amarkBody", ""); }
    // If already a string...
    else
    {
        // If not "", not the current body, and already spoken to through the door, reset "amarkLeave" to 1
        if (Quest("amarkBody") != BodySwap())
        {
            if (Quest("amarkLeave") >= 2) { scr_quest_set_state("amarkLeave", 1); }
        }
        else
        {
            if (Quest("amarkLeave") == 3) { scr_quest_set_state("amarkLeave", 2); }
        }
    }
    
    with (o_door_parent)
    {
        // Lock door if should be locked
        if (name == "amark_door")
        {
            if (Quest("amarkLeave") >= 1)
            {
                event_user(0); // lock door
                _disableOutline = false;
            }
            else
            {
                if (locked == true) { _disableOutline = false; }
                else { _disableOutline = true; }
            }    
        }
    
        // Lock door if should be locked
        else if (name == "birgit_door")
        {
            scr_tnn_paper();
            
            if (Quest("birgitOpen") == 0)
            {
                event_user(0); // lock door
                _disableOutline = false;
            }
            else
            {
                if (locked == true) { _disableOutline = false; }
                else { _disableOutline = true; }
            }
        }
    }
}
else if (argument0 == SCRIPT_STEP)
{
        /*
        // Lock door if should be locked
        if (name == "amark_door") && (Quest("amarkLeave") >= 1)
        {
            event_user(0); // lock door
        }
        
        if (name == "amark_door")
        {
            if (locked == true) { _disableOutline = false; }
            else { _disableOutline = true; }
        }
        */
}
else if (argument0 == SCRIPT_INTERACT) 
{
    with (o_door_parent)
    {
        
        if (name == "amark_door") && (locked == true)
        {
            var event = scr_event_create_main();
            with (event)
            {
                Debug("hello amark");
            }
            scr_event_advance(event);
        }
        else if (name == "birgit_door") && (locked == true)
        {
            var event = scr_event_create_main();
            with (event)
            {
                Debug("hello birgit");
            }
            scr_event_advance(event);
        }
    }
}
/*
else if (argument0 == SCRIPT_COLLISION_HOOPZ)
{
    
    if (Quest("amarkLeave") == 1) || (Quest("amarkLeave") == 2)
    {
        scr_quest_set_state("amarkLeave", 3);
        var event = scr_event_create_main();
        with (event)
        {
            if (BodySwap() == "hoopz")
            {
                if (Quest("amarkLeave") == 2) { Dialogue("Amark", "Hey " + P_NAME + ", that's you, right? I think I need to be alone for awhile."); }
                else { Dialogue("Amark", "Hey, " + P_NAME_S + ", is that you? I need to spend some time alone for a little while. I've got some thinking to do. But thanks for talking to me earlier, it means a lot."); }
            }
            else if (BodySwap() == "matthias")
            {
                if (Quest("AmarkLeave") == 2) { Dialogue("Amark", "..."); }
                else
                {
                    Dialogue("Amark", "Hey, " + P_NAME_S +", is that you?");
                    Dialogue("Matthias", "It's me, Matthias! A mild-mannered boy from Tir na n0g!");
                    Dialogue("Amark", "...");
                }
            }
            else if (BodySwap() == "governor")
            {
                if (Quest("AmarkLeave") == 2) { Dialogue("Amark", "..."); }
                else
                {
                    Dialogue("Amark", "Hey, " + P_NAME_S +", is that you?");
                    Dialogue("Matthias", "It's me, the Governor of Tir na n0g!");
                    Dialogue("Amark", "...");
                }
            }
            scr_event_build_move(o_cts_hoopz, 0, 24);
            scr_event_build_wait_for_actions();
        }
        scr_event_advance(event);
    }
}
*/
