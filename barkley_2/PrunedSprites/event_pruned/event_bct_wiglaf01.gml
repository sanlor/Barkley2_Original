// EDIT event_bct_wiglaf02 script start instead




























/*

Wiglaf's intro cutscene (tuber peeling), plays when you enter for the first time, Wiglaf's main interact script is wiglaf02

-----------------------------------------
Wiglaf variables
-----------------------------------------
wiglafState = 0 - Wiglaf hasn't been spoken to (this triggers on script start)
wiglafState = 1 - Wiglaf has been spoken to
wiglafState = 2 - Wiglad has given you a Mission

wiglafMission = 1 - You've been assigned to kill Cuchulainn in order to meet Cyberdwarf.
wiglafMission = 2 - You've exited the rebel base through the hatch the Jhodfrey shows you.
wiglafMission = 3 - You've reported back to Wiglaf to get full permission to meet Cyberdwarf.

crustFightAny = 1 - You've fought Cuchu Crustacea.

tuberPeel = 0 - You do not know about Tuber Peeling duties
tuberPeel = 1 - Hoopz has been assigned Tuber Peeling duties and will be transported to r_bct_tuberCloset01 to peel
tuberPeel = 2 - Set by event_bct_tuberPeeling01 at the end of Tuber Peeling Duties
tuberPeel = 3 - You completely skippped the Tuber Peeling segment
tuberPeel = 4 - You've finished the Wiglaf report about the tubers

NOTES: Although you don't need to speak to Wiglaf before you fight Cuchulainn, you currently need to
speak to him after you've fought Cuchulainn in order to see the Cyberdwarf.
*/

