// Script for Joad!
// usage: event_sw1_joad01

/*  
Quest Variable:
    
    joadQuest
        0 = Never Talked
        1 = Failed, Dead (can pick up Bloody Paper)
        2 = got Bloody Paper
        3 = got Tattered Paper
        4 = got Ancient Scroll
        5 = got Dead Dwarf Note
        6 = got Dead Dwarf Note AND Tattered Paper
        7 = got Dead Dwarf Note AND Ancient Scroll
    joadBad
        # = the number of bad answers (starts at 0)
    joadGood
        # = the number of good answers (starts at 0)
    joadLife
        # = the amount of life Joad has, decrease by 1 every turn. (starts at 5)
    joadLine
        -1 = 
        0 = joad's note contains the standard message
        1 = joad's note contains the bonus message  
    joadScrollChoice
        0 = scroll choice unavailable
        1 = scroll choice available
    joadScrollKnow
        0 = scroll not known about, scroll is received as "tattered paper"
        1 = scroll known about, changes scroll name to "ancient scroll"
    joadScrollOn
        0 = scroll or paper is not "in hand"
        1 = scroll or paper is "in hand", turns on the choice to give to joad or ask about it
    joadProcess
        1 = Change joadQuest state upon completion of Quest
    joadNoteReuse
        1 = this turns on when you are giving him a different note to use and keeping the Ancient Scroll
*/

if (argument0 == SCRIPT_START)
    {
    // bomb dwarf's life count
    if (Quest("joadQuest") == 0)
        {
        // Joad's Life reduces by one for each ClockTime() gate passed.
        // TODO: Verify this works!
        
        scr_quest_set_state("joadLife", 5 - ClockTime());
        script_execute(event_sw1_joad01, SCRIPT_INTERACT);
        }
    }

