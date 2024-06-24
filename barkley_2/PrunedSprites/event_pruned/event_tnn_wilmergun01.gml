// event_tnn_wilmergun01
// this is wilmer's bowl. are you a good kid or a bad kid!?!?!?!

if (argument0 == SCRIPT_START)
{
    // change graphic
    if (Quest("wilmerGun") == 1) && (Quest("wilmerMoney") == 1) { scr_entity_animation_set(o_obj_wilmergun01, "none"); }
    else if (Quest("wilmerGun") == 1) { scr_entity_animation_set(o_obj_wilmergun01, "money"); }
    else if (Quest("wilmerMoney") == 1) { scr_entity_animation_set(o_obj_wilmergun01, "gun"); }
    else { scr_entity_animation_set(o_obj_wilmergun01, "both"); }
}
else if (argument0 == SCRIPT_INTERACT)
{
    
    var obj = id;
    var event = scr_event_create_main();
    
    var money_snippet = scr_event_create_child(event);
    var candy_snippet = scr_event_create_child(event);
    var gun_snippet = scr_event_create_child(event);
    
    var gun1 = scr_gun_db("wilmerGun", 1); //Gets the object of the gun only
    var gun2 = scr_gun_db("wilmerPax1", 1); //Gets the object of the gun only
    var gun3 = scr_gun_db("wilmerPax2", 1); //Gets the object of the gun only
    
    var mort = scr_money_db("wilmerMortgage");
    var allo = scr_money_db("wilmerMortgageBonus");
    var tota = scr_money_db("wilmerMortgageTotal");
    
    var sleepin = 0;
    if (Quest("wilmerSleep") == scr_time_get()) { sleepin = 1; }

    var full = 0
    if (scr_items_countAll() >= scr_equipment_pocket_getSize()) { full = 1; }
    
    if (Quest("wilmerCandy") >= 1)
    { 
        if full { scr_quest_set_state("wilmerCandy", 2); }
        else { scr_quest_set_state("wilmerCandy", 1); }
    }
    
    var tall = 0;
    if (Quest("wilmerGun") == 1) && (Quest("wilmerMoney") == 1) { tall = 1; }
    if (Quest("wilmerGun") == 1) && (Quest("wilmerCandy") == 2) { tall = 1; }
    if (Quest("wilmerMoney") == 1) && (Quest("wilmerCandy") == 2) { tall = 1; }
    
    var any = 1;
    if (Quest("wilmerGun") == 0) && (Quest("wilmerMoney") == 0) && (Quest("wilmerCandy") != 3) { any = 0; }
    
    
    //-------------------------------------------
    //      money_snippet
    //-------------------------------------------
    with (money_snippet)
    {
        // update quest variable
        Quest("wilmerMoney", 1);
        
        // get money
        Breakout("build", "add", "money");
        scr_event_build_money_add(mort);
        Dialogue(P_NAME, "(Wilmer did ask me to pay the rent...)");
        scr_event_build_money_add(allo);
        Dialogue(P_NAME, "(Oh yeah, and the " + string(allo) + " for my allowance!)", s_port_hoopzHappy);
        
        if (Quest("wilmerGun") == 1) { scr_event_build_animation_set(o_obj_wilmergun01, "none"); }
        else { scr_event_build_animation_set(o_obj_wilmergun01, "gun"); }
        Breakout("build", "clear");
        
        Dialogue(P_NAME, "I'll need this too, sound's like these Duergars are by the books.");
        Note("build", "take", "Wilmer's Amortization Schedule");
        DialogueItem("Took Wilmer's Amortization Schedule.");
         
        // if taking all, loop
        if (Quest("wilmerBowlAll") == 1)
        {
            scr_event_build_execute_event_script(event_tnn_wilmergun01);
        }
    }
    
    //-------------------------------------------
    //      candy_snippet
    //-------------------------------------------
    with (candy_snippet)
    {
        // get candy
        if (Quest("wilmerBowlAll") == 1) { Dialogue(P_NAME, "(... and this candy... I... I just wanna... I just wanna gomp it all!)"); }
        else { Dialogue(P_NAME, "(That candy... I... I just wanna... I just wanna gomp it all!)"); }
        
        Breakout("build", "clear");
        
        // Pockets Full
        if (full)
        {
            Dialogue(P_NAME, "Aww... darn it... heck-darn it!!!", s_port_hoopzAngry);
            scr_event_build_look_object(o_cts_hoopz, o_wilmer01);
            scr_event_build_wait_for_actions();
            scr_event_build_camera_frame(CAMERA_FAST, o_hoopz, o_wilmer01);
            scr_event_build_wait_for_actions();
            
            // Wilmer Asleep
            if (sleepin)
            {
                scr_event_build_wait(1);
                scr_event_build_camera_frame(CAMERA_NORMAL, o_hoopz);
                Dialogue(P_NAME, "(Whew... he didn't hear me.)");
                scr_event_build_wait(0.2);
                scr_event_build_look_object(o_cts_hoopz, o_obj_wilmergun01);
                scr_event_build_wait_for_actions();
                Dialogue(P_NAME, "(But my pockets are full... full of candy. I can't fit these butterscotches right now... Oh wait! What's this?)", s_port_hoopzSad);
                scr_event_build_candy_give_schematic("Butterscotch");
                scr_event_build_dialogue_item("Got Butterscotch Recipe.");
                Dialogue(P_NAME, "(Mr. Wilmer's candy recipe... I hope he won't mind if I use this for awhile!)", s_port_hoopzSurprise);
            }
            // Wilmer Awake
            else
            {
                Dialogue("Wilmer", "What the... what in blue... watch your language, " + P_NAME + "!");
                Dialogue(P_NAME, "Sorry Mr. Wilmer... I just... I wanted to get some more candy, but my pockets are full... full of candy already...", s_port_hoopzSad);
                Dialogue("Wilmer", "That's no reason to go hootin' and hollerin' in the presence of your elders now, you hear me, kiddo? I tell ya, You're gonna have some hard days ahead of you if you're trying to find that Cyberdwarf fella, so *cough* you'd better straighten up! It ain't worth it if you come out of it with your mouth stinkin' like a Tir na nOg sewer, " + P_NAME + "... it just ain't..."); 
                Dialogue(P_NAME, "I-... I didn't think of it like that, Mr. Wilmer...", s_port_hoopzSad);
                Dialogue("Wilmer", "Well don't fret about it too much! I'm just *cough* an oldster! Besides, look underneath the bowl there... it's my candy recipe! Take it with you and you can make Ol' Wilmer's butterscotch wherever you go!");
                scr_event_build_look_object(o_cts_hoopz, o_obj_wilmergun01);
                scr_event_build_wait_for_actions();
                Dialogue(P_NAME, "Whoa! Thanks, Mr. Wilmer!", s_port_hoopzHappy);
                scr_event_build_dialogue_item("Got Butterscotch Recipe.");
                scr_event_build_candy_give_schematic("Butterscotch");
            }
            Quest("wilmerCandy", 3);
        }
        // Pockets Not Full
        else
        {
            scr_event_build_candy_give("Butterscotch");
            scr_event_build_dialogue_item("Got a Butterscotch.");
            Quest("wilmerCandy", 2);
        }
        
        // if taking all, loop
        if (Quest("wilmerBowlAll") == 1)
        {
            scr_event_build_execute_event_script(event_tnn_wilmergun01);
        }
    }
    
    //-------------------------------------------
    //      gun_snippet
    //-------------------------------------------
    with (gun_snippet)
    {
        // update quest variable
        Quest("wilmerGun", 1);
        Breakout("build", "clear");
        // get gun's
        if (Quest("wilmerBowlAll") == 1) { Dialogue(P_NAME, "(... and I think I'll take these gun's too. Just in case...)"); }
        else { Dialogue(P_NAME, "(I think I'll take these gun's. Just in case...)"); }
        
        scr_event_build_dialogue_item("Got the " + gun1[? "pModel"] + ".");
        scr_event_build_gun_give("wilmerGun");
        scr_event_build_dialogue_item("Got the " + gun2[? "pModel"] + ".");
        scr_event_build_gun_give("wilmerPax1");
        scr_event_build_dialogue_item("Got the " + gun3[? "pModel"] + ".");
        scr_event_build_gun_give("wilmerPax2");
        
        if (Quest("wilmerMoney") == 1) { scr_event_build_animation_set(o_obj_wilmergun01, "none"); }
        else { scr_event_build_animation_set(o_obj_wilmergun01, "money"); }
        //scr_event_build_set_object(obj, -999, -999);
        
        scr_event_build_look_object(o_cts_hoopz, o_wilmer01);
        scr_event_build_camera_frame(CAMERA_FAST, o_hoopz, o_wilmer01);
        scr_event_build_wait_for_actions();
        
        // wilmer is sleeping
        if (scr_quest_get_state("wilmerSleep") == scr_time_get())
        {
            Dialogue("Wilmer", "Zzz...be... zzz... be care... zzz... hear... zzz...");
        }
        else
        {
            Dialogue("Wilmer", "Now, listen up you little braster! Heh heh! *cough cough* Remember that those things aren't toys! And you better not go pullin' 'em on anyone in Tir na nOg. Those dirty Duergars will really tan your hide if you go trying a stunt like that! Still, you can't be too safe nowadays *cough*... especially in those sewers...");
            Dialogue(P_NAME, "(This oldtimer sure is a worrywort... I don't know why, but I feel like I'm a gun'snatural...)");
        }
        scr_event_build_camera_frame(CAMERA_FAST, o_hoopz);
        scr_event_build_look_object(o_cts_hoopz, o_obj_wilmergun01);
        
        // if taking all, loop
        if (Quest("wilmerBowlAll") == 1)
        {
            scr_event_build_execute_event_script(event_tnn_wilmergun01);
        }
    }
    
    
    //-------------------------------------------
    //      Event
    //-------------------------------------------
    with (event)
    {
        //-----------------------------------
        //  Body Swap States
        //-----------------------------------
        // If you're Matthias
        if (BodySwap() == "matthias")
        {
            Dialogue("Matthias", "(It's Mr. Wilmer's possessions he wanted me to have... I want them but I don't think Matthias has the manual dexterity to get it... how did I even get in through the door?)");
        }
        // If you're Governor
        else if (BodySwap() == "governor") 
        {
            Dialogue("Governor Elagabalus", "(Mr. Wilmer's things... I should grab these later.)");
        }
        
        //-----------------------------------
        //  Normal Bowl
        //-----------------------------------
        else 
        {
            // Take All Loop
            if (Quest("wilmerBowlAll") == 1)
            {
                if (Quest("wilmerMoney") == 0) { scr_event_build_event_snippet(money_snippet); }
                else if (Quest("wilmerCandy") <= 1) { scr_event_build_event_snippet(candy_snippet); }
                else if (Quest("wilmerGun") == 0) { scr_event_build_event_snippet(gun_snippet); }
                else
                { 
                    Quest("wilmerBowlAll", 2);
                    if (Quest("wilmerCandy") != 3) { Quest("wilmerCandy", 1); }
                    Breakout("build", "clear");
                    scr_event_build_end();
                }
            }
            // Normal Interaction
            else
            {
                if (Quest("wilmerBowlState") == 0) 
                { 
                    Quest("wilmerBowlState", 1);
                    Dialogue(P_NAME, "(The " + string(mort) + " neuro-shekels, the bill for the mortgage, a bowl of candy, and Wilmer's firearms are on the table.)");
                }
                else if (any == 0)
                {
                    Dialogue(P_NAME, "(Looks like I looted this table good'n'proper. Nothing left to loot.)");
                    scr_event_build_end();
                }
                Breakout("build", "add", "money");
                
                // Choice
                var stuff = Choice("If Wilmer insists...", s_port_hoopz);
                
                // Money
                if (Quest("wilmerMoney") == 0)
                {
                    var money = ChoiceAdd(stuff, "Snag the shekels.");
                    with (money) 
                    {
                        scr_event_build_event_snippet(money_snippet);
                    }
                }
                
                // Candy
                if (Quest("wilmerCandy") != 3)
                {
                    var candy = ChoiceAdd(stuff, "Cop the candies.");
                    with (candy) 
                    {
                        scr_event_build_event_snippet(candy_snippet);
                    }
                }
                
                // Gun
                if (Quest("wilmerGun") == 0)
                {
                    var gun = ChoiceAdd(stuff, "Grab the gun's.");
                    with (gun) 
                    {
                        scr_event_build_event_snippet(gun_snippet);
                    }
                }
                
                // All
                if (!tall)
                {
                    var takeall = scr_event_build_add_choice(stuff, "Acquire it all!");
                    with (takeall)
                    {
                        Dialogue(P_NAME, "(I want it all!)");
                        Quest("wilmerBowlAll", 1);
                        Breakout("build", "clear");
                        scr_event_build_execute_event_script(event_tnn_wilmergun01);
                    }
                }
                
                // None
                var no = scr_event_build_add_choice(stuff, "Not interested...");
                with (no)
                {
                    Dialogue(P_NAME, "(I can do without it...)");
                    Breakout("build", "clear");
                    scr_event_build_end();
                }
            }
        }
    }
    scr_event_advance(event);
}