if (argument0 == SCRIPT_START) {
    var (event) = scr_event_find_main(); //scr_event_create_main();
    
    with (event) {
        
        //------------------------------------
        //       ON RETURN FROM TUBERS
        //------------------------------------
        
        if scr_quest_get_state("tuberPeel") == 2 {
            scr_event_build_look_object(o_cts_hoopz, o_wiglaf01);
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "What in the name of Clispaeth is going on here? I didn't serve four tours of duty to see tubers this poorly peeled. You're not cut out for tubers, punk. That's it... you're on Cuchulainn duty!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "It was my first time peeling tubers...");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "It won't be the last, Private. Practice makes perfect. Get to peeling.");
            //A pause
            scr_event_build_wait(1.2);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not going to peel any more tubers, sir.");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "What are you saying to a superior officer Private?!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not here to peel any tubers, sir. My name is " + P_NAME + ", I was rescued by L.O.N.G.I.N.U.S. members, and they told me to find the Cyberdwarf.");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Private " + P_NAME + ", huh? You sure you want to meet the Cyberdwarf? Not with a rank like that, you won't. But three more sorties and you get your promotion. Ready for your first briefing, Private?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes sir, Lft. Wiglaf!");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Okay, here it is. We've been receiving reports of a Malevolent AI, one Cuchulainn terrorizing L.O.N.G.I.N.U.S. members and dwarf civilians. Your first task... take him out, and rid the Necron 7 of his tyranny!");
            //-------------------------------
            // GAMESMASTER PLAYTHROUGH: 
            // Player already killed Cuchu or died in Lair.
            //-------------------------------
            if (scr_quest_get_state("crustDead") == 1) || (scr_quest_get_state("crustFightAny") == 1) || scr_quest_get_state("cuchuLairDeath") {
                // Cuchu Crustacea was killed
                if (scr_quest_get_state("crustDead") == 1) {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wait... are you serious? You want me to take out Cuchulainn? I already did! And I kicked his ass.");
                    scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Already beat him, huh? Proactive thinking, sprout! I like your moxie! I don't usually do this, but I'm willing to overlook your exceptionally poor tuber peeling performance just this once. I'm giving you a field promotion. Congratulations, Private First Class " + P_NAME + "!");
                }
                // Died in Cuchulainn's area 
                else if (scr_quest_get_state("crustFightAny") >= 1) {
                    // TODO: Change this dialogue to accurately reflect if you died against Crustacea vs died in the Lair
                    scr_event_build_dialogue_debug("bort", NULL, "TODO: Change this dialogue to accurately reflect if you died against Crustacea vs died in the Lair.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wait... are you serious? You want me to take out Cuchulainn? I've already fought him and it's a suicide mission!");
                    scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Already fought him, huh? Proactive thinking, sprout! I like your moxie, forget about the mission. I don't usually do this, but I'm giving you a field promotion. Congratulations, Private First Class " + P_NAME + "!");
                }
                else if (scr_quest_get_state("cuchuLairDeath") >= 1) {
                    // TODO: Change this dialogue to accurately reflect if you died against Crustacea vs died in the Lair
                    scr_event_build_dialogue_debug("bort", NULL, "TODO: Change this dialogue to accurately reflect if you died against Crustacea vs died in the Lair.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wait... are you serious? You want me to take out Cuchulainn? I got to his lair already, but he bopped me pretty bad...");
                    scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Already poked around up there, huh?? Proactive thinking, sprout! I like your moxie, forget about the mission. I don't usually do this, but I'm giving you a field promotion. Congratulations, Private First Class " + P_NAME + "!");
                } 
                // shared dialogue
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Private First Class? I've never gotten a promotion before...");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Tell you what, you want to see the Cyberdwarf? You've earned it. Jhodfrey, boot up Benevolent A.I. OS!");
                scr_event_build_dialogue("Jhodfreja", NULL, "Yes, sir! Parsing RAM as we speak.");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Private First Class " + P_NAME + ", you're free to see the Cyberdwarf. Go right through that door.");
                // Cyberdwarf is now accessible!
                // update wiglafMission quest state
                Quest("tuberPeel", 4);
                scr_event_build_quest_state("wiglafMission", 3);
            }
        //-------------------------------
        // NORMAL PLAYTHROUGH: 
        // Get quest prompt.
        //-------------------------------
            else {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, don't you think...");
                //take this _____??
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "That's right, >I< think! And you act!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sir, yes sir!");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Now then Private, our most current intelligence puts Cuchulainn, henceforth known as 'Big Boy' at approximately Level 666 of Necron 7, codenamed 'The Hen House'. The only known incursion route? Well that's the Express Elevator in the bog. Your mission is this: Under codename 'Knife' infiltrate The Hen House and take out Big Boy.");
                scr_event_build_dialogue(P_NAME, s_port_hoopzHappy, "Knife, Hen House, Big Boy, GOT IT!");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "What was that Private?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sir, Mission Accepted sir!");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "That's what I thought, Private. Now, Jhodfrey will give you the OP specs. Pull this one off and you'll be wearing some shiny brass in no time.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Cyberdwarf ... I'm coming.");
                // update wiglafMission quest state and tuberPeel
                // elevator is now accessible!
                Quest("tuberPeel", 4);
                scr_event_build_quest_state("wiglafMission", 1);
            }
        }
        
        //---------------------------------------------------------------------------------------
        // First Conversation (runs on entry to the LONGINUS BASE)
        //---------------------------------------------------------------------------------------
        
        if (scr_quest_get_state("wiglafState") == 0) {
            // update Wiglaf state
            scr_event_build_quest_state("wiglafState", 1);
      
            // First intro scene that always plays:
            scr_event_build_dialogue_debug("Bhroom", NULL, "A cutscene starts and takes control of Hoopz. This is a major cutscene that moves around the room.");
            scr_event_build_camera_move_to_point(240,208,CAMERA_SLOW);
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Listen up, maggots. We ain't at the school dance, we ain't staring at our targets from across the gym. This is war, you yellow-bellied, lily-livered, wet-behind-the-ear weenies!  This is about territory. Half a league onward!");
            //TODO: eventually update with the x,y of the appropriate room (along with all otyher x,ys here) and camera frame
            scr_event_build_move_to_point(o_cts_hoopz, 136, 272);
            scr_event_build_wait_for_actions();
            scr_event_build_look_object(o_cts_hoopz, o_wiglaf01);
            scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_wiglaf01);
            //Moves Jhodfrey over a bit in the placeholder room to help him out with pathfinding
            scr_event_build_move_to_point(o_jhodfrey01, 136, 160);
            //Rebels exclaim out of the regular breakout box
            scr_event_build_dialogue("Rebels", NULL, "Into the jaws of death SIR!");
            //scr_event_build_dialogue_ext("Rebels", NULL, "Into the jaws of death SIR!", rebel_text);
            //Pause for impact
            scr_event_build_wait(2);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, ahem excuse me sir.");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Huh, what is it civvy? Who let you in here?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm looking for the Cy-");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Well I'm looking for a few good dwarfs, and your face looks as purty and clean as the shine on those boots of yours.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "My kicks?");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "The color is way off regulation but I like the shine. And I doubt that 'do is high enough or tight enough.");
            scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "My hair? This is just how it grows...");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "And this is just how I boot a civvy out of my command center. Jhodfrey, get this noncombatant out of my line of sight! Double-time!");
            
            scr_event_build_dialogue("Jhodfrey", s_port_jhodfrey, "Sir! Yes sir!");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No wait!");
            scr_event_build_move_to_point(o_jhodfrey01, 136, 248);
            Wait();
            scr_event_build_look(o_jhodfrey01, SOUTHWEST);
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Rules of engagement, tyke. I ain't runnin' a daycare, here.");
            scr_event_build_wait_for_actions();
            //TODO: Jhodfrey moves down into Hoopz, pushing him back
            scr_event_build_dialogue_debug("Bhroom", NULL, "Jhodfrey pushes Hoopz back!");
            scr_event_build_move_ext(o_jhodfrey01, -8, 8, MOVE_FAST);
            scr_event_build_wait(0.01);
            scr_event_build_move_backwards(o_cts_hoopz, -8, 8);
            scr_event_build_wait_for_actions();
            scr_event_build_dialogue("Jhodfrey", s_port_jhodfrey, "Let's go, out this way. You heard the commander.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "But I'm supposed to be here.");
            scr_event_build_move_ext(o_jhodfrey01, -8, 8, MOVE_FAST);
            scr_event_build_wait(0.01);
            scr_event_build_move_backwards(o_cts_hoopz, -8, 8);
            scr_event_build_wait_for_actions();
            
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Alright maggots, no more distractions. Back to war.");
            
            //TODO: Scene of Hoopz about to be pushed out.
            scr_event_build_dialogue_debug("Bhroom", NULL, "Jhodfrey pushes Hoopz almost to the exit.");
            scr_event_build_move_ext(o_jhodfrey01, -8, 8, MOVE_FAST);
            scr_event_build_wait(0.01);
            scr_event_build_move_backwards(o_cts_hoopz, -8, 8);
            //Pause for impact
            scr_event_build_wait(2);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "... Into the jaws of death SIR!");
            //TODO: Kill the music
            scr_event_build_dialogue_debug("Bhroom", NULL, "The music stops!");
            
            //A pause
            scr_event_build_wait(2);
            //TODO: BGM Change to Rebel Base Music
            scr_event_build_dialogue_debug("Bhroom", NULL, "The music starts back up, inspired by Hoopz' dedication tot he cause!");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "... Are my old ears playing tricks on me or does it sound like we have a new recruit in our ranks?");
            //TODO: Hoopz walks past Jhodfrey
            scr_event_build_dialogue_debug("Bhroom", NULL, "Hoopz runs past Jhodfrey.");
            scr_event_build_move_to_point_ext(o_cts_hoopz, 136, 272, MOVE_NORMAL);
            scr_event_build_wait_for_actions();
            scr_event_build_look_object(o_jhodfrey01, o_cts_hoopz);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Sir! I'm here to enlist!");
            scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "Love to hear it. Now get to work! Get on those roots and tubers, pronto. They aren't gonna peel themselves, grunt!");
            
            // CHOICE: Peel tubers or don't
            // The player always will get this choice, one choice plays a Tuber Peeling Cutscene, the othere sends you directly to the Cuchulainn Assasination portion of the Main Quest.
            var tuberchoice = scr_event_build_choice("Peel those tubers?", s_port_hoopz);
            // Response 1: Peel the tubers.
            with scr_event_build_add_choice(tuberchoice, "Get peeling.") {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "My name is " + P_NAME + ", and I was told to find the Cyberdwarf. Where are the tubers?");
                scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "That's the spirit! Right this way, Private!");
                
                //Screen fades out, load up Tuber Cutscene Gag
                scr_event_build_fade(true, 3);
                scr_event_build_wait(1);
                scr_event_build_dialogue_debug("Bhroom", NULL, "Here comes the tubers.");
                scr_event_build_wait_for_actions();
                scr_event_build_quest_state("tuberPeel", 1);
                scr_event_build_teleport(r_bct_tuberCloset01, 198, 120, 1, 1);
            }
            // Response 2: Do not peel the tubers.
            with scr_event_build_add_choice(tuberchoice, "Ask to see the Cyberdwarf.") {
               scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not going to peel any tubers, sir.");
               scr_event_build_dialogue("Lft. Wiglaf", s_port_wiglaf, "What are you saying to a superior officer Private?!");
               // Advance Wiglaf's State and go to Ending Event Snippet
               //TODO: fix this weird way to get out of peeling tubers
               scr_event_build_dialogue_debug("Bhroom", s_port_bhroom01, "Not sure what do do here anymore.");
               scr_event_build_quest_state("tuberPeel", 3);        
            }    
        }
    }
    //scr_event_advance(event); // Not needed on fadein
}   
