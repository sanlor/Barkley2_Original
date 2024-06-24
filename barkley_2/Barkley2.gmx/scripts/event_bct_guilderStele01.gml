// event_bct_guilderStele01

/*if (argument0 == SCRIPT_START) {
    if (scr_quest_get_state("guilderPromotion") == 1) {
        // TODO: replace graphic with a glittering gem
        // TODO: remove other characters from the scene
    }
}
else if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    var guilderDais = id;
    var event = scr_event_create_main();
    var scene_snippet = scr_event_create_child(event);
    
    var guilder01 = "Von Miser";
    var guilder02 = "Gald";
    var guilder03 = "Gothbard";
    var guilderport01 = "s_port_guilderVonMiser";
    var guilderport02 = "s_port_guilderGald";
    var guilderport03 = "s_port_guilderGothbard";
    var mummyport01 = s_portrait;
    var mummyport02 = s_portrait;
    var mummyport03 = s_portrait;
    var mummiesport01 = s_portrait;
    
    // initial value
    var coin = "Bronze";
    var coin2 = "Silver";
    
    
    //-----------
    // main event
    //-----------
    with (event) {
    
        // if promotion has occured
        if (scr_quest_get_state("guilderPromotion") == 1) {
            switch (scr_quest_get_state("guilderRank")) {
                case 1:
                    scr_event_build_dialogue(NULL_STRING, NULL, "The stele glows softly with a silvery light. A small groove in the stele beckons for your coin.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Von Miser graphic to cocoon.");
                    // TODO: change von miser graphic to cocoon
                    coin = "Bronze";
                    coin2 = "Silver";
                    break;
                case 2:
                    scr_event_build_dialogue(NULL_STRING, NULL, "The stele radiates warmly with a golden light. A small groove in the stele beckons for your coin.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Von Miser graphic to cocoon.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Gald graphic to cocoon.");
                    // TODO: change von miser graphic to cocoon
                    // TODO: change gald graphic to cocoon
                    coin = "Silver";
                    coin2 = "Gold";
                    break;
                case 3:
                    scr_event_build_dialogue(NULL_STRING, NULL, "The stele glitters resplendently with a glorious light. A small groove in the stele beckons for your coin.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Von Miser graphic to cocoon.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Gald graphic to cocoon.");
                    scr_event_build_dialogue_debug("bort", NULL, "Change Gothbard graphic to cocoon.");
                    // TODO: change von miser graphic to cocoon
                    // TODO: change gald graphic to cocoon
                    // TODO: change gothbard graphic to cocoon
                    coin = "Gold";
                    coin2 = "Platinum";
                    break;
                default:
                    break;
            }
            var summon = scr_event_build_choice("Place the " + coin + " Coin upon the stele?", s_port_hoopz);
            var yes = scr_event_build_add_choice(summon, "Yes.");
            var no = scr_event_build_add_choice(summon, "No.");
            with (yes) {
                scr_event_build_event_snippet(scene_snippet);
            }
            with (no) {
                scr_event_build_end();
            }
        }
        // no promotion, generic response
        else {
            scr_event_build_dialogue_debug("bort", NULL, "No promotion. Generic response.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Just a sturdy stone stele...)");
        }
    }
    
    //--------------
    // scene_snippet
    //--------------
    with (scene_snippet) {
        if (Item("count", "Bronze Coin") == 1) { Item("build", "lose", "Bronze Coin", 1); }
        if (Item("count", "Silver Coin") == 1) { Item("build", "lose", "Silver Coin", 1); }
        if (Item("count", "Gold Coin") == 1) { Item("build", "lose", "Gold Coin", 1); }
        scr_event_build_dialogue_debug("bort", NULL, "Coin placement sfx.");
        
        scr_event_build_dialogue_debug("bort", NULL, "There is a slight screen shake.");
        
        scr_event_build_dialogue_debug("bort", NULL, "Camera pans upwards to center on Guilderberg curtain.");
        
        scr_event_build_dialogue_debug("bort", NULL, "Guilderberg curtain raises.");
        
        scr_event_build_dialogue_debug("bort", NULL, "Shin Megami Tensei Nocturne squeaking noises start.");
        
        scr_event_build_dialogue_debug("bort", NULL, "Creepy music fades in very slowly as the curtain raises even slower.");
        switch (scr_quest_get_state("guilderRank")) {
            case 1:
                scr_event_build_dialogue(guilder02, guilderport02, "Gothbard, the initiate has arrived!");
                scr_event_build_dialogue(guilder03, guilderport03, "Rest, ritual, savings. Through the rite of investment, we divest from this world!");
                scr_event_build_dialogue(guilder02, guilderport02, "Thanks to your efforts, Von Miser has already taken leave.");
                scr_event_build_dialogue(guilder03, guilderport03, "Zeni, zeni, zeni. Value transforms us. Value transforms everything. A gift for you, young tycoon.");
                scr_event_build_dialogue(guilder02, guilderport02, "I hope I may rest... soon...");
                break;
            case 2:
                scr_event_build_dialogue(guilder03, guilderport03, "Behold, the preparation continues. Gald and Von Miser are on their journey home. I shall soon follow. We would have you join us... with your work, everything is falling into place. Zeni, zeni, zeni. At last... the rite will be evoked. There will be no one to help you now. Continue in the path laid out for you. Save, invest, and above all, profit! You must not hold back, young rentier. The cruel world rendered us assets... now, true valuation is almost ours.");
                break;
            case 3:
                scr_event_build_dialogue("First Voice", mummyport01, "At last, the plutocrat returns!");
                scr_event_build_dialogue("Second Voice", mummyport02, "You've done it... a critical mass of money...");
                scr_event_build_dialogue("Third Voice", mummyport03, "Numisma Terminus...");
                scr_event_build_dialogue("All Voices", mummiesport01, "Enact the ritual! Read from the stele! Recite the rite!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Huh? The stele... these words were never here before. Well, here goes...");
                scr_event_build_wait(1);
                //scr_event_build_dialogue(P_NAME, s_port_hoopz, "Zeni, nomizo!");
                scr_event_build_dialogue("First Voice", mummyport01, "From the coin I came, and to the coin I must return!");
                scr_event_build_dialogue_debug("bort", NULL, "Von Miser's cocoon ruptures into copper coins.");
                //scr_event_build_dialogue(P_NAME, s_port_hoopz, "Zeni, nomos!");
                scr_event_build_dialogue("Second Voice", mummyport02, "The final investiture... bestow unto me a value!");
                scr_event_build_dialogue_debug("bort", NULL, "Gald's cocoon ruptures into silver coins.");
                //scr_event_build_dialogue(P_NAME, s_port_hoopz, "Zeni, nemo!");
                //scr_event_build_dialogue("Third Voice", mummyport03, "Now, I am become money, valuator of the real!");
                scr_event_build_dialogue("Third Voice", mummyport03, "Now, I am become fungible, valuator of the real!");
                scr_event_build_dialogue_debug("bort", NULL, "Gothbard's cocoon ruptures into golden coins.");
                break;
        }
        if (scr_quest_get_state("guilderRank") != 3) {
            scr_event_build_dialogue_debug("bort", NULL, "Guilderberg curtain lowers.");
            scr_event_build_dialogue_debug("bort", NULL, "Shin Megami Tensei Nocturne squeaking noises start.");
            scr_event_build_dialogue_debug("bort", NULL, "Creepy music fades out very slowly as the curtain lowers even slower.");
        }
        else {
            scr_event_build_dialogue_debug("bort", NULL, "Creepy music begins to fade out.");
        }
        switch (scr_quest_get_state("guilderRank")) {
            case 1:
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hm? The coin... it's transformed...");
                scr_event_build_dialogue_item("Got the Silver Coin.");
                Item("build", "gain", "Silver Coin", 1);
                scr_event_build_quest_state("guilderRank", 2);
                scr_event_build_quest_state("guilderAbsent", 1);
                break;
            case 2:
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "The coin...");
                scr_event_build_dialogue_item("Got the Gold Coin.");
                Item("build", "gain", "Gold Coin", 1);
                scr_event_build_quest_state("guilderRank", 3);
                scr_event_build_quest_state("guilderAbsent", 2);
                break;
            case 3:
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "The coin... it's stuck...");
                scr_event_build_dialogue(NULL_STRING, NULL, "The Platinum Coin remains embedded in the stele.");
                scr_event_build_dialogue_debug("bort", NULL, "Here we can begin the kool krazy moneymanip adventure...");
                scr_event_build_quest_state("guilderRank", 4);
                scr_event_build_quest_state("guilderAbsent", 3);
                break;
        }
        scr_event_build_quest_state("guilderPromotion", 0);
        
        if (scr_quest_get_state("guilderRank") == 3) {
            //scr_event_build_dialogue_item("Got 20000 neuro-shekels!");
        }
        scr_event_build_fade(true, 3);
        scr_event_build_wait_for_actions();
        scr_event_build_wait(2);
        scr_event_build_teleport(r_bct_guilderBoard01, 100, 100);
    }
    scr_event_advance(event);
}
