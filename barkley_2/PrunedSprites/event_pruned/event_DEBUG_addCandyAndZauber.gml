// Spawns the crabcommando

if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var event = scr_event_create_main();
    var borkbork = id;

//--------------------------------------------
//-------------- MAIN EVENT ------------------
//--------------------------------------------   
       
    with (event) {
        scr_event_build_dialogue("Ball of DeBuggs", s_port_wilmer, "I'm giving you a B-Ball candy and a Test Zauber.");
        scr_event_build_dialogue("Ball of DeBuggs", s_port_wilmer, "Here is the Candy.");
        scr_event_build_candy_give("B-Ball");
        scr_event_build_wait(1);
        scr_event_build_dialogue("Ball of DeBuggs", s_port_wilmer, "Here is the Zauber.");
        scr_event_build_zauber_give("Test Zauber");
        scr_event_build_wait(1);
        scr_event_build_dialogue("Ball of DeBuggs", s_port_wilmer, "Bye bye!");
        scr_event_build_disappear(borkbork);
    }
    
    scr_event_advance(event);
}
