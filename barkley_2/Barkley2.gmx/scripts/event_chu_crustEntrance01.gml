// event_chu_crustEntrance01

/* event_chu_crustEntrance01 - NOTES
Start, upon entering CuchuCrustacea's Room

/*if (argument0 == SCRIPT_START) {
    var event = scr_event_create_main();
    with (event) {
        //---------------------------
        // HE DEAD... CUCHU'S DEAD!!!
        //---------------------------
        if (scr_quest_get_state("crustDead") == 1) {
            scr_event_build_animation_set(o_chu_crustBody01, "dead");
            scr_event_build_pacify(true);
            // Destroy Event
            scr_event_build_end();
        }
        else {
            scr_event_build_visible(o_chu_crustBody01, false);
            scr_event_build_animation_set(o_chu_crustBody01, "alive");
            scr_event_build_end();
        }
    }
    scr_event_advance(event);
}
else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var crustEntrance = id;
    
    //var _______ = scr_event_create_child(event);
    var event = scr_event_create_main();
    scr_collisionSystem_add_shape_solid(sat_make_shape_rect(113, 311, 15, 58));
    
    with (event) {
        /*
         .----------------. 
        | .--------------. |
        | |     __       | |
        | |    /  |      | |
        | |    `| |      | |
        | |     | |      | |
        | |    _| |_     | |
        | |   |_____|    | |
        | |              | |
        | '--------------' |
         '----------------' 
        */
       /* if (scr_quest_get_state("crustFightAny") == 0) 
        {
            scr_event_build_quest_state("crustFightAny", 1);
            scr_event_build_dialogue_debug("bort", NULL, "No music.");
            scr_event_build_dialogue_debug("bort", NULL, "This is the first time the player has faught Cuchu Crustacea.");
            // animation, intro
            scr_event_build_dialogue_debug("bort", NULL, "The screen fades in as the player auto-walks up towards the screen on the top/corner of the map, similar to the Cyberdwarf cutscene.");
            scr_event_build_dialogue_debug("bort", NULL, "Crackles of electricity, weird screen effects, etc. occur on the screen.");
            scr_event_build_dialogue_debug("bort", NULL, "Forboding music plays.");
            scr_event_build_dialogue_debug("bort", NULL, "Eventually the greater effects stop: we have Cuchulainn's face, or some kind of static or looping screen effect going.");
            // Normal Cuchulainn taunt
            // XXXplosions
            // A flash of light, whatever
            // Scanline-version appears just in front of the screen
            //---------
            // X114JAM9
            //---------
            if (scr_quest_get_state("playerX1") == 1) {    
                //scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Bwahahaha what have we here? Someone dares to enter my domain?... Oh, it's you... that youngster from the engine room.");
                scr_event_build_dialogue_debug("bort", NULL, "Cuchulainn needs a good soliloquy here. Something like Magus from Chrono Trigger maybe?");
                scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Bwahahaha what have we here? Someone dares to enter my domain?");
                if (scr_quest_get_state("wiglafMission") >= 1) { // On Wiglaf's quest
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Cuchulainn! I'm on orders to take you out! You're keeping me from the Cyberdwarf... and from finding out who I truly am...");
                    scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Take me out? Kwehehehe! I rule over the Necron 7, child. How could you possibly think you could do such a thing? Don't you know where we are?");                    
                }
                else if (scr_quest_get_state("wiglafMission") == 0) { // Not on Wiglaf's quest
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey you! Where's the Cyberdwarf? I have to find the Cyberdwarf!");
                    scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Cyberdwarf?... Cyberdwarf? There's no Cyberdwarf here. This was the gravest mistake you've ever made, child. Kwehehehe!! Don't you know where we are?");
                }
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um... not really...");
                scr_event_build_quest_state("crustFightSolo", 1);
            } 
            //------------
            // HOOPZ OR CC
            //------------
            else if (scr_quest_get_state("playerCC") == 1) || (scr_quest_get_state("playerHoopz") = 1) {
                if (scr_quest_get_state("csComplete") == 1) {
                    // have cyberspear
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Cuchulainn! We've come to stop you, once and for all! I have the Cyberspear, and a Benevolent AI. There's nothing you can do to stop us! End this voyage into Hell, now!");
                    scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Bwahahahaha! I didn't understand half of that. You fool... don't you know where we are?");
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Are... are we that close already? No...");
                    scr_event_build_quest_state("crustFightComplete", 1);
                }
                else {
                    // don't have cyberspear
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Cuchulainn, your fun's over! End this voyage to Hell now, or we'll make you!");
                    scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Bwahahahaha! You really think you'll stop me? Don't you know where we are?");
                    scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Are... are we that close already? No...");
                    scr_event_build_quest_state("crustFightIncomplete", 1);
                }
            }
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "Kohohoho... full speed ahead!");
            scr_event_build_dialogue_debug("bort", NULL, "Screen shake!");
            scr_event_build_dialogue_debug("bort", NULL, "Some weird ripple goes up and down the screen, maybe slightly transparent Dolge effects pass over the screens. Maybe an effect like The Candelabra Flickers in Nocturne.");
            // crazy animation, stuff appears on the screen, shake effect, etc.
            // WARNING: NOW ENTERING SHEOL, NOW ENTERING SHEOL
            scr_event_build_dialogue_debug("bort", NULL, "It possibly even says WARNING: NOW ENTERING SHEOL on the screens?");
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuAI", "The Necron 7 has entered Sheol! The intermediary zone that separates the universe from your future home, Hell! Here, in the terminal resting place of souls, I have all the raw voltage of the Necron 7 at my disposal!");
            scr_event_build_visible(o_chu_crustBody01, true);
            scr_event_build_animation_play_and_set(o_chu_crustBody01, "appearing", "alive");
            scr_event_build_dialogue_debug("bort", NULL, "The lobster form disappears in scanlines down the screen and reappears in front of the player. It's now the boss CuchuCrustacea enemy object.");
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "Ever tangle with a malevolent AI, here, in the /'End Zone/' of the universe? Prepare to face your final judgment!");
            scr_event_build_dialogue_debug("bort", NULL, "BATTLE BEGINS!");
        }
        /*
         .----------------------------. 
        | .--------------------------. |
        | |    _____         _       | |
        | |   / ___ `.      | |      | |
        | |  |_/___) |   ___| |___   | |
        | |   .'____.'  |___   ___|  | |
        | |  / /____        | |      | |
        | |  |_______|      |_|      | |
        | |                          | |
        | '--------------------------' |
         '----------------------------' 
        */
