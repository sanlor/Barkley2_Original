// event_chu_point_no_return
/* event_chu_point_no_return - NOTES
Interact, upon touching door to Point of No Return
*/ 
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {

    var playerX1 = scr_quest_get_state("playerX1")
   
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }
    //var _______ = scr_event_create_child(event);
    var pnr = id;
    var event = scr_event_create_main()

    with (event) {
        if (scr_quest_get_state("pointNoReturn") == 0) {
            if (scr_quest_get_state("cdwarfJoined") == 1) {
                scr_event_build_dialogue("Cyberdwarf", s_port_cd, "It's unlikely you will be able to return if you step through the screen, " + string(playerName) + ". Still, there is no time to delay. Hurry through!");
            }
            else {
                scr_event_build_dialogue(string(playerName), s_port_hoopz, "This is it... I don't think I'll be able to return if I step through here though...");
            }
        } else {
            if (scr_quest_get_state("cdwarfJoined") == 1) {
                scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Hurry through the screen, child!");
            }
            else {
                scr_event_build_dialogue(string(playerName), s_port_hoopz, "Ok... this is it...");
            }
        }
        var pnr_choice = scr_event_build_choice("Travel through the screen?", s_port_hoopz)
        var yes = scr_event_build_add_choice(pnr_choice, "Yes, travel through the screen.");
        var no = scr_event_build_add_choice(pnr_choice, "No, wait.");
        with (yes) {
            // TELEPORT
        } 
        with (no) {
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "I... I can't do it.");
            if (scr_quest_get_state("cdwarfJoined") == 1) {
                scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You must proceed, " + string(playerName) + ". You must!");
            }
        }
    }
    scr_event_advance(event);
}