///The Final Decision: INJECT, THROW, DESTROY
script = "
DIALOG | P_NAME | There you are, Cuchulainn! 
DIALOG | Cuchulainn = s_port_cuchuPrimo | Yes... here we are... Hell approaches faster and faster. Are you ready? It will be your final resting place!
DIALOG | P_NAME | Oh yeah? Take this!
" +
//TODO: SOUND | hoopz readies Cyberspear
//TODO: PLAYSET | hoopz readies Cyberspear
"
DIALOG | The Cyberdwarf | No, P_NAME_S! Stay thy weapon!
DIALOG | P_NAME | Huh?
DIALOG | The Cyberdwarf | Don't throw the Cyberspear! It is not meant for Cuchulainn.. It is for you!
DIALOG | P_NAME = s_port_hoopzShock | Say what?!
DIALOG | The Cyberdwarf | Pierce your heart with the business end of the Cyberspear! Doing so  will allow me to fight with you. Together, we'll have more than enough power to defeat Cuchulainn. It's the only way.
DIALOG | P_NAME | Fight with me? What do you mean?
DIALOG | Cuchulainn = s_port_cuchuPrimo | Ghuhuhuhu, this is too much! Do you really believe what he's saying, kid? Inject that thing into your neck and that AI will take over your brain in a second!
DIALOG | P_NAME = s_port_hoopzSurprise | Huh? Take over?
DIALOG | The Cyberdwarf | Silence, you foul abomination!
DIALOG | Cuchulainn | Kyukyukyukyu! Go on, kid. Do it, see what happens! The Cyberspear as your friend calls it is nothing more than USB 12.0! You've been whipping around a glorified flashdrive with your /'buddy/' written into it. Ghyahahahah. The Cyberdwarf doesn't want to share your destiny, he wants control your hot, young, supple bod!
DIALOG | P_NAME | Cyberdwarf... is that true?
DIALOG | Cuchulainn = s_port_cuchuPrimo | Of course it is!
DIALOG | The Cyberdwarf | I said silence! Do not listen to this trickster, P_NAME_S! He means only to lead you astray, and into Hell with all of dwarfkind!
DIALOG | Cuchulainn = s_port_cuchuPrimo | Kyahahaha! This was his plan all along, kid! Do you really think he was willing to spend his whole existence cooped up in a hard drive, then migrate to a solid state drive, then finally to proprietary 3D storage architechture? He longs for a permanent return to the flesh, and that means claiming your body for himself! He looks at you and sees nothing but meat and sinew! You're just an instrument! Kwehehehe!
DIALOG | P_NAME = s_port_hoopzSad | Then... then all that stuff about my destiny...
DIALOG | The Cyberdwarf | P_NAME_S, your destiny is real! You are destined to be the most powerful baller who ever lived. You have the power to save not only the dwarfs of Necron 7, but entire galaxies! You are the chosen one, P_NAME_F, trust me!
DIALOG | P_NAME | I... I don't know what to say...
DIALOG | The Cyberdwarf | You don't have to... inject yourself with the Cyberspear, P_NAME_F. That's all you have to do... we'll have power to beat Cuchulainn. Power beyond our wildest dreams!
DIALOG | Cuchulainn = s_port_cuchuPrimo | Bwahahahaha! Look at him panic. You won't last a second after you use that device, kid. We all know it!
DIALOG | P_NAME | Is he telling the truth, Cyberdwarf? Is that what you believe in? Total apocalyptic ideals?
DIALOG | The Cyberdwarf | Just the opposite, child. You... you are the Messiah. You, P_NAME_F, are Clispaeth!
DIALOG | P_NAME = s_port_hoopzShock | W-what? Clispaeth? ... I'm Clispaeth?... how can this be...?
DIALOG | The Cyberdwarf | What Cuchulainn and his /'mixed bag/' of charlatan Duergar scientists will tell you is that Destiny lies before you. That the thread of F.A.T.E. is unbreakable and linear. They are wrong! F.A.T.E. is not a thread it is a web! Stretching out in all directions! and looping around upon itself. I know you are Clispaeth because you already have been! You feel like you are at the end of your destiny but rather,_ at the center of your F.A.T.E. P_NAME_F! 
DIALOG | Cuchulainn = s_port_cuchuPrimo | Clispaeth!? F.A.T.E. webs? You two must be kidding me! This is all bullpuck!
DIALOG | The Cyberdwarf | He lies! The Messiah is real and in the flesh! You are the Messiah! 
DIALOG | Cuchulainn = s_port_cuchuPrimo | I'm tired of this... I'll kill you both before we even get to Hell. Die!
" +
//TODO: CUCHU ATTACKS THE Cyberdwarf Hologram bounces around him
"
DIALOG | The Cyberdwarf | P_NAME_F! Inject the Cyberspear now!
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzMeditative | (Focus, P_NAME_S.)
WAIT | 0.5
" +
//TODO: Hoopz sees a Tuber Float Down from the top of the screen and then lensflare
"
DIALOG | P_NAME = s_port_hoopzMeditative | (Focus, P_NAME_S.)
CHOICE | What do you do?
REPLY | INJECT | Inject the Spear into yourself.
REPLY | THROW | Throw the Spear at Cuchu.
REPLY | DESTROY | Destroy the Spear with Cyberdwarf. 

