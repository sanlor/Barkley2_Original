// event_tnn_cornrowNote01
// Event for Cornrow, part of the Community Service quest.

// This entire post is for the Community Service quest.
// Here are the list of quest variables in the quest:

// concessionVal - this number is important for the main Tir na Nog governor quest.
// You have a set amount of concession points, a value you can
// use to bargain for things during the quest.
// If you do good quests, it increases. If you do bad quests, it decreases.

// comServ - determines your current position in the Community Service quest
//      0 = not active
//      1 = rejected
//      2 = need to break into house
//      3 = break-in complete
//      4 = need to rob store
//      5 = robbery complete
//      6 = need to kill vivian
//      7 = vivian dead
//      8 = mission complete

// This quest requires you to break into a house - the house doesn't exist yet, but inside there's
// no real dialogue and a lockpicking minigame. I can write up the dialogue when we need it.

// time > 2: make cornrow disappear.
// comServ > 6: cornrow's sprite is replaced with a note.


if (argument0 == SCRIPT_START)
{
    // Step
    if (Quest("comServ") >= 7)
    {
        scr_event_interactive_activate();
    }
    else
    {
        scr_event_interactive_deactivate();
    }
}

else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var curmoney = scr_money_count();
    var event = scr_event_create_main();
    
    var jgun = scr_gun_db("juiceboxGun", 1);
    
    with (event)
    {
        // If you're Matthias.
        if (BodySwap() == "matthias")
        {
            //Read note before.
            if (Quest("comServ") == 8)
            {
                Dialogue("Matthias", "(It's Mr. Cornrow's thank you note! I can't really read it from up here, but just thinking about how I got to help out the community really warms my heart. I hope Mr. Firas appreciates me bringing back Matthias as much as Cornrow appreciated my work!)");
            }
            //Haven't read note before.
            else {
                Dialogue("Matthias", "(There's a note on the ground here, but I can't see it... I bet it says something great... dad shuck it! I wanna read that note...)");
            }
        }

        // If you're Governor
        else if (BodySwap() == "governor")
        {
            //Read note before.
            if (Quest("comServ") == 8)
            {
                Dialogue("Governor Elagabalus", "(It's Mr. Cornrow's thank you note! Just thinking about how I got to help out the community really warms my heart. I hope this whole speech thing goes as well as my community service with Mr. Cornrow did!)");
            }
            //Haven't read note before.
            else
            {
                Dialogue("Governor Elagabalus", "(There's a note on the ground here! As much as I love to meddle in other people's business by reading things that don't belong to me, I feel like this is the one time I should abstain.)");
            }
        }

        // Quest Complete
        else if (Quest("comServ") == 8)
        {
            Dialogue(P_NAME, "Here's Mr. Cornrow's thank you letter. Helping the community's tough, but it feels good and it's definitely rewarding. I learned a lot working for Mr. Cornrow and Mr. Juicebox. Wherever you guys are, thanks for showing me the ropes!");
        }

        // Killed Vivian
        // (Quest("comServ") == 7)
        else
        { 
            Dialogue(P_NAME, "(Huh? Looks like Cornrow and Juicebox are gone and there's a note here. I wonder what it says...)");
            Dialogue(P_NAME, "/'" + P_NAME_S + ", this is an emergency. We've been captured by our enemies and need you to break us out. I need to keep this short 'cuz they're getting suspicious. I've left a gun for you underneath this crate. Take it and break us out of here - for the love of Clispaeth, save us! I can hear them torturing Juicebox! Oh Clispaeth, he's screaming! His screams are terrible. Please save us! I'm sorry about all those terrible things we made you do! Please help us, I'm begg-/''");
            Dialogue(P_NAME, "Hmm? This brick feels pretty loose. Whoa! It's a gun!"); //Mr. Cornrow's gun!");
            DialogueItem("Got " + jgun[? "pModel"] + ".");
            scr_event_build_gun_give("juiceboxGun");
            Dialogue(P_NAME, "And who says hard work doesn't pay off! I had to get that fruit basket, get Juicebox's change and give granny her vitamins. I worked up a sweat running all over town and I'm tired out, but after a hard day's work, I finally got my dues! Sure it was tough, but in the end? I think it was worth it! And hey, I even got to help the community in the process. I consider this mission accomplished!");

            scr_event_build_create_object(o_tnn_mission_complete, 0, 0);
            Wait(14);
            Wait();

            // TODO: Give gun for juicebox quest
            //scr_event_build_item_gain("Gold Shotgun", 1);
            //scr_equipment_guns_bag_addGun(scr_combat_weapons_generate("shotgun","gold",300,100));
            scr_event_build_time_add(1);
            Quest("comServ", 8);
            Quest("concessionVal", Quest("concessionVal") - 15);
        }
    }
    scr_event_advance(event);
}
