// event_chu_crustVictory01

/* event_chu_crustVictory01 - NOTES
Interact, called upon killing CuchuCrustacea
For debug purposes, we will link it inside an object.

Now displays actual remaining clockTime!
*/
/*if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_get_state("playerX1")
    
    var victory = id;
    var event = scr_event_create_main()
    with (event) {
        if (scr_quest_get_state("crustDead") == 1) {
            scr_event_build_wait_for_actions();
            scr_event_build_execute_event_script(event_chu_pointNoReturn01);
        }
        scr_event_build_quest_state("crustCombat", 0);
        var results = scr_event_build_choice("What happened?", s_portrait);
        var won = scr_event_build_add_choice(results, "I won.");
        var lost = scr_event_build_add_choice(results, "I lost.");
        with (won) {
            // update quest variables
            scr_event_build_camera_shake(2, 0);
            //this does nothing but it's a variable used by Wiglaf and if it's 2, it's no longer a loose end.
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "What... no! That's not possible!");
            scr_event_build_dialogue_debug("bort", NULL, "The screens go crazy, the lobster head spurts blood, something like that.");
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "You're still too late! All power diverted to engines! Faster, faster!");
            scr_event_build_dialogue_debug("bort", NULL, "More crazy animations, maybe some weird effect goes down the entire screen. Cuchulainn accelerates the passage to Hell!");
            scr_event_build_dialogue("Cuchulainn", "s_port_cuchuCrust", "Yes, faster, faster! Time to Hell... " + string(global.clockHours) + " hours, " + string(global.clockMinutes) + " minutes, and " + string(global.clockSeconds) + " seconds!");
            // SCREEN STARTS COUNTING DOWN A TIMER 
            scr_event_build_dialogue_debug("bort", NULL, "There is now a number on-screen, counting down the time until game-end.");
            // TODO: build timer
            scr_event_build_camera_shake(false, 0);
            scr_event_build_camera_shake(5, 0.4);
            scr_event_build_wait(2);
            scr_event_build_dialogue_debug("bort", NULL, "A crazy animation needs to play here! Cuchu Crustacea is defeated and crawls back into itself and dries out.");
            scr_event_build_animation_play_and_set(o_chu_crustBody01, "dying", "dead");
            scr_event_build_wait_for_actions();
            scr_event_build_camera_shake(10, 0.3);
            scr_event_build_camera_shake(0.5, 0);
            scr_event_build_dialogue_debug("bort", NULL, "There is now a rift in the screen behind it, with some kind of swirling background.");
            scr_event_build_quest_state("crustDead", 1);
            scr_event_build_visible(o_chu_pointNoReturn01, true);
            scr_event_build_animation_play_and_set(o_chu_pointNoReturn01, "opening", "open");
            scr_event_build_dialogue_debug("bort", NULL, "It's the gate to Cuchu Cloaca!");
            scr_event_build_camera_shake(false, 0);
            if (scr_quest_get_state("cdwarfPresent") == 1) {
                scr_event_build_dialogue("Cyberdwarf", CD_PORT, "Now, " + P_NAME + "! After him!");
            }
            scr_event_build_dialogue_debug("bort", NULL, "Hoopz and Cyberdwarf could advance on the Point of No Return and begin in immediately... or, they're allowed to walk up and touch it.");
            scr_event_build_dialogue_debug("bort", NULL, "What do you think?");
            var choice = scr_event_build_choice("Do you automatically advance?", s_portrait);
            var yes = scr_event_build_add_choice(choice, "Yes, the player should automatically advance on the Point of No Return.");
            with (yes) {
                scr_event_build_move_to_point_ext(o_cts_hoopz, 240, 136, 8);
                scr_event_build_wait_for_actions();
                scr_event_build_execute_event_script(event_chu_crustVictory01);
            }
            var no = scr_event_build_add_choice(choice, "No, the player should have to walk up to the Point of No Return and interact with it.");
            with (no) {
                scr_event_build_end();
            }
        }
        with (lost) {
            // teleport
            scr_event_build_dialogue_debug("bort", NULL, "You should be teleported out of here. Ya died!");
            Stat("hp", "-150%");
            //scr_event_build_execute_event_script(event_chu_die01);
        }
    } 
    scr_event_advance(event);
}
