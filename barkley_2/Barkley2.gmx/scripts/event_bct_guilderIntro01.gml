// event_bct_guilderIntro01

/*if (argument0 == SCRIPT_START) {
    
} 
else if (argument0 == SCRIPT_STEP) {

} 
else if (argument0 == SCRIPT_INTERACT) {
    var guilderIntro = id;
    var event = scr_event_create_main();
    
    var guilder01 = "Von Miser";
    var guilder02 = "Gald";
    var guilder03 = "Gothbard";
    var guilderport01 = "s_port_guilderVonMiser";
    var guilderport02 = "s_port_guilderGald";
    var guilderport03 = "s_port_guilderGothbard";
    
    with (event) {
        scr_event_build_quest_state("guilderIntro", 1);
        scr_event_build_dialogue(guilder01, guilderport01, "Look, Gald. One of the proles has come to play!");
        scr_event_build_dialogue(guilder02, guilderport02, "Come to stop us, have you? There's nothing you can do! The system is already in motion!");
        scr_event_build_dialogue(P_NAME, s_port_hoopz,  "The protesters downstairs say you botched their investments... I'm here to make you pay!");
        scr_event_build_dialogue(guilder02, guilderport02, "Ha, ha, ha! You hear that, Von Miser? /'Pay/'! Pay for what? Paupers who do not labor...");
        scr_event_build_dialogue(guilder01, guilderport01, "... need to die already!");
        scr_event_build_dialogue_debug("bort", NULL, "The CEOs assume battle stances.");
        scr_event_build_dialogue(guilder01, guilderport01, "Hmm. I'm rather thirsty, Gald. Shall we sup?");
        scr_event_build_dialogue(guilder02, guilderport02, "Yes, sup indeed. We'll drain this peasant... of their human capital!");
        scr_event_build_dialogue_debug("bort", NULL, "Battle begins for a brief moment. Music starts. They are vampires, one male and one female. If you have over 10000 neuro-shekels (from selling the Dwarf League) you can audience with the Guilderbergs here. If not, the battle continues until death or victory.");
        //-------------------------------------
        // GUILDERBERG JOIN OPPORTUNITY
        //-------------------------------------
        if (scr_money_count() >= 10000) {
            scr_event_build_dialogue_debug("bort", NULL, "The player has enough money. The battle suddenly stops.");
            scr_event_build_dialogue_debug("bort", NULL, guilder03 + " appears in the darkness in the back of the room. He is mostly obscured.");
            scr_event_build_dialogue(guilder03, guilderport03, "Stop this at once!");
            scr_event_build_dialogue(guilder01, guilderport01, guilder03 + ", your excellency!");
            scr_event_build_dialogue(guilder02, guilderport02, "Sir, what are you doing here!? You should have stayed hidden! If you perished here...");
            scr_event_build_dialogue(guilder03, guilderport03, "Hm? If I perished?");
            scr_event_build_dialogue_debug("bort", NULL, guilder03 + " steps into the light.");
            scr_event_build_dialogue(guilder03, guilderport03, "It is you fools who certainly would have perished if I did not stop you. Look... look at the youngster's prideful stance, that aura of confidence... the engorged billfold...");
            scr_event_build_dialogue(guilder02, guilderport02, "By the heavenly dollar... the precious yuan...");
            scr_event_build_dialogue(guilder01, guilderport01, "It's true then... the child is one of us!" );   
            scr_event_build_dialogue_debug("bort", NULL, "Lights illuminate the room further. There is a Guilderberg Logo visible.")
            scr_event_build_dialogue(guilder03, guilderport03, "Indeed. I have been watching you for some time now, child. Now heed what I am about to tell you, for this is the true nature of the world. We are esteemed bankers, and having surveyed the market, found it similar to a great, endless ocean; purchases make ripples, the flow of goods and services form currents, and supply and demand ebb and flow like the tides. Where money gathers in masses, we find vast pools of wealth. I have felt your liquid presence in the market, child. I have examined your bankroll and inspected your ledger. You have done more than ever could have been anticipated by one so young. You are becoming a master of money, child, a titan of capital!");
            scr_event_build_dialogue_debug("bort", NULL, guilder03 + " could do an animation, if he's got one!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Why are you saying this? Who are you?");
            scr_event_build_dialogue(guilder03, guilderport03, "I am known as " + guilder03 + ". My coworkers are " + guilder02 + " and " + guilder01 + ". We are bankers, investors, traders, and lenders. To some, we are known as the Guilderberg Group. We believe in the power of the coin and have dedicated our lives to protecting and nurturing this power. As for you, we desire nothing more than to see your pockets grow ever deeper. You show so much promise, and yet there are great secrets of money that still elude you. We can teach you. I hereby invite you to join us, " + P_NAME + ". Forget about the commoners below, and put your faith us, and in the almighty coin. This is your only chance. Accept our offer... or your life - and profits - end here.");
            // Choice: Kill or Join!
            var choice = scr_event_build_choice("Join the Guilderberg Group?", s_port_hoopz);
            var join = scr_event_build_add_choice(choice, "Join them.");
            var kill = scr_event_build_add_choice(choice, "Kill them.");
            with (join) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Your shining suit and fine words have convinced me. Tell me what I can do about my credit. I don't know what a promissory note is, and I'm afraid I need one. How is my portfolio doing?");
                scr_event_build_dialogue(guilder03, guilderport03, "Very good, child. There will be time for all of your questions to be answered. For now, I must resume my rest. " + guilder01 + " and " + guilder02 + " will assist you with anything you need, and you will assist them as well. Welcome, " + P_NAME + "...");
                scr_event_build_fade(true, 2);
                scr_event_build_wait_for_actions();
                scr_event_build_dialogue(guilder03, guilderport03, "... Welcome to the family.");
                scr_event_build_wait(1);
                scr_event_build_time_add(1); // increase time!
                scr_event_build_quest_state("guilderJoined", 1);
                scr_event_build_quest_state("guilderRank", 1);
                scr_event_build_teleport(r_bct_guilderBoard01, 100, 100); // TODO coordinates
            }
            with (kill) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Fat chance! Bankers? Hah! You're usurers, swindlers, and crooks! The only thing getting liquidated now... is you! Your reign of financial terror ends here!");
                scr_event_build_dialogue_debug("bort", NULL, "The fight begins again. Either you are facing all 3 Guilderbergs now, or the third boss Guilderberg flees.")
                scr_event_build_quest_state("guilderFight", 2); // guilderFight == 1, fought Gothbard
            }
        }
        //-------------------------------------
        // NORMAL SCENE
        //-------------------------------------
        else { scr_event_build_quest_state("guilderFight", 1); } // guilderFight == 1, didn't fight Gothbard
        scr_event_build_dialogue_debug("bort", NULL, "Decide if you won or not!");
        var outcome = scr_event_build_choice("Did you win?", s_port_hoopz);
        var won = scr_event_build_add_choice(outcome, "I won.");
        with (won) {
            scr_event_build_dialogue_debug("bort", NULL, "You killed them!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Whew... it's over. I'd better let Ertharin and the other protesters know.");
            scr_event_build_fade(true, 3);
            scr_event_build_wait_for_actions();
            scr_event_build_quest_state("guilderVictory", 1);
            scr_event_build_teleport(r_bct_guilderBoard01, 208, 160);
            //scr_event_build_execute_event_script(event_bct_guilderVictory01);
            // TODO some victory quest state
        }
        var lost = scr_event_build_add_choice(outcome, "I lost.");
        with (lost) {
            scr_event_build_dialogue_debug("bort", NULL, "You should be teleported out of here. Ya died!");
            scr_event_build_dialogue_debug("bort", NULL, "So far, lots of things can happen... a plaza of dead protesters? Tower is open for free combat and exploration? The top room is empty when you get there? Who knows... yet...");
            Stat("hp", "-150%");
            // TODO some death quest state
        }
    }
    scr_event_advance(event);
}
