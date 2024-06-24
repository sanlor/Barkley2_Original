// Defaults
var event = scr_event_create_main();
var snippet = scr_event_create_child(event);

// Listed Snippets
var choice_snippet = scr_event_create_child(event);
var take_orders_snippet = scr_event_create_child(event);
var mix_drink_snippet = scr_event_create_child(event);
var mix_existing_snippet = scr_event_create_child(event);
var mix_new_snippet = scr_event_create_child(event);
var first_time_snippet = scr_event_create_child(event);
var serve_snippet = scr_event_create_child(event);
var ending_snippet = scr_event_create_child(event);

//-----------------------------------------------------------------------------
with (choice_snippet) {
    // Build Choice
    var do_choice = scr_event_build_choice("Do what?", s_port_hoopz);

    // 1. Take Everyone's Orders 
    var take_orders = scr_event_build_add_choice(do_choice, "Take orders.");
    with (take_orders) {
        scr_event_build_event_snippet(take_orders_snippet);
    }
    
    // 2. Mix a Drink
    var mix_drink = scr_event_build_add_choice(do_choice, "Mix a drink.");
    with (mix_drink) {
        scr_event_build_event_snippet(mix_drink_snippet);
    }
    
    // 3. Step Down From Bar
    var mix_drink = scr_event_build_add_choice(do_choice, "Step down.");
    with (mix_drink) {
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "Well, I think that's it for me.");
        // go through the PRESENT characters
        if (scr_quest_get_state("zeldaThirst") == "none") {
            scr_event_build_dialogue("Zelda", NULL, "Giving up on my thirst already!");
        }
        if (scr_quest_get_state("_____Thirst") == "none") {
            scr_event_build_dialogue("", NULL, "");
        }
        // continue this forever
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "Sorry...");
    }
}

