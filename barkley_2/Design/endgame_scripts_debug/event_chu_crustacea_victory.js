// event_chu_crustacea_victory

/* event_chu_crustacea_victory - NOTES
Start, called, upon killing CuchuCrustacea
For debug purposes, we will link it inside an object.
*/
if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_get_state("playerX1")
    
    var hellhour = 1
    if hellhour != 0 {
        var hellhourstr = string(hellhour) + " hours, "
    } else {
        var hellhourstr = ""
    }
    var hellminute = 24
    if hellminute == 0 {
        var hellminutestr = ""
    } else {
        var hellminutestr = string(hellminute) + " minutes, and"
    }
    var hellsecond = 27
    var hellsecondstr = string(hellsecond) + " seconds!"
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }

    var victory = id;
    var event = scr_event_create_main()
    with (event) {
        var results = scr_event_build_choice("What happened?", s_port_hoopz);
        var won = scr_event_build_add_choice(results, "I won.");
        var lost = scr_event_build_add_choice(results, "I lost.");
        with (won) {
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuCrust, "What... no! That's not possible!");
            // LONG ASS ANIMATION
            // WEIRD PORTAL OPENS ON SCREEN
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "You're too late! All power diverted to engines! Faster, faster!");
            // SCREEN STARTS COUNTING DOWN A TIMER
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuAI, "Time to hell... " + hellhourstr + hellminutestr + hellsecondstr);
            // CUCHULAINN DISAPPEARS
            if (scr_quest_get_state("cdJoined") == 1) {
                scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Quickly, " + string(playerName) + "! After him!");
            }
            scr_event_build_quest_state("crustDead", 1);
        }
        with (lost) {
            // teleport
        }
    } 
    scr_event_advance(event);
}