// Event for the Vivian, part of Community Service Quest, the Granny!
// I include $gender in her Time 4 case. This refers to whatever gender you selected in the beginning.
// We need to set up some sort of gender heirarchy for if you choose multiple genders. Maybe --
//      1. Female
//      2. Eunuch
//      3. Male
//      4. Dwarf
// usage: event_tnn_vivian01();

if (argument0 == SCRIPT_START)
{
    // Deactivate Vivian in her House
    if (scr_quest_get_state("grannyIncapped") != scr_time_get()) && (room == r_tnn_vivian02)
    {
        scr_event_interactive_deactivate();
    }

    // Deactivate Vivian in the Church
    if (scr_quest_get_state("grannyIncapped") != scr_time_get()) && (room == r_tnn_giuseppesChurch01)
    {
        scr_event_interactive_deactivate();
    }

    // Deactivate Vivian in the Clinic
    if (scr_quest_get_state("grannyIncapped") == 0) && (room == r_tnn_clinicoffice01)
    {
        scr_event_interactive_deactivate();
    }
}

else if (argument0 == SCRIPT_INTERACT)
{
    var vivian = id;
    var event = scr_event_create_main();
    var curname = P_NAME;
    if (BodySwap() == "matthias") { curname = "Matthias"; }
    else if (BodySwap() == "governor") { curname = "Governor Elagabalus"; }
    //------------------------------------------------------------------------------
    // main event
    //------------------------------------------------------------------------------
    with (event)
    {
        if (scr_quest_get_state("comServ") >= 7)
        {
            Dialogue(curname, "(I'm not going to bother her. She's sleeping so heavily, she must have been really tired.");
            scr_event_build_end();
        }


        //------------------------------------------
        // Body Swap States
        //------------------------------------------
        //if you're controlling Matthias/Dead Son.
        else if (BodySwap() == "matthias")
        {
            Dialogue("Vivian", "I don't like what young people do with their hair these days. It frightens me.");
        }

        //if you're controlling the Governor.
        else if (BodySwap() == "governor")
        {
            Dialogue("Vivian", "You certainly don't see many Duergars at Father Giuseppe's sermons... perhaps if we had a larger chapel, more people would be interested...");
        }


        //------------------------------------------
        // Normal States
        //------------------------------------------
        else if (scr_quest_get_state("comServ") == 6)
        {
            // Incapacitate Granny...
            if (scr_tnn_curfew("before")) or (scr_tnn_curfew("during"))
            {
                Dialogue(P_NAME, "(Hmm, I think this is Mr. Cornrow's granny. Should I give her the vitamins?)");

                var inject_choice = Choice("Inject the vitamins into Vivian?", s_port_hoopz);

                var yes = ChoiceAdd(inject_choice, "Yes.");

                with (yes)
                {
                    Dialogue(P_NAME, "(Okay, well - here goes!)");
                    Debug("TODO: play injection animation");
                    Dialogue("Vivian", "Wh-wha? Young man, no need to be so uncouth...");
                    Wait(0.5);
                    Dialogue("Vivian", "I'm feeling... uh uhh-ughhhhh...");
                    Wait(0.5);
                    scr_event_build_sound_play("sn_hoopz_blunthit01");
                    scr_event_build_animation_set(vivian,"onground");
                    Wait(1.0);
                    scr_event_build_dialogue(P_NAME, s_port_hoopzHappy, "(Looks like I got here just in the nick of time! I guess going so long without her vitamins made her tired. I'm not gonna wake her up, she needs all the rest she can get!)");
                    Quest("comServ", 7);
                    Quest("grannyIncapped", scr_time_get() );
                    Item("Granny's Medicine", -1);
                }

                var no = ChoiceAdd(inject_choice, "No.");
                with (no)
                {
                    Dialogue(P_NAME, "(Well, I guess I can take care of this later...)");
                }
            }
            else if (scr_tnn_curfew("after"))
            {
                Dialogue(P_NAME, "(Hmm, I think this is Mr. Cornrow's granny. They asked me to give her vitamins, but that was kind of a while ago... maybe I should go check on them instead...)");
            }
        }
        // Community service quest on
        else if (scr_time_get() == 5)
        {
            Dialogue("Vivian", "Maybe the new Duergar Governor isn't as bad as we had initially thought. Perhaps he is a blessing from Clispaeth after all, or perhaps what they say is true - that Cuchulainn really was one of Clispaeth's Disciples...");
        }
        // Dialogue.
        else if (scr_time_get() == 4)
        {
            Dialogue("Vivian", "Youngster, I can tell you have a deep faith in Clispaeth and I admire that. But I can tell you're also going through deep inner turmoil, that you're losing your identity and questioning that faith. Sometimes the best thing to do is to close your eyes and relax for a little bit. Try a new fruit. Try some grapes. If you don't like grapes, try raisins.");
        }
        // Dialogue.
        else if (scr_time_get() == 3)
        {
            Dialogue("Vivian", "Some people say Cuchulainn knew Clispaeth, that he might have even been one of his Disciples! How could Cuchulainn have fallen so far from Clispaeth's teachings? What made Cuchulainn change so much? Is this what Clispaeth would have wanted? Is all this part of Clispaeth's plan?");
        }
        // Dialogue.
        else if (scr_time_get() == 2)
        {
            Dialogue("Vivian", "Clispaeth was the prophet of the Cyberpocalypse. He and his apostles brought salvation to everyone, even those nasty Duergars. These days, all dwarfs seem to care about are gems and fruits. I love gems and fruits too, but I would never place them before Clispaeth...");
        }
        // Dialogue.
        else
        {
            Dialogue("Vivian", "Oh, Father Giuseppe is such a kind man. His sermons about Clispaeth are the only things that give me hope sometimes. I'm... I'm starting to wonder what fate Cuchulainn has in store for the dwarfs... every day there's more and more of us here and things are getting worse and worse. But... but as long as I keep my faith in Clispaeth, I'll remain strong.");
        }
    }
    scr_event_advance(event);
}
