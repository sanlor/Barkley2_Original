// Hyacinth - Generic dancer in Booty Bass quest
// usage: event_tnn_hyacinth01

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var hyacinth = id;
    var event = scr_event_create_main();
    with (event) {
        // Build events!
        if (scr_quest_get_state("bootyBassQuest") == 2) { // *** bootyBassQuest = 2 *** - Lost Booty Bass tournament.
            scr_event_build_dialogue("Hyacinth", NULL, "So what if you're not the Baron of Booty? You went up there, gave it your all and had a good time. Right?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I guess...");
            scr_event_build_dialogue("Hyacinth", NULL, "Maybe you're the baron of something else, something bigger than booties. You'll never know unless you go out there and try. Just take what life gives you and give it your best shot. Okay?");
        }
        else if (scr_quest_get_state("bootyBassQuest") == 3) { // *** bootyBassQuest = 3 *** - won Booty Bass tournament.
            scr_event_build_dialogue("Hyacinth", NULL, "See that? You went with the flow, tried something new and came out on top. Sometimes you've just gotta be impulsive. That's what it's all about.");
        }
        else if (scr_quest_get_state("hyacinthState") == 0) { // *** no conditions ***
            scr_event_build_dialogue("Hyacinth", NULL, "You might think this is crazy, but sometimes the best thing you can do is let yourself get absorbed in the collective energy of a crowd. Lose your mind and just dance. You should join me!");
            var choice = scr_event_build_choice("Join her?", s_port_hoopz);
            var yes = scr_event_build_add_choice(choice, "Yes.");
            with yes {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, that sounds cool!");
                scr_event_build_dialogue("Hyacinth", NULL, "Let's dance!");
                //screen blacks out for a sec, fades back in
                scr_event_build_fade(true, 1);
                scr_event_build_wait(2);
                scr_event_build_fade(false, 1);
                scr_event_build_dialogue("Hyacinth", NULL, "Hey, you're a cool kid. Listen to this: to get the most out of life, sometimes you have to make decisions that take you out of your comfort zone. Sometimes you just have to let life take you places. Don't forget that, okay?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll remember that!");
                scr_event_build_quest_state("hyacinthState", 1);
            }
            var no = scr_event_build_add_choice(choice, "No.");
            with no {
                
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Umm, I'm sorry... I need to uh, deliver some milk bottles...");
                scr_event_build_dialogue("Hyacinth", NULL, "You'd enjoy life more if you let yourself go sometimes. It's not always about making the most rational choice. Next time you're presented a choice that takes you out of your comfort zone, you should take it. I challenge you.");
                scr_event_build_quest_state("hyacinthState", 1);
            }
        }
        else { // *** hyacinthState = 1 ***
            scr_event_build_dialogue("Hyacinth", NULL, "When I dance, I let my mind go and I don't care about anything else. Life just takes you away sometimes. That's what I like about it.");
        }
    }
    scr_event_advance(event);
}
