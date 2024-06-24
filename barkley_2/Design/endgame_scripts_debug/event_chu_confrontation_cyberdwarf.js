// event_chu_confrontation_cyberdwarf

if (argument0 == SCRIPT_START) {

} else if (argument0 == SCRIPT_STEP) {
    
}
else if (argument0 == SCRIPT_INTERACT) {
    var playerX1 = scr_quest_get_state("playerX1")
   
    if (scr_quest_get_state("playerX1") == 1) {
        var playerName = "X114JAM9"
    } else if (scr_quest_get_state("playerCC") == 1) {
        var playerName = "Dougray"
    } else if (scr_quest_get_state("playerHoopz") == 1) {
        var playerName = "Hoopz"
    }
    var confrontation_cd = id;
    var event = scr_event_create_main()
    with (event) {
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "There you are, Cuchulainn!");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Yes... here we are... Hell approaches faster and faster. Your final resting place!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Oh yeah? Take this!");
        // HOOPZ READIES CYBERSPEAR
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "No, " + string(playerName) + "! Wait!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Huh?");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Don't throw the Cyberspear! It isn't meant for Cuchulainn, " + string(playerName) + "... it is for you. Place the Cyberspear to your neural jack, and I will be able to fight with you. Together, we'll have more than enough power to defeat Cuchulainn. It's the only way.");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Fight with me? What do you mean?");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Ghuhuhuhu, this is too much! Do you really believe what he's saying, kid? Inject that thing into your neck and that AI will take over your brain in a second... go on, do it!");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Silence!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cyberdwarf... is that true?");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Of course it is!");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "I said quiet, you! Do not listen to this foul creature, " + string(playerName) + "! He means only to lead you astray!");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "It was his plan all along! Do you really think he was willing to spend his whole existence in your CPU? He longed to return to the flesh... and you were just the instrument! You're clearly powerful if you could beat my first form. He wants your body to himself!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "All that about my destiny...");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, string(playerName) + ", your destiny is real! You are destined to be the most powerful baller who ever lived. You have the power to save not only the dwarfs of Necron 7, but entire galaxies! You are the chosen one, " + string(playerName) + "trust me!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "I... I don't know what to say...");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "You don't have to... inject yourself with the Cyberspear, " + string(playerName) + ". That's all you have to do... we'll have power to beat Cuchulainn. Power beyond our wildest dreams!");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Bwahahahaha! Look at him panic. You won't last a second after you use that device, kid. We all know it!");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "Is that what you believe in, Cyberdwarf? Total apocalyptic ideals?");
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Just the opposite, child. You... you are the Messiah. You, " + string(playerName) + ", are Clispaeth.");
        scr_event_build_dialogue(string(playerName), s_port_hoopz, "W-what? Clispaeth? ... I'm Clispaeth?... how can this be...?");
        scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Clispaeth!? Are you kidding me? I'm tired of this... I'll kill you both before we even get to Hell. Die!");
        // CUCHU ATTACKS!!!
        scr_event_build_dialogue("Cyberdwarf", s_port_cd, "Now! Inject the Cyberspear now!");
        // CHOICES: Throw, Inject, Destroy
        var cs_choice = scr_event_build_choice("What do you do?", s_port_hoopz);
        var inject_cs = scr_event_build_add_choice(cs_choice, "Inject the Cyberspear.");
        var throw_cs = scr_event_build_add_choice(cs_choice, "Throw the Cyberspear.");
        var destroy_cs = scr_event_build_add_choice(cs_choice, "Destroy the Cyberspear.");
        with inject {
            // INJECT CYBERSPEAR, CYBERDWARF TAKEOVER (BLACK SCREEN, FOR NOW)
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "We've come this far, Cyberdwarf. I trust you...");
            scr_event_build_fade(true, 5);
        }
        with throw {
            // THROW CYBERSPEAR, OMNIDWARF BATTLE
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Why? Why? I hate both of you! Enough!");
            scr_event_build_dialogue("Cyberdwarf", s_port_cdOmni, "What... what have you done!? My perfect body was so close... and you locked me in this putrid thing! " + string(playerName) + "... you'll pay for this, you insolent child!");
        }
        with destroy {
            // DESTROY CYBERSPEAR, REGULAR PRIMORDIA BATTLE
            scr_event_build_dialogue(string(playerName), s_port_hoopz, "Cyberdwarf, how could you lie to me!? I'm not going to be your puppet!");
            scr_event_build_dialogue("Cuchulainn", s_port_cuchuPrimo, "Wise choice... but you'll still die here!");
        }
    }
    scr_event_advance(event);
}