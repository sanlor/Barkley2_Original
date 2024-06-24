// Tatijana the Doctor, runs the clinic in Tir na Nog //
// Should be able to do more than just greet you now that you don't interact with her regarding the sewers

/* Old Dialogue, from Sewers
    Dialogue(P_NAME, "What?");
    Dialogue("Dr. Tatijana", "You're either trying to escape from Tir na Nog or trying to join L.O.N.G.I.N.U.S. Don't bother.");
    Dialogue(P_NAME, "Wait, how come? What's the matter?");
    Dialogue("Dr. Tatijana", "Because people who go in the sewers don't come out. Most people know someone who's tried to escape or gone to find the rebels. They know maybe two or three people who are gone now. But I'm a doctor. I'm here. I see every single dwarf who goes in there, dozens, hundreds, and I also see the handful that comes back. So don't bother.");
    Dialogue(P_NAME, "I'll remember that...");
    Quest("tatijanaState", 1);
*/

if (argument0 == SCRIPT_START)
{   
 
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Variables //
    var tatijana = id;    
    var event = scr_event_create_main();    
    var ailment_snippet = scr_event_create_child(event);
    var question_snippet = scr_event_create_child(event);
    
    var treatment_snippet = scr_event_create_child(event);
    
    // Tell about your ailment(s) //
    with (ailment_snippet)
    {
        Dialogue("Dr. Tatijana", "Ailment?");
         
        // Choice: What ails you? //   
        var ailment = Choice("What seems to the be problem?", s_port_hoopz);
        
        // Amnesia //  
        var amnesia = ChoiceAdd(ailment, "Amnesia.");
        with (amnesia)
        {
            Dialogue(P_NAME, "I don't know who I am or where I came from... I think I might have been born out of an egg.");
            Snippet(treatment_snippet);
            if (Quest("tatijanaGrapes") == 1)
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes.");
                Dialogue(P_NAME, "Okay...");
            }
            else
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes, grapes.");
                Dialogue(P_NAME, "Wait, how are grapes going to help me?");
                Dialogue("Dr. Tatijana", "They contain an abundance of vitamins and plenty of other important things. You aren't allergic, are you?");
                Dialogue(P_NAME, "No, I don't think so.");
                Dialogue("Dr. Tatijana", "Good. Come and see me in a week.");
                Dialogue(P_NAME, "Okay...");
            }
        }
        
        // Anxiety //
        var anxiety = ChoiceAdd(ailment, "Anxiety.");
        with (anxiety)
        {
            Dialogue(P_NAME, "I feel like the walls are closing in on me.");
            Snippet(treatment_snippet);
            if (Quest("tatijanaGrapes") == 1)
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes.");
                Dialogue(P_NAME, "Okay...");
            }
            else
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes, grapes.");
                Dialogue(P_NAME, "Wait, how are grapes going to help me?");
                Dialogue("Dr. Tatijana", "They contain an abundance of vitamins and plenty of other important things. You aren't allergic, are you?");
                Dialogue(P_NAME, "No, I don't think so.");
                Dialogue("Dr. Tatijana", "Good. Come and see me in a week.");
                Dialogue(P_NAME, "Okay...");
            }
        }
        
        // Pain //
        var anxiety = ChoiceAdd(ailment, "Pain.");
        with (anxiety)
        {
            Dialogue(P_NAME, "I hurt a lot. I ache all over.");
            Snippet(treatment_snippet);
            if (Quest("tatijanaGrapes") == 1)
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes.");
                Dialogue(P_NAME, "Okay...");
            }
            else
            {
                Dialogue(P_NAME, "Grapes?");
                Dialogue("Dr. Tatijana", "Yes, grapes.");
                Dialogue(P_NAME, "Wait, how are grapes going to help me?");
                Dialogue("Dr. Tatijana", "They contain an abundance of vitamins and plenty of other important things. You aren't allergic, are you?");
                Dialogue(P_NAME, "No, I don't think so.");
                Dialogue("Dr. Tatijana", "Good. Come and see me in a week.");
                Dialogue(P_NAME, "Okay...");
            }
        }
        
        // Question - Nothing for now, until we make a purpose for her //
        /*
        var question = ChoiceAdd(ailment, "I've got a question...");
        with (question)
        {
            Dialogue(P_NAME, "I've got a question...");
            Dialogue("Dr. Tatijana", "");
            Dialogue(P_NAME, "");
        }
        */ 
            
        // Nothing... //
        var nothing = ChoiceAdd(ailment, "Nothing...");
        with (nothing)
        {
            Dialogue(P_NAME, "Nothing...");
            Dialogue("Dr. Tatijana", "Then why are you here?");
            Dialogue(P_NAME, "I don't know. Bye.");
        }             
    }
    
    //---------------------------------------------------------------------------------
    // Question Event
    //---------------------------------------------------------------------------------
    with (treatment_snippet)
    {
        Debug("Dr. Tatijana looks up at Hoopz."); //TODO
        Wait(1.3);
        Dialogue("Dr. Tatijana", "Grapes, twice a day.");
        Debug("Dr. Tatijana looks back down."); //TODO
        
        if (Quest("tatijanaGrapes") == 1)
        {
            Dialogue(P_NAME, "Grapes?");
            Dialogue("Dr. Tatijana", "Yes.");
            Dialogue(P_NAME, "Okay...");
        }
        else
        {
            Dialogue(P_NAME, "Grapes?");
            Dialogue("Dr. Tatijana", "Yes, grapes.");
            Dialogue(P_NAME, "Wait, how are grapes going to help me?");
            Dialogue("Dr. Tatijana", "They contain an abundance of vitamins and plenty of other important things. You aren't allergic, are you?");
            Dialogue(P_NAME, "No, I don't think so.");
            Dialogue("Dr. Tatijana", "Good. Come and see me in a week.");
            Dialogue(P_NAME, "Okay...");
        }
    } 
    
    //---------------------------------------------------------------------------------
    // Question Event
    //---------------------------------------------------------------------------------
    with (question_snippet)
    {

    } 
    
    //---------------------------------------------------------------------------------
    // Main Event
    //---------------------------------------------------------------------------------
    with (event)
    {
        // Player is Matthias
        if (BodySwap() == "matthias")
        {
            Dialogue("Dr. Tatijana", "M-Matthias? Is that you? Clispaeth Christ, what happened? You look like you died! Lay down on the bed, let me treat you!");
            Dialogue("Matthias", "You're right that I'm 100% for sure the real Matthias, but I DEFINITELY didn't die! I'm feeling fit as a fiddle! Boy, do I feel healthy! Well, I've got some triathlons to compete in, see ya!");
        }
        // Player is Governor
        else if (BodySwap() == "governor")
        {
            Dialogue("Dr. Tatijana", "You... you're the new Governor, right? I didn't expect to see you here. What brings you to the clinic, Mr. Governor?");
            Dialogue("Governor Elagabalus", "Hello! Hello, good citizen! I'm just doing my neighborhood watch duty and patrolling our great city. Keep an eye out for scofflaws and roustabouts! You never know where they'll turn up. Well, goodbye citizen!");
        }
        
        //-------------------------------------------
        // Normal States
        //-------------------------------------------
        // DOES NOT EXIST - Banned from Tir na Nog
        /*
        else if (Quest("tnnBan") == 1) then
            {
            Dialogue("Dr. Tatijana", "I'm not going to ask what you did. They did it to me too. I know whatever you did was for the good of the people in Tir na Nog. I guess the difference between you and me is that you're not afraid to put others first when it counts most. You can stay here as long as you need, but at this point, the people outside of Tir na Nog need you more.");
            Dialogue(P_NAME, "Do you know how I can get out of here?");
            Dialogue("Dr. Tatijana", "The sewers are a big place. I don't know the way out, but I know there is a Duergar maintained plantation on the first floor of the sewers. I wouldn't go there if I were you.");
            Dialogue(P_NAME, "Alright, thank you.");
            Dialogue("Dr. Tatijana", "Yeah. Be careful.");
            }
        */
        // Filler dialog //
        //else if (Quest("tatijanaState") == 1) // Not in sewers anymore
        //{
        //    Dialogue("Dr. Tatijana", "We're lucky. Sometimes rebels can limp their way back here. Sometimes old Turald fishes out people who have washed up on the sewer bank over there. Sometimes people are fast enough to get away. Those are the people I can help. But most people who go in there never come back.");
        //}
        else
        {
            Snippet(ailment_snippet);
        }
    }
        
    scr_event_advance(event);
}
