/* event_air_dais01

This is the Cyberspear Dias that should hold the Lance.  Unfortunately, it is missing when you first get to it ...

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
    2 - Hoopz has assembled the Cyberspear

csDaisSeen
    1 = Hoopz has seen the Dais and knows that the Cyberspear isn't in there.
*/
/*if (argument0 == SCRIPT_INTERACT) then
    {
    // Is this even needed? //
    var dais = id;
    
    //Main Event
    var event = scr_event_create_main();
    
    //Cyberspear Variables
    var csQuest = scr_quest_get_state("csQuest");
    var csPieceAIRuins = scr_quest_get_state("csPieceAIRuins");
    var csPieceFactory = scr_quest_get_state("csPieceFactory");
    var csPieceGrem = scr_quest_get_state("csPieceGrem");
    var csPiecesTotal = scr_quest_get_state("csPiecesTotal");
    var csComplete = scr_quest_get_state("csComplete");
    
    with event 
        {
        //If Hoopz knows that he has enough Cyberspear pieces to create the spear // Master Sword scene from Zelda 3
        if csComplete = 1 then
            {
            Dialogue(P_NAME, "I've come a long way... Cyberdwarf... Dad... I won't let you down.");
            scr_event_build_dialogue_debug("Bhroom", "s_port_bhroom01", "Hoopz lifts up his hands and a lot of bonkerz-ass effects shoot out. This creates the Cyberspear of Destiny!");
            Dialogue(P_NAME, "That worked! They Cyberspear is ours!", s_port_hoopzHappy);
            Wait(1);
            Dialogue(P_NAME, "Now back to Cyberdwarf... and then we'll really make Cuchu pay!", s_port_hoopzHappy);
            Quest("csComplete", 2);
            }
        
        // If you know about the cyberspear from Cdwarf from Chatroulette
        else if (csQuest == 2) or (csQuest == 3) then
            {
            Dialogue(P_NAME, "... Wait ... the Cyberspear ...");
            Wait(0.5);
            
            //Animate hoopz as surprised! (fuckerproofing for looking NW and NE during surprise)
            if (o_hoopz.x <= 280) then
                {
                scr_event_build_animation_play_and_set(o_cts_hoopz, "surpriseNE", "surpriseHoldNE");
                Wait();
                Dialogue(P_NAME, "It's missing!", s_port_hoopzSurprise);
                }
                
            //Animate hoopz as surprised! (fuckerproofing for looking NW and NE during surprise)
            else if (o_hoopz.x >= 281) then
                {
                scr_event_build_animation_play_and_set(o_cts_hoopz, "surpriseNW", "surpriseHoldNW");
                Wait();
                Dialogue(P_NAME, "It's not here!", s_port_hoopzSurprise);
                }
                
            // Hoopz is a'ghast, there is no spear... //
            Dialogue(P_NAME, "There is supposed to be the Cyberspear right here but there isn't a pike, leister, javelin or gaff to be found anywhere!");
            Wait(0.75);
            Dialogue(P_NAME, "I need to get back and tell the Cyberdwarf!");
            Quest("csQuest", 4);
            }
        
        //If you know about the cyberspear just from the Identity Event with Cdwarf
        else if (csQuest == 1) then
            {
            Dialogue(P_NAME, "I wonder if this is where the Cyberspear is supposed to be...");
            //bandaid quest variable for noticing the Dais
            Quest("csDaisSeen", 1);
            }
        }
        
    // Gameboy advance //
    scr_event_advance(event);
    }
