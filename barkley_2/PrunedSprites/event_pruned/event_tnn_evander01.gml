// Event for Powerful Bartender "Evander".
// usage: event_tnn_evander01();

if (argument0 == SCRIPT_START)
{
    if (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
}
else if(argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var evander = id;

    var event = scr_event_create_main();
    with (event)
    {
        //---------------------------------------------------------
        // Body Swap states
        //---------------------------------------------------------
        // If you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            scr_event_build_dialogue("Evander", NULL, "You never give up, do you kid? I can't serve you juice till your ID says you're of age... maybe Cornrow can help you with that, ha ha!");
        } 
        // If you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Evander", NULL, "Hello, Mr. Governor, sir. May I serve you the house grape puree? It's a fine craft for the refined palette with one grape of every strain, each distilled five times through reverse osmosis. It's rare vintage reserved exclusively for our Duergar clientele.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "(I don't think I'm old enough to drink grape juice...)");
        }
        
        //----------------------------
        // Time >= 2
        //----------------------------
        if (ClockTime("get") >= 1)
        {
            // Talked to him twice.
            if (scr_quest_get_state("evanderState") == 2)
            {
                scr_event_build_dialogue("Evander", NULL, "Get outta here, kid!");
            }
            // Talked to him.
            else if (scr_quest_get_state("evanderState") == 1)
            {
                scr_event_build_dialogue("Evander", NULL, "What's the deal, kid? I told you, I can't serve you any juice!");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm a little thirsty, but okay.");
                scr_event_build_dialogue("Evander", NULL, "Ah! Some reverse psychology, huh? You're just like that young punk Matthias, always scheming for juice! Even if I wanted to, the Duergars would really rough me up if they found out.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "The Duergars are really opposed to underaged drinking, huh?");
                // before curfew
                if (scr_tnn_curfew("before") == true)
                {
                    scr_event_build_dialogue("Evander", NULL, "That's not it at all. They just need a reason. They always come up with new laws, just so we break 'em. And when we break 'em they really let loose on us. We've supposedly got a new Governor arriving soon... I'm sure when they get here they'll make a big speech laying out all the new offenses we're committing, and how it's for our own saf... oh no... is this dissident speech? It is, isn't it? There's a Dissident Speech Statute... I...");
                }
                // after curfew
                else
                {
                    scr_event_build_dialogue("Evander", NULL, "That's not it at all. They just need a reason. They always come up with new laws, just so we break 'em. And when we break 'em they really let loose on us. That curfew? That's new too. Never used to have that until they needed an excuse to bea-... oh no... is this dissident speech? It is, isn't it? There's a Dissident Speech Statute... I...");
                }
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Don't worry, Evander, I-");
                scr_event_build_dialogue("Evander", NULL, "Shut up kid! Shut up, shut up, shut up! Don't say another word! Speak a word of this to anyone and you're dead meat!");
                scr_event_build_quest_state("evanderState", 2);
            }
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Evander", NULL, "This ain't for you, youngster.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do you mean? What is this place?");
                scr_event_build_dialogue("Evander", NULL, "It's a fruit juice bar, kid? What does it look like? Old timers like Dubuque come here to sip away their sorrows. Old timers, got it? NOT for youngsters."); 
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yikes... you don't have to be so mean about it... I didn't know...");
                scr_event_build_dialogue("Evander", NULL, "Aw, kid, cheer up... you'll grow up fast in Tir na Nog! Heh heh heh!");
                scr_event_build_quest_state("evanderState", 1);
            }
        }
        
        //----------------------------
        // Time == 1
        //----------------------------
        else 
        {
            // Talked
            if (scr_quest_get_state("evanderState") == 1)
            {
                if (scr_quest_get_state("jindrichApricot") == 2)
                { 
                    scr_event_build_dialogue("Evander", NULL, "Thanks for helping me out with Jindrich. But I still can't serve you, kid.");
                }
                else
                { 
                    scr_event_build_dialogue("Evander", NULL, "I can't serve you, kid."); 
                }
            }
            // Never talked to him.
            else
            {
                scr_event_build_dialogue("Evander", NULL, "This ain't for you, youngster.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do you mean? What is this place?");
                scr_event_build_dialogue("Evander", NULL, "It's a fruit juice bar, kid? What does it look like? Old timers like Dubuque come here to sip away their sorrows. Old timers, got it? NOT for youngsters."); 
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yikes... you don't have to be so mean about it... I didn't know...");
                scr_event_build_dialogue("Evander", NULL, "Aw, kid, cheer up... you'll grow up fast in Tir na Nog! Heh heh heh!");
                scr_event_build_quest_state("evanderState", 1);
            }
        }
    }
    scr_event_advance(event);
}
