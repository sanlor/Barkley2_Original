// event_bct_guilderVictory01

// This is the cutscene that runs if the Guilderbergs are defeated in combat.
// It happens after event_bct_guilderIntro01, currently, but occurs after a teleport.
// Thus, it is actually called by event_bct_guilderAutostart01.
/*
    Quest Variables:
    guilderVictory
        0 = guilderbergs not fought, or defeated. the guilderVictory cutscene will not play
        1 = guilderbergs fought and killed. used to autostart event_bct_guilderVictory01 from event_bct_guilderAutostart01
        2 = indicates that event_bct_guilderVictory01 has been run

    guilderFight
        1 = fought the guilderbergs normally, facing just gald and von miser
        2 = fought the guilderbergs after the guilderberg cutscene, facing gothbard as well.
*/

/*if (argument0 == SCRIPT_START) {
    
} 
else if (argument0 == SCRIPT_STEP) {

} 
else if (argument0 == SCRIPT_INTERACT) {
    var guilderVictory = id;
    var event = scr_event_create_main();
    
    with (event) {
        scr_event_build_dialogue_debug("bort", NULL, "Money and gibs alie all over the floor...");
        // TODO: PILES OF MONEY AND GIBS LIE ALL OVER
        // TODO: SCREEN FADES OUT, AND BACK IN WITH THE PROTESTORS
        scr_event_build_quest_state("guilderVictory", 2);
        scr_event_build_fade(false, 3);
        scr_event_build_wait_for_actions();
        scr_event_build_dialogue("Ertharin", s_port_ertharin, "Well, " + P_NAME + ". It looks like you did what you told us you would!");
        scr_event_build_dialogue("Qutlugh", s_port_qutlugh, "Wooooohooooo! Look at that cash!");
        scr_event_build_dialogue("Durriyah", s_port_durriyah, "It's our payday at last! Sweet Clispaeth's coffers, this is an occasion!");
        scr_event_build_dialogue("Ertharin", s_port_ertharin, "We couldn't have done it without you. We mean that, and not just us... all dwarfs thank you today. We all have a chance to thrive, now that you eliminated those gilded devils. You can't imagine how much this means to us. Our labor and our property will finally belong to us. Liberation, at last!");
        scr_event_build_dialogue("Durriyah", s_port_durriyah, "Come on, " + P_NAME_S + ", thrive with us! Dig in!");
        scr_event_build_dialogue("Qutlugh", s_port_qutlugh, "Get a good grip to take home with you, " + P_NAME_S + "! There's at least 2000 neuro-shekels here for ya!");
        scr_event_build_dialogue("Ertharin", s_port_ertharin, "Take whatever you need for your efforts, " + P_NAME + ", it's the least we can offer.");
        Breakout("build", "add", "money");
        var money = scr_event_build_choice("Take the money?", s_port_hoopz);
        var yes = scr_event_build_add_choice(money, "Take at least 2000 neuro-shekels.");
        with (yes) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What can I say, I'm gonna fill boots!");
            scr_event_build_money_add(2000 + irandom(100));
            scr_event_build_dialogue_item("Got at least 2000 neuro-shekels!");
            Breakout("build", "clear");
            scr_event_build_dialogue("Ertharin", s_port_ertharin, "That's the spirit. Again, young warrior, thank you for everything you've done today.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sure thing! Now let's get out of here!");
            scr_event_build_wait(1);
            scr_event_build_fade(true, 3);
            scr_event_build_move_to_point(o_cts_hoopz, 192, 224);
            // QUEST COMPLETE
        }
        var no = scr_event_build_add_choice(money, "No! I won't take it!");
        with (no) {
            Breakout("build", "clear");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No! I won't take it! This... this is...");
            scr_event_build_dialogue("Durriyah", s_port_durriyah, "What gives? Those bastards took money from all of us. You toppled the system, take a reward, from us!");
            scr_event_build_move(o_cts_hoopz, 0, 8);
            scr_event_build_wait_for_actions();
            scr_event_build_wait(0.5);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Don't you see? This is gib money! I won't have it... I won't have a nickel of this gib money!");
            scr_event_build_wait(1);
            scr_event_build_fade(true, 3);
            scr_event_build_move_to_point_ext(o_cts_hoopz, 192, 224, 8);
            scr_event_build_wait(1);
            // TODO: RUNS OUT OF ROOM
            // QUEST FAILED
        }
        scr_event_build_wait(1);
        scr_event_build_camera_move_to_point(208, 80, 6);
        scr_event_build_visible(o_cts_hoopz, false);
        scr_event_build_wait(3);
        scr_event_build_wait_for_actions();
        scr_event_build_dialogue_debug("bort", NULL, "At this point, if Guilderberg Gothbard has not been killed, his eyes will blink in the background."); // MEGA TODO
        if (scr_quest_get_state("guilderFight") == 2) {
            //scr_event_build_visible(o_guilderEyes01, true);
            //scr_event_build_animation_play_and_set(o_guilderEyes01, "blink");
            //scr_event_build_wait_for_actions();
            //scr_event_build_wait(2);
        }
        scr_event_build_teleport(r_bct_guilderPlaza01, 192, 160);
    }
    scr_event_advance(event);
}
