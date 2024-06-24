// Event for Ex-Mayor "Dubuque."
// usage: event_tnn_dubuque01
/*


*/

if (argument0 == SCRIPT_START)
{
    if (scr_inside()) scr_entity_animation_set(o_dubuque01, "inside");
    else scr_entity_animation_set(o_dubuque01, "default");
    
    // Activation & Deactivation for Curfew
    if ((scr_time_db("tnnCurfew") == "during") && !scr_inside()) { scr_event_interactive_deactivate(); }
    if (!(scr_time_db("tnnCurfew") == "during") && scr_inside()) { scr_event_interactive_deactivate(); }
}

else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var dubuque = id;
    var event = scr_event_create_main();
    
    with (event)
    {
        //-----------------------------------------
        // Body Swap States
        //-----------------------------------------
        
        //if you're controlling the Governor.
        if (BodySwap() == "governor")
        {
            if (scr_quest_get_state("dubuqueGovernor") == 0)
            {
                Dialogue("Dubuque", "Well look who it is, our high-falutin', self-appointed, so-called... *hic*... /'Governor/'. Hey buddy, how about you take your Duergar buddies back to Cuchulainn and tell him to kiss my rumpus-");
                Dialogue("Evander", "Mr. Governor, sir! P-please don't mind old man Dubuque, he's been hitting the fruit juice a little too hard! You know how those old timers can be! We all love Cuchulainn and the Duergar administration at this establishment! Now shut your mouth, old man!");
            }
            Dialogue("Dubuque", "Ahhhh... *grumble*... Cuchulainn... *grumble*... mayor... *grumble* grape juice...");
            scr_event_build_quest_state("dubuqueGovernor", 1);
        } 
        
        //-----------------------------------------
        // Indoors, during curfew
        //-----------------------------------------
        if (scr_time_db("tnnCurfew") == "during")
        {
            if (scr_quest_get_state("dubuqueState") == 2)
            {
                Dialogue("Dubuque", "Yep... let's celebrate. I just need the curfew to end... the bar to open... to get juice... I need some juice bad...");
            }
            else if (scr_quest_get_state("dubuqueState") == 1)
            {
                Dialogue("Dubuque", "Hey there youngster, this is my campaign office. Election season's far away still, so there's not much going on. Don't worry, it'll be a landslide! There will be a flash of recognition when the dwarfs see me on the ballot. It's me, Dubuque, the old mayor of the dwarfs! Let's celebrate my victory with some juice!... just need the bar to be open again... juice...");
                scr_event_build_quest_state("dubuqueState", 2);
            }
            else
            {
                Dialogue("Dubuque", "Say, look what we have here... a new constituent! I'm Dubuque... the former mayor of the dwarfs! This my campaign office. Election season's far away still, so there's not much going on. Don't worry, it'll be a landslide! There will be a flash of recognition when the dwarfs see me on the ballot. It's me, Dubuque, the old mayor of the dwarfs! Let's celebrate my victory with some juice! Let's celebrate my victory with some juice!... just need the bar to be open again... juice...");
                scr_event_build_quest_state("dubuqueState", 2);
            }
        }
        
        //-----------------------------------------
        // Normal dialogue, before and after curfew
        //-----------------------------------------
        else
        {
            // Talked to him.
            if (scr_quest_get_state("dubuqueState") == 1)
            {
                Dialogue("Dubuque", "I think... *gulp*... I think the election's been postponed again. Yup... that's it...");
            }
            // Never talked to him.
            else
            {
                Dialogue("Dubuque", "Never seen you before. I'd ask for your vote but you don't really look like a dwarf.");
                var vote_choice = scr_event_build_choice("Reply?", s_port_hoopz);
                
                //ROUNDMOUND: add compatibility
                var what_vote = scr_event_build_add_choice(vote_choice, "What vote?");
                with what_vote
                {
                    Dialogue(P_NAME, "You want my vote? For what? I'd like to... but I don't think I'm old enough to vote.");
                    Dialogue("Dubuque", "You mean... you want to vote for me? What great citizenry! The whole of Tir na Nog will be proud of you. I myself am overjoyed! You won't regret putting your efforts behind the Dubuque camp! Not at all! You're doing the right thing!..._ but..._ the vote is for dwarfs only! Get out of here! Get lost!");
                    scr_event_build_camera_frame(CAMERA_NORMAL, o_evander01);
                    Dialogue("Evander", "*Sigh*...");
                }
                
                var dwarf = scr_event_build_add_choice(vote_choice, "I am a dwarf.");
                with dwarf
                {
                    Dialogue(P_NAME, "No, I'm definitely a dwarf... I mean... I think I'd like to be... oh I don't know.");
                    Dialogue("Dubuque", "Hmm... you're tall, but by golly you may just be a dwarf. You got that dwarf gleam in your eye, that's for sure. Most of us around here lost their dwarf twinkle in occupation. I'll say it again! The Duergar Occupation is illegitimate! Illegitimate! I, Dubuque, former deputy ma-");
                    scr_event_build_camera_frame(CAMERA_NORMAL, o_evander01);
                    Dialogue("Evander", "Shut up old man! There is no mayor of the dwarfs, and there never was! If the Duergars hear you talking like that, they'll send you to the mines to do hard labor. They'll work you till your brittle old dwarf bones crack, you hear me?");
                }
                scr_event_build_camera_frame(CAMERA_NORMAL, o_dubuque01, o_cts_hoopz);
                scr_event_build_wait(1);
                scr_event_build_wait_for_actions();
                Dialogue("Dubuque", "I..._ \... I'm the deputy mayor... *gulp*");
                scr_event_build_quest_state("dubuqueState", 1);
            } 
        }
    }
    scr_event_advance(event);
}
