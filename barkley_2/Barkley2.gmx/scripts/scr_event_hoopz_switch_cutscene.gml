/// scr_event_hoopz_switch_cutscene()
/// Deactivates Hoopz and spawns a cutscene version of him. Call this when you
/// want to start a cutscene.

if (instance_exists(o_hoopz)) { // Safety Check in case Hoopz is not on screen at this time.
    if (!instance_exists(o_cts_hoopz)) {
        with (o_hoopz) {
            scr_event_interactive_deactivate();
            instance_create(x, y, o_cts_hoopz);
            //Fixes part of ticket 895
            with (o_cts_hoopz)
            {
                //show_debug_message("If to see if Hoopz faces object (interact)...");
                //If being triggered by an interact, make Hoopz face the object by default
                if (global.eventInteract && global.eventObject != NULL)
                {
                    //show_debug_message("Setting Hoopz to face object...");
                    tempFacing = round(point_direction(x, y, global.eventObject.x, global.eventObject.y) / 45);
                    if (tempFacing == 8) tempFacing = 0;
                    _current_animation = "stand_UP"; // NEEDED or hoopz can't look up
                    _automatic_animation = false; //temp disable
                    if (BodySwap() != "hoopz") //o_hoopz.stance == scr_player_stance_governor)
                    {
                        scr_entity_look_object(o_cts_hoopz, global.eventObject);
                    }
                    else
                    {
                        scr_entity_animation_setRange(_current_animation, tempFacing, 1);
                        scr_entity_animation_setFrame(_current_animation, 0);
                        scr_entity_animation_setSpeed(_current_animation, 0);
                    }
                    
                }
                else //Otherwise transfer o_hoopz facing to o_cts_hoopz
                {
                    scr_entity_look(o_cts_hoopz, global.eventFacing);
                }
            }
        }
        with (o_camera_hoopz) {
            _follow = o_cts_hoopz;
        }
    }
}
