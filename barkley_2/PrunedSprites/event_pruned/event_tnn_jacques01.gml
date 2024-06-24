// Event for Jacques, man in tnn.
// appears at times 2, 4 and 5.

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Jacques", NULL, "Back from the sewers, Matt? Just forget about the rebels, you don't want to get involved with 'em. You here to pay your Pa's rent? Forget about it. It's closed for the day... hey, open up! Open up, you chumps!");
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            if (scr_quest_get_state("jacquesGov") == 0) { 
                scr_event_build_dialogue("Jacques", NULL, "Mr. Governor, you're just the man I'm looking for! Look, I know I'm late on my rent, but I can explain. See, my cousin Birchard's been staying with me for the past few weeks and lemme tell you, that guy can eat. I've gotta be paying, I don't know, three, four times my normal grocery bill. It's a real pain, Mr. Governor, but that's why I'm here. See, I've finally got my rent money and I'm just trying to get in to pay it, but the department's closed. If I give you the money, could you square everything up for me?");
                Breakout("build", "add", "money");
                var takemoney = scr_event_build_choice("Take Jacques' money?", s_port_governor);
            
                with scr_event_build_add_choice(takemoney, "Take the money.") {
                    scr_event_build_money_add(scr_money_db("jacquesRent"));
                    Breakout("build", "clear");
                    scr_event_build_dialogue(NULL, NULL, "Get " + string(scr_money_db("jacquesRent")) + " neuro-shekels.");
                    scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "YES. PLEASE GIVE ME YOUR MONEY. I WILL TAKE CARE OF WHATEVER PROBLEM YOU WERE TALKING ABOUT.");
                    scr_event_build_dialogue("Jacques", NULL, "Aww, gee Mr. Governor. You're the best! Here's all the money I've got, " + string(scr_money_db("jacquesRent")) + " neuro-shekels. I know my rent's less than that, but I figured since you're doing me this big favor I'd throw in a little extra. Thanks for being such a great guy, Mr. Governor. Maybe things are starting to look up around here.");
                    scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(I, uh... I feel kinda bad about taking this money...)");
                    //TODO: BAD roundmound points.
                    scr_event_build_quest_state("jacquesGov", 1);
                }
                
                with scr_event_build_add_choice(takemoney, "I can't help you, sorry.") {
                Breakout("build", "clear");
                scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Uhhh... sorry, I don't think I'm going to be able to help you out here...");
                scr_event_build_dialogue("Jacques", NULL, "Man, you're the governor! You've got the authority to do anything! It's just a tiny favor! Man... now I'm gonna get kicked out of my apartment all because I didn't wake up early enough...");
                scr_event_build_quest_state("jacquesGov", 2);
                //TODO: GOOD roundmound points
                }
            }
            
            else if (scr_quest_get_state("jacquesGov") == 1) {
                scr_event_build_dialogue("Jacques", NULL, "You're the greatest, Mr. Governor! Thanks for taking care of my rent for me! I knew you weren't the corrupt, power-mad, genocidal, torturous masochist they said you were!");
                scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Nope! I'm not any of those things! Well, thanks for the money, I've got to run!");
                }
                
            else if (scr_quest_get_state("jacquesGov") == 2) {
                scr_event_build_dialogue("Jacques", NULL, "Sigh... it looks like I really am getting kicked out now...");
                }
        //did wilmer mortgage quest
        } else if (scr_quest_get_state("wilmerEvict") >= 4) { 
            scr_event_build_dialogue("Jacques", NULL, "Hey, what's going on here? When are they gonna let us in?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You mean the Department of Population and Housing? I think they've closed up for the day.");
            scr_event_build_dialogue("Jacques", NULL, "Man, if I don't renew my mortgage soon, I'm gonna get evicted. Hey, open up! Open up! Can you hear me? Open up in there!!");
            
        //didn't do quest.
        }else{
            scr_event_build_dialogue("Jacques", NULL, "Open up! Open up in there! Can you hear me!? Open up! If I don't renew my mortgage soon, they're gonna evict me! How am I supposed to renew my mortgage if the Department of Population and Housing is closed, huh?");
            }
            
        }
    scr_event_advance(event);
}
