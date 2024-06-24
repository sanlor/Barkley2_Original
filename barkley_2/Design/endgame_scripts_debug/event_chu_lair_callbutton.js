// event_chu_lair_callbutton

/* event_chu_lobby_callbutton - NOTES
The lair Call Button! Much simpler.
        
TODOS:
    Door object and graphic.
    Teleport to elevator interior.
*/

if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
} else if (argument0 == SCRIPT_INTERACT) {
    // These are all useless but we can keep em!!!!
    var playerX1 = scr_quest_get_state("playerX1")
    var playerHoopz = scr_quest_get_state("playerHoopz")
    var playerCC = scr_quest_get_state("playerCC")
    var elevatorRide = scr_quest_get_state("elevatorRide")
    var cdwarfReformat = scr_quest_get_state("cdwarfReformat")
    var elevatorChastise = scr_quest_get_state("elevatorChastise")
    var elevatorCamp = scr_quest_get_state("elevatorCamp")
    var elevatorCSPieces = scr_quest_get_state("elevatorCSPieces")
    var csComplete = scr_quest_get_state("csComplete")

    var elevator_exterior = id;
    var door_open = scr_event_create_child(event);
    var event = scr_event_create_main();
    
    with (event) {
        // other stuff can go here
        scr_event_build_event_snippet(door_open);
    }
    
    with (door_open) {
        // the actual door stuff!!!!
    }
    scr_event_advance(event);
}