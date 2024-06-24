// event_tnn_animeBulldog01
/*
    Event for The Anime Bulldog.

    
*/
if (argument0 == SCRIPT_START)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    var djname = scr_quest_get_state("djName");
    var djpref = scr_quest_get_state("djNamePrefix");

    // Build Event
    var event = scr_event_create_main();
    with (event)
    {
        //------------------------------------
        // Won or Lost Booty Bass
        //------------------------------------
        
        // Won Booty Bass Quest.
        if (scr_quest_get_state("bootyBassQuest") == 3)
        {
            // Final state
            if (scr_quest_get_state("animeBulldogState") == 3)
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "The Baron's back! Hats off to the Baron!");
                scr_event_build_dialogue(djname, s_port_hoopz, "(He's... he's just flattering me...)");
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Remember, kid. /'Japanimation./'");
            }
            // First time talking after victory
            else
            {
                // Was intimidated by The Anime Bulldog
                if (scr_quest_get_state("animeBulldogState") == 2)
                {
                    scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "You're not bad, Baron. Sorry I gave you a hard time before the compo. I like what I heard up there. Keep it up, you'll go places.");
                }
                // Was not intimidated by The Anime Bulldog
                else
                {
                    scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "You're not bad, Baron. I like what I heard up there. Keep it up, you'll go places.");
                }
                scr_event_build_dialogue(djname, s_port_hoopz, "(He talked to me...)");
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Oh, and " + djpref + ", one more thing.");
                scr_event_build_dialogue(djname, s_port_hoopz, "Yeah?");
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Google /'Japanimation./' Trust me.");
                scr_event_build_dialogue(djname, s_port_hoopz, "Th-thank you Mr. Bulldog!");
                scr_event_build_quest_state("animeBulldogState", 3);
            }
        }
        // Lost Booty Bass contest.
        else if (scr_quest_get_state("bootyBassQuest") == 2)
        {
            // Was intimidated by The Anime Bulldog
            if (scr_quest_get_state("animeBulldogState") == 3)
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Don't speak, just bow! Bow down to your new Barons!");
            }
            // Was not intimidated by The Anime Bulldog
            else
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Pathetic... not surprising, but pathetic.");
                scr_event_build_dialogue(djname, s_port_hoopz, "It was my fi-");
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Don't even talk to me, kid. I don't want to hear it. Not after the way you betrayed everyone at the Bootypocalypse. I'm just glad DJ Booty Slayer and I could clean up the mess you made.");
                scr_event_build_dialogue(djname, s_port_hoopz, "I'm sorry...");
                scr_event_build_quest_state("animeBulldogState", 3);
            }
        }
        
        //------------------------------------
        // After Curfew, Missed Out
        //------------------------------------
        else if (scr_tnn_curfew("after") == true) // formerly (scr_time_get() > 3)
        { 
            // Refused the Booty Bass Quest
            if (scr_quest_get_state("bootyBassQuest") == 1)
            {
                // Was intimidated by The Anime Bulldog
                if (scr_quest_get_state("animeBulldogState") == 2)
                {
                    scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Hey, sorry if I scared you away from entering the Bootypocalypse. I don't mean to be so intimidating... but DJ Booty Slayer and I rightfully tied and are ruling as joint Barons, so all's right with Booty.");
                }
                // Was not intimidated
                else
                {
                    scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Hey, I thought you were gonna enter the Bootypocalypse! Turns out you didn't miss anything... DJ Booty Slayer and I rightfully tied and are ruling as joint Barons, so all's right with Booty.");
                }
            }
            // Did not refuse the Booty Bass Quest
            else
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Hey latecomer, enjoying the groove? DJ Booty Slayer and I just tied in the Baron of Booty Contest. We're working on a new single, called /'Pax Booty/'. We're putting our differences aside.... it's going to be a Golden Booty Millennium!");
            }
        }
        
        //------------------------------------
        // Before Booty Bass
        //------------------------------------
        
        // Refused the Booty Bass Quest
        else if (scr_quest_get_state("bootyBassQuest") == 1)
        {
            // Spoke to The Anime Bulldog already, get intimidated.
            if (scr_quest_get_state("animeBulldogState") >= 1)
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "I thought you were just a fan... but now you're sniffing around the Daimyo? Enter at your own peril. I've got a Gluteal-Kei barnburner ready... you got what it takes to top that?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(G-Gluteal-Kei? I've never even heard of it...");
            }
            // First time speaking to The Anime Bulldog, get intimidated.
            else
            {
                scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "What have we here... a new DJ trying to build a name? Better carve your niche and carve it fast, and don't bother with Gluteal-Kei. It's my turf and I will defend it fiercely.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "(G-Gluteal-Kei? I've never even heard of it...");
            }
            scr_event_build_quest_state("animeBulldogState", 2);
        }
        // Spoken to once.
        else if (scr_quest_get_state("animeBulldogState") == 1)
        {
            scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "You want an autograph, kid? Meet me after the show.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(Whoa... I wonder if he likes anime...)");
        } 
        // Never spoken to before.
        else
        {
            scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Hey, what's up? Diggin' the track? This is a collab, me versus DJ Booty Slayer. He was basically going for a booty-nouveau feel while I maintained the crispness and punch of modern keisterstep. Hope you like it.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "(W-whoa... I can't believe he talked to me... he's so cool...)");
            scr_event_build_dialogue("The Anime Bulldog", s_port_animebulldog, "Speechless, huh? Well stick around for a real show. Don't tell him I said this, but I'm going to crush DJ Booty Slayer in the Bootypocalypse!");
            scr_event_build_quest_state("animeBulldogState", 1);
        }
    }
    scr_event_advance(event);
}
