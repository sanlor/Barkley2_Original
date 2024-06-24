// Event for Firas Switch, involved in Dead Son quest.
// Note on Firas - deadSon 2 is activated in the sewers by finding his dead son from anywhere between Times 1-3. The quest ends automatically at 4 if it's not completed.
//deadson = 7 means you've completed quest, spoken to firas.
// deadSon = 6 means you completed the quest, haven't returned to Firas.
// deadSon = 5 Used for cutscene inside Firas' house.
// deadSon = 4 means Firas saw through your disguise and realized his son is dead
// deadSon = 3 means you're currently controlling the dead son who is in the sewers
// deadSon = 2 means the quest has been accepted
// deadSon = 1 means Firas has been spoken to but the quest was rejected
// deadSon = 0 means Firas hasn't been spoken to and the quest is not active*
// usage: event_tnn_firas01();

if (argument0 == SCRIPT_START) {
    //checks for deadSon 5
    if (scr_quest_get_state("deadSon") == 5) {
        scr_quest_set_state("deadSon", 6);
        script_execute(event_tnn_firasSwitch01, SCRIPT_INTERACT);
    }
}

if (argument0 == SCRIPT_STEP) {

}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var firasSwitch = id;
    var event = scr_event_create_main();
    with (event) {
        scr_event_build_fade(true, .1);
        scr_event_build_set_object(o_deadSonBath01, -500, -500); 
        scr_event_build_wait_for_actions();
        scr_event_build_fade(false, 2); 
        scr_event_build_wait_for_actions();
        //hoopz dump animation
        scr_event_build_fade(true, 2);
        scr_event_build_wait_for_actions();
        scr_event_build_teleport(r_tnn_marketDistrict01, 1032, 640);
    }
    scr_event_advance(event);
}
