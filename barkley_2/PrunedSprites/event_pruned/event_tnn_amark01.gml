// Amnesiac in TNN who appears out in the world later on in the game if you 
//follow through on his dialogue.

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Amark", s_port_amark, "...");
            scr_event_build_dialogue("Matthias", s_port_matthias, "Oh, hi! Just a friendly visit from your good friend Matthias!! You should tell all your pals that super-friend Matthias visited you today!!! Wow!!");
            
        //if you're controlling the Governor.
        } else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Amark", s_port_amark, "...");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Uh... yes... everything seems to be in order here. I am the governor, you know, and it is the governor's job to see that everything is in order. Carry on!");
            
        //Spoken to Amark 5 times.
        } else if (scr_quest_get_state("amarkState") == 4) {
            scr_event_build_dialogue("Amark", s_port_amark, "So long, I guess. Maybe we'll bump into each other in another life. Stay safe, buddy.");
            
        //Spoken to Amark 3 times.
        } else if (scr_quest_get_state("amarkState") == 3) {
            scr_event_build_dialogue("Amark", s_port_amark, "This really does change everything. I think when you leave I'm going to lock the door behind you for a few days. I need to digest all of this...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Are you going to just stay around here?");
            scr_event_build_dialogue("Amark", s_port_amark, "I... yeah, aren't you?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't think so. This place is bad news. I'm going to try getting out.");
            scr_event_build_dialogue("Amark", s_port_amark, "Really? How?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not sure yet, but it's something I need to do.");
            scr_event_build_dialogue("Amark", s_port_amark, "Huh... I was actually getting kinda excited about having someone around town now that I can talk to. You sure you aren't going to stick around a little longer?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry. I've got things to do, I can't stay.");
            scr_event_build_dialogue("Amark", s_port_amark, "Yeah, it's okay, I don't blame you. If I could, I'd leave too.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, maybe we could go together? It gets a little lonely just wandering around by myself. We could look after each other.");
            scr_event_build_dialogue("Amark", s_port_amark, "I... I don't think you really need dead weight like me. I see what you're carrying. I'd just be a liability. You don't need that.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't mind. It'd be cool having someone to talk to.");
            scr_event_build_dialogue("Amark", s_port_amark, "No, I'd feel wrong about that. I've overheard people talking about what it's like out there. I wouldn't last five minutes.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay, if you're sure.");
            scr_event_build_dialogue("Amark", s_port_amark, "Yeah, I think so. But thanks for the offer. It really means a lot that you'd say that. And who knows? Maybe I'll get the nerve to leave on my own sometime. I wouldn't count on it, but you never know I guess.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I hope we meet again. Maybe our memories will have come back by then. Then we can find out who the heck we've been talking to all this time.");
            scr_event_build_dialogue("Amark", s_port_amark, "Ha ha, yeah. That's a nice dream, isn't it?");
            scr_event_build_quest_state("amarkState", 4);
            scr_event_build_quest_state("amarkLeave", 1);
            
        //Spoken to Amark 2 times.
        } else if (scr_quest_get_state("amarkState") == 2) {
            scr_event_build_dialogue("Amark", s_port_amark, "Hey, you're looking at me kinda funny. Do you need help with something?");
            var amarkChoice1 = scr_event_build_choice("I'm doing alright, it's just...", s_port_hoopz);
            
            //Just seeing how you're doing.
            with scr_event_build_add_choice(amarkChoice1, "Just seeing how you're doing.") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, it's nothing. Just seeing how you're doing.");
                scr_event_build_dialogue("Amark", s_port_amark, "You know, you're the only person that's ever asked me that since I got here. I keep to myself, yeah, but it's still nice to hear. Anyway, yeah, doing good. Better today. Thanks for asking. How are you?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know. Hanging in there, I guess.");
                scr_event_build_dialogue("Amark", s_port_amark, "You and me both could use some better fortune, I think. Here's hoping things turn out ok for us lost souls.");
            }
            
            //What is your story?
            with scr_event_build_add_choice(amarkChoice1, "So what's your story, anyway?") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "So what's your story, anyway?");
                scr_event_build_dialogue("Amark", s_port_amark, "My story?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah. You don't seem to go out much, you keep the door locked. I'm just interested, I guess.");
                scr_event_build_dialogue("Amark", s_port_amark, "Huh, yeah I guess that is a little weird. At least here, anyway. To tell you the truth, though, I don't have a story. Or if I do, I don't remember it. I have amnesia. I don't remember anything since I ended up here.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "What? You have amnesia?!?");
                scr_event_build_dialogue("Amark", s_port_amark, "Uh, yeah? There's not a lot for me to gain by lying about that, is there? It's just amnesia. I'm not asking for anything from you. You asked.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, it's just... I have amnesia too. I can't remember anything either.");
                scr_event_build_dialogue("Amark", s_port_amark, "No... you're pulling my leg.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm serious, I have amnesia too.");
                scr_event_build_dialogue("Amark", s_port_amark, "Wow. I had to check myself right there. My first reaction was to say how cool it is to find someone else going through what I'm going through... but that's not right at all. My life's been hell since I woke up. The more I think about it, the more it hurts to think I'm not the only one going through that. I'm sorry. I wish I was the only one who had to experience this. Nobody should have to lose this much.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, me too... Hey, do you think we're connected in some way? Maybe we got the amnesia together?");
                scr_event_build_dialogue("Amark", s_port_amark, "I don't know. I don't think I recognize you at all. Have you been getting the headaches too?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Headaches? No, I feel ok.");
                scr_event_build_dialogue("Amark", s_port_amark, "Do you have any weird scars? I've got a couple on my head, a couple more on my chest. There's something implanted under the skin of my arm too. It beeps sometimes. Do you have any of that?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, nothing quite like that. Does that thing hurt at all?");
                scr_event_build_dialogue("Amark", s_port_amark, "No, it just beeps. Strangest thing... Hmm... Maybe our amnesia is just an odd coincidence, then. I don't know.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess that's possible.");
                scr_event_build_dialogue("Amark", s_port_amark, "Hmm... this changes everything... I thought it was just me...");
                scr_event_build_quest_state("amarkState", 3);
            }
            
            
        //Spoken to Amark 1 time.
        } else if (scr_quest_get_state("amarkState") == 1) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Why did you mean to lock the door?");
            scr_event_build_dialogue("Amark", s_port_amark, "The door? I don't know. Does it seem like that unusual of a thing to do?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess it shouldn't. Are you hiding from something?");
            scr_event_build_dialogue("Amark", s_port_amark, "I don't know if hide is the right word. Out there, there's just... There's too much... eh...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Too much what?");
            scr_event_build_dialogue("Amark", s_port_amark, "Just too much. Too much everything. There's this layer of despair out there, I don't think most of the others even really see it. It's hard to watch...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I know what you mean. Maybe that's why I wandered in here.");
            scr_event_build_dialogue("Amark", s_port_amark, "Probably is.");
            scr_event_build_quest_state("amarkState", 2);
        
        //Never spoken to Amark before.
        } else {
            scr_event_build_dialogue("Amark", s_port_amark, "Oh... hey...");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hi.");
            scr_event_build_dialogue("Amark", s_port_amark, "How did you get in here?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I walked in? I don't know what you mean.");
            scr_event_build_dialogue("Amark", s_port_amark, "Oh, thought I locked the door.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm sorry. I can leave if you want.");
            scr_event_build_dialogue("Amark", s_port_amark, "No, you just surprised me, that's all. You can hang around if you want.");
            scr_event_build_quest_state("amarkState", 1);
        }
    }
    scr_event_advance(event);
}
