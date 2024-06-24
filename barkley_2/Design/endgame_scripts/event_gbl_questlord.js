// event_gbl_questlord

if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var cdwarfcinema = scr_quest_get_state("cdwarfCinema");
    var prevRoom = scr_quest_get_state("rmDebugPrevRoom");
    var prevX = scr_quest_get_state("rmDebugPrevX");
    var prevY = scr_quest_get_state("rmDebugPrevY");
    var roomName = room_get_name(room)
    var playerX1 = scr_quest_get_state("playerX1")
    
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }

    var questlord = id;
    var event = scr_event_create_main()
    with (event) {
        var ql_choice = scr_event_build_choice("Do what?", s_port_hoopz);
        // Choices
        var cdwarfup = scr_event_build_add_choice(ql_choice, "Advance Cyberdwarf Cinema state.");
        with (cdwarfup) {
            scr_event_build_quest_state("cdwarfCinema", cdwarfcinema + 1);
            scr_event_build_dialogue("Quimlobe", NULL, "Now it's " + string(cdwarfcinema + 1) + " ok???");
            cdwarfcinema += 1
        }
        var cdwarfdown = scr_event_build_add_choice(ql_choice, "Decrease Cyberdwarf Cinema state.");
        with (cdwarfdown) {
            scr_event_build_quest_state("cdwarfCinema", cdwarfcinema - 1);
            scr_event_build_dialogue("Quiltlong", NULL, "Now it's " + string(cdwarfcinema - 1) + " ok???");
            cdwarfcinema -= 1
        }
        if (roomName != "r_barkleypond01") {
            var die = scr_event_build_add_choice(ql_choice, "Die in " + string(roomName) + ".");
            with (die) {
                scr_event_build_teleport(r_commonarea01, 392, 432); 
            }
            if (scr_quest_get_state("rmComplete") == 0) {
                var rm_tele = scr_event_build_add_choice(ql_choice, "Teleport to Round Mound.");
                with (rm_tele) {
                    scr_event_build_quest_state("rmDebugPrevRoom", roomName);
                    scr_event_build_quest_state("rmDebugPrevX", o_hoopz.x);
                    scr_event_build_quest_state("rmDebugPrevY", o_hoopz.y);
                    scr_event_build_teleport(r_barkleypond01, 120, 376);
                }
            }
        } 
        else if (roomName == "r_barkleypond01") {
            var rm_init = scr_event_build_add_choice(ql_choice, "Randomize Round Mound properties.");
            with (rm_init) {
                scr_event_build_dialogue("Quarklord", NULL, "Not working right now!");
            
            } var rm_exe = scr_event_build_add_choice(ql_choice, "Execute Round Mound.");
            with (rm_exe) {
                scr_event_build_execute_event_script(scr_gbl_round_mound01);
            } var rm_return = scr_event_build_add_choice(ql_choice, "Return to previous room - " + string(prevRoom) + ".");
            with (rm_return) {
                scr_event_build_teleport(prevRoom, prevX, prevY);
            }    
        }
        var rm_check = scr_event_build_add_choice(ql_choice, "Check Round Mound goal/alignment/points.");
        with (rm_check) {
            scr_event_build_dialogue("Quakeloan", NULL, "Not working right now!");
        }
        
    } 
    scr_event_advance(event);
}