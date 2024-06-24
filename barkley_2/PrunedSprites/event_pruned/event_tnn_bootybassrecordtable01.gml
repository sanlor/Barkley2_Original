// The record table in Booty Bass, for Hoopz to DJ with.
// event_tnn_bootybassrecordtable01

// bootyRecordState is reset to 0 in event_tnn_stonewallBootyDaimyoJackson01
if (argument0 == SCRIPT_START) {
    
}
if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var djname = scr_quest_get_state("bootyDjName");
    var djfail = "";
    //var djfail = scr_booty_dj_fail("bootyDjName");
    // Build Event
    var event = scr_event_create_main();
    with (event) {
        // Won Booty Bass
        if (scr_quest_get_state("bootyBassQuest") == 3) {
        if (scr_quest_get_state("bootyRecordState") == 1) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Should I bless 'em on the decks?");
            }
            else if (scr_quest_get_state("bootyRecordState") == 0) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Get on the 1's and 2's?");
            }
            // TODO Everyone looks to hoopz? Hoopz looks left and right, or ponders. *BEAT*
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Nah.");
            scr_event_build_quest_state("bootyRecordState", 1 - scr_quest_get_state("bootyRecordState"));
        }
        // Lost Booty Bass
        else if (scr_quest_get_state("bootyBassQuest") == 2) {
            if (scr_quest_get_state("bootyRecordState") == 1) {
                scr_event_build_dialogue("Stonewall /'Booty Daimyo/' Jackson", s_port_daimyo, "HEY! Come on, kid. We're trying to /'Feel The Bass/' here... can you feel it? I guess you can't feel it. All of us can feel it! Can't we!?");
                scr_event_build_dialogue("Crowd", NULL, "Yeaaaaah! Woo hoo! We feel it! Yeah, the bass! Our booties are shuddering! Wahooooooo!~!");
                //scr_event_build_dialogue("Stonewall /'Booty Daimyo/' Jackson", s_port_daimyo, "See, " + djname + "? Or is it " + djfail + "? We're all feeling it here. You're the odd one out...");
                scr_event_build_dialogue("Stonewall /'Booty Daimyo/' Jackson", s_port_daimyo, "See, " + djname + "? We're all feeling it here. You're the odd one out...");
            } else {
                scr_event_build_dialogue("Stonewall /'Booty Daimyo/' Jackson", s_port_daimyo, "Oh no you don't! You had a shot, kid. These booties were yearning for bass... you denied the crowd... and so shamed the decks! Keep your clumsy hands off 'em!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Geez, you don't have to be so mean...)");
                // update state
                scr_event_build_quest_state("bootyRecordState", 1);
            }
        }
        // Haven't talked to Stonewall "Booty Daimyo" Jackson at all, or refused quest
        else {
            if (scr_quest_get_state("bootyRecordState") == 1) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Could this be me?)");
            } else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Wow, look at these turntables... I wish I could get my chance to step up to the plate. I think I could really pump it up...)");
                scr_event_build_dialogue("Stonewall /'Booty Daimyo/' Jackson", s_port_daimyo, "You there, youngster! Yes you, the one fervently ironing the 1's and 2's!");
                scr_event_build_quest_state("bootyRecordState", 1);
            }
        }
    }
    scr_event_advance(event);
}
