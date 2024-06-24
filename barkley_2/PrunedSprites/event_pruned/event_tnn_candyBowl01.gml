/// this is wilmer's bowl. are you a good kid or a bad kid!?!?!?!

if (argument0 == SCRIPT_START) {

}
else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var candybowl = id;
    var event = scr_event_create_main();
    with (event) {    
        
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Matthias", s_port_matthias, "(It's... it's a dish of Mr. Wilmer's butterscotches... I want it but I don't think Matthias has the manual dexterity to get it... how did I even get in through the door?)");
        
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(Mr. Wilmer's butterscotch candies... I... I couldn't take one...)");
        
        // Wilmer is outside or upstairs. ------------------------------------------------------------------
        } else if (scr_quest_get_state("wilmerDisplay") == 0) 
        {
            if (scr_quest_get_state("wilmerCandyState") == 0) 
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Mr. Wilmer's not here... Maybe he's upstairs in his bedroom. I guess it wouldn't hurt if I grabbed a candy, would it?)");
                scr_event_build_wait(1);
                scr_event_build_wait_for_actions();
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Mr. Wilmer?... Mr. Wilmer!?");
                var candy = scr_event_build_choice("Take a candy?", s_port_hoopz);
                var yes = scr_event_build_add_choice(candy, "Yes, snatch the candy.");
                with (yes) 
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes, a candy! And it's all mine!");
                    scr_event_build_item_gain("Butterscotch", 1);
                    scr_event_build_dialogue_item("Gained 1 Butterscotch.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "This must be Wilmer's private candy...");
                    scr_event_build_quest_state("wilmerCandyState", 2);
                }
                var no = scr_event_build_add_choice(candy, "No, resist the candy.");
                with (no)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "(No... I can't do it. It's Wilmer's candy, not mine. I'll just have to resist this candy.)");
                    scr_event_build_quest_state("wilmerCandyState", 1);
                }
            }
            else if (scr_quest_get_state("wilmerCandyState") == 1) 
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(That candy's the apple of my eye. How the heck am I resisting it? I must be a more powerful youngster than I thought...)");
            }
            else if (scr_quest_get_state("wilmerCandyState") == 2)
            {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "It'll probably look suspicious if any more candy is missing. I know, I'll just really try to savor this one!");
            }
        }  
        // Wilmer is rocking away, next to you ------------------------------------------------------------------
            if (scr_quest_get_state("wilmerDisplay") == 1)
            {
                /*// Wilmer is awake ------------------------------------------------------------------
                if (scr_quest_get_state("wilmerAwake") == 1)
                {
                    if (scr_quest_get_state("wilmerCandyState") == 0) 
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Mr. Wilmer, you've gotta tell me what's going on with this candy!");
                        scr_event_build_dialogue("Wilmer", wilmer_portrait, "");
                        scr_event_build_dialogue("X1114", wilmer_portrait, "");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Mr. Wilmer?... Mr. Wilmer!?");
                        var candy = scr_event_build_choice("Take a candy?", s_port_hoopz);
                        var yes = scr_event_build_add_choice(candy, "Yes, snatch the candy.");
                        with (yes) 
                        {
                            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes, a candy! And it's all mine!");
                            scr_event_build_item_gain("Butterschnapps", 1);
                            scr_event_build_dialogue_item("Gained 1 Butterschnapps.");
                            scr_event_build_quest_state("wilmerCandyState", 2);
                        }
                        var no = scr_event_build_add_choice(candy, "No, resist the candy.");
                        with (no)
                        {
                            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(No... I can't do it. It's Wilmer's candy, not mine. I'll just have to resist this candy.)");
                            scr_event_build_quest_state("wilmerCandyState", 1);
                        }
                    }
                    else if (scr_quest_get_state("wilmerCandyState") == 1) 
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(That candy's the apple of my eye. How the heck am I resisting it? I must be a more powerful youngster than I thought...)");
                    }
                    else if (scr_quest_get_state("wilmerCandyState") == 2)
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "It'll probably look suspicious if any more candy is missing. I know... I'll just really try to savor this one.");
                    }
                }
                
               */ // Wilmer is asleep ------------------------------------------------------------------
                //else
               // {
                if (scr_quest_get_state("wilmerCandyState") == 0) 
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Mr. Wilmer is just rocking away... he probably has no idea I'm even here. Maybe I can grab one of these candies...)");
                    scr_event_build_wait(1);
                    scr_event_build_wait_for_actions();
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Psst... Mr. Wilmer? Psst!");
                    scr_event_build_wait(2);
                    var candy = scr_event_build_choice("Take a candy?", s_port_hoopz);
                    var yes = scr_event_build_add_choice(candy, "Yes, snatch the candy.");
                    with (yes) 
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Okay, here goes...");
                        scr_event_build_wait(1);
                        scr_event_build_dialogue("Wilmer", s_port_wilmer, "Hm? " + P_NAME + "? Is that you over there?");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Nooooooooooooooooo! What do I do?)");
                        scr_event_build_dialogue("Wilmer", s_port_wilmer, "Oh, thought I heard " + P_NAME + "... too bad I'm too old and stiff to ... zzz... up and turn around... zzz... zzz...");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Whew, he's asleep again... I gotta get out of here).");
                        //scr_event_build_item_gain("Butterscotch", 1);
                        //scr_event_build_dialogue_item("Gained 1 Butterscotch.");
                        scr_event_build_quest_state("wilmerCandyState", 4);
                    }
                    var no = scr_event_build_add_choice(candy, "No, resist the candy.");
                    with (no)
                    {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "(No... I can't do it. It's Wilmer's candy, not mine. I'll just have to resist this candy.)");
                        scr_event_build_quest_state("wilmerCandyState", 1);
                    }
                }
                else if (scr_quest_get_state("wilmerCandyState") == 1) 
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "(That candy's the apple of my eye. How the heck am I resisting it? I must be a more powerful youngster than I thought...)");
                }
                else if (scr_quest_get_state("wilmerCandyState") == 2)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "(It'll probably look suspicious if any more candy is missing. I know, I'll just really try to savor this one!)");
                }
                else if (scr_quest_get_state("wilmerCandyState") == 3)
                {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "(It's too late, there's no way I'm getting my hands on that candy.)");
                }
                // else if {}
            }
        }
    scr_event_advance(event);
}
