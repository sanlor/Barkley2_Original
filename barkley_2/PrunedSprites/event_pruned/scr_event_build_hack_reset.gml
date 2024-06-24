// scr_event_build_hack_reset();

/*
    bort sez:
    This script should be called to do whatever is necessary to "reset"
    a script that fails after it has run through scr_hack_validate().
    The player's variable changes need to be reset to the state of the
    save file they had when they first spoke with the Executor.
    
    It is the opposite of scr_event_build_hack_finalize().
    It is only in a build event for the sake of this prototype.
    Put this functionality wherever!
*/

scr_event_build_dialogue_debug("RESET", NULL, "This script will reset the variables changed in the script to their previous values, perhaps by loading up the duplicated game save.");
