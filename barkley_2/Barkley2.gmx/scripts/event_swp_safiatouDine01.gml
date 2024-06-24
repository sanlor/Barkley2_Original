// event_swp_safiatouDine01
// Safiatou sells Hard Tack in the swamp!
/*
if (argument0 == SCRIPT_START) {
    
    // load save data if it exists
    if scr_savedata_contains("supergrid") {
        global.supergrid = scr_savedata_get("supergrid");
    }
    
    // if safiatou is in the dilapidated zone
    if (scr_quest_get_state("safiatouOffer") == 3) {
        scr_event_interactive_deactivate();
        scr_actor_unsetRigid(id);
    }
    
    // if dining, run this script
    if (scr_quest_get_state("safiatouDineStart") == 1) {
        Quest("safiatouDineStart", 0);
        script_execute(event_swp_safiatouDine01, SCRIPT_INTERACT);
    }
    
    if (scr_quest_get_state("safiatouBreak") == 1) {
        scr_event_interactive_deactivate();
        scr_actor_unsetRigid(id);
    }
}
if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var safiatou = id;
    
    // portrait
    var safiaport = "s_port_safiatou";
    
    // events & snippets
    var event = scr_event_create_main();
    var menu_snippet = scr_event_create_child(event);
    var bill_snippet = scr_event_create_child(event);
    var tip_snippet = scr_event_create_child(event);
    
    
    // salutation
    var salutation = "";
    if (scr_time_get() <= 7) { salutation = "Good morning!"; }
    else if (scr_time_get() <= 16) { salutation = "Good afternoon!"; }
    else { salutation = "Good evening!"; }
    
    // hardtack price
    var price = 10
    var bill = 0;
    bill = scr_quest_get_state("safiatouBill");
    var tip = 0;
    tip = scr_quest_get_state("safiatouTip");

    //------------------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------------------
    with (event) {
        // no money, gotta dash
        if (scr_quest_get_state("safiatouDash") == 10)
        {
            scr_event_build_dialogue("Safiatou", safiaport, "Are you feeling any better? Let me know if there is any way I can assist you.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, a little better... I think I should walk around a little more.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Just go for it... now's your chance, just go!)");
            Breakout("build", "clear");
        }
        // finished dining
        else if (scr_quest_get_state("safiatouDine") == 3)
        {
            // return to normal safiatou state
            scr_event_build_execute_event_script(event_swp_safiatou01);
        }
        // still in togo mode
        else if (scr_quest_get_state("safiatouTogo") >= 1)
        {
            scr_event_build_execute_event_script(event_swp_safiatou01);
        }
        // have not finished dining
        else
        {
            if (scr_quest_get_state("safiatouDeliberate") == 2)
            {
                //scr_event_build_quest_state("safiatouDeliberate", 1);
                scr_event_build_dialogue("Safiatou", safiaport, "Was everything satisfactory? May I take the check?");
                scr_event_build_event_snippet(tip_snippet);
            }
            // tip amount saved, send to tip_snippet
            if (scr_quest_get_state("safiatouTip") > 0) || (scr_quest_get_state("safiatouStiff") == 1)
            {
                scr_event_build_event_snippet(tip_snippet);
            }
            // bill amount saved, send to bill_snippet
            else if (scr_quest_get_state("safiatouBill") > 0)
            {
                scr_event_build_event_snippet(bill_snippet);
            }
            // couldn't decide what to eat
            else if (scr_quest_get_state("safiatouDine") >= 1)
            {
                scr_event_build_event_snippet(menu_snippet);
            }
            // first time talking
            else
            {
                // introduction
                if (scr_quest_get_state("safiatouIntro") == 0)
                {
                    scr_event_build_fade(true, 0.1);
                    scr_event_build_fade(false, 3);
                    scr_event_build_wait_for_actions();
                    scr_event_build_wait(1.5);
                    scr_event_build_wait_for_actions();
                    scr_event_build_quest_state("safiatouIntro", 1);
                }
                scr_event_build_quest_state("safiatouDine", 1);
                scr_event_build_event_snippet(menu_snippet);
            }
        }
    }

    
    //------------------------------------------------------------------------------------------
    // menu_snippet
    //------------------------------------------------------------------------------------------
    with (menu_snippet) {
        // first time
        if (scr_quest_get_state("safiatouDine") == 0) {
            // salutation
            scr_event_build_dialogue("Safiatou", safiaport, string(salutation) + " Welcome again to Hemalatha's Hardtack! My name is Safiatou, and I am the maitre d' of our swamp location. May I start you off with an aperitif?");
            scr_event_build_quest_state("safiatouTime", scr_time_get() );
            //----------------- aperitif choice -----------------//
            var aperitif_choice = scr_event_build_choice("Aperitif?", s_port_hoopz);
            var aperitif_what = scr_event_build_add_choice(aperitif_choice, "What's an aperitif?");
            with (aperitif_what) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Aperitif? What's an aperitif?");
                scr_event_build_dialogue("Safiatou", safiaport, "An aperitif is... hm, how do I say this? Ah, perhaps a comparison will do - think of it like... a liquid amuse-bouche!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "A what?");
                scr_event_build_quest_state("safiatouAperitif", 0);
            }
            var aperitif_me = scr_event_build_add_choice(aperitif_choice, "Aperitif me!");
            with (aperitif_me) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Let's do it! Aperitif me!");
                scr_event_build_dialogue("Safiatou", safiaport, "Certainly, one moment... excuse me, I apologize but it seems the house has no aperitifs available at the moment.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Dang... now I really want a 'tif or two...");
                scr_event_build_quest_state("safiatouAperitif", 1);
            }
            
            // menu offer
            scr_event_build_dialogue("Safiatou", safiaport, "Er, anyway then, can I instead start you off with something to eat? Perhaps the assortment of hardtack small plates? Those are priced at " + string(price) + ". We're also currently offering a hardtack entree at " + string(price) + ". In addition, our chef has a fine hardtack special, also priced at " + string(price) + ". Lastly, there is a 3 course hardtack prix fixe menu, at " + string(3 * price) + ". What will you be having?");
        }
        
        /*
        // 2+ times
        else {
            scr_event_build_dialogue("Safiatou", safiaport, string(salutation) + " Welcome back to Hemalatha's Hardtack! Have you decided what you would like? Shall I read the menu options again?");
            // if it's been a long time...
            if (scr_time_get() > scr_quest_get_state("safiatouTime")) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(She's been waiting this whole time?)");
            }
            var menu2choice = scr_event_build_choice("Hear the menu?", s_port_hoopz);
            var menu2hear = scr_event_build_add_choice(menu2choice, "Yes, hear the menu.");
            with (menu2hear) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Lay it on me.");
                scr_event_build_dialogue("Safiatou", safiaport, "Ahem. We have an excellent selection today. Perhaps you'd enjoy the assortment of hardtack small plates? Those are priced at " + string(price) + " for three. We're also currently offering a hardtack entree at " + string(price) + " as well. In addition, our chef has a fine hardtack special, also priced at " + string(price) + ". Lastly, there is a 3 course hardtack prix fixe menu, at " + string(3 * price) + ". What will you be having?");
            }
            var menu2togo = scr_event_build_add_choice(menu2choice, "Order from the carryout menu instead.");
            with (menu2togo) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Actually, I don't think I have time to sit. I'll order some carryout instead!");
                scr_event_build_dialogue("Safiatou", safiaport, "*Sigh*... All right. One moment.");
                scr_event_build_quest_state("safiatouTogo", 2);
                scr_event_build_quest_state("safiatouDine", 1);
                scr_event_build_execute_event_script(event_swp_safiatou01);
            }   
        }
        */
        
