/*

The AI Ruins Scanner Event!

*/

if (argument0 = SCRIPT_COLLISION_HOOPZ) {
    var scanner = id;
    var event = scr_event_create_main();
    
    with (event) {
        //TODO: GZ fix this!
        scr_event_build_dialogue_debug("Bhroom", s_port_bhroom01, "Put the scanner event here!");
    }
    scr_event_advance(event);
}
