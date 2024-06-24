// scr_event_build_hack_finalize()

/*
    bort sez:
    This script should be called to do whatever is necessary to "save"
    a correctly-parsed script after it has run through scr_hack_validate().
    The variables changed in the hacking script should be saved, and 
    replace the player's regular save file.
    
    It is the opposite of scr_event_build_hack_reset().
    It is only in a build event for the sake of this prototype.
    Put this functionality wherever!
*/

scr_event_build_dialogue_debug("HACKING", NULL, "The script is correctly formatted and acceptable to the hacking site. It follows through, and the quest data that was changed is now saved!");
