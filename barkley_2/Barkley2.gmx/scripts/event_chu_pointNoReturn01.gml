// event_chu_pointNoReturn01
/* event_chu_pointNoReturn01 - NOTES
Interact, upon touching door to Point of No Return
*/ 
/*if (argument0 == SCRIPT_START) {
    if (scr_quest_get_state("crustDead") == 1) {
        scr_event_interactive_activate();
    }
    else {
        scr_event_interactive_activate();
    }
} else if (argument0 == SCRIPT_STEP) {
    if (scr_quest_get_state("crustDead") == 1) && (_active == false) {
        _active = true;
    }
    else if (scr_quest_get_state("crustDead") == 0) && (_active == true) {
        _active = false;
    }
}
else if (argument0 == SCRIPT_INTERACT) {

    var zap_x = o_hoopz.x;
    var zap_y = -20 + o_hoopz.y;
    var clocktime = 10;
    var pnr = id;
    var event = scr_event_create_main();
    var reformat_snippet = scr_event_create_child(event);
    var entrance_snippet = scr_event_create_child(event);
    var cyberspear_snippet = scr_event_create_child(event);

    //------------------------------------------
    // ENTRANCE SNIPPET
    //------------------------------------------
    with (entrance_snippet) {
        var pnr_choice = scr_event_build_choice("Travel through the screen?", s_port_hoopz)
        var yes = scr_event_build_add_choice(pnr_choice, "Yes, travel through the screen.");
        var no = scr_event_build_add_choice(pnr_choice, "No, wait.");
        with (yes) {
            if (scr_quest_get_state("cdwarfPresent") == 1) {
                scr_event_build_quest_state("pnrCyberspear", 1);
                scr_event_build_execute_event_script(event_chu_pointNoReturn01);
            }
            scr_event_build_dialogue_debug("bort", NULL, "There needs to be a cool animation of the player stepping through the portal here.");
            // TELEPORT
            scr_event_build_teleport(r_chu_pointNoReturn01, 176, 440);
        } 
        with (no) {
            if (scr_quest_get_state("cdwarfPresent") == 1) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I... I can't do it, Cyberdwarf!");
                scr_event_build_dialogue("Cyberdwarf", CD_PORT, "You must proceed, " + P_NAME + ". You must!");
            }
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(I... I can't do it yet...)");
            }
        }
    }
    
    //------------------------------------------
    // CYBERSPEAR SNIPPET
    //------------------------------------------
    with (cyberspear_snippet) {
        // CHANGE STANCE
        
        scr_event_build_dialogue_debug("bort", NULL, "");
        scr_event_build_dialogue_debug("bort", NULL, "There needs to be a cool animation of the player stepping through the portal here.");
        // TELEPORT
        scr_event_build_teleport(r_chu_pointNoReturn01, 176, 440);
    }
    
    //------------------------------------------
    // REFORMAT SNIPPET
    //------------------------------------------
    with (reformat_snippet) {
        var reformat_choice = scr_event_build_choice("Reformat Cyberdwarf's disk?", s_port_hoopz);
        var yes = scr_event_build_add_choice(reformat_choice, "Reformat Cyberdwarf.");
        var no = scr_event_build_add_choice(reformat_choice, "Obey Cyberdwarf.");
        with (yes) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I know you're in there, Cyberdwarf... and I'm tired of it! Get out of there, now!");
            scr_event_build_animation_play_and_set(o_cts_hoopz, "reformat", "reformatted");
            scr_event_build_sound_play("sn_withering03");
            //scr_event_build_visible(o_cdwarfDisk01, true);
            // Cyberdwarf gets reformatted!
            // Animation plays...
            // Disk flies out and lands on ground.
            scr_event_build_wait_for_actions();
            scr_event_build_wait(2);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Huh... I... I did that...)");
            scr_event_build_move(o_cts_hoopz, 0, 1);
            scr_event_build_wait(0.5);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(The portal...)");
            scr_event_build_quest_state("cdwarfReformat", 1);
            scr_event_build_quest_state("pnrReformat", 1);
            scr_event_build_quest_state("cdwarfPresent", 0);
            scr_event_build_execute_event_script(event_chu_pointNoReturn01);
        } with (no) {
            if (clocktime) <= 15 {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay Cyberdwarf... I'll find the Cyberspear. But we're running out of time...");
            }
            else if (clocktime) <= 60 {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay Cyberdwarf... I'll find the Cyberspear. But I gotta go quick... I'm too young to go to Hell.");
            }
            scr_event_build_move_ext(o_cts_hoopz, 0, 16, 8);
        } 
    }

    
    //------------------------------------------
    // MAIN EVENT
    //------------------------------------------
    with (event) {
        if (scr_quest_get_state("pnrReformat") == 1) {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok... this is it!");
            scr_event_build_event_snippet(entrance_snippet);
        }
        else if (scr_quest_get_state("pnrCyberspear") == 1) {
            scr_event_build_event_snippet(cyberspear_snippet);
        }
        if (scr_quest_get_state("cdwarfJoined") == 1) {
            //----------------------
            // INCOMPLETE CYBERSPEAR
            //----------------------
            if (scr_quest_get_state("csComplete") == 0) {
                // ZERO ATTEMPTS
                if (scr_quest_get_state("pnrState") == 0) { 
                    scr_event_build_quest_state("pnrState", 1); // Add 1 attempt
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Look at that, Cuchulainn's on the run. We really clobbered him, C-Dwarf!");
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "You fool! Don't you see what you've done, " + P_NAME + "? Cuchulainn has used his remaining powers to spur the Necron 7 even faster towards hell, and yet we still lack the Cyberspear. The Cyberspear, " + P_NAME + "! It is instrumental to achieving our goals, and now all may be lost!");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Are you sure we need the Cyberspear? Let's go bust him up while he's on the ropes!");
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "This is not up for debate, child! You must fetch the Cyberspear, now. Time is running out!");
                    // scr_event_build_dialogue(P_NAME, s_port_hoopz, "");
                    // MOVE DOWNWARDS, AWAY FROM DOOR  
                    scr_event_build_move_ext(o_cts_hoopz, 0, 16, 8);
                    scr_event_build_wait_for_actions();
                    scr_event_build_end();
                } 
                // ONE ATTEMPT
                else if (scr_quest_get_state("pnrState") == 1) {
                    scr_event_build_quest_state("pnrState", 2); // Add 1 attempt
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "What is this insolence!? You must leave, and retrieve the Cyberspear! I command it!");
                    // DOOR CHOICE LEAD-UP TO REFORMAT
                    var door_choice = scr_event_build_choice("Enter the door?", s_port_hoopz);
                    var no = scr_event_build_add_choice(door_choice, "No, do not enter.");
                    var yes = scr_event_build_add_choice(door_choice, "Yes, enter.");
                    with (yes) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Quit holding me back! If I say I can beat him, I can beat him!");
                        scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Do you not understand? Obtain the Cyberspear, that is your mission! The prophecy demands your compliance!");
                        // ZZAP!!!
                        scr_event_build_create_object(o_cdwarfZap01, zap_x, zap_y);
                        scr_event_build_visible(o_cdwarfZap01, true);
                        scr_event_build_animation_play_and_set(o_cdwarfZap01, "short");
                        scr_event_build_sound_play("sn_withering02");
                        scr_event_build_wait(1.2);
                        scr_event_build_wait_for_actions();
                        scr_event_build_visible(o_cdwarfZap01, false);
                        scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Do not forget that I am in here too, child. I won't allow you to do it, not while I inhabit your cyberware. Now, to the Cyberspear!");
                        scr_event_build_event_snippet(reformat_snippet);
                    }
                    with (no) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok, Cyberdwarf... I just want to get this over with. (Doesn't he believe in me?)");
                        scr_event_build_move_ext(o_cts_hoopz, 0, 16, 8);
                        scr_event_build_wait_for_actions();
                        scr_event_build_end();
                    }
                } 
                // TWO-PLUS ATTEMPTS
                else if (scr_quest_get_state("pnrState") == 2) {
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Blasphemy... you must hold the Cyberspear before you cross this threshold!");
                    scr_event_build_create_object(o_cdwarfZap01, zap_x, zap_y);
                    scr_event_build_visible(o_cdwarfZap01, true);
                    scr_event_build_animation_play_and_set(o_cdwarfZap01, "short");
                    scr_event_build_sound_play("sn_withering02");
                    scr_event_build_wait(1.2);
                    scr_event_build_wait_for_actions();
                    scr_event_build_visible(o_cdwarfZap01, false);
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "So long as I inhabit your cyberware, I shall not permit your passage. Claim the Cyberspear, fulfill your destiny!");
                    scr_event_build_event_snippet(reformat_snippet);
                }
            }
            //--------------------
            // COMPLETE CYBERSPEAR
            //--------------------
            else if (scr_quest_get_state("csComplete") == 1) {
                if (scr_quest_get_state("pnrState") == 2) {
                    scr_event_build_quest_state("pnrState", 0);
                    scr_event_build_execute_event_script(event_chu_pointNoReturn01);
                }
                // ZERO ATTEMPTS
                if (scr_quest_get_state("pnrState") == 0) {
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "TBD.");
                } 
                // 1+ ATTEMPTS
                else {
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Now, child! Press forward and fulfill the prophecy!");
                }  
                scr_event_build_event_snippet(entrance_snippet);     
            }
        }
        //------------------------
        // X114JAM9 or REFORMATTED
        //------------------------
        else if (scr_quest_get_state("cdwarfPresent") == 0) {
            // ZERO ATTEMPTS
            if (scr_quest_get_state("pnrState") == 0) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "This is it... I don't think I'll be able to return if I step through here though...");
            } 
            // 1+ ATTEMPTS
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Ok... this is it!");
            } 
            scr_event_build_event_snippet(entrance_snippet); 
        }
    }

    scr_event_advance(event);
}
