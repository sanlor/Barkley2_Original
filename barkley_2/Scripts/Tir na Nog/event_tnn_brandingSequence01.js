// Introduction to Game!
// This is the event that controls everything.

if (argument0 == SCRIPT_START) {
    // Build Event
    var event = instance_create(0, 0, o_event);
    event._event_object = id;
    with (event) {
        // Textbox options for cutscene.
        var text_options = scr_event_dialogue_build_extras(NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL);
        var tv_text = scr_event_dialogue_build_extras(144, 64, 220, 4, 1.5, NULL, NULL, NULL, NULL, NULL);
        var slow_text_options = scr_event_dialogue_build_extras(NULL, NULL, NULL, 3, 0.25, NULL, NULL, NULL, NULL, NULL);
        var sdwarfVulnerable = false;
        
        // The camera is at the top of the map and gradually pans down the line until it gets to Hoopz, showing off the entire line. 
        // After it pans down, it locks onto Hoopz and stays there.
        scr_event_build_fade(true, 0);
        scr_event_build_visible(o_hoopz, false);
        scr_event_build_camera_move_to_point(245, 113, 500);
        scr_event_build_wait_for_actions();
        scr_event_build_fade(false, 3.6);
        scr_event_build_camera_move(0, 50, 0.5);
        scr_event_build_wait_for_actions();
        // On the right side of the screen where there's opening an opening, one duergar patrols up and down.
        scr_event_build_wait(1);
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "Congratulations, lucky dwarfs! You've been selected by the benevolent A.I. Cuchulainn to live in the fabulous Tir na Nog, the upscale, ultra-modern arcology located here in the luxurious space ziggurat Necron 7...", tv_text);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "NEXT!", text_options);
        scr_event_build_wait(1);
        scr_event_build_move(o_hoopz_demo, 0, -32);
        scr_event_build_move(o_dwarf1, 0, -32);
        scr_event_build_move(o_dwarf2, 0, -32);
        scr_event_build_move(o_dwarf3, 0, -32);
        scr_event_build_move(o_dwarf4, 0, -32);
        scr_event_build_move(o_dwarf5, 0, -32);
        scr_event_build_move(o_dwarf6, 0, -32);
        // All NPCs, including Hoopz, shuffle up a few squares. The ones at the head of the line walk off the top of the map.
        scr_event_build_wait_for_actions();
        scr_event_build_move(o_dwarf1, 0, -50);
        scr_event_build_dialogue_ext("Tough Dwarf", s_port_hikingdwarf, "This... this is it! I've been waiting for this my whole life! We're finally in Tir na Nog!", text_options);
        scr_event_build_destroy_object(o_dwarf1);
        scr_event_build_dialogue_ext("Small Dwarf", s_port_smallDwarf01, "I don't want to be here... I'm scared and I just want to go home... I don't like Cuchulainn...", text_options);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "NEXT! Get movin' you lazy sacks of...", text_options);
        scr_event_build_wait(1);
        // All NPCs, including Hoopz, shuffle up a few squares, The one at the head of the line walks off the top of the map.
        scr_event_build_move(o_dwarf2, 0, -32);
        scr_event_build_move(o_dwarf3, 0, -50);
        scr_event_build_move(o_dwarf4, 0, -32);
        scr_event_build_move(o_dwarf5, 0, -32);
        scr_event_build_move(o_dwarf6, 0, -32);
        scr_event_build_move(o_hoopz_demo, 0, -32);
//SEND ODWARF3 UP and then destroy him later
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "...features many wonderful amenities, from all the fruit, grapes and prunes you can eat, to free, first-class housing to dozens of fun activities like weekly bingo and calisthenics, all provided free of charge by the generous and munificent Cuchulainn...", tv_text);
        scr_event_build_destroy_object(o_dwarf3);
        scr_event_build_dialogue_ext("Tough Dwarf", s_port_hikingdwarf, "Weekly bingo and free grapes! I love bingo!! And I love Cuchulainn!", text_options);
        scr_event_build_dialogue_ext("Small Dwarf", s_port_smallDwarf01, "I do too... but I just want to go home...", text_options);