/*        else if (scr_quest_get_state("crustFightAny") >= 1)
        {
            scr_event_build_dialogue_debug("bort", NULL, "Anything here is optional! You've tried this fight 2+ times.");
            // increase quest state
            scr_event_build_quest_state("crustFightAny", scr_quest_get_state("crustFightAny") + 1);
            // "Back for more?" taunt
            if (scr_quest_get_state("crustFightAny") == 1) {
                scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "How pathetic... back for more?");
            } else if (scr_quest_get_state("crustFightAny") >= 2) {
                scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "You just don't quit... give up!");
            }
            //---------
            // X114JAM9
            //---------
            if (scr_quest_get_state("playerX1") == 1) {
                // Nothing?
                if (scr_quest_get_state("wiglafMission") >= 1) { // On Wiglaf's quest
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not stopping until you're dead... I must find the Cyberdwarf!");
                }
                else if (scr_quest_get_state("wiglafMission") == 0) { // Not on Wiglaf's quest
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Tell me where the Cyberdwarf is, Cuchulainn! I need to find him!");
                }
            } 
            //------------
            // HOOPZ OR CC
            //------------
            else if (scr_quest_get_state("playerCC") == 1) || (scr_quest_get_state("playerHoopz") = 1) {
                //---------
                // COMPLETE
                //---------
                if (scr_quest_get_state("crustFightComplete") == 1) {
                    // Repeated Cyberdwarf response
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll never give up, Cuchulainn! Take this!");
                }
                else if (scr_quest_get_state("crustFightIncomplete") == 1) {
                    if (scr_quest_get_state("csComplete") == 1) {
                        scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Be careful, " + P_NAME + ", he's strong. But now that we have the Cyberspear, Cuchulainn will certainly fall!");
                        scr_event_build_quest_state("csComplete", 1);
                    }
                    else {
                        scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Be careful, " + P_NAME + ", without the Cyberspear, any victory will only be temporary. You must find the Cyberspear!");
                    }
                }
                if (scr_quest_get_state("crustFightSolo") == 1) {
                    // Returned, more confident Cyberdwarf response
                    if (scr_quest_get_state("csComplete") == 1) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'll never stop... now I have the Cyberspear, and a benevolent AI. Say your prayers, Cuchulainn!");
                        scr_event_build_quest_state("csComplete", 1);
                    }
                    else {
                        scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Be careful, " + P_NAME + ", without the Cyberspear, any victory will only be temporary. You must find the Cyberspear!");
                    }
                } 
            }
        }
        scr_event_build_pacify(false);
        // Fight!!!!
        //scr_event_build_camera_reset();
    }
    scr_event_advance(event);

} 
