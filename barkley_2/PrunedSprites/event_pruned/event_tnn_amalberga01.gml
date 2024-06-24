// Script for Amalberga.
// usage: event_tnn_amalberga01();

if (argument0 == SCRIPT_START)
{
    // Changes Amalberga's animation to inside version
    if (scr_inside() == true)
    {
        scr_entity_animation_set(o_amalberga01, "inside");
    }
    
    // Activation & Deactivation for Curfew
    if (scr_tnn_curfew("during") && !scr_inside()) { scr_event_interactive_deactivate(); }
    if (!scr_tnn_curfew("during") && scr_inside()) { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var event = scr_event_create_main();
    with (event)
    {
        //-------------------------------------------
        // Body Swap States
        //-------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            // During Curfew
            if (scr_tnn_curfew("during") == true) { Dialogue("Amalberga", "Hey Matthias, you busy? Think you can help me install the new catalytic converter when the curfew's over?"); }
            // Before / After Curfew
            else { Dialogue("Amalberga", "Hey Matthias, you busy? Think you can help me install this new catalytic converter now?"); }
            Dialogue("Matthias", "Uh, nope! Gotta run! Sorry! Can't do that thing for you! Thanks for the interest though! Well, see you later, good to talk to you!");
        }
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            Dialogue("Amalberga", "Hello, Mr. Governor... wouldn't mind some new tools or a garage to work on this thing in. Just throwing it out there.");
            Quest("govCar", 1);
        }
        
        //-----------------------------------------
        // After Governor
        //-----------------------------------------
        //Spoken to Hildeberga and Amalberga about garage.
        else if (Quest("govCar") == 3)
        {
            Dialogue("Amalberga", "Sometimes late at night, I think I can hear the sound of speeding cars coming from outside the city. You think people out there might be racing? When we get this thing souped up, nobody's gonna beat us.");
        } 
        //Gave Hildeberga and Amalberga a garage to work in during Gov speech.
        else if (Quest("govCar") == 2)
        {
            Dialogue("Amalberga", "Hey, did you catch the new governor's speech? Isn't it so weird that we're getting a new garage to work in? Hildy and I were only working on the car for fun, to keep our minds off of how crummy and boring it is here. But it really looks like we may actually get this thing done soon. Maybe the new governor isn't so bad after all.");
            Quest("govCar", 3);
        }
        
        //-----------------------------------------
        // Indoors, during curfew
        //-----------------------------------------
        if (scr_tnn_curfew("during") == true)
        {
            Dialogue("Amalberga", "Sigh. Flippin' curfew. One of these days, Hildy and I are gonna fix that clunker up and break out through the front gate. Then we'll be the queens of the road... if there are any roads out there.");
            Quest("govCar", 1);
        }
        //-----------------------------------------
        // Normal dialogue, before and after curfew
        //-----------------------------------------
        else
        {
            Dialogue("Amalberga", "Hildy and I have been working on this baby for as long as we've been here. They said it would be a real fixer-upper and they were right, but the main problem is that the parts we need just don't exist anymore. I mean, I have no idea how old this thing is but it's amazing that it's not just a lump of rust. If we could get an ancient catalytic converter, we could really get this thing purring again.");
            Quest("govCar", 1);
        }
    }
    scr_event_advance(event);
}
