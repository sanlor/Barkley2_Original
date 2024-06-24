// event_chu_confrontation_reformat

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
    
    var confrontation_reformat = id;
    var event = scr_event_create_main()
    with (event) {
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "There you are, Cuchulainn!");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Yes... here we are... Hell approaches faster and faster. Your final resting place!");
        if (scr_quest_get_state("csComplete") == 0) {
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Even without Cyberdwarf, and even without the Cyberspear... you're no match for me Cuchulainn! Take this!");
            // NO CHOICE: Fight
        }
        else if (scr_quest_get_state("csComplete") == 1) {
            // CHOICES: Throw, Keep?
            // CHOICES: Throw, Destroy?
            // NO CHOICE: Throw?
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Not by a long shot, Cuchu!")
            var throw_choice = scr_event_build_choice("What do you do?", s_port_hoopz);
            var throw_cs = scr_event_build_add_choice(throw_choice, "Throw the Cyberspear.");
            var destroy_cs = scr_event_build_add_choice(throw_choice, "Destroy the Cyberspear.");
            with (throw_cs) {
                scr_event_build_dialogue(string(playerName), s_port_hoopz, "Hiiiiiiiyah!");
                // cyberspear bounces off
                // possibly seals him in spear
                scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Gwahahahaha... stick with your gun's, kid!");
            }
            with (destroy_cs) {
                scr_event_build_dialogue(string(playerName), s_port_hoopz, "Heh! I don't even need that piece of junk. It's me and you now, Cuchu! Take this!");
                // destroys cyberspear
            } 
        } 
        // BATTLE BEGINS
    }
    scr_event_advance(event);
}