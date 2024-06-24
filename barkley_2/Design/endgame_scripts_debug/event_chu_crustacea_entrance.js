// event_chu_crustacea_entrance

/* event_chu_crustacea_entrance - NOTES
Start, upon entering CuchuCrustacea's Room
*/
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    
    var playerX1 = scr_quest_get_state("playerX1")
   
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }
    //var _______ = scr_event_create_child(event);
    var crustacea_entrance = id;
    
    var event = scr_event_create_main();
    
    with (event) {
        //---------------------------
        // HE DEAD... CUCHU'S DEAD!!!
        //---------------------------
        if (scr_quest_get_state("crustDead") == 1) {
            // Destroy Event
            
        }
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
        if (scr_quest_get_state("crustFightAny") == 0) {
            // animation, intro
            scr_event_build_dialogue("NARRATOR", NULL, "There can be a bunch of flickering lights and stuff for the whole CuchuCrustacea intro. But basically: the player auto-walks upwards to a point, and stops. The camera does a pan or something maybe, to where they're both centered on the screen, and on a giant monitor (Cyberdwarf's monitor, even) Cuchulainn appears in his Lobster Form.");
            // Normal Cuchulainn taunt
            // XXXplosions
            // A flash of light, whatever
            // Scanline-version appears just in front of the screen
            //---------
            // X114JAM9
            //---------
            if (scr_quest_get_state("playerX1") == 1) {    
                scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Bwahahaha what have we here? Someone dares to enter my domain?... Oh, it's you... that youngster from the engine room.");
                if (scr_quest_get_state("wiglafMission") >= 1) { // On Wiglaf's quest
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cuchulainn! I'm on orders to take you out. You're keeping me from the Cyberdwarf... and finding out who I truly am...");
                    scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Take me out? I rule over the Necron 7, child. How could you possibly think you could do such a thing? Don't you know where we are?");                    
                }
                else if (scr_quest_get_state("wiglafMission") == 0) { // Not on Wiglaf's quest
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "Where's the Cyberdwarf? I have to find the Cyberdwarf!");
                    scr_event_build_dialogue("Cuchulainn", s_port_cuchAI, "Cyberdwarf? There's no Cyberdwarf here. This was the gravest mistake you've ever made, child. Kwehehehehe!! Don't you know where we are?");
                }
                scr_event_build_dialogue(string(playerName), s_port_hoopz, "Um... not really...");
                scr_event_build_quest_state("crustFightAny", 1);
                scr_event_build_quest_state("crustFightSolo", 1);
            } 
            //------------
            // HOOPZ OR CC
            //------------
            else if (scr_quest_get_state("playerCC") == 1) || (scr_quest_get_state("playerHoopz") = 1) {
                //---------
                // REFORMAT
                //---------
                if (scr_quest_get_state("cdwarfReformat") == 1) {
                    if (scr_quest_get_state("csComplete") == 0) {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cuchulainn! I've come to stop you. I'm ending this voyage to Hell, right now!");
                        scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Stop me? What a joke! Don't you know where we already are?");
                    } else {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cuchulainn! Your rule over the Necron 7 ends here. I'm stopping our voyage to Hell, right now! And I brought the Cyberspear with me!");
                        scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Huh? the Cyberspear?... Stop me? What a joke! Don't you know where we already are?");
                    }
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "Um... the Necron 7...?");
                    scr_event_build_quest_state("crustFightAny", 1);
                    scr_event_build_quest_state("crustFightReformat", 1);
                } 
                //---------
                // COMPLETE
                //---------
                else {
                    // Cyberdwarf response
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cuchulainn! We've come to stop you. I have the Cyberspear, and a benevolent AI. There's nothing you can do to stop me! End this voyage into Hell, now!");
                    scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Bwahahahaha! I didn't understand half of that. Don't you know where we are?");
                    scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Are... are we that close already? No...");
                    scr_event_build_quest_state("crustFightAny", 1);
                    scr_event_build_quest_state("crustFightCyberdwarf", 1);
                } 
            }
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuCrust, "Kohohoho... full speed ahead!");
            // crazy animation, stuff appears on the screen, shake effect, etc.
            // WARNING: NOW ENTERING SHEOL, NOW ENTERING SHEOL
            scr_event_build_dialogue("NARRATOR", NULL, "The lobster form disappears in scanlines down the screen and reappears in front of the player. It's now the boss CuchuCrustacea enemy object.");
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuCrust, "The Necron 7 has entered Sheol! The intermediary zone that separates the universe from your future home... Hell! Here, in the terminal resting place of souls, I have all the raw voltage of the Necron 7 at my disposal! Ever tangle with a malevolent AI, here, in the /'end zone/' of the universe? Prepare to face your final judgment!");
            // FIGHT BEGINS!!!
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
        else if (scr_quest_get_state("crustFightAny") >= 1) {
            // "Back for more?" taunt
            if (scr_quest_get_state("crustFightAny") == 1) {
                scr_event_build_dialogue("Cuchulainn", s_port_cuchuCrust, "How pathetic... back for more?");
            } else if (scr_quest_get_state("crustFightAny") >= 2) {
                scr_event_build_dialogue("Cuchulainn", s_port_cuchuCrust, "You just don't quit... give up!");
            }
            //---------
            // X114JAM9
            //---------
            if (scr_quest_get_state("playerX1") == 1) {
                // Nothing?
                if (scr_quest_get_state("wiglafMission") >= 1) { // On Wiglaf's quest
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "I'm not stopping until you're dead... I must find the Cyberdwarf!");
                }
                else if (scr_quest_get_state("wiglafMission") == 0) { // Not on Wiglaf's quest
                    scr_event_build_dialogue(string(playerName), s_port_hoopz, "I know the Cyberdwarf's back there somewhere. I need to find him!");
                }
            } 
            //------------
            // HOOPZ OR CC
            //------------
            else if (scr_quest_get_state("playerCC") == 1) || (scr_quest_get_state("playerHoopz") = 1) {
                //---------
                // REFORMAT
                //---------
                if (scr_quest_get_state("cdwarfReformat") == 1) {
                    if (scr_quest_get_state("crustFightReformat") == 0) {
                        if (scr_quest_get_state("csComplete") == 0) {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Hoopz could say something here. Fought solo, now reformatted. No Cyberspear.");
                        } else {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Hoopz could say something here. Fought solo, now reformatted. With Cyberspear.");
                        }
                    } else if (scr_quest_get_state("crustFightSolo") == 0) {
                        if (scr_quest_get_state("csComplete") == 0) {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Hoopz could say something here. Fought reformatted, no Cyberspear.");
                        } else {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Hoopz could say something here. Fought reformatted, with Cyberspear.");
                        }
                        scr_event_build_quest_state("crustFightReformat", 1);
                    }
                } 
                //---------
                // COMPLETE
                //---------
                else {
                    if (scr_quest_get_state("crustFightSolo") == 1) {
                        // Returned, more confident Cyberdwarf response
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "I'll never stop... now I have the Cyberspear, and a benevolent AI. Say your prayers, Cuchulainn!");
                        scr_event_build_quest_state("crustFightCyberdwarf", 1);
                    } else if (scr_quest_get_state("crustFightComplete") == 1) {
                        // Repeated Cyberdwarf response
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Your time is up, Cuchulainn! En garde!");
                    }
                }
            }
        }
        // Fight!!!!
    }
    scr_event_advance(event);
}