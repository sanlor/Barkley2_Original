// event_chu_confrontation_x1

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
    var confrontation_x1 = id;
    var event = scr_event_create_main()
    with (event) {
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "There you are, Cuchulainn!");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Yes... here we are... Hell approaches faster and faster. Your final resting place!");
        if (QVAR("wiglafMission") >= 1) { // On Wiglaf's quest
            // Looking to kill Cuchulainn
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "I'm beating you... and finding Cyberdwarf! Take this!")
        }
        else if (QVAR("wiglafMission") == 0) { // Not on Wiglaf's quest
            // Looking for Cyberdwarf
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "If you won't tell me where Cyberdwarf is, I'll beat it out of you. Take this!")
        }
        // BATTLE BEGINS
    }
    scr_event_advance(event);
}