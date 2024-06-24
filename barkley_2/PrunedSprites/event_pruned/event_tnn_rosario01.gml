// Rosario - generic dancer in Booty Bass quest
// usage: event_tnn_rosario01

if (argument0 == SCRIPT_INTERACT) {
    var rosario = id;
    var event = scr_event_create_main();
    with (event) {
         // Build events!
        if (scr_quest_get_state("bootyBassQuest") == 3) { // *** if bootyBassQuest = 3 ***
            scr_event_build_dialogue("Rosario", NULL, "Dang, that was the freshest post-jock jam bootycore I've ever heard. Scene's gonna go nuts when this hits the blogs.");
        }
        else if (scr_quest_get_state("bootyBassQuest") == 2) { // *** if bootyBassQuest = 2 ***
            scr_event_build_dialogue("Rosario", NULL, "You don't beat The Anime Bulldog. Not on your first try, kid. His bite is as fierce as his bark and his beats are sicker than the booty plague. Just go home.");
        }
        else if (scr_quest_get_state("rosarioState") == 1) { // *** if rosarioState = 1 ***
             scr_event_build_dialogue("Rosario", NULL, "I'm feelin' it... I'm feelin' it!! Someone get me a mechanic, 'cuz my keister's on the fritz!");
        }
        else if (scr_quest_get_state("bootyBassQuest") <= 1) {
            scr_event_build_dialogue("Rosario", NULL, "Oh man, oh man, the Anime Bulldog is so cool... but so is DJ Booty Slayer... I can't tell who's gonna be crowned the Baron of Booty, they've both brought their A-game.");
            var choice = scr_event_build_choice("Who will be the Baron of Booty?", s_port_hoopz);
            var bulldog = scr_event_build_add_choice(choice, "The Anime Bulldog.");
            with bulldog {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I like the Anime Bulldog better.");
                scr_event_build_dialogue("Rosario", NULL, "Yeah, the Anime Bulldog's got that pumpin' beat and mature sound but I don't know, DJ Booty Slayer's got that psychedelic bootytrance going. I'm gonna have to flip a coin on this one because they're both on fire.");
                scr_event_build_quest_state("rosarioState", 1);
            }
            var bootyslayer = scr_event_build_add_choice(choice, "DJ Booty Slayer.");
            with bootyslayer {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "The Anime Bulldog's not bad, but DJ Booty Slayer's got it going on.");
                scr_event_build_dialogue("Rosario", NULL, "The Anime Bulldog's all about ambient bloghouse booty samples but DJ Booty Slayer's the master of bitcrushed bootywave. I guess you've just gotta be in the mood for it.");
                scr_event_build_quest_state("rosarioState", 1);
            }
            if (scr_time_get() < 4) && (scr_quest_get_state("bootyBassQuest") == 0) {
                var melf = scr_event_build_add_choice(choice, "I'm going to be the Baron of Booty.");
                with melf {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Forget about them. There's a new Baron of Booty in town.");
                    scr_event_build_dialogue("Rosario", NULL, "Haha, are you kidding me kid? You think you've got the booty beats to take on the Anime Bulldog AND DJ Booty Slayer? You're out of your mind. These are the two freshest dudes on the scene. You'd better be one bumpin' DJ.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Heh, you better believe it. I'll get your rump bumpin' AND gumpin', buddy.");
                    scr_event_build_dialogue("Rosario", NULL, "Yeah, well we'll see about that kid.");
                    scr_event_build_quest_state("rosarioState", 1);
                }
            }
            var cant_decide = scr_event_build_add_choice(choice, "I can't decide.");
            with cant_decide {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I can't really decide.");
                scr_event_build_dialogue("Rosario", NULL, "Yeah, me neither man, tonight is wild. This is definitely the best Booty Bass blowout ever. My tookis is goin' haywire!");
                scr_event_build_quest_state("rosarioState", 1);
            }
        }
    }
    scr_event_advance(event);
}
