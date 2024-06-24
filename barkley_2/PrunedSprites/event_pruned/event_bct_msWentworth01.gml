// event_bct_msWentworth01

if (argument0 == SCRIPT_START) {  

}
else if (argument0 == SCRIPT_STEP)
{
    
}
else if (argument0 == SCRIPT_INTERACT)
{
    var wentworth = id;
    
    var event = scr_event_create_main();
    //var snippet = scr_event_create_child(event);

    npc_port = NULL;
    
    //----------------------------------------------------------
    // main event
    //----------------------------------------------------------
    with (event)
    {
        scr_event_build_dialogue_debug("bort", NULL, "This is Wentworth.");
    }
    scr_event_advance(event);
}
