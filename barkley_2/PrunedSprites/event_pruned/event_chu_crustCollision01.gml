// the collision point that sends you into the CuchuCrustacea battle
// 
if (argument0 == SCRIPT_START) {
    scr_actor_unsetRigid(id);
} 
else if (argument0 == SCRIPT_STEP) {
    //if (scr_quest_get_state("crustDead") == 1) {
    //    scr_event_destroy_instance()
    //}
}
else if (argument0 == SCRIPT_COLLISION_HOOPZ) {
    var movey = o_hoopz.y;
    var movex = o_hoopz.x;    
    // 352
    var elevator_exit = id;
    var event = scr_event_create_main();
    
    with event {
        /*
        if (scr_quest_get_state("crustCombat") == 0) {
            
            if (scr_quest_get_state("playerX1") == 1) {
                scr_event_build_quest_state("crustDoorSolo", 2);
            }
            else if (scr_quest_get_state("csComplete") == 1) {
                scr_event_build_quest_state("crustDoorComplete", 2);
            }
            else {
                scr_event_build_quest_state("crustDoorIncomplete", 3);
            }
            scr_event_build_move_to_point_ext(o_cts_hoopz, 168, movey, 10);
            scr_event_build_camera_move_to_point(168, movey, 10);
            //scr_event_build_move_to_point(o_cts_hoopz, 232, 184);
            //scr_event_build_camera_move_to_point(232, 184, 10);
            scr_event_build_wait(1.5);
            //scr_event_build_wait_for_actions();
            scr_event_build_quest_state("crustCombat", 1);
            scr_event_build_animation_play_and_set(o_chu_crustSeal01, "closing", "closed");
            scr_event_build_visible(o_chu_crustSeal01, true);
            scr_event_build_sound_play("sn_partitioning02"); // TODO
            scr_event_build_wait_for_actions();
            //scr_event_build_camera_move_to_point(168, movey, 10);
            //scr_event_build_camera_reset()
            scr_event_build_execute_event_script(event_chu_crustEntrance01);
        }
        */
    }
    scr_event_advance(event);
}