/*
        //----------------- price checks -----------------//
        // don't have enough for anything
        if (scr_money_count() < price) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Dang... I gotta come back when I have more money... then I'll do a serious grub-down).");
            scr_event_build_dialogue("Safiatou", safiaport, "Do you need more time to think?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Umm... yeah, some more time. I think I'm going to mull it over... somewhere else.");
            scr_event_build_dialogue("Safiatou", safiaport, "Of course, take your time.");
            // update quest state and end event
            scr_event_build_quest_state("safiatouBroke", 1);
            scr_event_build_end();
        }
        // don't have prix fixe price
        else if (scr_money_count() < 3 * price) { scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Too bad I can't afford that prix fixe menu... it looks slammin'!)"); }
        // enough for everything
        else { scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Hmmm, what should I have?)"); }
*/
/*        
        //----------------- hardtack choice -----------------//
        Breakout("build", "add", "money");
        var hardtack_choice = scr_event_build_choice("What will I have?", s_port_hoopz);
        
        // small plates
        var hardtack_small = scr_event_build_add_choice(hardtack_choice, "The hardtack small plates (" + string(price) + ")");
        with (hardtack_small) {
            Breakout("build", "clear");
            scr_event_build_quest_state("safiatouBill", 10);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I think I'll have the small plates... I just hope they're not TOO small...");
            scr_event_build_dialogue("Safiatou", safiaport, "Splendid choice! Just one moment... here you are.");
            //Item("build", "gain", "Hardtack Small Plate", 3);
            scr_event_build_dialogue("", NULL, "Got 3 Hardtack Small Plates.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "These sure are small... hm... if you line them up, they kind of look like one piece of hardtack.");
            //Item("build", "lose", "Hardtack Small Plate", 3);
            //Item("build", "gain", "Hardtack", 1);
            scr_event_build_dialogue("", NULL, "Lost 3 Hardtack Small Plates... but got 1 piece of Hardtack!");
        }
        // entree
        var hardtack_entree = scr_event_build_add_choice(hardtack_choice, "The hardtack entree (" + string(price) + ")");
        with (hardtack_entree) {
            Breakout("build", "clear");
            scr_event_build_quest_state("safiatouBill", 10);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Let's go with the entree!");
            scr_event_build_dialogue("Safiatou", safiaport, "Exquisite choice! Just one moment... here you are.");
            //Item("build", "gain", "Hardtack Entree", 1);
            scr_event_build_dialogue("", NULL, "Got 1 Hardtack Entree.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hm... so... I just pick it up? With my hands?");
            scr_event_build_dialogue("Safiatou", safiaport, "Yes, that is customary.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay, here it goes... hey... this feels just like a piece of hardtack.");
            //Item("build", "lose", "Hardtack Entree", 1);
            //Item("build", "gain", "Hardtack", 1);
            scr_event_build_dialogue("", NULL, "Lost 1 Hardtack Special... but got 1 piece of Hardtack!");
        }
        // special
        var hardtack_special = scr_event_build_add_choice(hardtack_choice, "The chef's hardtack special (" + string(price) + ")");
        with (hardtack_special) {
            Breakout("build", "clear");
            scr_event_build_quest_state("safiatouBill", 10);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm feeling daring... let's go with the special!");
            scr_event_build_dialogue("Safiatou", safiaport, "Stellar choice! Just one moment... here you are.");
            //Item("build", "gain", "Hardtack Special", 1);
            scr_event_build_dialogue("", NULL, "Got 1 Hardtack Special.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "This looks pretty good. But sort of hard too...");
            //Item("build", "lose", "Hardtack Entree", 1);
            //Item("build", "gain", "Hardtack", 1);
            scr_event_build_dialogue("", NULL, "Lost 1 Hardtack Entree... but got 1 piece of Hardtack!");
        }
        // prix fixe
        var hardtack_prix_fixe = scr_event_build_add_choice(hardtack_choice, "The hardtack prix fixe menu (" + string(3 * price) + ")");
        with (hardtack_prix_fixe) {
            Breakout("build", "clear");
            scr_event_build_quest_state("safiatouBill", 30);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm hungry! Today... today I'm the prix fixe kid!");
            scr_event_build_dialogue("Safiatou", safiaport, "Magnificent choice! Just one moment... here you are.");
            //Item("build", "gain", "Hardtack 1st Course", 1);
            scr_event_build_dialogue("", NULL, "Got 1 Hardtack First Course.");
            scr_event_build_dialogue("Safiatou", safiaport, "... and when you're ready, here you are also!");
            //Item("build", "gain", "Hardtack 2nd Course", 1);
            scr_event_build_dialogue("", NULL, "Got 1 Hardtack Second Course.");
            scr_event_build_dialogue("Safiatou", safiaport, "... and lastly...");
            //Item("build", "gain", "Hardtack 3rd Course", 1);
            scr_event_build_dialogue("", NULL, "Got 1 Hardtack Third Course.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hmm... these all seem like the same thing.");
            //Item("build", "lose", "Hardtack 1st Course", 1);
            //Item("build", "lose", "Hardtack 2nd Course", 1);
            //Item("build", "lose", "Hardtack 3rd Course", 1);
            //Item("build", "gain", "Hardtack", 3);
            scr_event_build_dialogue("", NULL, "Lost the 3 Hardtack Courses... but got 3 pieces of Hardtack!");
        }
        /*
        // nothing
        var hardtack_nothing = scr_event_build_add_choice(hardtack_choice, "Can't decide.");
        with (hardtack_nothing) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ummm... umm....");
            scr_event_build_dialogue("Safiatou", safiaport, "Do you need more time to think?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, some more time would be great. Everything sounds so good!");
            scr_event_build_dialogue("Safiatou", safiaport, "Thank you! And of course, take your time.");
            // update quest state and end event
            scr_event_build_quest_state("safiatouDine", 2);
            scr_event_build_end();
        }
        */
        // re-execute event script to calculate bill
