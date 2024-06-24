// Script for Kalevi.


if (argument0 == SCRIPT_START)
{
    // Check if Inside, if so change Kalevi's animation to "standing" and check for existence of curfew
    if (scr_inside() == true)
    {
        scr_entity_animation_set(o_kalevi02, "kaleviStanding");
        if (!(scr_time_db("tnnCurfew") == "during") && scr_inside()) { scr_event_interactive_deactivate(); }
    }
    
    // Activation & Deactivation for Curfew Outside
    if ((scr_time_db("tnnCurfew") == "during") && !scr_inside()) { scr_event_interactive_deactivate(); }
} 
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{

    var event = scr_event_create_main();
    var question_snippet = scr_event_create_main();
    
    //------------------------------------------------------------
    // question_snippet
    //------------------------------------------------------------
    with (question_snippet)
    {
        // Choice to talk to Kalevi about something.  I am not sure if there is a better way to do this 
        // but I am trying to have the choice only appear if at least some of the questStates are met
        // right now it just checks for any of the qualifying states to be true with or statements
        if (scr_quest_get_state("wilmerEvict") == 1 && scr_quest_get_state("kaleviHousingDept") == 0) || (scr_quest_get_state("kaleviGun1Given") == 0) || (scr_quest_get_state("kaleviJobSearch") == 0 && scr_quest_get_state("ericQuest") == 2)
        {
            var kaleviMeet = scr_event_build_choice("Question for Kalevi?", s_port_hoopz);
            
            // This first choice triggers if you are still looking for the Housing Dept (wilmerEvict = 1)
            if (scr_quest_get_state("wilmerEvict") == 1) && (scr_quest_get_state("kaleviHousingDept") == 0)
            {
                var housingDept = scr_event_build_add_choice(kaleviMeet, "Housing Department?");
                with (housingDept)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm actually looking for the Housing Department.");
                    scr_event_build_dialogue("Kalevi", NULL, "Ha! Good luck if you can stand the wait. It's over in the Warehouse District, pretty much on the other side of the Governor's Mansion in the center of town. Probably should hurry though, their hours are less than accomodating and their late fees hit harder than my hammer.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh that's really good to know, thanks!");
                    scr_event_build_quest_state("kaleviHousingDept", 1);
                }
            }                
            // If you ask for a zook you'll get a gun: kaleviGun1
            if (scr_quest_get_state("kaleviGun1Given") == 0)
            {
                var (zookRequest) = scr_event_build_add_choice(kaleviMeet, "Sure you can't make me a 'zook?");
                with (zookRequest)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Gosh Kalevi, it's tough going through life brasting without a trusty 'zook.");
                    scr_event_build_dialogue("Kalevi", NULL, "Fat chance, kid. I'm not stamping my passport to the labor mines just to break out the 'good stuff'. The only way I'm ending up in the mines is on smithin' contract.");
                    scr_event_build_wait(1.0);
                    scr_event_build_dialogue("Kalevi", NULL, "But you know what? I don't think there is much in the rules about givin' away ALREADY SMITHED gun's. Look, I was gonna drop this old pop gun into this sewer pipe once I was done shapin' it, so you might as well take it.");
                    scr_event_build_dialogue_item("Got Orbiting Aluminum Submachine Gun.");
                    scr_event_build_gun_give("kaleviGun1");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh wow I wasn't expecting this! Thanks a lot!");
                    scr_event_build_dialogue("Kalevi", NULL, "For what, kid? I didn't give you anything. I don't deal in gun's. I'm a straight shooter. That gun you just happened to find though, is anything but straight.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh... oh! Right! No thanks to you then... got it!");
                    scr_event_build_quest_state("kaleviGun1Given", 1);
                }
            }
            
            // Any jobs available? - for Eric's Quest
            if (scr_quest_get_state("ericQuest") == 2) && (scr_quest_get_state("kaleviJobSearch") == 0)
            { 
                var (jobRequest) = scr_event_build_add_choice(kaleviMeet, "Any jobs available?");
                with (jobRequest)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Excuse me, do you have any jobs available?");
                    scr_event_build_dialogue("Kalevi", NULL, "Think you can pound molten steel with a 20 pound hammer in front of a raging furnace all day long?");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh, I'm looking for a friend, not me.");
                    scr_event_build_dialogue("Kalevi", NULL, "Well can your friend do it?");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Mmm... no, definitely not... one hundred percent definitely not.");
                    scr_event_build_dialogue("Kalevi", NULL, "Nope. No jobs.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh, okay then. Thanks anyway!");
                    scr_event_build_quest_state("kaleviJobSearch", 1);
                }
            }
            
            var (nevermind) = scr_event_build_add_choice(kaleviMeet, "Nary ye mind...");
            with (nevermind)
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Nary ye mind, maybe some other time.");
            }
        }
    }
    
    
    //------------------------------------------------------------
    // event
    //------------------------------------------------------------
    with (event)
    {
        
        //-------------------------------------------
        // Body Swap States
        //-------------------------------------------
        // If you're controlling the Governor.
        if (BodySwap() == "governor")
        {
            // Haven't talked as governor
            if (scr_quest_get_state("govKalevi") == 0)
            {
                scr_event_build_dialogue("Kalevi", NULL, "Eh, you're the new Governor then, are you? Askin' humbly, sir... I don't mind making nails and pipes for the Duergars, but what I wouldn't give to work on gun's again...");
                scr_event_build_quest_state("govKalevi", 1);
            }
            // Have talked as governor
            else
            {
                scr_event_build_dialogue("Kalevi", NULL, "Yes sir, I'm the blacksmith around here. Actually, I'm a trained gun'ssmith but the old Governor didn't let me work my craft, at least not for dwarfs. Been doing this for all my life and I learned from the gun'ssmithing masters themselves. What I wouldn't give to work on 'zook's again, to feel molten Damascus steel bending under the blows of my hammer just one last time...");
            }
        }
         
        //-------------------------------------------
        // Normal States
        //------------------------------------------- 
        else
        {
            //-----------------------------------------
            // After Governor
            //-----------------------------------------
            // Kalevi is being transferred to the mines.
            if (scr_quest_get_state("govKalevi") == 3)
            {
                scr_event_build_dialogue("Kalevi", NULL, "If you ever end up in the Mines, hit me up. I'll forge you the most hellzapoppin' 'zook's you ever laid eyes on. That's my specialty, bazookas. You can tell I'm serious about bazookas because I have the word /'bazooka/' tattooed to my inner thigh.");
            }
            // Kalevi is being transferred to the mines.
            else if (scr_quest_get_state("govKalevi") == 2)
            {
                if (scr_time_db("tnnCurfew") == "during") { 
                    scr_event_build_dialogue("Kalevi", NULL, "Sorry, kid, can't talk. I'm packing up my things 'cuz I'm getting transferred to the Duergar Mines, where I'm actually gonna be allowed to work on weapons. You know, they say life at the Mines is pretty rough but I honestly can't wait to work on weapons again. Making these crummy trinkets and tools was driving me crazy."); 
                }
                else {
                    scr_event_build_dialogue("Kalevi", NULL, "Sorry, kid, can't talk. I'm finishing up my last orders 'cuz I'm getting transferred to the Duergar Mines, where I'm actually gonna be allowed to work on weapons. You know, they say life at the Mines is pretty rough but I honestly can't wait to work on weapons again. Making these crummy trinkets and tools was driving me crazy.");
                }
                scr_event_build_quest_state("govKalevi", 3);
            }
            // Kalevi told you about desire to transfer to mines.
            else if (scr_quest_get_state("govKalevi") == 1)
            {
                scr_event_build_dialogue("Kalevi", NULL, "Yep, I'm the blacksmith around here. Actually, I'm a trained gun'ssmith but the Duergars don't let me work my craft, at least not for dwarfs. Been doing this for all my life and I learned from the gun'ssmithing masters themselves. What I wouldn't give to work on 'zook's again, to feel molten Damascus steel bending under the blows of my hammer just one last time...");
            }
            
            
            //-----------------------------------------
            // No progress on Governor Quest yet...
            //-----------------------------------------
            if (scr_quest_get_state("govKalevi") == 0)
            {
                //-----------------------------------------
                // Indoors, during curfew
                //-----------------------------------------
                if (scr_time_db("tnnCurfew") == "during")
                {
                    //Spoken to before indoors.
                    if (scr_quest_get_state("kaleviState") == 1)
                    {
                        scr_event_build_dialogue("Kalevi", NULL, "Sigh... what I wouldn't give to get outta this place. To work on gun's again, to have my own schedule, to be my own boss. You know, Tir na Nog sucks.");
                        scr_event_build_quest_state("govKalevi", 1);
                    } 
                    // Haven't spoken to in-doors before.
                    else 
                    {
                        scr_event_build_dialogue("Kalevi", NULL, "Hey, I can't say it too loud but... this curfew is just stupid. Why shouldn't I be allowed to work when I want to? I think the Duergars just get off on bossing us around, that's what I think.");
                        scr_event_build_quest_state("kaleviState", 1);
                        scr_event_build_quest_state("govKalevi", 1);
                    }
                }
                //-----------------------------------------
                // Normal dialogue, before and after curfew
                //-----------------------------------------
                else
                {
                    
                    if (scr_quest_get_state("kaleviTalked") == 1)
                    {
                        scr_event_build_dialogue("Kalevi", NULL, "Anvil's hot.");
                    }
                    // Greets you the first time with a talk about Bazookas
                    else
                    {
                        // Normal ending dialogue
                        scr_event_build_dialogue("Kalevi", NULL, "Sure these are just sewage pipes I'm repairing, but with a hot enough flame and a true enough anvil, I could forge a 'zook that would clear a Duergar's arse.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Such raw power... and zook's are...?");
                        scr_event_build_dialogue("Kalevi", NULL, "Ah, and here I thought the little tyke was a 'braster. Bazookas my boy! I make the finest pop launchers this side of Brain City. But city ordinance keeps me from pounding that ordnance. New rules state that gun's need to be bred, no straight smithing, this keeps us dwarfs from using our true talents. It's a scam. I'm just a glorified plumber while I'm in this dump.");
                        scr_event_build_quest_state("kaleviTalked", 1);
                    }
                }
            
                scr_event_build_event_snippet(question_snippet);
            
                if (scr_time_db("tnnCurfew") == "during") { scr_event_build_dialogue("Kalevi", NULL, "Can't wait to get out of here, anyway... so I can get back to hammering."); }
                else { scr_event_build_dialogue("Kalevi", NULL, "Back up, I'm gonna really smash the hell out of this pipe."); }
            }
        }
    }
    scr_event_advance(event);
}
