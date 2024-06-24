// scr_event_build_script_conclude()
// PLACE ONLY AT THE END OF *****Script.b2s !!!

/* 
    bort sez:
    For the time being, this script should be the final line in any hacking script.
    That is, when you are running *****Script.b2s, this should be the final line.
    It will execute and run the event with the correct "conclusion" to the script.
    Eventually this should be "built in" in a way that it happens invisibly.
    Removing this line will ensure that the script does not undergo "verification",
    as in, confirming that it is written "correctly" and consists only of "whitelisted"
    commands and variables.
    
    If it is not present, the player is required to interact with the Executor twice,
    if they are looking to play honestly.
*/
    
// holds the script to execute
var _script = event_empty;

// select script based on which computer the player is using
switch (scr_quest_get_state("hackSite"))
{
    case "power": _script = event_wst_powerExecutor01; break;
    //case "tnn": _script = event_tnn_compExecutor01; break;
    //case "guilder": _script = event_bct_guilderExecutor01; break;
    //case "prison": _script = event_min_prisonExecutor01; break;
}
// reset hackSite quest variable
scr_quest_set_state("hackSite", "");

// run confirmation script
scr_event_build_execute_event_script(_script);
