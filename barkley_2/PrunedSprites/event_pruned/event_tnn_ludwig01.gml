/* Event for Ludwig, eintag dwarf. 
   He moves backward in time while everyone else moves forward
   
   Variables:
    ludwigState
        0 = first stage, haven't met Ludwig, he knows you
        1 = second stage, Ludwig is defeated by Hoopz not knowing him
        2 = the exchange of Hoopz knowing Ludwig and Ludwig forgetting
        3 = the question segment where you can ask Ludwig to go with you (NOTE there is no reason to move from 3 to 4 in the quest variable, but I did because it was set up this way and can be reverted if we don't like the questioning)
        4 = Ludwig forgets Hoopz
        5 = Ludwig is born, then dissapears
*/

if (argument0 == SCRIPT_START) {
    // This starts Ludwig as just shoes if you get that far (this now starts at 4 (after you've failed to get him into your party and he no longer remembers Hoopz.)
    if (scr_quest_get_state("ludwigState") >= 4) or (scr_tnn_curfew("during")) {
        _current_animation = "gone";
        scr_event_entity_settings(o_ludwig01, 0, 1, 0);
    }
    else if (scr_tnn_curfew("after")) {
        scr_event_interactive_deactivate()
    }
} else if (argument0 == SCRIPT_INTERACT) {
    var ludwig = id;
    var event = scr_event_create_main();
    with (event) {
        if (scr_quest_get_state("ludwigState") == 0) {
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm surprised you aren't tired of talking with me yet.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Not that I have anything against you, I really like talking with you. I'm fortunate you're even talking to me. It's just...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Excuse me, have we met before?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Yeah... yeah, we met before. You really don't remember me?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "... no.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Just as well. I'd hate to mess up your life any more than I already have...");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Thanks for talking with me as long as you have. It means a lot that you tried.");
            scr_event_build_quest_state("ludwigState", 1);
        }
        if (scr_quest_get_state("ludwigState") == 1) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do you mean we've met before? I don't think I know you.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I... that's unfortunate to hear. I was really hoping you'd remember me.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Nevermind.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "So have we met before?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Does it matter? It's probably clear by now that we aren't capable of having a meaningful conversation.");
            scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "Um, I guess so.");
            scr_event_build_quest_state("ludwigState", 2);
        }
        if (scr_quest_get_state("ludwigState") == 2) {
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm pretty sure I've never seen you before. I know it's not terribly pertinent, but I thought you should know. I don't want you thinking that I'm just some old friend who doesn't really care. I don't really know what I am, but I know I wouldn't do that.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah that's what I was saying! We've never met before!");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "What? No you didn't.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "That's what I've been saying all along.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I... No, you're just trying to trick me.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Why would I trick you?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm an Eintag Dwarf. I'm very valuable. Supposedly, anyway... I don't know if that's still the case...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What does that mean?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm not sure how to say this. You're the only person I've ever spoken to...");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Eintag Dwarfs either live for one day or for an infinite amount of days. There's no in between. We begin existing, and our life belongs to the first person we speak to. Most people are cruel and just use us for servitude, sometimes worse. Others are more benevolent, give us permission to live our own lives.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't really understand.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "It's difficult to describe. We have many traits, most of which we aren't aware of until we're a little older, if we even get that far. The parameters of every Eintag Dwarf's life is different from the next.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "But you said one day or an infinite amount of days. What does that mean?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Most of us just pass by the people to whom we belong. We don't have very much time to find the person, and we need to establish some sort of bond with them, or our time will be up, and our existence will be forfeit.");
            scr_event_build_dialogue(P_NAME, s_port_hoopzHappy, "Oh! So that's me? I can help you?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I don't know if you can help me. Eintag Dwarfs have a different perception of spatial reality than other people, even other Dwarfs. We're born knowing quite a few things, but aren't always on the proper spatial trajectory to do anything about it. Most of us just fade away.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "How can I help you, then? We're friends! I don't want to make you a slave, I just want to see you live your own life. I'd hate to see you just fade away.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "Really?");
            scr_event_build_dialogue(P_NAME, s_port_hoopzHappy, "Definitely!");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Thanks... I'm not sure if our lives share the same trajectory. The things you've said to me thus far suggest this. You may not be able to help me, even if you want to.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do I need to do?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Ask me to come with you.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Where?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "Anywhere. Away. Not here. I'll die if I stay here. If I can hear you ask me this again I'll know it is possible, if we're going in the same direction.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay then...");
            scr_event_build_quest_state("ludwigState", 3);
            //Restart the event and have Ludwig ask to be in the party
            scr_event_build_execute_event_script(event_tnn_ludwig01);
        }
        // Flavor question for getting Ludwig to follow you ... can't be answered in any way that saves him
        if (scr_quest_get_state("ludwigState") == 3) {
            var accompanyLudwig = scr_event_build_choice("Invite Ludwig to accompany you?", s_port_hoopz);
            var yes = scr_event_build_add_choice(accompanyLudwig, "Sure! Join my party!");
            with yes {            
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Please, I need you to come with me.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "What?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Come on, let's go. I want to help you.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "I don't understand. Go where?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Anywhere. Away. Not here. You told me this is what you wanted.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "I told you, I don't know who you are! I didn't say these things!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes, you do. We just talked! You told me all about you!");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "No, I've only just seen you! I don't understand this!");
                scr_event_build_dialogue(P_NAME, s_port_hoopzSurprise, "Please, let me help you!");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "I don't understand! What's going on?!");
                scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "...");
                scr_event_build_quest_state("ludwigState", 4);
            }
            var no = scr_event_build_add_choice(accompanyLudwig, "Not right now, sorry.");
            with no {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry I don't think you can come with me right now.  I have a Cyberdwarf AND a destiny to discover.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "What?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I feel bad though, because want to help you.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "Help me how?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "You just said you wanted to get out of here.");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "Um, not sure what you are talking about but if you could please give me some space.");
                scr_event_build_dialogue(P_NAME, s_port_hoopzSurprise, "You know me! We just talked! You told me all about you!");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "No, I've only just seen you! I don't understand this!");
                scr_event_build_dialogue(P_NAME, s_port_hoopzSurprise, "Please, let me help you!");
                scr_event_build_dialogue("Ludwig", s_port_ludwig, "I don't understand! What's going on?!");
                scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "...");
                scr_event_build_quest_state("ludwigState", 4);
            }    
        }
        if (scr_quest_get_state("ludwigState") == 4) {
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "Hi, I'm Ludwig! I was just born.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You... You don't remember me?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "How can I remember you when I was just born?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "We were just talking. You told me to ask you to come with me.");
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "I'm pretty sure I didn't do that! I was just born this very minute!");
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "It's pretty exciting to be alive. I know a lot of things. I'm just starting to be aware of it all.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Isn't there anything I can do to make you come with me?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig_happy, "What? That's a curious thing to say.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You don't remember speaking to me?");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm sorry, I don't. Are you all right?");
            scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "I don't think so...");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "I'm sorry.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I...");
            scr_event_build_dialogue("Ludwig", s_port_ludwig, "What?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "... I don't know. Ludwig, I...");
            scr_event_build_animation_play_and_set(ludwig, "disappear", "gone");
            scr_event_build_wait_for_actions();
            scr_event_build_entity_settings(o_ludwig01, 0, 1, 0);
            scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "...");
            scr_event_build_quest_state("ludwigState", 5);
        }
    }
    scr_event_advance(event);
}
