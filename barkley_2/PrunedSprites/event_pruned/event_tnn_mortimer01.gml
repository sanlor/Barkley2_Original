// Script for Mortimer in Dwarf Ghetto, operates a candy shop
// Quests:
//      Community Service
//      Eric's Pet Quest
// Variables:
//      mortimerGov
//      comServ
//      ericQuest
//      TEST TEST TEST
//      YOOOOOOOOOOOOO


if (argument0 == SCRIPT_START)
{
    if (scr_inside() == false) && (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
    if (scr_inside() == true) && (scr_tnn_curfew("during") == false) { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

}
else if (argument0 == SCRIPT_INTERACT)
{
    //-------------------------------
    // CANDY SHOP
    //-------------------------------
    
    var mortimer = id;
    var event = scr_event_create_main();
    var shopping = scr_event_create_child(event);
    
    var curmoney = scr_money_count();
    
    // edit this for each candy type stocked by mortimer
    var unavailable;
    if (Quest("mortimerCandyCorn") == 1)
    && (Quest("mortimerJawbreaker") == 1)
    && (Quest("mortimerNonpareil") == 1)
    {
        unavailable = true;
    }
    else { unavailable = false; }
    
    var monPep = scr_money_db("mortimerCandyCorn");
    var monJaw = scr_money_db("mortimerJawbreaker");
    var monLol = scr_money_db("mortimerNonpareil");
    var monRob = scr_money_db("mortimerRobbery");
    
    var shopstring = "Buy some candy?";
    if (Quest("comServ") >= 5) { shopstring = "Take some candy?"; }
    
    
    var candy1str = "Candy Corn";
    var candy2str = "Jawbreaker";
    var candy3str = "Nonpareil";
    
    if (Quest("mortimerExp") == 1)
    {
        candy1str = "Candy Corn Recipe";
        candy2str = "Jawbreaker Recipe";
        candy3str = "Nonpareil Recipe";
    }
    
    
    //------------------------------------------------------------
    // shopping snippet
    //------------------------------------------------------------
    with (shopping)
    {
        // Robbed Mortimer
        if (Quest("comServ") >= 5)
        {
            scr_event_build_animation_set(o_mortimer01, "scared2");
            if (Quest("mortimerExp") == 0)
            {
               Dialogue("Mortimer", "B-b-... before you buy... I'm sorry but I don't have any candies! I just sell recipes! Please take what you want and don't hurt me, please!");
               Dialogue(P_NAME, "Shucks... I wanted some candy...");
            }
        }
        else if (Quest("mortimerExp") == 0)
        {
            // var candy_mound = Choice("My candy desires are...?"); // TODO
            // ROUNDMOUND // ROUND_MOUND // ROUND MOUND
            Dialogue(P_NAME, "This is a candy store? Then I want CANDY, of course! Candy, candy, candy!");
            Dialogue("Mortimer", "Well... I just sell recipes here actually. We haven't gotten any candy in and I'm not sure we will soon. Did you know Cuchulainn is going to bestow his prize on us soon? Oh, but I do have recipes for sale, in case you come across another bakery somewhere. Or, I suppose a 3D Printer would work too...");
            Dialogue(P_NAME, "Shucks... I wanted some candy..."); 
        }
        
        Breakout("build", "add", "money");
        
        var junkchoice = Choice(shopstring, s_port_hoopz);
        
        // Changing this to test with the new item system
        
        // CHOICE: Peppermint
        if (Quest("mortimerCandyCorn") == 0)
        {
            with (ChoiceAdd(junkchoice, candy1str + " (" + string(monPep) + " $)"))
            {
                // If you robbed him
                if (Quest("comServ") >= 5)
                {
                    Dialogue(P_NAME, "I'd like a Candy Corn Recipe.");
                    Dialogue("Mortimer", "J-just take it!");
                    scr_event_build_dialogue_item("Got Candy Corn Recipe!");
                    scr_event_build_candy_give_schematic("Candy Corn");
                    Quest("mortimerCandyCorn", 1);
                }
                else
                {
                    if(curmoney >= monPep)
                    {
                        scr_event_build_money_add(-monPep);
                        Dialogue(P_NAME, "I'd like a Candy Corn Recipe.");
                        Dialogue("Mortimer", "Yeah sure. Here it is.");
                        scr_event_build_dialogue_item("Got Candy Corn Recipe!");
                        scr_event_build_candy_give_schematic("Candy Corn");
                        Quest("mortimerCandyCorn", 1);
                    }
                    else { Dialogue("Mortimer", "Sorry. You don't have enough. The Candy Corn Recipe costs " + string(monPep) + " neuro-shekels."); }
                }
                Breakout("build", "clear");
            }
        }
        
        // CHOICE: Jawbreaker
        if (Quest("mortimerJawbreaker") == 0)
        {
            with ChoiceAdd(junkchoice, candy2str + " (" + string(monJaw) + " n$)")
            {
                // If you robbed him
                if (Quest("comServ") >= 5)
                {
                    Dialogue(P_NAME, "I'd like the Jawbreaker Recipe.");
                    Dialogue("Mortimer", "J-just take it!");
                    scr_event_build_dialogue_item("Got Jawbreaker Recipe!");
                    scr_event_build_candy_give_schematic("Jawbreaker");
                    Quest("mortimerJawbreaker", 1);
                }
                else
                {
                    if(curmoney >= monJaw)
                    {
                        scr_event_build_money_add(-monJaw);
                        Dialogue(P_NAME, "I'd like the Jawbreaker Recipe.");
                        Dialogue("Mortimer", "Yeah sure. Here you go, kid.");
                        scr_event_build_dialogue_item("Got Jawbreaker Recipe!");
                        scr_event_build_candy_give_schematic("Jawbreaker");
                        Quest("mortimerJawbreaker", 1);
                    }
                    else { Dialogue("Mortimer", "Sorry. You don't have enough. The Jawbreaker Recipe costs " + string(monJaw) + " neuro-shekels."); }
                }
                Breakout("build", "clear");
            }
        }
        
        // CHOICE: Nonpareil
        if (Quest("mortimerNonpareil") == 0)
        {
            with ChoiceAdd(junkchoice, candy3str + " (" + string(monLol) + " n$)")
            {
                // If you robbed him
                if (Quest("comServ") >= 5)
                {
                    Dialogue(P_NAME, "I'd like a Nonpareil Recipe.");
                    Dialogue("Mortimer", "J-just take it!");
                    scr_event_build_dialogue_item("Got Nonpareil Recipe!");
                    scr_event_build_candy_give_schematic("Nonpareil");
                    Quest("mortimerNonpareil", 1);
                }
                else
                {
                    if (curmoney >= monLol)
                    {
                        scr_event_build_money_add(-monLol);
                        Dialogue(P_NAME, "I'd like a Nonpareil.");
                        Dialogue("Mortimer", "There you go...");
                        scr_event_build_dialogue_item("Got Nonpareil Recipe!");
                        scr_event_build_candy_give_schematic("Nonpareil");
                        Quest("mortimerNonpareil", 1);
                    }
                    else { Dialogue("Mortimer", "Sorry. You don't have enough. The Nonpareil Recipe is " + string(monLol) + " neuro-shekels."); }
                }
                Breakout("build", "clear");
            }
        }
        
        // CHOICE: Sorry, no candy for me.
        with ChoiceAdd(junkchoice, "Sorry, no candy for me.")
        {
            Breakout("build", "clear");
            if (Quest("comServ") >= 5) { Dialogue("Mortimer", "J-just leave me alone!"); }
            else { Dialogue("Mortimer", "Okay, come back if you change your mind!"); }
        }
        
    }
        
    //------------------------------------------------------------
    // main event
    //------------------------------------------------------------
    with (event)
    {
        //---------------------------------------
        // Body Swap States
        //---------------------------------------
        // If you're Matthias
        if (BodySwap() == "matthias")
        {
            Dialogue("Mortimer", "G'day Matthias, your Pa's been looking all over for you... you uh, might want to take a bath before you see him.");
        } 
        // If you're Governor
        else if (BodySwap() == "governor")
        {
            if (Quest("mortimerGov") == 0)
            {
                Dialogue("Mortimer", "Y-you must be the new g-g-governor! P-pleasure to meet you, sir! P-p-please take this black licorice recipe... it's on me, sir!");
                scr_event_build_candy_give_schematic("Black Licorice");
                scr_event_build_dialogue_item("Got Black Licorice Recipe!");
                Dialogue("Governor Elagabalus", "Thank you! But you didn't need to do that...", s_port_governor);
                Quest("mortimerGov", 1);
            }
            else
            {
                Dialogue("Mortimer", "M-m-mr. Governor! Please stop by Mortimer's Candy Shop anytime! W-w-we love to serve Duergars!");
            }
        }
        
        //---------------------------------------
        // Normal Body States
        //---------------------------------------
        else
        {
            Quest("mortimerState", 1);
            //---------------------------------------
            // Community service quest on.
            // You're about to rob him
            //---------------------------------------
            if (Quest("comServ") == 4)
            {
                Dialogue("Mortimer", "Welcome to Mortimer's Candy Shop! What can I get for you, youngster?");
                Dialogue(P_NAME, "Hi! I'm here to pick up some money for Mr. Cornrow and Mr. Juicebox. Mr. Cornrow said Mr. Juicebox gave you some money and got the wrong change in return.");
                Dialogue("Mortimer", "Mr. Cornrow? Mr. Juicebox? What the hell are you talking about, kid?");
                Dialogue(P_NAME, "Mr. Cornrow told me to show you his gun so you'd know I'm here for him.");
                // TODO: Potential animation of Hoopz pulling out a gun.
                scr_event_build_animation_set(o_mortimer01, "scared1");
                Dialogue("Mortimer", "Wh-whoa! Let's s-slow down here! Uhhh, y-y-yeah! Uh, take your change, kid! Take all of it! I don't want any trouble!");
                Dialogue(P_NAME, "Thanks, Morty! I'll see you later!");
                scr_event_build_animation_set(o_mortimer01, "scared2");
                Dialogue("Mortimer", "H-holy Clispaeth...");
                scr_event_build_dialogue_item("Got " + string(monRob) + " neuro-shekels!");
                scr_event_build_money_add(monRob);
                Quest("comServ", 5);
            }
            
            //---------------------------------------
            // Eric Quest
            // Any jobs available? 
            //---------------------------------------
            else if (Quest("ericQuest") == 2) 
            {
                // Robbed Mortimer for Cornrow and Juicebox
                if (Quest("comServ") >= 5)
                {
                    scr_event_build_animation_set(o_mortimer01, "scared2");
                    
                    // No More Candy
                    if (unavailable == true)
                    {
                        Dialogue("Mortimer", "I-I don't have any more candies!");
                        Dialogue(P_NAME, "Hey Morty! No worries, I was just wondering if you had any jobs available.");
                    }
                    // Candy Available
                    else
                    {
                        Dialogue("Mortimer", "Y-you again? I-I-I don't want any trouble! J-just take whatever you want!");
                        Dialogue(P_NAME, "Hey Morty! I was wondering if you had any jobs available.");
                    }
                    Dialogue("Mortimer", "J-j-jobs? Uh... n-no, sir... w-we're not hiring today... I-I-I'm sorry, sir!!!");
                    Dialogue(P_NAME, "Shucks...");
                    
                    // Candy Available
                    if (unavailable == false)
                    {
                        Dialogue("Mortimer", "S-sorry! H-here, take as much c-c-candy as you want, please!");
                        scr_event_build_event_snippet(shopping);
                    }
                }
                // Have Not Robbed Mortimer
                else
                {
                    //-------------- ASKING FOR JOB ---------------
                    // No More Candy
                    if (unavailable == true)
                    {
                        Dialogue("Mortimer", "Welcome again, youngster. I'm all out of stock at the moment. Come back some other time.");
                        Dialogue(P_NAME, "Hey Morty! No worries, I was just wondering if you had any jobs available.");
                    }
                    // 2+ Talks
                    else if (Quest("mortimerState") == 1)
                    {
                        Dialogue("Mortimer", "Welcome again, youngster. What can I do for you? Care for some sweets? I've got some delicious sweets here!");
                        Dialogue(P_NAME, "Hi Morty. Umm, maybe, but first I was wondering if you have any job openings right now.");
                    }
                    // First Talk
                    else
                    {
                        Dialogue(P_NAME, "Hey, this is a candy store, right? I was wondering if you have any job openings right now.");
                    }
                    
                    //----------------- RESPONSE -----------------
                    // Some Candy Sold
                    if (Quest("mortimerPeppermint") || 1 && Quest("mortimerJawbreaker") || 1 && Quest("mortimerLollipop") || 1)
                    {
                        Dialogue("Mortimer", "Job openings? Sales haven't been so great lately... you're actually my best customer. No openings now, sorry.");
                        Dialogue(P_NAME, "Shucks...");
                    }
                    // No Candy Sold
                    else
                    {
                        Dialogue("Mortimer", "Sigh... there's no money in the candy biz these days... I couldn't afford to hire help even if I wanted to...");
                        Dialogue(P_NAME, "Oh... well I'm sorry to hear that... good luck.");
                    }
                    // Candy Available? Go to shopping snippet
                    if (unavailable == false)
                    {
                        Dialogue("Mortimer", "By the way, would you buy some candy while you're here?");
                        scr_event_build_event_snippet(shopping);
                    }
                }
            }
            
            //---------------------------------------
            // Normal Event
            //---------------------------------------
            else 
            {
                // Robbed Mortimer for Cornrow and Juicebox
                if (Quest("comServ") >= 5)
                {
                    if (unavailable == true)
                    { 
                        Dialogue("Mortimer", "I-I don't have any more candies!");
                    }
                    else
                    {
                        scr_event_build_animation_set(o_mortimer01, "scared2");
                        Dialogue("Mortimer", "Y-you again? I-I-I don't want any trouble! J-just take whatever you want!");
                        scr_event_build_event_snippet(shopping);
                    }
                }
                // Have Not Robbed Mortimer
                else
                {
                    if (unavailable == true)
                    {
                        Dialogue("Mortimer", "Welcome again, youngster. I'm all out of stock at the moment. Come back some other time.");
                    }
                    else
                    {
                        Dialogue("Mortimer", "Welcome to Mortimer's Candy Shop, youngster. What can I get for you?");
                        scr_event_build_event_snippet(shopping);
                    }
                }
            }
        }
    }
    scr_event_advance(event);
}
