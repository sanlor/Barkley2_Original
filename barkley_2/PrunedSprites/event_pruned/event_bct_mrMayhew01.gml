// event_bct_mrMayhew01

if (argument0 == SCRIPT_START) {  

}
else if (argument0 == SCRIPT_STEP)
{
    
}
else if (argument0 == SCRIPT_INTERACT)
{
    var mayhew = id;
    
    var event = scr_event_create_main();
    //var snippet = scr_event_create_child(event);

    npc_port = NULL;
    
    //----------------------------------------------------------
    // main event
    //----------------------------------------------------------
    with (event)
    {
        scr_event_build_dialogue_debug("bort", NULL, "This is Mayhew.");
    }
    scr_event_advance(event);
}
