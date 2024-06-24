/* event_air_cyberspear01

The AI Ruins Cyberspear Piece

This is the spear that it is in the depths of the AI Ruins.

csQuest
    0 = Have not started quest
    1 = Discussed the AI Ruins Hoopz has started his journey there
    2 = Hoopz talks to cdwarf after turning on the Wifi. Cyberdwarf and is compelled to descend into the ruins
    3 = Cyberdwarf repeating dialogue
    4 = Hoopz returns after finding the Cyberspear altar empty, Cyberdwarf asks him to descend further into the ruins
    5 = Cyberdwarf repeating dialogue
    6 = Hoopz has found the first piece

csPieceAIRuins
    0 = Hoopz does not have the AI Ruins Piece
    1 = Hoopz has the AI Ruins Piece    

*/

/*if (argument0 == SCRIPT_INTERACT) then 
    {
    var cyberspear1 = id;
    var event = scr_event_create_main();
    
    with event 
        {
        Dialogue(P_NAME, "Is this a Cyberspear piece? It sure looks like a Cyberspear piece!");
        Wait(2);
        scr_event_build_dialogue_debug("bhroom", "s_port_bhroom01", "Here we should run a generic 'Cyberspear Attain Animation' I'm thinking something like a spiraling, spear that decays orbit around Hoopz' hands that are outstretched in the air. Cliched item-get animation!");
        //TODO: add cliched item-get animation!
        Wait();
        Wait(2);
        //Item add for Key Items
        Item("build", "gain", "Cyberspear Piece")
        //Increase the csQuest knowledge variable, AI Ruins Variable and total spear variable
        Quest("csQuest", 7);
        Quest("csPieceAIRuins", 1);
        scr_event_build_quest_state_add("csPieceTotal", 1);
        //Run the Cyberspear Count Script that will give dynamic responses to each count situation
        scr_event_build_execute_event_script(event_gbl_cyberspearCount01);
        }
        
    // Gameboy advance //
    scr_event_advance(event);
    }
