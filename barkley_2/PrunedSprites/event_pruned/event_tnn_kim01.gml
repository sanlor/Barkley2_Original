// event_tnn_kim01

if (argument0 == SCRIPT_START)
{

}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    var kim = id;
    var kimname = Duergar("getname", "kim")
    
    var event = scr_event_create_main();
    with (event)
    {
        Dialogue(kimname, "I've got no clue why the Governor let you out of Tir na nOg, but you'd better get the hell out of here before I smash your face in. Stay safe out there in the Wasteland! Bwahahahaha!");
        /*
        //-------------------------------------------
        //  Body Swap States
        //-------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            Dialogue(kimname, "Haw haw, you look like shit, kid. Sure wouldn't mind kickin' yer ass.");
            Dialogue("Matthias", "Gulp! (Why do I keep talking to Duergars?");
        }
        //if you're controlling the Governor.
        if (BodySwap() == "governor")
        {
            Dialogue(kimname, "Mr. Governor, sir! Jus' doin' my part to fully dehumanize and psychologically pulverize the dwarfs. Pleased to be of service!");
        }
        
        //-------------------------------------------
        // After Gutterhound Robbery
        //-------------------------------------------
        else if (ClockTime("get") >= scr_time_db("gutterhoundRobbery"))
        {
            Dialogue(kimname, "I've seen you wanderin' around real suspicious-like. You better hope you had nothin' to do with that break-in, or you're gonna be walkin' around with a new face.");
        }
        
        //-------------------------------------------
        // During Curfew
        //-------------------------------------------
        else if (scr_tnn_curfew("during") == true)
        {
        
        }
        
        //-------------------------------------------
        // After Governor Quest
        //-------------------------------------------
        else if (Quest("govQuest") == 6)
        {
            Dialogue(kimname, "Well I don't know what Governor Elagabalus was thinking when he gave you permission to leave Tir na Nog. Never happened before, not on my watch. Course, we've thrown a few knuckleheads into the sewers in the past. Never heard from them again! Hahaha!!");
        }
        
        //-------------------------------------------
        // Normal State
        //-------------------------------------------
        else
        {
            Dialogue(kimname, "What are you lookin' at, chump? Keep walkin', unless you want a taste of my knuckle sandwich.");   
        }
        */
    }
    scr_event_advance(event);
}
