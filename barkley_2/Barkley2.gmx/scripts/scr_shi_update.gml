// scr_shi_update

// This will engage after Time 9 OR if you've advanced her quest state to 2 (spoken to her twice)
// Shi will then bounce back and forth between Happy and Sad, which will trigger her object to either
// activate or deactivate in that particular area.

/*var currentTime = scr_time_get();

if (scr_time_get() >= 9) or (scr_quest_get_state("shiState") >= 2) {
    // advance the shiSwitch to check if she should get over her latest heartbreak
    // Quest("shiSwitch", +1); // add one
    
    // Switch Shi from Happy to Sad State
    if (scr_quest_get_state("shiHappy") == 1) {
    
        // Check to see if these parameters are correct, if so, stop running shiUpdate
        if (scr_quest_get_state("shiReset") <= 2) {
            Quest("shiReset", (scr_quest_get_state("shiReset") + 1));
            }
        // Set Shi to be Sad
        else {
            Quest("shiReset", 0);
            Quest("shiHappy", 0);
        }
    }
        
    // Switch Shi from Sad to Happy State 
    else if (scr_quest_get_state("shiHappy") == 0) {
        
        // Check to see if these parameters are correct, if so, stop running shiUpdate
        if (scr_quest_get_state("shiReset") <= 2) {
            Quest("shiReset", (scr_quest_get_state("shiReset") + 1));
        }
        // Set Shi to be Happy
        else {
            Quest("shiReset", 0);
            Quest("shiHappy", 1)
        }
    }
}
