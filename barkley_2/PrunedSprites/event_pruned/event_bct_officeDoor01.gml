// event_bct_officeDoor01

if (argument0 == SCRIPT_START) {  

}
else if (argument0 == SCRIPT_STEP)
{
    
}
else if (argument0 == SCRIPT_INTERACT)
{
    var officeDoor = id;
    
    
    var event = scr_event_create_main();
    //var snippet = scr_event_create_child(event);

    var npc_port = NULL;
    
    //----------------------------------------------------------
    // main event
    //----------------------------------------------------------
    with (event)
    {
        /*
        switch (inhabitant) 
        {
            case "wentworth":
                scr_event_build_execute_event_script(event_bct_msWentworth01);
                break;
            case "mayhew":
                scr_event_build_execute_event_script(event_bct_mrMayhew01);
                break;
            case "pembroke":
                scr_event_build_execute_event_script(event_bct_mrPembroke01);
                break;
            case "davenport":
                scr_event_build_execute_event_script(event_bct_msDavenport01);
                break;
            case "pomeroy":
                scr_event_build_execute_event_script(event_bct_msPomeroy01);
                break;
            case "quatermaine":
                scr_event_build_execute_event_script(event_bct_mrQuatermaine01);
                break;
            default:
                scr_event_build_dialogue_debug("bort", NULL, "YOU'RE NOT SUPPOSED TO SEE THIS! BAD CREATION CODE!?!?!");
        }
        scr_event_build_execute_event_script(_inhabitant); // from creation code
        */
        //scr_event_build_dialogue_debug("bort", NULL, "Hoopz should move the player inside the room.");
    }
    scr_event_advance(event);
}