/*        scr_event_build_execute_event_script(event_swp_safiatouDine01);
    }
    
    //------------------------------------------------------------------------------------------
    // bill_snippet
    //------------------------------------------------------------------------------------------
    with (bill_snippet) {
        // just got bill, first time
        if (scr_quest_get_state("safiatouCheck") == 0) {
            // if purchased...
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess it's time to put it down...");
            scr_event_build_dialogue_debug("bort", NULL, "Various gomping SFX! If Hoopz got Prix Fixe it should be 3x as long. Also, his HP needs to fill up or do whatever else Hardtack does!");
            // TODO: GET HP!
            scr_event_build_dialogue("Safiatou", safiaport, "Of course, of course! ... there you go! I'll just leave the check with you, but no hurry, take your time.");
            //if (bill == 10) { Item("build", "gain", "Bill for 10 N.S."); }
            //else (bill == 30) { Item("build", "gain", "Bill for 30 N.S."); }
            Item("build", "gain", "Hemalatha's Bill", 1);
            scr_event_build_dialogue("", NULL, "Got the check. You owe " + string(bill) + " neuro-shekels.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Okay, let's see... aw man, what is this? /'A gratuity of 50% is recommended for parties of one or more/'?)");
            scr_event_build_dialogue("Safiatou", safiaport, "One moment, hold still and I'll get those crumbs...");
            scr_event_build_dialogue_debug("bort", NULL, "Safiatou sweeps crumbs animation.");
            scr_event_build_dialogue("Safiatou", safiaport, "... There you go. I hope you enjoyed your visit to Hemalatha's Hardtack!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, yep, everything was great... (oh jeez... what am I gonna leave as a tip?)");
            scr_event_build_quest_state("safiatouCheck", 1);
        }
        else {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Okay, now what should I leave as a tip?)");
        }
        
        Breakout("build", "add", "money");
        // tip choice
        var tip_choice = scr_event_build_choice("Amount to tip on " + string(bill) + " N.S. ?", s_port_hoopz);
        // 200%
        with (scr_event_build_add_choice(tip_choice, "Tip 200%")) { 
            // not enough money
            if (scr_money_count() < bill * 3) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(200% is uh... " + string(bill * 3) + "... I don't have enough for that...)");
                scr_event_build_goto_choice(tip_choice);
            }
            // not enough money
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Yikes... 200% sure seems steep. What did I get myself into?)");
                scr_event_build_quest_state("safiatouTip", bill * 2);
            }
        }
        // 50%
        with (scr_event_build_add_choice(tip_choice, "Tip 50%")) { 
            // not enough money
            if (scr_money_count() < bill * 1.5) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(50% is uh... " + string(bill * 1.5) + "... I don't have enough for that...)");
                scr_event_build_goto_choice(tip_choice);
            }
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(50%... I mean... she WAS attentive...)");
                scr_event_build_quest_state("safiatouTip", bill * 0.5);
            }
        }
        // 20%
        with (scr_event_build_add_choice(tip_choice, "Tip 20%")) { 
            // not enough money
            if (scr_money_count() < bill * 1.2) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(20% is uh... " + string(bill * 1.2) + "... I don't have enough for that...)");
                scr_event_build_goto_choice(tip_choice);
            }
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(20%... it's as low as I'll go...)");
                scr_event_build_quest_state("safiatouTip", bill * 0.2);
            }
        }
        // NO TIP
        with (scr_event_build_add_choice(tip_choice, "Tip 0%")) { 
            //not enough money
            if (scr_money_count() < bill) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(A 0% tip... the bill is still 10" + string(bill) + "! Why the heck did I order when I had no money? I gotta make a run for it...)");
                scr_event_build_dialogue("Safiatou", safiaport, "Is something wrong?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I, um... hold on a minute, I think I've got a little indigestion. I'm gonna stand up for a second.");
                scr_event_build_dialogue("Safiatou", safiaport, "Of course, and if there's way I can make you comfortable, please let me know. This treacherous swamp location of Hemalatha's Hardtack is a fair bit out of the way for most of our customers, but the location is rather beautiful. We appreciate that you ventured out here to see us, so please, take your time and soak it in.");
                // set the dine and dash variable to max
                scr_event_build_quest_state("safiatouDash", 10);
                scr_event_build_end();
            }
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(No tip... I am the worst. I am the worst person in the universe.)");
                scr_event_build_quest_state("safiatouStiff", 1);
                scr_event_build_quest_state("safiatouTip", 0);
            }
        }
        // re-execute event script to add tip
        scr_event_build_execute_event_script(event_swp_safiatouDine01);
    }
    
    
    //------------------------------------------------------------------------------------------
    // tip_snippet
    //------------------------------------------------------------------------------------------
    with (tip_snippet) {
        if (scr_quest_get_state("safiatouDeliberate") == 0) {
            scr_event_build_dialogue("Safiatou", safiaport, "Okay, you can just leave it there when you're all done.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Hmmm... does this all look right?)");
            scr_event_build_quest_state("safiatouDeliberate", 1);
        }
        Breakout("build", "add", "money");
        // CHOICE: pay now
        var pay_now_choice = scr_event_build_choice("Leave the check on the table? (" + string(bill + tip) + " N.S.)", s_port_hoopz);
        // option1: pay_yes
        var pay_yes = scr_event_build_add_choice(pay_now_choice, "Leave it on the table.");
        with (pay_yes) {
            scr_event_build_money_add(-bill -tip);
            Item("build", "lose", "Hemalatha's Bill", 1);
            scr_event_build_dialogue("", NULL, "Gave " + string(bill + tip) + " and Hemalatha's Bill back to Safiatou.");
            Breakout("build", "clear");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay... there you go. That was nice. I've never seen hardtack prepared so many different ways before.");
            scr_event_build_dialogue("Safiatou", safiaport, "Thank you, the pleasure of our customers is our highest priority here at Hemalatha's. Oh, I almost forgot: here is your receipt. Thank you so much for dining with us! If you have any questions about your meal, please don't hesitate to ask!");
            Item("build", "gain", "Hemalatha's Receipt", 1);
            scr_event_build_dialogue("", NULL, "Got Hemalatha's Receipt.");
            scr_event_build_quest_state("safiatouDine", 3);
            scr_event_build_quest_state("safiatouDeliberate", 0);
            scr_event_build_quest_state("safiatouBreak", 1);
            scr_event_build_end();
        }
        // option2: pay_no
        var pay_no = scr_event_build_add_choice(pay_now_choice, "Hold onto it and stand up.");
        with (pay_no) {
            Breakout("build", "clear");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, I'm going to just relax awhile longer.");
            if (scr_quest_get_state("safiatouDeliberate") == 2) { scr_event_build_dialogue("Safiatou", safiaport, "Of course, take your time!"); }
            else { scr_event_build_dialogue("Safiatou", safiaport, "Of course, and if there's way I can make you comfortable, please let me know. This treacherous swamp location of Hemalatha's Hardtack is a fair bit out of the way, but the location is rather beautiful. Take your time and soak it in."); }
            scr_event_build_quest_state("safiatouDeliberate", 2);
            scr_event_build_end();
        }
        // option3: pay_tip
        var pay_tip = scr_event_build_add_choice(pay_now_choice, "Change tip amount.");
        with (pay_tip) {
            Breakout("build", "clear");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hold on a second, I think I messed something up...");;
            scr_event_build_quest_state("safiatouTip", 0);
            scr_event_build_quest_state("safiatouStiff", 0);
            scr_event_build_quest_state("safiatouDeliberate", 0);
            // restart to recalculate tip
            scr_event_build_execute_event_script(event_swp_safiatouDine01);
        }
    } 
    
    scr_event_advance(event);
}
