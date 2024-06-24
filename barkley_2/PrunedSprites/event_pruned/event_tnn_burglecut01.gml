// event_tnn_burglecut01

if (argument0 == SCRIPT_START) 
{

}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    //TODO: make his dialogue more personality-rich
    var burglecut = id;
    var event = scr_event_create_main();
    var burglename = Duergar("getname", "burglecut");
    with (event)
    {
        //-------------------------------------------
        //  Body Swap States
        //-------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            Dialogue(burglename, "Flub off, kid. I don't have time for septic tank-smellin' chumps today.");
            Dialogue("Matthias", "Gulp! (Why do I keep talking to Duergars?");
        }
        //if you're controlling the Governor.
        if (BodySwap() == "governor")
        {
            Dialogue(burglename, "Standing at attention, Mr. Governor! I'm looking forward to your speech - can't wait to hear about all the ghastly torture protocols we're going to be implementing.");
        }
        
        //-------------------------------------------
        // After Gutterhound Robbery
        //-------------------------------------------
        else if (ClockTime("get") >= scr_time_db("gutterhoundRobbery"))
        {
            Dialogue(burglename, "I've seen you wanderin' around real suspicious-like. You better hope you had nothin' to do with that break-in, or you're gonna be walkin' around with a new face.");
        }
        
        //-------------------------------------------
        // During Curfew
        //-------------------------------------------
        else if (scr_tnn_curfew("during"))
        {
            Dialogue(burglename, "Look at these stupid dwarfs. They can't do anything for themselves. That's the difference between us and them, they're helpless children and we're their malevolent masters. They deserve what Cuchulainn has in store for 'em."); 
        }
        
        //-------------------------------------------
        // After Governor Quest
        //-------------------------------------------
        else if (Quest("govQuest") == 6)
        {
            Dialogue(burglename, "Well I don't know what Governor Elagabalus was thinking when he gave you permission to leave Tir na Nog. Never happened before, not on my watch. Course, we've thrown a few knuckleheads into the sewers in the past. Never heard from them again! Hahaha!!");
        }
        
        //-------------------------------------------
        // Normal State
        //-------------------------------------------
        else if (scr_tnn_curfew("after"))
        { 
            Dialogue(burglename, "What I wouldn't give to live in the Governor's mansion. Heh heh, you wouldn't believe some of the stories I've heard about the place.");
        }
        else
        {
            Dialogue(burglename, "Mmmmm, I'm lookin' forward to the new governor coming to town. I hear he's a real hardass. Oooh, I love to watch these idiot dwarfs squirm.");   
        }
    }
    scr_event_advance(event);
}