//-----------------------------------------------------------------------------
with (take_orders_snippet) {
    // loop through each seat
    // is someone in it?
    // if so, who is it?
    //      do they want anything?
    //      if so, what do they want?
    //          how do they say it?
    //      if not, how do they say they aren't thirsty?
    //      say the relevant dialogue
    // move to the next seat, repeat   
    
    
    /*
    Depending on each unit of time, a person has to be sitting in each seat.
    From Times X to Y, these 3 people will be there.
    Characters will come and go. There will probably be a main Al-Akihabara position-controller object.
    alakiSeat1 is a quest variable that will contain the identity of the character that inhabits it.
    FOR RIGHT NOW:
        scr_quest_set_state("alakiSeat1", "Zelda");
        scr_quest_set_state("alakiSeat2", "22222");
        scr_quest_set_state("alakiSeat3", "33333");
        scr_quest_set_state("alakiSeat4", "44444");
        scr_quest_set_state("alakiSeat5", "none");
        scr_quest_set_state("alakiSeat6", "66666");
        scr_quest_set_state("alakiSeat7", "77777");
    */
    
    if (scr_quest_get_state("alakiSeat1") != "none") {
        case "Zelda": var seat1 = "Zelda" break;
        case "22222": var seat1 = "22222" break;
        case "33333": var seat1 = "33333" break;
        case "44444": var seat1 = "44444" break;
        case "55555": var seat1 = "55555" break;
        case "66666": var seat1 = "66666" break;
        case "77777": var seat1 = "77777" break;
    }
    else { var seat1 = ""; }
    
    switch (who) {
        case "Zelda":
            switch (scr_quest_get_state("zeldaDrinkScore") {
                case -4: case -3: case -2: case -1:
                
                    break;
                case 0:
                
                    break;
                case 1:
                    
                    break;
                case 2:
                    
                    break;
                case 3:
                    
                    break;
                case 4: case 5: case 6: case 7: case 8:
                    
                    break;
            }
            break;
            
        case "11111":
          
            break;
    }
    
    
    if seat1 == occupied {
        if desirous == true {
            dialogue == "i'll have a !!!"
        }
        else {
            dialogue == "not thirsty"
        }
    }
}

//-----------------------------------------------------------------------------
with (mix_drink_snippet) {
    var mix_choice = scr_event_build_choice("Mix what?", s_port_hoopz);
    if (drinkMixed >= 1) {
        var mix_existing = scr_event_build_add_choice("Mix an old drink.");
        with (mix_existing) {
            scr_event_build_event_snippet(mix_existing_snippet);
        }
    }
    var mix_new = scr_event_build_add_choice("Mix a new drink from ingredients.");
    with (mix_new) {
        if (barMixed == 0) {
            // go to FIRST TIME snippet
            scr_event_build_event_snippet(first_time_snippet);
        }
        else {
            scr_event_build_event_snippet(mix_new_snippet);
        }
    }
    var mix_nvm = scr_event_build_add_choice("Stop mixing.");
    with (mix_nvm) {
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "Umm, nevermind.");
        scr_event_build_event_snippet(ending_snippet);
    }
}
//-----------------------------------------------------------------------------
with (mix_existing_snippet) {
    

}
//-----------------------------------------------------------------------------
with (mix_new_snippet) {
/*
    1. Get Ingredients
        * This will come from the player's sneakers, quest variables that update on time change.
        * For now, the test version will select a random value from 1 to 10
    2. Halt event if there are fewer than 3 ingredients available
        * This should probably exist in the PREVIOUS choice.
    3. Build Breakout Box
        * Placeholder graphics need to be made.
        * If the amounts don't update, rig the event to restart, similar to Booty Bass
    4. Give the ingredient 1 choice
        * Add each to choice box if owned
        * Should we somehow show disabled choices, etc? Announce ingredients that are unusable? Nah.
        * Keep the breakout even if you have ingredients with 0 in them. All 4 appear, independent of values.
    5. Update the variables
        * The right value, "sand", "pebble", etc is increased by 1
        * The value in your possession, "curSand", "curPebble", etc is decreased by 1
        * Next choice's "drink_string" is updated to show current ingredients
    6. Give the ingredient 2 choice
    7. Update the variables
    8. Give the ingredient 2 choice
    9. Drink-shaking animation and sound!!!!
    10. Announce drink name, and store to drink database.
        * Get title
        * Store as "mixed"
    11. Serve drink (animation?)
    12. Get result / scoring for drinker
    13. Restart event if you possess enough ingredients?
    
    // GET INGREDIENTS REAL
    /*
    var curSand = scr_quest_get_state("curSand");
    var curPebble = scr_quest_get_state("curPebble");
    var curDirt = scr_quest_get_state("curDirt");
    var curDust = scr_quest_get_state("curDust");
    */
    
    // GET INGREDIENTS TEST
    var curSand = irandom(10)
    var curPebble = irandom(10)
    var curDirt = irandom(10)
    var curDust = irandom(10)
    
    // CHECK FOR ENOUGH INGREDIENTS
    if (curSand + curPebble + curDirt + curDust) <= 2) {
        // NOT ENOUGH INGREDIENTS, EXIT EVENT;
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "Welp, not enuf!");
        scr_event_build_end();
    }

    scr_event_build_breakout("add", "curSand");
    scr_event_build_breakout("add", "curPebble");
    scr_event_build_breakout("add", "curDirt");
    scr_event_build_breakout("add", "curDust");

    //----------------------------------------
    // INGREDIENT 1
    //----------------------------------------
    var ing_1_choice = scr_event_build_choice("What is the first ingredient?", s_port_hoopz);
    if (curSand >= 1) {
        var ing_1_sand = scr_event_build_add_choice(ing_1_choice, "Sand.");
        with ing_1_sand {
            curSand -= curSand;
            sand += 1;
            drink_string = "1 Sand"
        }
    }
    if (curPebble >= 1) {
        var ing_1_pebble = scr_event_build_add_choice(ing_1_choice, "Pebble.");
        with ing_1_pebble {
            curPebble -= curPebble;
            pebble += 1;
            drink_string = "1 Pebble"
        }
    }
    if (curDirt >= 1) {
        var ing_1_dirt = scr_event_build_add_choice(ing_1_choice, "Dirt.");
        with ing_1_dirt {
            curDirt -= curDirt;
            dirt += 1;
            drink_string = "1 Dirt"
        }
    }
    if (curDust >= 1) {
        var ing_1_dust = scr_event_build_add_choice(ing_1_choice, "Dust.");
        with ing_1_dust {
            curDust -= curDust;
            dust += 1;
            drink_string = "1 Dust"
        }
    }
    
    //----------------------------------------
    // INGREDIENT 2
    //----------------------------------------
    var ing_2_choice = scr_event_build_choice("Second ingredient? (" + drink_string + ")", s_port_hoopz);
    if (curSand >= 1) {
        var ing_2_sand = scr_event_build_add_choice(ing_2_choice, "Sand.");
        with ing_2_sand {
            curSand -= curSand;
            sand += 1;
            if (drink_string = "1 Sand") {
                drink_string = "2 Sand")
            }
            else {
                drink_string = drink_string + ", 1 Sand";
            }                
        }
    }
    if (curPebble >= 1) {
        var ing_2_pebble = scr_event_build_add_choice(ing_2_choice, "Pebble.");
        with ing_2_pebble {
            curPebble -= curPebble;
            pebble += 1;
            if (drink_string = "1 Pebble") {
                drink_string = "2 Pebble")
            }
            else {
                drink_string = drink_string + ", 1 Pebble";
            }  
        }
    }
    if (curDirt >= 1) {
        var ing_2_dirt = scr_event_build_add_choice(ing_2_choice, "Dirt.");
        with ing_2_dirt {
            curDirt -= curDirt;
            dirt += 1;
            if (drink_string = "1 Dirt") {
                drink_string = "2 Dirt")
            }
            else {
                drink_string = drink_string + ", 1 Dirt";
            }  
        }
    }
    if (curDust >= 1) {
        var ing_2_dust = scr_event_build_add_choice(ing_2_choice, "Dust.");
        with ing_2_dust {
            curDust -= curDust;
            dust += 1;
            if (drink_string = "1 Dust") {
                drink_string = "2 Dust")
            }
            else {
                drink_string = drink_string + ", 1 Dust";
            }  
        }
    }
    
    //----------------------------------------
    // INGREDIENT 3
    //----------------------------------------
    var ing_3_choice = scr_event_build_choice("Third ingredient? (" + drink_string + ")" s_port_hoopz);
    if (curSand >= 1) {
        var ing_3_sand = scr_event_build_add_choice(ing_3_choice, "Sand.");
        with ing_3_sand {
            curSand -= curSand;
            sand += 1;
        }
    }
    if (curPebble >= 1) {
        var ing_3_pebble = scr_event_build_add_choice(ing_3_choice, "Pebble.");
        with ing_3_pebble {
            curPebble -= curPebble;
            pebble += 1;
        }
    }
    if (curDirt >= 1) {
        var ing_3_dirt = scr_event_build_add_choice(ing_3_choice, "Dirt.");
        with ing_3_dirt {
            curDirt -= curDirt;
            dirt += 1;
        }
    }
    if (curDust >= 1) {
        var ing_3_dust = scr_event_build_add_choice(ing_3_choice, "Dust.");
        with ing_3_dust {
            curDust -= curDust;
            dust += 1;
        }
    }
    
    //----------------------------------------
    // SHAKE THE DRINK!!!!
    //----------------------------------------
    // drink shaking goes here
    
    // DRINK ARRAY!!!
    drink[3,0,0,0] = "Sandstorm"
    drink[2,1,0,0] = "Sandblaster"
    drink[2,0,1,0] = "Sand Trap"
    drink[2,0,0,1] = "Sand & Dusty"
    // Pebble
    drink[0,3,0,0] = "Rocks on Rocks on Rocks"
    drink[1,2,0,0] = "Rock & Roller"
    drink[0,2,1,0] = "Rocky Top"
    drink[0,2,0,1] = "Rocky Classic"
    // Dirt
    drink[0,0,3,0] = "Dirtopia"
    drink[1,0,2,0] = "Dirty Beach"
    drink[0,1,2,0] = "Dirt Djinni"
    drink[0,0,2,1] = "Dirt & Dusty"
    // Dust
    drink[0,0,0,3] = "Old Fashioned"
    drink[1,0,0,2] = "Dust Storm"
    drink[0,1,0,2] = "Dust Bowl"
    drink[0,0,1,2] = "Dusty Trail"
    // One Of Each
    drink[1,1,1,0] = "Grainy Fusion"
    drink[1,1,0,1] = "Clean Shake"
    drink[1,0,1,1] = "Splendid Daiquiri"
    drink[0,1,1,1] = "Mojito"
    
    var drinkTitle = drink[sand,pebble,dirt,dust];
    
    scr_event_build_dialogue("X114JAM9", s_port_hoopz, "Aha! A " + drinkTitle + "!");
    scr_event_build_event_snippet(serve_snippet);
}
//-----------------------------------------------------------------------------
with (first_time_snippet) {
    // stuff happens
    // rules introduction
    scr_event_build_dialogue("Here", NULL, "'s the rules!");
    scr_event_build_event_snippet(mix_new_snippet);
}
//-----------------------------------------------------------------------------
with (serve_snippet) {
    // default to ZELDA
    scr_event_build_event_snippet(zelda_snippet);
}
//-----------------------------------------------------------------------------
with (ending_snippet) {
    // TODO
    // everybody bitches if they are unhappy. it basically just runs through "take_orders_snippet" again and gives dialogue if they are still in demand of something    
}
//-----------------------------------------------------------------------------
with (zelda_snippet) {
    // this is how to calculate zelda's score. we can have them all be different!
    // it is easier to do custom scores for everybody, honestly. i don't want to think about everybody who COULD
    // be in this quest all at once. so this is easier.

    // define level and score
    zeldaLevel = scr_quest_get_state("zeldaLevel");
    zeldaScore = scr_quest_get_state("zeldaScore");

    // establish perfects, which can have special dialogues
    if (zeldaLevel == 1) { zeldaPerfect = "Dirt Djinni"; } 
    else if (zeldaLevel == 2) { zeldaPerfect = "Dusty Trail"; }
    else if (zeldaLevel == 3) { zeldaPerfect = "Rocky Top"; }

    // individual characteristics
    zeldaSand = -1;
    zeldaPebble = 0;
    zeldaDirt = 0;
    zeldaDust = 1;

    // calculate score
    zeldaRound = (sand * zeldaSand) + (pebble * zeldaPebble) + (dirt * zeldaDirt) + (dust * zeldaDust);
    zeldaScore = max(0, zeldaScore + zeldaRound);
    zeldaDialogue = NULL_STRING;

    // if perfect: advance to next level and reset score; get special dialogue
    if (zeldaPerfect == drink[sand, pebble, dirt, dust]) {
        // advance to next level
        zeldaLevel += 1;
        // reset score
        zeldaScore = 0;
        // get special dialogue
        if (zeldaLevel == 1) { 
            zeldaDialogue = "Dear Clisp that's spicy!... this dwarf sure done needed to quaff a Dirt Djinni! My throat's scorching! That's the stuff... but it does make ya want water more, don't it now? Water..."
        } 
        else if (zeldaLevel == 2) { 
            zeldaDialogue = "What in blue blazes is this? I didn't think a Trail could be this Dusty! Makes me crave a glass of water...";
        }
        else if (zeldaLevel == 3) {
            zeldaDialogue = "Hoot and holler! It's a Rocky Top!";
        }
    }
    // if score exceeded, advance to next level and reset score
    if (zeldaScore >= zeldaLevel + 2) {
        zeldaLevel += 1;
        zeldaScore = 0;
    }

    if (zeldaDialogue == NULL_STRING) {
        if dust >= 1
            
        scr_event_build_dialogue("Zelda", NULL, "");
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
        scr_event_build_dialogue("Zelda", NULL, "");
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
    }
    else {
        scr_event_build_dialogue("Zelda", NULL, zeldaDialogue);
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
        scr_event_build_dialogue("Zelda", NULL, "");
        scr_event_build_dialogue("X114JAM9", s_port_hoopz, "");
    }
}
//-----------------------------------------------------------------------------


