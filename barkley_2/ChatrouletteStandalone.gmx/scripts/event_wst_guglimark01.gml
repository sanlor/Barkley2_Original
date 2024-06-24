script = "
IF banquoState == 0     | GOTO | BANQUO0
IF banquoState == 1     | GOTO | BANQUO1

BANQUO0
DIALOG | Banquo | When I'm in my gulch of sorrows, the place where I hate myself the most, the place where I don't even care if I'm alive or not, do you know what I do? Power lifting. Shut off your brain, stop thinking about the darkness and pound the irons. Cutting and bulking, supplements, fish oil, protein powder. You know what it all adds up to? Huge gains, gigantic delts. The world wants to see your glutes balloon. It keeps my mind off of suffocating depression and I can lift any rock.
QUEST  | banquoState = 1

BANQUO1
DIALOG | Banquo | If you only work your upper body, you'll look all fucked up like me. So work both your arms and your legs. Or just lay in bed. It's all the same in the end.
";
/*

// Guglimark // Filler NPC, tells you to go meet his friend for the Gremlin Gauntlet //
// Initialize //
if (argument0 == SCRIPT_START) {

    if scr_time_get() >= 4 and scr_time_get() >= 12 then scr_event_interactive_deactivate();
    else if scr_quest_get_state("wst_guglimark") == 5 scr_event_interactive_deactivate();
        
} 

// Step //
if (argument0 == SCRIPT_STEP) {

}

// Interact //
else if (argument0 == SCRIPT_INTERACT) {

    // Variables //
    var event = scr_event_create_main();
    
    // Main event //
    with (event) {
            // wst_guglimark //
            // 0 = First interaction //
            // 1 = Second interaction //

            // Shoe tinkering //
            if (scr_quest_get_state("wst_guglimark") == 3) or scr_quest_get_state("wst_thelzee") == 4 {
            
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(He's tinkering very intently with those shoes. I'd better not bother him.)");
                }
            
            // First interaction //
            else if (scr_quest_get_state("wst_guglimark") == 0) {
            
                scr_event_build_dialogue("Guglimark", NULL, "Ah, hail fellow well met. You must be a true wasteland champion, having been able to come this far by yourself.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm not really into titles but.... Heh, yeah, you could say call me a champ.");
                scr_event_build_dialogue("Guglimark", NULL, "Wow, such confidence. But you know what they say: talk is cheap. Why don't you have a little chat with my friend over there, she'll have something to prove your championhood. The Gremlin Gauntlet!");
                
                if scr_quest_get_state("wst_thelzee") >= 1 {
                
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I already know all about it.");
                    scr_event_build_dialogue("Guglimark", NULL, "Ah... I should've guessed as much. A champ like you probably has already mastered all the other arenas as well.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uhh, yeah, I'm... I'm all about the arenas.");
                    scr_event_build_quest_state("wst_guglimark", 2);
                    }
                    
                else {
                
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "A gauntlet, huh? Sounds interesting...");
                    scr_event_build_dialogue("Guglimark", NULL, "Yeah, you should definetly go and put yourself to the test.");
                    scr_event_build_quest_state("wst_guglimark", 1);
                    }                
                }
                
            // Second interaction //
            else if (scr_quest_get_state("wst_guglimark") == 1) {
            
                scr_event_build_dialogue("Guglimark", NULL, "One word of advice though. You'd better have your gun's locked and loaded before you begin... The Gremlin Gauntlet.");
                scr_event_build_quest_state("wst_guglimark", 2);
                }
                
             // Second interaction //
            else if (scr_quest_get_state("wst_guglimark") == 2) {
            
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "What's with all these shoes?");
                scr_event_build_dialogue("Guglimark", NULL, "Oh these? Just... little souveniers, you could say...");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Souveniers, huh? You sure have a lot of them.");
                scr_event_build_dialogue("Guglimark", NULL, "Well you know what they say, you never know a man until you walk a mile in his shoes... All these shoes have stories to tell, great journeys they have travelled. I intend to learn from it all, and better myself.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I wonder what sort of a story my kicks would tell...");
                scr_event_build_dialogue("Guglimark", NULL, "Perhaps we will found out eventually, hehehehe...");
                scr_event_build_quest_state("wst_guglimark", 3);
                }
    }
    scr_event_advance(event);
}
