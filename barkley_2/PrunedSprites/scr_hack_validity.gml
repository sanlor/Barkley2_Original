// scr_hack_validity()

/*
    bort sez:
    This script eventually will verify that the contents of the *****Script.b2s,
    upon execution, is not either:
    
    a) using commands that are illegal to the b2script parser.
    b) using scripts or changing variables that are not in the current
        hacking site's "whitelist."
    c) being stopped by the inherent properties of the hacking unit
        (ie. at the power station, the player sends power to too many places)
    
    This temporarily simply chooses true or false randomly, but this will 
    likely be a fairly lengthy script! Some pseudocode should give an 
    example of what should be performed.

    false will run scr_event_build_hack_reset();
    true will run scr_event_build_hack_finalize();
*/
/*

/// STEP ONE: Fail if there are parser issues.
/// This should pop up some kind of on-screen indication for the player.
/// It should possibly be contained in the hacking minigame object itself.

if ( scr_hack_parser_failed() ) { return false }

var site = scr_quest_get_state("hackSite");

/// STEP TWO: Fail if the script strays from the script/variable "whitelist"
/// This should pop up some kind of on-screen indication for the player.
/// This could occur on the hack Screen object, some kind of "bad command
/// or filename" kind of stuff.

else if ( scr_hack_whitelist_failed(site) ) { return false; }

/// STEP THREE: Fail if the script fails in a manner specific to the hacking site.
/// This requires a built in command based on the site itself.
/// Ex. at the power station, each quest change decreases the "power available."
/// If it reaches below zero, the script fails and none of the changes are saved.

else if ( scr_hack_whitelist_failed(site) ) { return false; }

else { return true; }

*/

var result = choose(true, false);

return result;