else if (argument0 == SCRIPT_INTERACT)
{
    var joad = o_joad01.id; // MUST be o_joad01 as this can be called from other objects
    var event = scr_event_create_main();
    var dead_snippet = scr_event_create_child(event);
    var main_q_snippet = scr_event_create_child(event);
    var post_choice_snippet = scr_event_create_child(event);
    var writing_snippet = scr_event_create_child(event);
    
    //-------------------------------
    // main_q_snippet
    //-------------------------------
    with (main_q_snippet)
    {
        // LIFE STATEMENT
        // Joad has a new line for how close to death he is.
        
        // Does not occur if joadLife is the starting value, 5, or if joadLife is negative. 
        if (Quest("joadLife") != 5) && (Quest("joadLife") >= 0)
        {
            //Debug("debug: ", "Joad's life is " + string(Quest("joadLife")));
            
            // Number of total choices remaining.  
            switch (Quest("joadLife"))
            {
                case 0:
                    Dialogue("Dying Dwarf", "...ngh_..._ *gasp*..."); 
                    scr_event_build_animation_set(joad, "dead");
                    break;   
                case 1: Dialogue("Dying Dwarf", "Y... young... ster..._ I..."); break;
                case 2: Dialogue("Dying Dwarf", "Nnnh..._ my strength is decreasing..._ even further..._"); break;
                case 3: Dialogue("Dying Dwarf", "I... I dont have much strength..."); break;
                case 4: Dialogue("Dying Dwarf", "Nnngh..._ *kack*... this is it..."); break;
                case 5: Dialogue("Dying Dwarf", "I'm truly... a..._ g-... goner..._"); break;
                case 6: Dialogue("Dying Dwarf", "Ya script is bu$$ted"); break;
            }
        }
        
        
        // After the Life Statement (if it happens) we get to this choice.
        // This is the main looped choice that runs the event. We have to determine the options,
        // because they change every time. There is essentially a "slot" for each option.
        //  1 = Good choices, this will move to getting the note quickly
        //  2 = Bad choices, these are about the tomb and bainshee and scroll, and do not move towards getting the note.
        //  3 = This has scroll prompt and dialogue(???)
        //  4 = This has the "Blank Paper" prompt and dialogue, if you own Blank Paper.
        
        var main_choice = Choice("What do you do?", s_port_hoopz);
        
        //----------------------------------------------
        // Determine Choice 1 ("Help") prompt & dialogue
        //----------------------------------------------
        // if joadGood is less than 3, you get a "Good" choice depending on what number you are on.
        if (Quest("joadGood") <= 2)
        {
            // Determine Choice 1 ("Good") prompt & dialogue
            switch (Quest("joadGood"))
            {
                // joadGood == 0 ::: "Ask where he's hurt."
                case 0: 
                    var good = ChoiceAdd(main_choice, "Ask where he's hurt.");
                    with (good)
                    {
                        Dialogue(P_NAME, "It looks like you're really bleeding. Where were you hurt?");
                        Dialogue("Dying Dwarf", "Ugh... all over, youngster. It surprised us... *kack*... looks like my time's... almost up.");
                        QuestAdd("joadGood", 1);
                        Snippet(post_choice_snippet);
                    }
                    break;
                
                // joadGood == 1 ::: "Ask what you can do."
                case 1:
                    var good = ChoiceAdd(main_choice, "Ask how you can help.");
                    with (good)
                    {
                        Dialogue(P_NAME, "Ok, we're gonna get you out of here. Uh..._ how should I do this?");
                        Dialogue("Dying Dwarf", "I'm not going... anywhere. P-... paper... pencil. Help me... get my paper... check... pocket...");
                        Dialogue(P_NAME, "In your pocket, huh?... Here it is.");
                        Wait(1)
                        
                        // Don't know paper is scroll?
                        // Get "Tattered Paper"
                        if (Quest("joadScrollKnow") == 0)
                        {
                            DialogueItem("Got a piece of Tattered Paper.");
                            // Get scroll as "Tattered Paper"
                            Note("build", "take", "Tattered Paper");
                        } 
                        // Know paper is scroll?
                        // Get "Ancient Scroll"
                        else if (Quest("joadScrollKnow") == 0)
                        {
                            Dialogue(P_NAME, "This is that scroll... looks old!", s_port_hoopzSurprise);
                            DialogueItem("Got the Ancient Scroll.");
                            // Get scroll as "Ancient Scroll"
                            Note("build", "take", "Ancient Scroll");
                        }
                        // joadScrollOn is set to 1
                        // Indicates the scroll was gotten, whether as Paper or Scroll. 
                        // In player's hands, now "Scroll Giveaway" segment turns on.
                        Quest("joadScrollOn", 1);
                        
                        QuestAdd("joadGood", 1);
                        Snippet(post_choice_snippet);
                    }
                    break;
                    
                // joadGood == 2 ::: "Give the dwarf the paper." OR "Give the dwarf the scroll."
                case 2:
                    // Based on Scroll Knowledge...
                    // Give Paper
                    if (Quest("joadScrollKnow") == 0)
                    {
                        var good = ChoiceAdd(main_choice, "Give the dwarf the paper.");
                    }
                    // Give Scroll
                    else
                    {
                        var good = ChoiceAdd(main_choice, "Give the dwarf the scroll.");
                    }
                    with (good)
                    {
                        // Give Paper
                        if (Quest("joadScrollKnow") == 0)
                        {
                            Dialogue(P_NAME, "Here's the paper...");
                            DialogueItem("Gave the Tattered Paper to the Dying Dwarf.");
                            Note("build", "give", "Tattered Paper");
                        }
                        // Give Scroll
                        else
                        {
                            Dialogue(P_NAME, "Here you go... scribble all over this ancient scroll I guess."); 
                            DialogueItem("Gave the Ancient Scroll to the Dying Dwarf.");
                            Note("build", "give", "Ancient Scroll");
                        }
                        
                        QuestAdd("joadGood", 1);
                        Snippet(writing_snippet);
                    }
                    break;
            }
        }
        
        //---------------------------------------------
        // Determine Choice 2 ("Bad") prompt & dialogue
        //---------------------------------------------  
        // if your bad choices have not exceeded 5, the "bad" option is available for choosing.      
        // 6 Bad Choices Only!
        if (Quest("joadBad") <= 5)
        {
            switch (Quest("joadBad"))
            {
                // joadBad == 0 ::: "Ask how this happened."
                case 0:
                    var bad = ChoiceAdd(main_choice, "Ask how this happened.");
                    with (bad)
                    {
                        Dialogue(P_NAME, "You look really hurt. How did this happen?");
                        Dialogue("Dying Dwarf", "Was scouting... blasted into a room a few floors down... think it was a tomb... ba-... bainshee caught up to me... got me good.");
                    }             
                    break;
                    
                // joadBad == 1 ::: "Ask about the bainshee."
                case 1:
                    var bad = ChoiceAdd(main_choice, "Ask about the bainshee.");
                    with (bad) 
                    {
                        Dialogue(P_NAME, "A bainshee did this? Where did it get off to? They really sound like bad news.");
                        // Far from death.
                        if (Quest("joadLife") >= 3)
                        {
                            Dialogue("Dying Dwarf", "Really bad... I tracked it for awhile, lost it... lo... in tomb when it appeared. Got back to here but... ugh... too late.");
                        }
                        // Near death.
                        else
                        {
                            Dialogue("Dying Dwarf", "Real... bad... tracked for awhile... lost it... looking... *cough* tomb when... got to here but... ugh... late...");
                        }
                    }
                    break;
                    
                // joadBad == 2 ::: "Ask about the ancient tomb."
                case 2:
                    var bad = ChoiceAdd(main_choice, "Ask about the ancient tomb.");
                    with (bad)
                    {
                        Dialogue(P_NAME, "Could you tell me anything else about this tomb?");
                        Dialogue("Dying Dwarf", "... saw weak wall... blasted in. Caved in now... all I m-... to get was... nnngh... scroll.");
                        
                        // Turn on scroll knowledge, if not already on.
                        if (Quest("joadScrollKnow") == 0)
                        {
                            Quest("joadScrollKnow", 1);
                            
                            // If Tattered Paper is owned...
                            if (Note("have", "Tattered Paper") == true)
                            {
                                Dialogue(P_NAME, "Wow, so this is that ancient scroll, huh?... I bet it's jam packed with secrets... (I love secrets)...");
                                // Switch Tattered Paper and Ancient Scroll
                                DialogueItem("Tattered Paper revealed to be an Ancient Scroll.");
                                Note("build", "give", "Tattered Paper");
                                Note("build", "take", "Ancient Scroll");
                            }
                        }
                    }
                    break;
                    
                // joadBad == 3 ::: "Ask about the scroll."
                case 3:
                    var bad = ChoiceAdd(main_choice, "Ask about the scroll.");
                    with (bad)
                    {
                        Dialogue(P_NAME, "A scroll from a tomb, huh? You've gotta tell me more.");
                        Dialogue("Dying Dwarf", "Saw scroll... ground... grabbed it. That's when... b-... bainshee... little letters... my pocket.");
                        
                        Dialogue(P_NAME, "(Whoa... so this is that scroll...)");
                        
                        DialogueItem("Got Ancient Scroll.");
                        
                        // Get scroll as "Ancient Scroll"
                        Note("build", "take", "Ancient Scroll");
                        Quest("joadScrollOn", 1);
                    }
                    break;
                    
                // joadBad == 4 ::: "Ask what the scroll says."
                case 4:
                    var bad = ChoiceAdd(main_choice, "Ask what the scroll says.");
                    with (bad)
                    {
                        Dialogue(P_NAME, "So do you know what the scroll says on it? These letters are really faded, and I don't know what language this is.");
                        Dialogue("Dying Dwarf", "Ugh... I... scroll... other... s-...");
                    }
                    break;
                    
                // joadBad == 5 ::: "Ask him to speak up."
                case 5:
                    var bad = ChoiceAdd(main_choice, "Ask him to speak up.");
                    with (bad)
                    {
                        Dialogue(P_NAME, "What's that, mister? I can't hear you.");
                        Dialogue("Dying Dwarf", "...");
                    }
                    break;
            } 
            
            // This will always be executed regardless of choice.
            with (bad)
            {
                QuestAdd("joadBad", 1);
                Snippet(post_choice_snippet);
            }

        }
        
        //------------------------------------------------
        // Determine Choice 3 ("Scroll") prompt & dialogue
        //------------------------------------------------
        // Dwarf has asked for paper, AND Choice 3 has not passed Case 1.
        if (Quest("joadScrollOn") == 1) && (Quest("joadGood") == 2) && (Quest("joadScrollChoice") <= 2)
        {
            switch (Quest("joadScrollChoice"))
            {
                // "Ask about the paper." OR "Ask about the scroll."
                case 0:
                    // Scroll not known - Paper
                    if (Quest("joadScrollKnow") == 0)
                    {
                        var scroll = ChoiceAdd(main_choice, "Ask about the paper.");
                    }
                    else
                    {
                        var scroll = ChoiceAdd(main_choice, "Ask about the scroll.");
                    }
                    with (scroll)
                    {
                        // Scroll not known - Paper
                        if (Quest("joadScrollKnow") == 0)
                        {
                            Dialogue(P_NAME, "This paper looks really old. Where'd you get it?");
                            Dialogue("Dying Dwarf", "V-... very old... look closer... it's...fact... an ancient scroll.");
                            // Turn on scroll knowledge
                            Quest("joadScrollKnow", 1);
                            Dialogue(P_NAME, "Wow, an ancient scroll... I bet it's jam packed with secrets... (I love secrets...)");
                            
                            // Switch Tattered Paper and Ancient Scroll
                            DialogueItem("The Tattered Paper is really an Ancient Scroll.");
                            Note("build", "give", "Tattered Paper");
                            Note("build", "take", "Ancient Scroll");
                            
                            // Decrease "scroll_choice" so you ask about scroll next time.
                            QuestAdd("joadScrollChoice", -1);
                        }
                        // Scroll known - Scroll
                        else
                        {
                            // Tomb Question has not been asked... location unknown.
                            if (Quest("joadBad") < 2)
                            {
                                Dialogue(P_NAME, "This is unreal... where'd you get it?");
                                Dialogue("Dying Dwarf", "Saw scroll... tomb... grabbed it. That's when... b-... bainshee... little letters...");
                            }
                            // Tomb question has been asked.
                            else
                            {
                                Dialogue(P_NAME, "This is unreal... you said you got it from a tomb?");
                                Dialogue("Dying Dwarf", "Saw scroll... tomb... grabbed it. That's when... b-... bainshee... little letters...");
                            }
                        }
                    }
                    break;
                    
                // "Ask what the scroll says."
                case 1:
                    var scroll = ChoiceAdd(main_choice, "Ask what the scroll says.");
                    with (scroll)
                    {
                        Dialogue(P_NAME, "So do you know what the scroll says on it? These letters are really faded, and I don't know what language this is.");
                        Dialogue("Dying Dwarf", "Ugh... I... scroll... other... s-...");
                    }
                    break;
                    
                // "Ask him to speak up."
                case 2:
                    var scroll = ChoiceAdd(main_choice, "Ask him to speak up.");
                    with (scroll)
                    {
                        Dialogue(P_NAME, "What's that, mister? I can't hear you.");
                        Dialogue("Dying Dwarf", "...");
                    }
                    break;
            }
            
            // This will always be executed regardless of choice.
            with (scroll)
            {
                QuestAdd("joadScrollChoice", 1);
                Snippet(post_choice_snippet);  
            } 
        }
        
        //-----------------------------------------------
        // Add Choice 4 ("Blank Paper") prompt & dialogue
        //-----------------------------------------------
        // Dwarf has asked for paper AND you have Blank Paper in inventory!
        if (Quest("joadGood") == 2)
        {
            var blankpaper = ChoiceAdd(main_choice, "Give him another paper.");
            with (blankpaper)
            {
                Dialogue(P_NAME, "I think I might have something.");
                Note("build", "select", "dying dwarf");
            }
        }
    }
    
    
    //-----------------------------------------------------------
    // writing_snippet
    //-----------------------------------------------------------
    with (writing_snippet)
    {
        Dialogue("Dying Dwarf", "Th-... thank you youngster. And thank you for... being here. Now, I must record what I saw... help t... others...");
                        
        Wait(1);
        Dialogue("Dying Dwarf", "There... it's done... thank you youngster... now... I can fin._._._ ally._._._");
        
        //Joad Dies
        scr_event_build_animation_play_and_set(joad, "cough", "dead");
        Wait();
        
        // if he has more than 3 life remaining, he writes another line.
        if (Quest("joadLife") >= 3)
        {
            Wait(0.5);
            //scr_event_build_animation_set(joad, "reverse"); // Reverse doesn't exist
            Dialogue("Dying Dwarf", "Wait!... with all my str-*cough*... one more *hack*... line...");
            Wait(0.5);
            Debug("TODO: SFX: Writing noises.");

            // Joad adds name to line.
            Quest("joadLine", 1);
            
            // Wait(2);
            Dialogue(P_NAME, "Hey, stay with me!");
            Wait(1);
            Dialogue("Dying Dwarf", "...");
            Dialogue(P_NAME, "(I think he's passed on... but I think he finished writing his note. Let's see...)");
            
            Dialogue(P_NAME, "._._._ Sergeant Joad... so that was his name."); // JOAD_text
            
            // Check if you get the reused note or the note with the Squad Report on it
            if  (Quest("joadNoteReuse") == 1) {
                Note("build", "take", "Sgt. Joad's Note (Reused)");
                DialogueItem("Got Sgt. Joad's Note.");
            }
            
            // Or just get the normal one
            else {
                Note("build", "take", "Sgt. Joad's Note");       
            }
            
            //Regardless, for the player you get the Sgt Joad Note 
            DialogueItem("Got Sgt. Joad's Note.");
            
            // Player reached Rebel Base
            if (Quest("areaTnnRebels") == 1)
            {
                Dialogue(P_NAME, "(Since he's a soldier, I should report this to the L.O.N.G.I.N.U.S. rebels...)");
            }
            else
            {
                Dialogue(P_NAME, "(I wonder if these L.O.N.G.I.N.U.S. fellows I'm looking for could help me with this mystery.)");
            }
        }
        else
        {
            // Wait(2);
            Dialogue(P_NAME, "Hey, stay with me!");
            Wait(1);
            Dialogue("Dying Dwarf", "...");
            Dialogue(P_NAME, "(I think he's passed on... let's see what this says...)");    
            
            Dialogue(P_NAME, "(._._._ It looks like he's a soldier of some kind... )"); // SOLDIER_text
        
            // Check if you get the reused note or the note with the Squad Report on it
            if  (Quest("joadNoteReuse") == 1) {
                Note("build", "take", "Dead Soldier's Note (Reuse)");
            }
            
            // Or just get the normal one
            else {
                Note("build", "take", "Dead Soldier's Note");                
            }
            
            //Regardless, for the player you get the Dead Soldier Note
            DialogueItem("Got the Dead Soldier's Note.");
            
            // Player reached Rebel Base
            if Quest("areaTnnRebels")
            {
                Dialogue(P_NAME, "Maybe I should take this to the L.O.N.G.I.N.U.S. rebels...)");
            }
            else
            {
                Dialogue(P_NAME, "(Well... I guess I'm responsible for this now...)");
            }
        }
        
        Quest("joadProcess", 1);
        Execute(event_sw1_joad01);
    }

    
    
    //-----------------------------------------------------------
    // post_choice_snippet
    //-----------------------------------------------------------
    
    // every choice sends you to this point.
    // joad will cough, and his life will reduce by 1
    // if his life is 0, we go to the dead snippet. if not, we build the event again, which loops us up to "choice" again.
    with (post_choice_snippet)
    {
        scr_event_build_animation_play(joad, "cough");
        //TODO: scr_event_build_sound_play(sn_cough);
        Wait();
        // Decrease dwarf's life
        // (Remember how the new scripting works? The life is actually about to be BUILT to drop to -1, 
        //  but it is 0 when the Dead Snippet is travelled to.)
        QuestAdd("joadLife", -1);
        
        // Go to dead_snippet
        if (Quest("joadLife") == 0)
        {
            Snippet(dead_snippet);
        }
        // Re-execute script, carrying updated variables into the next iteration.
        Execute(event_sw1_joad01);
    }

    
    //-----------------------------------------------------------
    // dead_snippet
    //-----------------------------------------------------------
    with (dead_snippet)
    {
        Dialogue("Dying Dwarf", "...");
        Wait(2);
        Dialogue(P_NAME, "(I think he's passed on...)");
        
        // Update Quest State: Failure
        
        // Update Quest State: Tattered Paper
        if (Note("have", "Tattered Paper") == true)
        {
            Quest("joadQuest", 3);
        }
        // Update Quest State: Ancient Scroll
        else if (Note("have", "Ancient Scroll") == true)
        {
            Quest("joadQuest", 4);
        }
        // Update Quest State: No Paper (can get Bloody Paper)
        else
        {
            Quest("joadQuest", 1);
        }
        
        scr_event_build_end();
    }
    
    
    
    //-----------------------------------------------------------
    // MAIN EVENT
    //-----------------------------------------------------------
    /* The event begins by checking the value of joadQuest, which is 1 or greater if the quest has been completed.
       If it is 1, Joad still has the paper, and the player takes the "Bloody Paper" from his corpse, and then changes 
       the joadQuest state to 2
       If it is 2 or greater, Hoopz simply remarks that Joad is dead.
       If the value of joadQuest is 0, we check if "joadState" is 1. If it is, we are still in Joad's main question loop, 
       and we should launch back into it.
       It will take us to main_q_snippet, at the top of the page.
       Otherwise, we are talking to Joad for the first time. After the intro, "joadState" will change to 1, and we will 
       be put into the main loop.
    */ 
    with (event)
    {
        //-------------------------------
        // note giver for gaining an additional note!
        //-------------------------------
        
        var note = Note("selected");
        Note("selected", "");
        if (note != "")
        {
            //If you click EXIT
            if (note == "exit")
            {
                Dialogue(P_NAME, "Oh um, nevermind.");
                Snippet(main_q_snippet);
            }
            
            //If you click NONE
            else if (note == "none")
            {
                Dialogue(P_NAME, "Oh well, sike, I don't have any papers.");
                QuestAdd("joadLife", -1);
                Snippet(main_q_snippet);
            }
            
            //If you select a valid NOTE
            else if (note == "Love Letter") || (note == "Cornrow's Plea") || (note == "Wilmer's Amortization Schedule") || (note == "Aelfleda's Eviction")
            {
                Dialogue(P_NAME, "Go ahead and use this I guess, I won't need it.");   
                //TODO: give animation towards Joad
                
                //Make a variable that will change the note to a "reused" note
                Quest("joadNoteReuse", 1);
                
                // Lose selected paper
                Note("build", "give", note);
                DialogueItem("Gave the " + note + " to the Dying Dwarf.");
                Snippet(writing_snippet);
            }
            
            //Things he "doesn't have space", gets returned
            else if (note == "Printed Invitation") || (note == "Completed Application") || (note == "Pet Manifesto")
            {
                Dialogue(P_NAME, "Here! Use this!");
                //TODO: give animation towards Joad
                Dialogue("Dying Dwarf", "W-._._._ what is this?  Young._._._ something to write! Hurry!");
                Note("build", "select", "dying dwarf");    
            }
            
            //Things he doesn't understand, gets returned
            else
            {
                Dialogue(P_NAME, "Umm, will this work?");
                //TODO: give animation towards Joad
                Dialogue("Dying Dwarf", "W-._._._ what is this?  Young._._._ something to write! Hurry!");
                //Punishment for giving a bad note:
                QuestAdd("joadLife", -1);
                Note("build", "select", "dying dwarf");
            }
            scr_event_build_end();
        }
    
        if (Quest("joadProcess") == 1)
        {
            // If you have the Tattered Paper
            if (Note("have", "Tattered Paper") == true)
            {
                // Update Quest State: Tattered Paper + Dead Dwarf Note
                Quest("joadQuest", 6);
            }
            // If you have the Ancient Scroll:
            else if (Note("have", "Ancient Scroll") == true)
            {
                // Update Quest State: Ancient Scroll + Dead Dwarf Note
                Quest("joadQuest", 7);
            }
            // Update Quest State: Dead Dwarf Note
            else
            {
                Quest("joadQuest", 5);
            }
            
            QuestAdd("joadProcess", 2);
            
            // Increase joadGood by 1.
            QuestAdd("joadGood", 1);
            
            // END EVENT
            scr_event_build_end();
        }
        
        // Dead, didn't get paper yet.
        if (Quest("joadQuest") == 1)
        {
            Dialogue(P_NAME, "(He's gone._._._ but there's something sticking out of his pocket...)");
            // Gain Bloody Paper
            DialogueItem("Got the Bloody Paper!");
            Note("build", "take", "Bloody Paper");
            // Update Quest State: Bloody Paper
            Quest("joadQuest", 2);
        }
        
        // Dead, already got paper
        else if (Quest("joadQuest") >= 2)
        {
            Dialogue(P_NAME, "(He's gone... a goner.)");
        }
        
        // You are in the main loop, keep going until success... or failure!
        else if (Quest("joadState") == 1)
        {
            Snippet(main_q_snippet);
        } 
        
        // Autostart! Called from SCRIPT_START.
        else
        {
            Wait(0.75);
            scr_event_build_look(o_cts_hoopz, EAST);
            Emote("build", "exclamation", o_cts_hoopz, 0, 0);
            Wait(0.75);
            scr_event_build_camera_follow_frame(CAMERA_NORMAL, o_cts_hoopz, joad);
            Wait(1.5);
            scr_event_build_animation_play(joad, "cough");
            //scr_event_build_sound_play(sn_cough);
            Wait(0.5);
            scr_event_build_animation_play(joad, "cough");
            //scr_event_build_sound_play(sn_cough);
            Wait();
            scr_event_build_animation_play(joad, "cough");
            //scr_event_build_sound_play(sn_cough);
            Dialogue("Dying Dwarf", "Nnnh.. h-... help me... please, youngster.");
            scr_event_build_animation_play(joad, "cough");
            Wait();
            scr_event_build_move_to_point(o_cts_hoopz, o_cinema0.x, o_cinema0.y);
            Wait();
            scr_event_build_animation_play_and_set(o_cts_hoopz, "kneelHoldNE", "kneelHoldNE");
            Wait(0.3);
            Dialogue(P_NAME, "Whoa mister, are you all right?");
            Dialogue("Dying Dwarf", "Nnnh... not quite youngster... I think this dwarf's d-...");
            scr_event_build_animation_play(joad, "cough");
            //scr_event_build_sound_play(sn_cough);
            Wait();
            Dialogue("Dying Dwarf", "... numbered...");
            
            // Increase state to 1: Skip this section when script is re-executed to loop itself
            Quest("joadState", 1);
            
            // Go to Main Question Snippet
            Snippet(main_q_snippet);
        }
    }   
    scr_event_advance(event);
}