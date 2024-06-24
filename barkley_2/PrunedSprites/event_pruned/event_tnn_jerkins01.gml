// event_tnn_jerkins01 
// Event for Jerkin Rack

if (argument0 == SCRIPT_START)
{
    if (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var jerkins = id;
    var event = scr_event_create_main();
    
    with (event)
    {
        Dialogue(P_NAME, "(This sure is a bevy of jerkins... I wonder if one would fit me...)");
    }
    scr_event_advance(event);
}
