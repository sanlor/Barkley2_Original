// Quiz Payphone // Answer the call, answer the quests, get rewarded //
// Initialize //
if (argument0 == SCRIPT_START) {
   
} 

// Step //
if (argument0 == SCRIPT_STEP) {

}

// Interact //
else if (argument0 == SCRIPT_INTERACT) {

    // Variables //
    var event = scr_event_create_main();
    
    // Main event //
    with (event) {
            
            // Payphone 01 //
            if scr_quest_get_state("quizphone1") == 0 {
                
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hello...?");
                scr_event_build_dialogue("Voice", NULL, "Good morning, caller! Welcome to the show! It's the Blitzing Hour so aren't going to waste any time! I hope you are ready to tackle the questions because here they come!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "What?");
                scr_event_build_dialogue("Voice", NULL, "Here is question number one! Listen carefully!");

                // Question 1-1 // ------------------------------------------------------------------------------------------------------------
                var questions1 = scr_event_build_choice("Question 1", NULL); 
                
                    // Answer 1-1 A //
                    var answer1 = scr_event_build_add_choice(questions1, "Answer 1");
                    with answer1 {
                    
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Answer");
                        scr_event_build_dialogue("Voice", NULL, "Oh no! What misfortune! That is the WRONG answer! Looks like you won't be making the finals, but thank you for calling! we REALLY appreciate it!");
                        // TODO: *Click* *---- ---- ----*
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "H-hello? He just hang up on me...");
                        }

                    // Answer 1-1 B //
                    var answer2 = scr_event_build_add_choice(questions1, "Answer 2");
                    with answer2 {
                    
                        
                        }
    
                    // Answer 1-1 C //
                    var answer3 = scr_event_build_add_choice(questions1, "Answer 3");
                    with answer3 {
                    
                        // CORRECT ANSWER 1 // -----------------------------------------------------------------------------------------------
                        // Question 1-2 //
                        var questions2 = scr_event_build_choice("Question 2", NULL); 
                        
                            // Answer 1-2 A //
                            var answer1 = scr_event_build_add_choice(questions2, "Answer 1");
                            with answer1 {
                            
                                // CORRECT ANSWER 2 // -----------------------------------------------------------------------------------------------
                                // Question 1-3 //
                                var questions3 = scr_event_build_choice("Question 3", NULL); 
                                
                                    // Answer 1-3 A //
                                    var answer1 = scr_event_build_add_choice(questions3, "Answer 1");
                                    with answer1 {
                                    
                                        
                                        }
                
                                    // Answer 1-3 B //
                                    var answer2 = scr_event_build_add_choice(questions3, "Answer 2");
                                    with answer2 {
                                    
                                        
                                        }
                    
                                    // Answer 1-3 C //
                                    var answer3 = scr_event_build_add_choice(questions3, "Answer 3");
                                    with answer3 {
                                    
                                        
                                        }
                
                                    // Answer 1-3 D //
                                    var answer4 = scr_event_build_add_choice(questions3, "Answer 4");
                                    with answer4 {
                                    
                                        // CORRECT ANSWER 3 // -----------------------------------------------------------------------------------------------
                                        // YOU WIN //
                              
                                        }
                                }
        
                            // Answer 1-2 B //
                            var answer2 = scr_event_build_add_choice(questions2, "Answer 2");
                            with answer2 {
                            
                                
                                }
            
                            // Answer 1-2 C //
                            var answer3 = scr_event_build_add_choice(questions2, "Answer 3");
                            with answer3 {
                            
                                
                                }
        
                            // Answer 1-2 D //
                            var answer4 = scr_event_build_add_choice(questions2, "Answer 4");
                            with answer4 {
                            
                                
                                }
                        }

                    // Answer 1-1 D //
                    var answer4 = scr_event_build_add_choice(questions1, "Answer 4");
                    with answer4 {
                    
                        
                        }
                }
    }
    scr_event_advance(event);
}
