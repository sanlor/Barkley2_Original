/* event_bct_cdwarfHead01

Cyberdwarf's Head, also a conduit for multiple help points throughout the game.

csQuest
    0 = Have not started quest
    1 = Discussed the AI Ruins Hoopz has started his journey there
    2 = Hoopz talks to cdwarf after turning on the Wifi. Cyberdwarf and is compelled to descend into the ruins
    3 = Cyberdwarf repeating dialogue
    4 = Hoopz returns after finding the Cyberspear altar empty, Cyberdwarf asks him to descend further into the ruins
    5 = Cyberdwarf repeating dialogue
    6 = Hoopz has found the first piece and talked to Cyberdwarf
    
csComplete
    0 - the Cyberspear is not complete and Hoopz doesn't have knowledge to complete it
    1 - the Cyberspear pieces been collected and Cyberdwarf has told you to go assemble them
    2 - Hoopz has assembled the Cyberspear and should speak to Cyberdwarf
    3 - Cyberdwarf is now inside the Cyberspear

csDaisSeen
    1 = Hoopz has seen the Dais and knows that the Cyberspear isn't in there.

TEMPLATE
    Dialogue(P_NAME, "");
    Dialogue(cdwarf, "");

*/

/*if (argument0 == SCRIPT_START) {
    //If the Cyberspear Quest is Active, show Cyberdwarf, if it is "complete" or if any other condition is current, deactivate
    if (Quest("csComplete") == 3) {
        scr_event_interactive_deactivate();
    }
    else if (Quest("csQuest") >= 1) {
        scr_event_interactive_activate();
    }
    //TODO: find a more efficient way to handle this, but we need cdwarf on when you talk to him about the Trigal Scene (cdwarfCinema == 7)
    else if (Quest("cdwarfCinema") == 7) {
        scr_event_interactive_activate()
    }
    else {
        scr_event_interactive_deactivate();
    }
}
if (argument0 == SCRIPT_STEP) {
    
}
if (argument0 == SCRIPT_INTERACT) {
    var cdwarfHead = id;
    var event = scr_event_create_main();
    
    //Shorthand
    var cdwarf = "The Cyberdwarf";

    //Cyberspear Variables
    var csQuest = scr_quest_get_state("csQuest");
    var csPieceFactory = scr_quest_get_state("csPieceFactory");
    var csPieceGrem = scr_quest_get_state("csPieceGrem");
    var csPiecesTotal = scr_quest_get_state("csPiecesTotal");
    var csComplete = scr_quest_get_state("csComplete");
        
    with event {
        //TODO: this is the scene where Cyberdwarf is downloaded into the Cyberspear itself... so another BIG Cutscene
        //  lots of cool effects and such, right now it is just a placeholder!
        if csComplete = 2 {
            Dialogue(cdwarf, "Ah so the prodigal son returns...");
            Dialogue(P_NAME, "Cyberdwarf, the spear... I have it.");
            Wait();
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "The lights should turn down low again and Cyberdwarf's Head should be the only thing in full visibility (much like the initial meeting with him).");
            Dialogue(cdwarf, "The hands of time swept slowly across the face of the Universe, and I waited.");
            Dialogue(cdwarf, "The birth and death of man, The Coming of the Time of The Dwarf... through all I have waited.");
            Wait(1);
            Dialogue(cdwarf, "And when the mortal bounds of my bball flesh began to wane, I sacrificed the physical entity and ascended to the realm of Digital Perception... once more I waited... I waited for you, youngster.");
            Dialogue(P_NAME, "...");
            Dialogue(cdwarf, "But I wait no longer. For The Choosen One stands before me, the bright-eyed Progeny of the Cosmos, and in his hands he holds the key to life itself. Child, present the Spear of Destiny and allow me to ordain it with my own cyber-sacrament.");
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "Here, the Cyberspear needs some type of crazy animation of Cyberdwarf being uploading into the spear. We'll want to either make this stupid or dire and important...");
            Wait(1);
            Dialogue(P_NAME, "Cy-Cyberdwarf?");
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "Cyberdwarf now speaks from the Spear itself.");
            Dialogue(cdwarf, "I inhabit the weapon now, youngster. But a weapon is nothing without the one who wields.");
            Dialogue(P_NAME, "I... I will wield you.");
            //TODO: this obviously needs to change.
            Dialogue(cdwarf, "Good, now let's go take the Cuchu down a few pegs.");
            Quest("csComplete", 3);
        }
        else if csQuest >= 1 {
            //TODO: We should add the Quest Tracker here as well, skipping the Chatroulette Dick-Discussions
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "Here is where we should have a standalone 'quest tracker' run that works the same way the one in Chatroulette works, possibly the same script!");
        }
        //TODO: move this to the proper spot, since now it just runs a new script (event_bct_cdwarf_cinema02)
        // this should probably be moved to the Create Event of the object
        else if (Quest("cdwarfCinema") == 7) {
            scr_event_build_execute_event_script(event_bct_cdwarf_cinema02);
        }
    }
    scr_event_advance(event);
}