" +
// INJECT CYBERSPEAR, CYBERDWARF TAKEOVER
"
INJECT
DIALOG | P_NAME | We've come this far, Cyberdwarf. I trust you...
" +
/*
scr_event_build_dialogue_debug("bort", NULL, "The player places the Cyberspear against their chest or noggin or whatever, and /'injects/' it.
scr_event_build_animation_play_and_set(o_cts_hoopz, "csInjecting", "csInjected
scr_event_build_wait_for_actions();
scr_event_build_dialogue_debug("bort", NULL, "The player begins to shake or morph or do whatever shit to indicate that they are now possessed by Cyberdwarf.
scr_event_build_dialogue_debug("bort", NULL, "Cuchu Primordia stops bouncing.
scr_event_build_animation_set(o_chu_primordia01, "primoDefault
scr_event_build_dialogue_debug("bort", NULL, "OPTION 1: The game ends here, with an abrupt fade. You're taken to the score screen, but the events that unfold between Cyberdwarf and Cuchulainn Primordia are not witnessed.
scr_event_build_dialogue_debug("bort", NULL, "OPTION 2: The player watches a scripted battle between Cuchulainn and Cyberhoopz, now with a COOL CYBERDWARF CLASS ABILITY or two.
scr_event_build_dialogue_debug("bort", NULL, "OPTION 3: The player then gets to fight a battle as Cyberhoopz, with a COOL CYBERDWARF CLASS ABILITY or two!!!
scr_event_build_dialogue_debug("bort", NULL, "As of now, we're going with OPTION 1!
scr_event_build_fade(true, 0.01);
scr_event_build_quest_state("cdwarfTakeover", 1);
scr_event_build_dialogue_debug("bort", NULL, "TODO: TELEPORT TO SCORE.
//scr_event_build_teleport(r_ending01, 192, 192);
//scr_event_build_execute_event_script(event_gbl_gameover01);
*/
"
EXIT |

" +
// THROW CYBERSPEAR, OMNIDWARF BATTLE
"
THROW
DIALOG | P_NAME | Why? Why? I hate both of you! Enough!
" +
/*
scr_event_build_dialogue_debug("bort", NULL, "The player hurls the Cyberspear at Cuchulainn!;
scr_event_build_animation_play_and_set(o_cts_hoopz, "csThrowing", "csThrown
//scr_event_build_create_object(o_cyberspear, cs_x, cs_y);
//scr_event_build_move_ext(o_cyberspear, cs_x2, cs_y2, 20);;
scr_event_build_dialogue_debug("bort", NULL, "The Cyberspear flies through the air.
scr_event_build_wait_for_actions();
scr_event_build_dialogue_debug("bort", NULL, "It sticks into Cuchu Primordia, and then begins TRANSFERRING DATA!")
//scr_event_build_animation_play_and_set(o_cyberspear, "strike", "transferring
scr_event_build_wait_for_actions();
scr_event_build_dialogue_debug("bort", NULL, "Primordia begins to shake and transform!")
scr_event_build_animation_play_and_set(o_chu_primordia01, "omniTransforming
scr_event_build_wait_for_actions();
scr_event_build_dialogue_debug("bort", NULL, "The screen has some kind of flash perhaps?
scr_event_build_dialogue_debug("bort", NULL, "Where Cuchu Primordia once was, now there is SSJ Omnidwarf!")
scr_event_build_animation_set(o_chu_primordia01, "omniDefault
scr_event_build_wait(3);
scr_event_build_dialogue("Omnidwarf", "s_port_omni", "What... what have you done!? My perfect body was so close... and you locked me in this putrid thing!" + P_NAME + "...
scr_event_build_dialogue_debug("bort", NULL, "Omnidwarf BELLOWS and makes a horrific ape-noise!")
scr_event_build_animation_play_and_set(o_chu_primordia01, "omniBellow", "omniDefault
scr_event_build_wait_for_actions();
scr_event_build_dialogue("Omnidwarf", "s_port_omni", "You'll pay for this, you insolent child!
scr_event_build_dialogue_debug("bort", NULL, "Omnidwarf LEAPS up to where the battle with him actually occurs.")
scr_event_build_animation_set(o_chu_primordia01, "omniLeaping
scr_event_build_move_ext(o_chu_primordia01, zig_x, zig_y, 5);
scr_event_build_wait_for_actions();
scr_event_build_wait(1);
scr_event_build_animation_play_and_set(o_chu_primordia01, "omniLanding", "omniDefault
scr_event_build_dialogue_debug("NARRATOR", NULL, "You then battle SSJ Omnidwarf, who is a mean S.O.B.
scr_event_build_quest_state("cdwarfOmniFight", 1);
// scr_event_build_quest_state("cdwarfOmniDead", 1); // happens ONLY on victory! just here as a note.
*/
"
EXIT |

" +
// DESTROY CYBERSPEAR, REGULAR PRIMORDIA BATTLE
"
DESTROY
DIALOG | P_NAME | Cyberdwarf, how could you lie to me!? I'm not going to be your puppet!
DIALOG | Cuchulainn = s_port_cuchuPrimo | Kuehekeheke! Wise choice... but you'll still die here!
EXIT |
"