// triggers Patrolling Duergar to stop at Small Dwarf
        sdwarfVulnerable = true;
        scr_event_build_dialogue_ext("Duergar", s_duergar_peeing, "What was that? What the hell was that!?", text_options);
        scr_event_build_wait(1);
        scr_event_build_camera_move(0, o_dwarf2.y + 64, 0.5);
        scr_event_build_animation_set(o_dwarf2, s_intro_sdwarf_punched01, 0, 0)
        scr_event_build_dialogue_ext("Small Dwarf", s_port_smallDwarf01, "Wh-what?", text_options);
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "...truly Tir na Nog is the premiere intergalactic luxury vacation destination, and with our helpful Duergar assistants, waiting on hand and knee for your call, you never need to move a finger...", tv_text);
        scr_event_build_dialogue_ext("Duergar", s_duergar_peeing, "Was that rebel talk I heard? Are you a plant? Hey boys, it looks like we've got a rebel on our hands!", text_options);
        scr_event_build_dialogue_ext("Small Dwarf", s_port_smallDwarf01, "I-I'm not a rebel...", text_options);
        scr_event_build_dialogue_ext("Duergar", s_duergar_peeing, "You wanna know what Cuchulainn does to rebels around here? You wanna know?!", text_options);
 // Duergar punches the small dwarf in the gut and tosses him out of the line. He lies there and does not get up.
        scr_event_build_animation_play(o_dwarf2, s_intro_sdwarf_punched01, 8, true);
        scr_event_build_move_ext(o_dwarf2, -32, 0, 1.5);
        scr_event_build_dialogue_ext("Small Dwarf", s_port_smallDwarf02, "Ugh...", text_options);
        scr_event_build_dialogue_ext("Duergar", s_duergar_peeing, "That's what we do to rebels around here! Let that be a lesson to all of you - mess with Cuchulainn, get out of line, and you deal with us!", text_options);
 // Patrolling duergar goes back to walking up and down the empty area.
        sdwarfVulnerable = false
        scr_event_build_wait(1);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "NEXT! Get a move on, slackers!", text_options);
        scr_event_build_wait(1);
 // All NPCs move up besides the displaced Small Dwarf hike up, delete odwarf4 moments later
        scr_event_build_move(o_dwarf4, 0, -50);
        scr_event_build_wait(.3);
        scr_event_build_move(o_dwarf5, 0, -32);
        scr_event_build_move(o_dwarf6, 0, -32);
        scr_event_build_move(o_hoopz_demo, 0, -32);
        scr_event_build_dialogue_ext("Tough Dwarf", s_port_hikingdwarf, "That's me! I'm finally getting in!", text_options);
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "...and the best part of all is that when all the dwarfs in the galaxy are in Tir na Nog, Cuchulainn is going to give each and every one of you a prize...", tv_text);
        scr_event_build_destroy_object(o_dwarf3);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "NEXT! Get over here!", text_options);
 // Everyone in line moves up one space - Hoopz is next to the Gate Guard now.
        scr_event_build_camera_move(0, - 64, 0.5);
        scr_event_build_move(o_dwarf5, 0, -32);
        scr_event_build_move(o_dwarf6, 0, -32);
        scr_event_build_move(o_hoopz_demo, 0, -32);
        scr_event_build_wait_for_actions();
        scr_event_build_animation_set(o_hoopz_demo, s_hoopz_punched, 0, 0);
        scr_event_build_visible(o_duegar_gate, false)  // DISAPPEAR DUERGAR
 // Gate Duergar is now part of the s_hoopz_punched Sprite Anim
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "Alright kid, what's your name and where are you from?", text_options);
        scr_event_build_dialogue_ext("? ? ?", s_port_hoopz, "I... I don't know.", text_options);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "Not gonna tell me your name, kid?", text_options);
        scr_event_build_dialogue_ext("? ? ?", s_port_hoopz, "I don't know my name... I don't remember who I am! I don't know where I am! I just want to go home!", text_options);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "Alright, well if you're not gonna tell me your name...", text_options);
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "...can you believe that!? A prize for each and every dwarf! What do you think it will be?!", tv_text);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "...then I'm gonna give you one!", text_options);
        // Gate Guard punches Hoopz in the guts, grabs him by the collar, brands the back of his neck with a hot iron and throws 
        // him on the ground. Hoopz lays there.
        scr_event_build_animation_play(o_hoopz_demo, s_hoopz_punched, 8, true);
        scr_event_build_sound_play(sn_hoopzBranded); 
        scr_event_build_wait_for_actions();
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "Heh heh heh, looks like from now on, your name's gonna be...", text_options);
        scr_event_build_dialogue_ext("Mounted TV", s_port_tvGuy01, "...what do you think YOUR prize is going to be?", tv_text);
        scr_event_build_dialogue_ext("Gate Guard", s_port_duergar, "X114JAM9...", text_options);
        // The entire screen except for Hoopz's sprite, lying on the ground, fades to black.
        scr_event_build_animation_set(o_hoopz_demo, s_hoopz_ground, 0, 0)
        scr_event_build_fade(true, 3);
        scr_event_build_wait(5);
        scr_event_build_dialogue_ext("? ? ?", s_port_hoopz, "...is that... is that me...? Is that who I have to be? Is this who I am...?", text_options);
        scr_event_build_wait(2);
        scr_event_build_dialogue_ext("? ? ?", s_port_hoopz, "X114JAM9..................................", slow_text_options);
        scr_event_build_wait(2);
    }
    scr_event_advance(event);
}