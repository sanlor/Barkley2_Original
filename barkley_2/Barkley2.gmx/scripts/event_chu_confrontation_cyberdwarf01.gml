// event_chu_confrontation_cyberdwarf
/*
    
DIALOG | P_NAME     | There you are, Cuchulainn!
DIALOG | Cuchulainn | Yes... here we are... Hell approaches faster and faster. Are you ready? It will be your final resting place!
DIALOG | P_NAME     | Oh yeah? Take this!
// HOOPZ READIES CYBERSPEAR
WAIT  | 0
DIALOG | Cyberdwarf | No, P_NAME! Wait!
DIALOG | P_NAME     | Huh?
DIALOG | Cyberdwarf | Don't throw the Cyberspear! It isn't meant for Cuchulainn, P_NAME... it is for you. Place the Cyberspear to your neural jack, and I will be able to fight with you. Together, we'll have more than enough power to defeat Cuchulainn. It's the only way.
DIALOG | P_NAME     | Fight with me? What do you mean?
DIALOG | Cuchulainn | Ghuhuhuhu, this is too much! Do you really believe what he's saying, kid? Inject that thing into your neck and that AI will take over your brain in a second... go on, do it!
DIALOG | Cyberdwarf | Silence, you foul abomination!
DIALOG | P_NAME     | Cyberdwarf... is that true?
DIALOG | Cuchulainn | Of course it is!
DIALOG | Cyberdwarf | I said silence! Do not listen to this trickster, P_NAME! He means only to lead you astray, and into Hell with all of dwarfkind!
DIALOG | Cuchulainn | Kyahahaha! This was his plan all along, kid! Do you really think he was willing to spend his whole existence cooped up in your CPU? He longs to return to the flesh, and that means claiming your body for himself! He looks at you and sees nothing but sinew! You're just an instrument! Kwehehehe!
DIALOG | P_NAME     | Then... then all that stuff about my destiny...
DIALOG | Cyberdwarf | P_NAME, your destiny is real! You are destined to be the most powerful baller who ever lived. You have the power to save not only the dwarfs of Necron 7, but entire galaxies! You are the choosen one, P_NAME, trust me!
DIALOG | P_NAME     | I... I don't know what to say...
DIALOG | Cyberdwarf | You don't have to... inject yourself with the Cyberspear, P_NAME. That's all you have to do... we'll have power to beat Cuchulainn. Power beyond our wildest dreams!
DIALOG | Cuchulainn | Bwahahahaha! Look at him panic. You won't last a second after you use that device, kid. We all know it!
DIALOG | P_NAME     | Is he telling the truth, Cyberdwarf? Is that what you believe in? Total apocalyptic ideals?
DIALOG | Cyberdwarf | Just the opposite, child. You... you are the Messiah. You, P_NAME, are Clispaeth.
DIALOG | P_NAME     | W-what? Clispaeth? ... I'm Clispaeth?... how can this be...?
DIALOG | Cuchulainn | Clispaeth!? You two must be kidding me!
// scr_event_build_dialogue_debug("bort", NULL, "Cuchu Primordia does a vigorous bounce animation once.
// scr_event_build_animation_play_and_set(o_chu_primordia01, "primoBounce");
WAIT   | 0
WAIT   | 0.5
DIALOG | Cuchulainn | I'm tired of this... I'll kill you both before we even get to Hell. Die!
//scr_event_build_dialogue_debug("bort", NULL, "Cuchu Primordia does a vigorous bounce animation repeatedly, as if he is getting ready for an attack.
//scr_event_build_animation_set(o_chu_primordia01, "primoBouncing");
// CUCHU ATTACKS!!!
DIALOG | Cyberdwarf | Now, P_NAME! Inject the Cyberspear now!
// CHOICES: Throw, Inject, Destroy
CHOICE | What do you do?
REPLY  | CS_DESTRUCT | Destroy the Cyberspear.
REPLY  | CS_THROW    | Throw the Cyberspear.
REPLY  | CS_INJECT   | Inject the Cyberspear.

CS_INJECT
// INJECT CYBERSPEAR, CYBERDWARF TAKEOVER (BLACK SCREEN, FOR NOW)
DIALOG | P_NAME | We've come this far, Cyberdwarf. I trust you...
// Player injects the spear
WAIT   | 0
FADE   | 1 | 2
QUEST  | cdwarfTakeover = 1
// END OF THE GAME
                
CS_THROW
DIALOG | P_NAME | Why? Why? I hate both of you! Enough!
// scr_event_build_dialogue_debug("bort", NULL, "The player hurls the Cyberspear at Cuchulainn!");;
WAIT   | 0
// scr_event_build_dialogue_debug("bort", NULL, "It sticks into Cuchu Primordia, and then begins TRANSFERRING DATA!")
WAIT   | 0
// scr_event_build_dialogue_debug("bort", NULL, "Primordia begins to shake and transform!")
WAIT   | 0
WAIT   | 3
DIALOG | Omnidwarf | What... what have you done!? My perfect body was so close... and you locked me in this putrid thing! P_NAME...
// scr_event_build_dialogue_debug("bort", NULL, "Omnidwarf BELLOWS and makes a horrific ape-noise!")
WAIT   | 0
DIALOG | Omnidwarf | You'll pay for this, you insolent child!
WAIT   | 1
QUEST  | cdwarfOmniDead = 1

CS_DESTRUCT
DIALOG | P_NAME     | Cyberdwarf, how could you lie to me!? I'm not going to be your puppet!
// Destruct the cyberspear
DIALOG | Cuchulainn | Kuehekeheke! Wise choice... but you'll still die here!
WAIT   | 0
WAIT   | 1
QUEST  | primoDead = 1

