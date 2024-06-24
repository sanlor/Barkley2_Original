// Event for Benedict, in TnN and the Sewers
// usage: event_tnn_benedict01();

if (argument0 == SCRIPT_START)
{
    if (ClockTime("get") >= 1 && scr_area_get() == "tnn") { scr_event_interactive_deactivate(); }
    else if (ClockTime("get") < 1 && scr_area_get() != "tnn") { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

} 
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var benedict = id;
    var event = scr_event_create_main();
    with (event)
    {
        //-------------------------------------------
        // Body Swap States
        //-------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            if (scr_area_get() == "tnn") { scr_event_build_dialogue("Benedict", NULL, "G'day Matt! Still lookin' fer rebels? Guess you got outta the sewers okay. I'm goin' fishin' there myself! Get yer rod and come along!"); }
            else { scr_event_build_dialogue("Benedict", NULL, "G'day Matt! You still lookin' fer rebels? You aren't leaving the sewers, are ya? I just started fishin' myself! Go get yer rod and join me!"); }
            scr_event_build_dialogue("Matthias", s_port_matthias, "Um, hey... guy. I think I'll skip out for now. I've uh, had enough of the sewers for one day. Yep. Pretty sure I won't be going back there anymore.");
            scr_event_build_dialogue("Benedict", NULL, "Well if you're not goin' fishin, we have nothing to talk about. Scram! Scram, youngster! Scram!");
        }
        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Benedict", NULL, "Well if it ain't the new governor. I guess yer a real bigshot, huh? Well you'd be doin' me a big favor if you made the sewers a little safer to fish in. And let Cuchulainn know we're all ready for that prize.");
        }
        
        //-------------------------------------------
        // After Clocktime X, in Sewers
        //-------------------------------------------
        else if (scr_area_get() != "tnn")
        {
            // Talked before.
            if (scr_quest_get_state("benedictState") == 1)
            {
                scr_event_build_dialogue("Benedict", NULL, "My advice? Keep yer hook close... and yer sinker closer! Hyaw haw haw haw haw! Guh huh huh huh huh! Bwahahahaha! Gahahahahahah! Buh huh huh.");
            } 
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Benedict", NULL, "Nice day for fishin', huh? Don't usually go any further in on account of the Bainshees and all, but this ain't a bad spot.");
                scr_event_build_quest_state("benedictState", 1);
            }
        }
        //--------------------------------------
        // Before Clocktime X, in Sewers
        //--------------------------------------
        else
        {
            // Talked to him.
            if (scr_quest_get_state("benedictState") == 1)
            {
                scr_event_build_dialogue("Benedict", NULL, "Well, I'm going fishin' now. A lot of people say the sewers aren't a safe place for a dwarf to go fishin', that if the Duergars don't get me, it'll be Cuchulainn's Bainshees, but I'm not worried. The rebels go in and out of the sewers all the time! What's the big deal?");
            }
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Benedict", NULL, "Hey there youngster, you know anything about the sewers?");
                
                var know_anything_choice = scr_event_build_choice("Reply?", s_port_hoopz);
                
                var yeah = scr_event_build_add_choice(know_anything_choice, "Yeah.");
                with (yeah)
                {
                    scr_event_build_dialogue("Benedict", NULL, "Me too. I also know about the sewers.");
                }
                var no = scr_event_build_add_choice(know_anything_choice, "Not really.");
                with (no)
                {
                    scr_event_build_dialogue("Benedict", NULL, "Oh. I was going to ask you if you knew if the sewers are a dangerous place place filled with Bainshees, or if lots of dwarfs try to escape through the sewers, or if the sewers are where L.O.N.G.I.N.U.S. rebels hide out, or if it's where the Duergars have a plantation where they send anyone suspected of being a rebel. But I guess you don't know either.");
                }
                scr_event_build_quest_state("benedictState", 1);
            }
        }
    }
    scr_event_advance(event);
}
