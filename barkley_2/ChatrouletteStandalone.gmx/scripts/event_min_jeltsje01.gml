script = "
IF jeanmarcStateMines == 0 | GOTO | MINES0
IF jeanmarcStateMines == 1 | GOTO | MINES1
IF jeanmarcStateMines == 2 | GOTO | MINES2
IF jeanmarcStateMines == 3 | GOTO | DILEMMA

MINES0
DIALOG | Jean-Marc Pierre | *Yawn* Another lousy dwarf, huh? Alright, you fuck. Let's see your slave license.
DIALOG | P_NAME | Sorry, but I don't have one. I've got this ID card though...
DIALOG | Jean-Marc Pierre | What? What are you talking about you lousy piece of shit? Some shit dwarf like you ain't got no ID card.
DIALOG |P_NAME | Here, take a look for yourself.
    // ACTION POSE //
DIALOG | Jean-Marc Pierre | Klauust Mitsugiri? 
DIALOG |P_NAME | Yeah, uh, that's me. I'm Klauust Mitsugiri.
DIALOG | Jean-Marc Pierre | Clispdamnit! Who the fuck came up with these stupid rules? All I wanted was to beat the shit out of you... Go on, take your lousy ID card and get out of my sight.
DIALOG |P_NAME | (I can't believe that worked...)
QUEST | jeanmarcStateMines = 1 
QUEST | knowJeanmarc = 1 

MINES1
DIALOG | Jean-Marc Pierre | You again? What the hell do yo uwant?
DIALOG | P_NAME | Hey, take it easy. I was just wondering what are you guys doing down here in the mines.
DIALOG | Jean-Marc Pierre | What? What kind of a question is that? You some sorta dwarf spy or something? I ain't telling you anything. 
DIALOG | P_NAME | I'm not a spy. Honest! I'm just, uh, curious. That's all. 
DIALOG | Jean-Marc Pierre | Alright, I've had it up to my tumor with this circus. I don't know who's fudged up but you definetly shouldn't be allowed to be down here. But I can't mangle you because of the rules. This is so fucking frustrating! I need a break...
    // JEANMARC turns to face constantine (face right)
DIALOG | Jean-Marc Pierre | Constantine!
DIALOG | Constantine | What's up?
DIALOG | Jean-Marc Pierre | Cover for me for a bit, I need to take a small break.
DIALOG | Constantine | ...
DIALOG | Jean-Marc Pierre | Well? You gonna help me out or not?
DIALOG | Constantine | Heh, you're gonna owe me big time.
DIALOG | Jean-Marc Pierre | Whatever.
    // JEANMARC leaves to the tunnel  scr_event_build_move_to_point(o_jeanmarc01, 240, 320);
QUEST | jeanmarcStateMines = 2
    // JEANMARC DESTROYED scr_event_build_destroy_object(o_jeanmarc01);

MINES2
DIALOG | P_NAME | Huh? It's that rude Duergar, and it looks like he is sound asleep...
    WAIT 0.5
    // HOOPZ FACE WEST
    WAIT 0.5 
DIALOG | P_NAME | Hmm...
    WAIT 0.5
    // CAMERA 320 320 NORMAL SPEED
    WAIT FOR ACTIONS
    WAIT 1.5
    // CAMERA HOOPZ AND JEANMARC
    WAIT FOR ACTIONS 
    WAIT 0.5
DIALOG | P_NAME | I can't believe I'm saying this, but this is a prime opportunity to help the dwarfs by shoving one of their tormentors down into that pit.
GOTO | DILEMMA

DILEMMA
CHOICE | Push the cart into the pit?
REPLY | DOIT | I have to do it...
REPLY | DONT | No... I can't!

DOIT
DIALOG | P_NAME | You brought this on yourselves... It's time to pay the piper.
    scr_event_build_move_to_point(o_cts_hoopz, o_jeanmarc01.x + 24, o_jeanmarc01.y)
    scr_event_build_wait_for_actions();
    scr_event_build_look(o_cts_hoopz, WEST);
    scr_event_build_wait(0.25);
DIALOG | P_NAME | Adios.
    scr_event_build_wait(0.4);
    // TODO Hoopz action sprite pushes the cart // 528 328 
    scr_event_build_visible(o_jeanmarc01, false);
    scr_event_build_create_object(o_cts_jeanmarc_demise01, o_jeanmarc01.x, o_jeanmarc01.y);
    scr_event_build_camera_move_to_point(344, 300, MOVE_NORMAL);
    scr_event_build_wait_for_actions();
    scr_event_build_wait(2.5);
    scr_event_build_camera_frame(MOVE_NORMAL, o_cts_hoopz, o_jeanmarc01);
    scr_event_build_wait_for_actions();
DIALOG | P_NAME | ...
    scr_event_build_destroy_object(o_jeanmarc01);                

DONT
DIALOG | P_NAME | No, this isn't right. I know they are evil, everything I've seen and heard and felt has proved that much. But... I'm no executioner.                
QUEST | stateJeanmarcMines = 3
";

/*
    // Only exist while Alpha Camp is safe //
    if scr_min_cspear() == "prep" or scr_min_cspear() == "during" or scr_min_cspear() == "after" then scr_event_interactive_deactivate();
    
// Collision //
else if (argument0 == SCRIPT_COLLISION_HOOPZ) {

    // Inform the player about the rules of Beta Camp //
    if scr_quest_get_state("min_alpha_greeting") == 0 {

    scr_quest_set_state("min_alpha_greeting", 1);{

                // Halt //  
                scr_event_build_wait(0.5);
                scr_event_build_look(o_cts_hoopz, WEST);
                scr_event_build_camera_move_to_point(344, 208, MOVE_NORMAL);
                scr_event_build_wait_for_actions();
                scr_event_build_wait(1.25);
                DIALOG | P_NAME | Wow, take a look at that!
                scr_event_build_wait(0.5);
                scr_event_build_camera_move_to_point(o_hoopz.x - 30, o_hoopz.y, MOVE_NORMAL);
                scr_event_build_wait_for_actions();
                scr_event_build_wait(0.5);
                scr_event_build_look(o_jeltsje01, EAST);
                scr_event_build_wait(0.2);
                scr_event_emote("exclamation", o_jeltsje01, 0, 0);
                scr_event_build_wait(1.5);

                DIALOG | Jeltsje | What the hell?
                scr_event_build_move_to_point(o_jeltsje01, o_hoopz.x - 50, o_hoopz.y);
                scr_event_build_wait_for_actions();
                scr_event_build_look(o_jeltsje01, EAST);
                scr_event_build_wait(0.25);
                DIALOG | Jeltsje | Who the hell are you? How did you get down here?              
                DIALOG | P_NAME | I'm Klauust Mitsugiri. Here, check out my ID card.
                DIALOG | Jeltsje | What? For clisps sake... How the hell did you get this?
                DIALOG | P_NAME | Hey, it's legit. So chill out.
                DIALOG | Jeltsje | We'll see about that...
                scr_event_build_wait(0.5);
                scr_event_build_look(o_jeltsje01, WEST);
                DIALOG | Jeltsje | Hey Lumis. You ever hear of anyone called Klauust Mitsugiri?
                scr_event_build_camera_move_to_point(o_lumis01.x + 40, o_lumis01.y, MOVE_NORMAL);
                scr_event_build_wait_for_actions();
                DIALOG | Lumis | That's Captain Lumis to you, you piece of shit.
                DIALOG | Jeltsje | You think you're some big shot now that you got promoted? You think anyone here respects you?
                DIALOG | Lumis | Watch your mouth, bitch. This mining project is the only thing stopping me from wringing your neck.
                DIALOG | Jeltsje | Oh yeah? You'd best sleep with one eye open you miserable...
                DIALOG | Lumis | What's that? You got something to say to me?
                DIALOG | Jeltsje | No sir.
                DIALOG | Lumis | That's better. Now take that dwarf trash out of my sight and shut the hell up.
                scr_event_build_wait(0.75);
                scr_event_build_look(o_jeltsje01, EAST);
                DIALOG | Jeltsje | You heard him. Move.
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay...");
                scr_event_build_camera_follow(MOVE_SLOW, o_cts_hoopz)
                
                scr_event_build_move_to_point_ext(o_cts_hoopz, 696, 224, MOVE_NORMAL);
                scr_event_build_move_to_point_ext(o_jeltsje01, 646, 220, MOVE_NORMAL);
                scr_event_build_wait(2);
                scr_event_build_look(o_cts_hoopz, WEST);
                scr_event_build_wait_for_actions();
                
                DIALOG | Jeltsje | Alright, that's far enough, asshole.
                DIALOG | P_NAME | So... Can I go now?
                DIALOG | Jeltsje | Hah! I suppose I'm not allowed to stop you since you have that ID card, but I don't believe for a second that it's not a forgery.
                DIALOG | P_NAME | W-what do you mean? It's me, Klauust Mitsugiri! I'm not trying to trick you guys.
                DIALOG | Jeltsje | You know what, Mitsugiri? I could have your card checked by the higher ups. I've got the connections to do that. But I could look the other way this time if you do a little errand for me.
                DIALOG | P_NAME | *Gulp* Y-yeah sure. I mean my card is real for sure, I just like helping people out. I mean, I'm not trying to... What I'm saying is that I'd love to help.
                DIALOG | Jeltsje | Heh, looks like you're not as stupid as you look.
                DIALOG | P_NAME | So what do you want me to do?
                DIALOG | Jeltsje | Just little something for Captain Lumis over there. What a great guy, huh? Sometimes he gets a bit... uppity. But I'd like to give him a surprise to uh... brighten his day. I'm going to make him a nice Garlics Risotto.
                DIALOG | P_NAME | What...? I mean, okay, that sounds... nice. So what do you want me to do? 
                DIALOG | Jeltsje | You are going to take your stinking hide out of here and find some Columbus Day Garlics for me.
                QUEST | jeltsjeGarlics = 1
                
                // Already have the Garlics? //                
                if scr_item_have("Garlics") {
                    
                    // Choice //
                    var choice = scr_event_build_choice("Hey, I have something like that...", s_port_hoopz); 
                    
                        // Hand out the Garlics //
                        var give = scr_event_build_add_choice(choice, "I'll give my Garlics to a good cause");
                        with give {
                        
                            // Give the Garlics //
                            DIALOG | P_NAME | Columbus Day Garlics? I think I have some of those...
                            DIALOG | Jeltsje | Motherfucker... Maybe you aren't a completely useless and repulsive shithead after all. Alright, hand them over.
                            // TODO // Hoopz action sprite //
                            scr_event_build_wait(0.5);
                            scr_event_build_dialogue_item("Lost Columbus Day Garlics");
                            scr_event_build_item_loss("Garlics", 1);
                            scr_event_build_wait(0.5);
                            DIALOG | P_NAME | You really think a Garlics Risotto is going to make that guy behave?
                            DIALOG | Jeltsje | What? Oh, uh, I don't know. Now piss off, I don't ever want to see you in my life.
                            scr_event_build_move_to_point(o_jeltsje01, 504, 208);
                            scr_event_build_wait_for_actions();
                            scr_event_build_quest_state("garlic_eventkill", 5);
                            DIALOG | Jeltsje | Hmph... Some gratitude would've been nice...
                            scr_event_build_quest_state("min_alpha_greeting", 4);
                            }
        
                        // Keep a low profile about the Garlics //
                        var keep = scr_event_build_add_choice(choice, "I'd better keep a low profile about these Garlics I have...");
                        with keep {
                                           
                            // Keep the Garlics a secret //
                            DIALOG | P_NAME | Columbus Day Garlics, huh? Never heard of anything like that.
                            DIALOG | Jeltsje | What a shocker. Listen up, idiot. There's this guy called Fallen Gordo. He is on the top of this Garlics business. You find him, you find the Garlics. You got that?
                            DIALOG | P_NAME | Fallen Gordo, huh... But where can I find you after I have the Garlics?
                            DIALOG | Jeltsje | For fucks sake... Do I have to do everything for you? Alright, we're scheduled to move to Brain City later today. You can give them to me there.
                            DIALOG | P_NAME | Okay then.
                            DIALOG | Jeltsje | Oh, and just as a reminder. Fuck this up, and I'll have your head on a pike. You have until the break of dawn to deliver the Garlics, so you'd better get to it.
                            scr_event_build_move_to_point(o_jeltsje01, 504, 208);
                            scr_event_build_wait_for_actions();
                            DIALOG | P_NAME | *Gulp*
                            scr_event_build_quest_state("min_alpha_greeting", 2);
                            }
                       }
                    
                // Don't have the garlics //
                else {            
                
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Columbus Day Garlics? Where can I find those?");
                    scr_event_build_dialogue(jeltsjename, s_port_jeltsje, "There's this fat fuck who produces them. Fallen Gordo they call him. Last I heard he was running his operation somewhere near Tir na Nog.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Fallen Gordo, huh? Oh, but how am I supposed to find you if I get those Garlics?");
                    scr_event_build_dialogue(jeltsjename, s_port_jeltsje, "For fucks sake... Do I have to do everything for you? Alright, we're scheduled to move to Brain City later today. You can give them to me there.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Okay then.");
                    scr_event_build_dialogue(jeltsjename, s_port_jeltsje, "Oh, and just as a reminder. Fuck this up, and I'll have your head on a pike. You have until the break of dawn to deliver the Garlics, so you'd better get to it.");
                    scr_event_build_move_to_point(o_jeltsje01, 490, 208);
                    scr_event_build_wait_for_actions();
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "*Gulp*");
                    scr_event_build_quest_state("min_alpha_greeting", 2);
                    }        
                }
        scr_event_advance(event);
    }    
}
