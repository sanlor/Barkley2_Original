// Event for Cornrow Quest, cornucopia you need to steal from Vivian's house;

if (argument0 == SCRIPT_START)
{
    // Step
    if (visible and scr_quest_get_state("comServ") > 2)
    {
        scr_event_interactive_deactivate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    // Build Event
    var fruitbasket = id;
    var event = scr_event_create_main();
    with (event)
    {
        //------------------------------------------
        // Body Swap States
        //------------------------------------------
        //if you're controlling Matthias/Dead Son.
        if (BodySwap() == "matthias")
        {
            Dialogue("Matthias", "(It's a big basket of fruits, but I shouldn't take any. I'm not sure I could even get them with this clunky body...)");

        //if you're controlling the Governor.
        }
        else if (BodySwap() == "governor")
        {
            Dialogue("Governor Elagabalus", "(These fruits... are truly juicy!)");
        }

        //------------------------------------------
        // Normal States
        //------------------------------------------
        else if (Quest("comServ") >= 3)
        {
            scr_event_build_destroy_object(NULL);
        }

        else if (Quest("comServ") == 2)
        {
            if (scr_time_get() <= 2)
            {
                Dialogue(P_NAME, "(Hmmm, I think this is that fruit basket Mr. Cornrow asked me to get. Should I take it?)");

                var choice = Choice("Take the fruit basket?", s_port_hoopz);

                with (ChoiceAdd(choice, "Yes."))
                {
                    //Take the basket.
                    Dialogue(P_NAME, "(Gotta feed those kids!)");
                    DialogueItem("Got Granny's Fruit Basket!");
                    Quest("comServ", 3);
                    Item("Fruit Basket", 1);
                    scr_event_build_visible(o_fruitbasket01, false)
                    //scr_event_build_destroy_object(fruitbasket);
                    //fruit basket disappears
                }

                with (ChoiceAdd(choice, "No."))
                {
                    //Don't take the basket.
                    Dialogue(P_NAME, "(Nah, I think I'll leave it for now...)");
                }
            }

            // Time is greater than 2, quest is no longer completable.
            else
            {
                Dialogue(P_NAME, "(Hmmm, I think this is that fruit basket Mr. Cornrow asked me to get... but it looks rotten now... I think I came too late...)");
            }
        }

        // Not on Community Service Quest
        // Normal interaction.
        else
        {
            Dialogue(P_NAME, "(Wow, that's one big fruit basket. I wouldn't mind a grape... but that would be stealing...)");
        }
    }
    scr_event_advance(event);
}
