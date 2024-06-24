/*  
======================================================
    This is the Container Crusher Console's Script
======================================================
/*
    States:
        0 = not talked
        1 = talked
    Quest
        1 = you've turned down lugner and he wants nothing to do with you QUEST UNAVAILABLE
        2 = you've told Lugner you can't help him right away but this leave the quest open for later
        3 = you've accepted the quest from Lugner, next stop Slag, then Giuseppe
        4 = Giuseppe refuses to give you any dwarfs. The player can get fuck you dialogue from Slag and Lugner(currently broken)
        5 = The player has gained some dwarfs and has chosen the Slag path.
        6 = The player has gained some dwarfs and has chosen the Lugner path.
        7 = End of Lugner route. You've pressed the button and killed the dwarfs. The player talks to Slag and the quest ends.
        8 = Spoken to Lugner, the player can press the button or just leave entirely for some reason.
        9 = End of Slag route. Lugner is dead.
*/

if (argument0 == SCRIPT_START) {
    //Deactivate the switch
    with (o_cts_lugnerlever01) scr_event_interactive_deactivate();

    //Lugner container
    scr_event_entity_settings(o_cts_container01, 0, 0, 0);
    if (scr_quest_get_state("lugnerQuest") == 6) {
        if (scr_quest_get_state("dwarfCustody") == 0) scr_entity_animation_set(o_cts_container01, "containerEmpty");
        else scr_entity_animation_set(o_cts_container01, "containerDwarfed");
    }
    else if (scr_quest_get_state("lugnerQuest") == 7) or (scr_quest_get_state("lugnerQuest") == 9) {
        scr_entity_animation_set(o_cts_container01, "containerDestroyed");
    }
    else {
        scr_entity_animation_set(o_cts_container01, "containerEmpty");
    }
    
    //Slags container
    scr_event_entity_settings(o_cts_container02, 0, 0, 0);
    if (scr_quest_get_state("lugnerQuest") == 5) {
        if (scr_quest_get_state("dwarfCustody") == 0) scr_entity_animation_set(o_cts_container02, "containerEmpty");
        else scr_entity_animation_set(o_cts_container02, "containerDwarfed");
    }
    
}
else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {

    var crusher = id;
    var container = o_cts_container01;
    var event = scr_event_create_main();
    
    with (event) {
      // scr_event_build_dialogue_debug("Bhroom", NULL, "Does this work at all?");
        // The warehouse door is accessible again.
        // The music cuts out entirely
        // scr_event_build_animation_set(container, "containerCrush");
        scr_event_build_look(o_cts_hoopz, NORTHWEST);
        scr_event_build_camera_move_to_point(264, 96, CAMERA_NORMAL);
        scr_event_build_wait_for_actions();
        scr_event_build_sound_play("sn_squish5");
        scr_event_build_animation_play_and_set(container, "containerCrush", "containerDestroyed");
        scr_event_build_wait_for_actions();
        // scr_event_build_wait(.5);
        // scr_event_build_animation_play(o_hoopz, s_cts_hoopzSurpriseNE, 0, true);
        // this needs to play completely through this directions "surprise" which is 4 frames
        scr_event_build_wait(2.5);
        scr_event_build_dialogue(P_NAME, s_port_hoopzShock, "... what... ");
        scr_event_build_dialogue("Lugner", s_port_lugnerThrilled, "Oh my...");
        scr_event_build_look(o_cts_hoopz, SOUTHWEST);
        scr_event_build_dialogue(P_NAME, s_port_hoopzShock, "WHAT JUST HAPPENED?!?");
        scr_event_build_dialogue("Lugner", s_port_lugnerThrilled, "Darn! That must have been the wrong button. I guess the red button was the save all Dwarfs from certain death on Necron 7 button. Red must have been the crush all the stupid goddamn Dwarfs with a heavy thing button.\I always get the two mixed up.");
        scr_event_build_dialogue(P_NAME, s_port_hoopzShock, "WHAT DID YOU JUST DO?!?!?");
        scr_event_build_dialogue("Lugner", s_port_lugnerThrilled, "What did I do? What did YOU do? You pressed the button. Shouldn't go around pressing buttons like that. Never know what they're going to do. Buttons can be pretty dangerous.");
        scr_event_build_dialogue(P_NAME, s_port_hoopzSurprise, "But...but...you made me do it!!! You told me to push the button!!");
        scr_event_build_dialogue("Lugner", s_port_lugnerThrilled, "I didn't make you do it. You could have walked away. I didn't make you do anything.");
        scr_event_build_animation_set(o_lugner01, "lugnerEvil");
        scr_event_build_dialogue("Lugner", s_port_lugnerPsycho, "It's your stupid fault that all these sweet, innocent Dwarfs are dead now!");
        scr_event_build_dialogue(P_NAME, s_port_hoopzSurprise, "No... what... what have I done?");
        scr_event_build_dialogue("Lugner", s_port_lugnerPsycho, "You know, we could always just send the crushed crate of smashed Dwarf bones to the Sombrero Galaxy anyway. Let them worry about it before it starts stinking up the place. They wanted to leave heeheehee, probably should have been more specific about how uncrushed they expected their bones to be.");
        scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "......");
        scr_event_build_dialogue("Lugner", s_port_lugnerPsycho, "I'm sure I'll get this straightened out one day. Look, why don't you bring a bunch more of them back and we can have at it again? I mean, what are the odds this happens again?\Seriously, what are the odds?");
        scr_event_build_dialogue(P_NAME, s_port_hoopzAngry, "You are a horrible person.");
        scr_event_build_dialogue("Lugner", s_port_lugnerPsycho, "No, I'm seriously asking you the odds. I got bored of kicking Dwarfs down the stairwell so long ago. The more of these wastes of space I can kill the closer I am to getting off this rock, finding something else to smash for a change.\Kobolds are just too goddamn squishy to smash effectively. It needs to be Dwarfs. I NEED THIS.\YOU DON'T KNOW HOW MUCH I FUCKING NEED THIS.");
        scr_event_build_dialogue(P_NAME, s_port_hoopzSad, "......");
        scr_event_build_dialogue("Lugner", s_port_lugner01, "Oh look at this, you're crying now, and not even in one of those blubbering, dramatic ways. Just silently weeping like a little your little puppy got strangled.\Get the fuck out of my face. As reward for giving me a couple nice moments I will not smash you and roll around in your entrails.");
        scr_time_change(1);
        scr_event_build_quest_state("lugnerQuest", 7);
    }
    scr_event_advance(event);
}
