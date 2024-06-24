// event_chu_crustacea_door

/*
    This is the event that occurs just before the door to your battle with Cuchu-Crustacea.
    It varies based on who you have in your team, and it 
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
    } (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }
    //var _______ = scr_event_create_child(event);
    var elevator = id;
    
    var event = scr_event_create_main();
    var reformat_snippet = scr_event_create_child(event);
    
    with (reformat_snippet) {
        var reformat_choice = scr_event_build_choice("Reformat Cyberdwarf's disk?", s_port_hoopz);
        var yes = scr_build_event_add_choice(reformat_choice, "Reformat Cyberdwarf.");
        var no = scr_build_event_add_choice(reformat_choice, "Obey Cyberdwarf.");
        if (yes) {
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "I know you're in there... and I'm tired of it!");
            // Cyberdwarf gets reformatted!
            // Animation plays...
            // Disk flies out and lands on ground.
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "(Huh... I... I did that. The door...)"
            scr_event_build_quest_set("cdwarfReformat", 1);
        } else (no) {
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Okay Cyberdwarf. I'm finding the Cyberspear...");
            scr_event_build_quest_set("crustDoorIncomplete", 2);
        } 
    }
    
    
    with (event) {
        //-----------------------
        // CRUSTACEA DEAD SEGMENT
        //-----------------------
        if (scr_quest_get_state("crustDead") == 1) { // CuchuCrustacea has been killed
            // teleport
        }
        //-----------------
        // REFORMAT SEGMENT
        //-----------------
        else if (scr_quest_get_state("cdwarfReformat") == 1) {
            // teleport
        }
        //-----------------
        // X114JAM9 SEGMENT
        //-----------------
        else if (scr_quest_get_state("playerX1") == 1) { // Player is X114JAM9
            if (scr_quest_get_state("crustDoorSolo") == 0) { // Have not approached door before
                if (scr_quest_get_state("wiglafMission") >= 1) { var bossname = "Is this where Cuchulainn is? I could fight him" } // On Wiglaf's quest
                else if (scr_quest_get_state("wiglafMission") == 0) { var bossname = "Maybe this is where I'll find the Cyberdwarf" } // Not on Wiglaf's quest
                scr_event_build_dialogue("X114JAM9", s_port_hoopz, "(Whoa... I can feel a chilling power behind this door. " + string(bossname) + "... or maybe this is where I stop...)");
            } else if (scr_quest_get_state("crustDoorSolo") == 1) { // Approached door, did not enter
                // He could certainly say more here.
                scr_event_build_dialogue("X114JAM9", s_port_hoopz, "(Hmmm... should I? I need to be careful)."
            } else if (scr_quest_get_state("crustDoorSolo") == 2) { // Entered door, fought CuchuCrustacea, and lost
                if (scr_quest_get_state("wiglafMission") >= 1) { var bossname = "that Cuchulainn thing is bad. Wiglaf is insane. He's insane...)" }
                else if (scr_quest_get_state("wiglafMission") == 0) { var bossname = "that thing said it was Cuchulainn, not a Cyberdwarf... is this the right way?)" }
                scr_event_build_dialogue("X114JAM9", s_port_hoopz, "(I don't think I wanna go back in there..." + string(bossname));   
            }
            var door_choice = scr_event_build_choice("Enter the door?", s_port_hoopz);
            var yes = scr_event_build_add_choice(door_choice, "Yes, enter.");
            var no = scr_event_build_add_choice(door_choice, "No, do not enter.");
            with (yes) {
                if (scr_quest_get_state("crustDoorSolo") <= 1) {
                    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "All right, here goes nothing!");
                    scr_event_build_quest_set("crustDoorSolo", 2);
                    scr_event_build_quest_set("crustDoorAny", 2);
                } else if (scr_quest_get_state("crustDoorSolo") == 2) {
                    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "(Oh boy... here it goes...)");
                }
            } with (no) {
                if (scr_quest_get_state("crustDoorSolo") <= 1) {
                    "I don't know... maybe I'll come back later."
                    scr_event_build_quest_set("crustDoorSolo", 1);
                    scr_event_build_quest_set("crustDoorAny", 1);
                } else if (scr_quest_get_state("crustDoorSolo") == 2) {
                    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "(I'm not ready for this... maybe I should just tell Lft. Wiglaf).");
                }
            }
        }
        //--------------------
        // HOOPZ OR CC SEGMENT
        //--------------------
        else if (scr_quest_get_state("playerCC") == 1 )|| (scr_quest_get_state("playerHoopz") == 1) { // Hoopz or CreatedCharacter 
            //----------------------
            // INCOMPLETE CYBERSPEAR
            //----------------------
            if (scr_quest_get_state("csComplete") == 0) { // Cyberspear incomplete
                
                if (scr_quest_get_state("crustDoorIncomplete" == 0)) { // 0 door attempts w/incomplete Cyberspear
                    if (scr_quest_get_state("crustDoorSolo") <= 1) { // Have not entered solo
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "I can sense the dreaded power of Cuchulainn behind this door. We mustn't press forward until we have obtained the Cyberspear!");
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Isn't Cuchulainn who we're after? He's probably not so tough...");
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Yes, child. But you must be in possession of the Cyberspear to defeat him. It is the only way...");
                        // scr_event_build_dialogue(string(playerName), s_port_hoopz, "");
                        // MOVE DOWNWARDS, AWAY FROM DOOR
                     
                    } else if (scr_quest_get_state("crustDoorSolo") == 2) { // Fought Crustacea solo
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "I can sense the dreaded power of Cuchulainn behind this door. We mustn't press forward until we have obtained the Cyberspear!");
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "I tussled with this Cuchulainn before... he's tough, but I can beat him. I know I can...");
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You must be a resilient lad to escape in one piece... I've already applauded your daring, I won't do the same for stupidity. You must find the Cyberspear! It is instrumental if we have any hope of defeating Cuchulainn.");
                        // scr_event_build_dialogue(string(playerName), s_port_hoopz, "");
                        // MOVE DOWNWARDS, AWAY FROM DOOR
                    }
                    scr_event_build_quest_set("crustDoorIncomplete", 1); // Add 1 attempt

                } else if (scr_quest_get_state("crustDoorIncomplete" == 1)) { // 1 door attempt w/incomplete Cyberspear 
                    if (scr_quest_get_state("crustDoorSolo") <= 1) { // Have not entered solo
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Child, you must turn back! You haven't a chance of defeating Cuchulainn without the completed Cyberspear!");
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "I can beat him, Cyberdwarf. I know I can!");      
                    } else if (scr_quest_get_state("crustDoorSolo") == 2) { // Fought Crustacea solo
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Child, you must turn back! You haven't a chance of defeating Cuchulainn without the completed Cyberspear!");
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cuchulainn's not so tough, Cyberdwarf. I've got it!");
                    }
                    scr_event_build_quest_set("crustDoorIncomplete", 2);
                    scr_event_build_dialogue("Cyberdwarf", s_port_cd, "What is this insolence!? There's no way you can defeat Cuchulainn. It simply isn't possible. You must leave, and retrieve the Cyberspear!");
                    // Door Choice
                    var door_choice = scr_event_build_choice("Enter the door?", s_port_hoopz);
                    var yes = scr_event_build_add_choice(door_choice, "Yes, enter.");
                    var no = scr_event_build_add_choice(door_choice, "No, do not enter.");
                    with (yes) {
                        if (scr_quest_get_state("crustDoorSolo") <= 1) {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Quit holding me back! If I say I can beat him, I can beat him!");
                        } else if (scr_quest_get_state("crustDoorSolo") == 2) {
                            scr_event_build_dialogue(string(playerName), s_port_hoopz, "I fought him before Cyberdwarf, I know I can do it. I'm stronger now...");
                        }
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Do you not understand? Obtain the Cyberspear, that is your mission! The prophecy demands that do as commanded!");
                        // ZZAP!!!
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Do not forget I'm in here too, child. I won't allow you to do it, not while I inhabit your cyberware. Now, to the Cyberspear!");
                        scr_event_build_event_snippet(reformat_snippet);
                    }
                    with (no) {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Ok, Cyberdwarf... I just want to get this over with. (Doesn't he believe in me?)");
                    }
                } else if (scr_quest_get_state("crustDoorIncomplete" == 2)) {
                    scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Blasphemy... you must hold the Cyberspear to pass this point!");
                    // ZZAP!!!
                    scr_event_build_event_snippet(reformat_snippet);
                }
            }
            //---------------------
            // COMPLETED CYBERSPEAR
            //---------------------
            else if (scr_quest_get_state("csComplete") == 1) { // Cyperspear complete
                if (scr_quest_get_state("crustDoorComplete") == 0) { // First time with complete spear.
                    if (scr_quest_get_state("crustDoorSolo" <= 1) && (scr_quest_get_state("crustDoorIncomplete") == 0) { 
                    // Solo = approached or not. With incomplete spear = not approached.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "This is it, my child. You are finally ready... do you feel it,  " + string(playerName) + "? Holding the Cyberspear, you are finally ready to step into Cuchulainn's chamber. But be ready... Cuchulainn has ignored us for now, but if we cross beyond this point, he will surely show us his worst.");
                        var refuseHoopz = "Whew, okay. I just need a minute to prepare."
                        var refuseCD = "Good... you must be on your guard. But don't hesitate too long! We are in the heart of Cuchulainn's domain. The time is right to strike!"
                    } else if (scr_quest_get_state("crustDoorSolo" <= 1) && (scr_quest_get_state("crustDoorIncomplete") >= 1) {
                    // Solo = approached or not. With incomplete spear = approached but not entered.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Finally, we are ready my child. When we cross this threshold, Cuchulainn will certainly set his strongest forces against us, bith the Cyberspear in hand, we have nothing to fear. Open the door, child and face Cuchulainn. Destroy him once and for all!"
                        var refuseHoopz = "Yikes... just gimme a minute Cyberdwarf."
                        var refuseCD = "Of course, child. But please... push onward. We are so close to fulfilling your destiny."
                    } else if (scr_quest_get_state("crustDoorSolo" == 2) && (scr_quest_get_state("crustDoorIncomplete") == 0) {
                    // Solo = fought. With incomplete spear = not approached.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "At last, we are here, with Cyberspear in hand. Finally you are ready, child. You fell to him before, but you've gained such strength... your destiny lies in front of you. Snatch it up, and crush Cuchulainn!"
                        var refuseHoopz = "There's a lobster in there, Cyberdwarf. I just need a minute."
                        var refuseCD = "Prepare, then. But quickly! There is little time to spare. The Necron 7 edges closer to hell as we speak!"
                    } else if (scr_quest_get_state("crustDoorSolo" == 2) && (scr_quest_get_state("crustDoorIncomplete") >= 2) {
                    // Solo = fought. With incomplete spear = approached 2x but not entered.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Now, " + string(playerName) + ", now you are ready. Now that you possess the Cyberspear, you may pass through the door. There is nothing to fear from Cuchulainn. Face your final battle, and claim your destiny!"
                        var refuseHoopz = "Whoa... my final battle. Gimme a sec. I need to stretch first..."
                        var refuseCD = "Stretch quickly! We have Cuchulainn on the ropes!"
                    }
                    var enter_choice = scr_event_build_choice("Enter Cuchulainn's chamber?");
                    var yes = scr_event_build_add_choice(enter_choice, "Enter the chamber.");
                    var no = scr_event_build_add_choice(enter_choice, "Do not enter.");
                    with (yes) {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "(Get ready " + string(playerName) + "...)");
                        //teleport
                    }
                    with (no) {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, string(refuseHoopz));
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, string(refuseCD));
                        scr_event_build_quest_set("crustDoorComplete", 1);
                    }
                } else if (scr_quest_get_state("crustDoorComplete") == 1) {
                    if (scr_quest_get_state("crustDoorSolo" <= 1) && (scr_quest_get_state("crustDoorIncomplete") == 0) { 
                    // Solo = approached, maximum. With incomplete spear = not approached.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Enter, " + string(playerName) + ", and face your destiny. Your final battle lies past this door!");
                        var refuseHoopz = "Yikes... hold on a second."
                        var refuseCD = "Hurry, child. Hurry..."
                    } else if (scr_quest_get_state("crustDoorSolo" <= 1) && (scr_quest_get_state("crustDoorIncomplete") >= 1) {
                    // Solo = approached, maximum. With incomplete spear = approached but not entered.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Your preparation is complete and the Cyberspear is in hand. Enter, my child, and face your destiny!");
                        var refuseHoopz = "Whew, okay. I just need a minute to prepare."
                       var refuseCD = "Hurry, child. Hurry..."
                    } else if (scr_quest_get_state("crustDoorSolo" == 2) && (scr_quest_get_state("crustDoorIncomplete") == 0) {
                    // Solo = fought. With incomplete spear = not approached.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You are finally ready to defeat Cuchulainn. There is no more time for hesitation. Enter, " + string(playerName) + ", and fight!");
                        var refuseHoopz = "Whew, okay. I just need a minute to prepare."
                        var refuseCD = "Hurry, child. Cuchulainn anticipates your return, and his power only builds."
                    } else if (scr_quest_get_state("crustDoorSolo" == 2) && (scr_quest_get_state("crustDoorIncomplete") >= 1) {
                    // Solo = fought. With incomplete spear = approached but not entered.
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You are finally ready to defeat Cuchulainn. There is no more time for hesitation. Enter, " + string(playerName) + ", and fight!");
                        var refuseHoopz = "Whew, okay. I just need a minute to prepare."
                        var refuseCD = "Hurry, child. Cuchulainn anticipates your return, and his power only builds."
                    } 
                
                }
                else if (scr_quest_get_state("crustDoorComplete") == 2) {
                    var enter_choice = scr_event_build_choice("Enter Cuchulainn's chamber?");
                    var yes = scr_event_build_add_choice(enter_choice, "Enter the chamber.");
                    var no = scr_event_build_add_choice(enter_choice, "Do not enter.");
                    with (yes) {
                        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Ok... let's try this again!")
                        //teleport
                    }
                    with (no) {
                        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You mustn't hesitate too long Hoopz. Cuchulainn knows we plot against him. He is only building his power...");
                    }
                    
                }
            } 
        }
    }