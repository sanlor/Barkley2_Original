///Meeting Gelasio for the first time
/*
REVISED GELASIO, he's a turncoat informant for the Duergars murdered Augustine in the Swamps

He gives you FREE GUTS points because you drink GRAPE JUICE with him for each note you give him.

Variables
    gelasioState
        0 - not talked
        1 - talked, he offers the grape, you declined
        2 - you've drank the grape! now on the hunt for Augustine
        3 - you assume the Baldomero is Augustine, this increases the Marquee for this Quest
        4 - Gelasio has been found out as a turncoat, but you lose (time advances)
        5 - Gelasio gets freaked out by the letter from Augustino and disappears looking for him (he shows up later Dead in the Wasteland)
        
    gelasioDuergar (this is increased initially by Aelfleda and Jindrich)
        0 - no suspicion of Duergar Involvment
        1 - more suspicion
        2 - even more suspicion
        
    Note Variables
        duergarInfoRuins
            0 - none
            1 - the Duergars will be told that there is an Ancient Ruins in the Undersewers!
        duergarInfoLonginus
            0 - none
            1 - you are arrested once you enter the LONGINUS base
        duergarInfoGamingKlatch
            0 - none
            1 - the Duergars will be told about the Gaming Klatch Existence, one more add and it will be raided!
            2 - the Gaming Klatch will be raided!
        duergarInfoBBall
            0 - none
            1 - When you get to the Bball Hideaway, the Commish is gone,
                he's arrested in 1 time unit and sent to prison.
        duergarInfoCornrow
            0 - none
            1 - Cornrow and Juicebox are executed and crucified in the Prison
        duergarInfoWilmer
            0 - none
            1 - Wilmer is immediately taken to the Prison (He'll get jacked in prison)
        duergarInfoAelfleda
            0 - none
            1 - Aelfleda is immediately taken to the prison (She'll be super happy in prison, as she'll be fed and have shelter)

*/
// Not sitting there during the curfew //
//TODO: he is somewhere else during the curfew? As a clue that he is buddy buddy with the duergs
//TODO: he vanishes at gelasioState == 5, and after curfew if gelasioState == 4 
  
script = "
IF gelasioState == 5 | GOTO | GELASIO05
IF gelasioState == 4 | GOTO | GELASIO04
IF gelasioState == 1 | GOTO | GELASIO01
IF gelasioState == 0 | GOTO | GELASIO00

NOTECHOICE
CHOICE | Any clues for Gelasio?
REPLY | SHOWNOTE | Let me show you something.
IF gelasioDuergar == 1 | REPLY | AUGQUESTION | Let me ask you about this supposed /'Augustine/' fellow.
REPLY | SKIPNOTE | Nothing at the moment.

SHOWNOTE
DIALOG | P_NAME | How's this for a scoop?
QUEST | gelasioNoteBypass = 1
EVENT | o_gelasio01 | 1

SKIPNOTE         
DIALOG | P_NAME | I'll get back to you with some clues.
DIALOG | Gelasio | Hurry gumshoe, Augustine and The Grape are waiting!
GOTO | END 

AUGQUESTION
DIALOG | P_NAME | Actually I have some questions about Augustine.
DIALOG | Gelasio | For me, eh? Well what do you want to know?
EVENT | o_gelasio01 | 2

YESTOGRAPE
DIALOG | P_NAME | Hmm, I guess I'm good for one.
DIALOG | Gelasio | Attaboy, tiger, have a seat here and get ready to pucker on that purple nectar.
" +
//Hoopz walks over to Gelasio and drinks The Grape with him after considering ROUNDMOUND
//TODO:Convert these to DSL!
//scr_event_build_move_to_point(o_cts_hoopz, o_cinema0.x, o_cinema0.y);
//scr_event_build_camera_follow_frame(CAMERA_NORMAL, o_cts_hoopz, o_gelasio01);
"
WAIT | 
WAIT | 0.1
DIALOG | Gelasio | Abdul, two rounds of the grape.
DIALOG | P_NAME | (Gulp._._._ my first sup of the grape._._._ Am I ready?)
//ROUNDMOUND: choose your response
CHOICE | Psych yourself up for the GRAPE?
REPLY | GRAPEBALLER | All the best ballers grape...
REPLY | GRAPEVIDCONS | I've heard that The Grape increases my Gamerscore.
REPLY | GRAPECANDY | It's fine, just like a purple lollipop.

GRAPEBALLER
DIALOG | P_NAME | (These blocks of wood on my sneakers only get my calves so ripped. I think this Grape will give be the edge I need. But will this get out of control?)
" +
//ROUNDMOUND - add BBALL
"
GOTO | DRINKGRAPE

GRAPECANDY
DIALOG | P_NAME | (Purple is as purple does, it's just a flavor, no big deal P_NAME_S.)
" +
//ROUNDMOUND - add CANDY
"
GOTO | DRINKGRAPE

GRAPEVIDCONS
DIALOG | P_NAME | (If I do this, I'll be able to stay up all night and break through /'the grind ceiling/' on Hyperborea no Legends.)      
" +
//ROUNDMOUND - add to vidcon
"
GOTO | DRINKGRAPE

DRINKGRAPE
//Regardless of your Roundmound choice, you drink the GRAPE
DIALOG | P_NAME | Gelasio...
DIALOG | P_NAME = s_port_hoopzHappy | Pour me that hard grape!
" +
//TODO: DRINK THE GRAPE ANIMATION THERE SHOULD BE SOME EFFECT
"
DIALOG | Gelasio | Yowweee!_ That's the Deep Grape right there! You can feel it all the way down!
DIALOG | P_NAME | I_, I_, just Graped.\(Like an adult.)
" +
//TODO: give Hoopz +1 guts (this can also be part of the effect above while drinking, whatever works
"
DIALOG | Gelasio | There is plenty more where that came from, ace.
DIALOG | P_NAME | (Keep it together, P_NAME_S. Can't show that The Grape is going straight to my dome!)
DIALOG | Gelasio | Say, you're a fresh face. How long have you been here in Tir na nOg?
DIALOG | P_NAME | Oh not too long, I just got here. I have amnesia.
DIALOG | Gelasio | Yeah I hear ya, kid. We've all got amnesia these days.
DIALOG | P_NAME | No, I mean I really have amn-
DIALOG | Gelasio | Say hoss, to be honest I just got back to town myself. Me and my pal Augustine were on some serious labor duty in the mines, but let's just say we /'outfoxed the fox/'. Haha! Where the Duergars were the fox and_ we_ were_ the other fox.
DIALOG | P_NAME = s_port_hoopzHappy | Oh... good for you!
DIALOG | Gelasio | Thanks shooter. Me and Augie were livin' lavish, that is until yesterday... Augie done up and dissappeared. Some say he turned and ran with our cash, but that's not the case. I think he's still out there, lost in the Sewers and as sober as a fox, just searchin' for another shot of the The Ol' Grape.
GOTO | HELPLOOK

HELPLOOK
CHOICE | Offer to help with the search?
REPLY | AUGLOOK | I'll help look for Augustine.
IF gelasioDuergar == 1 | REPLY | AUGQUESTION | Let me ask you about this supposed /'Augustine/' fellow.
REPLY | AUGNOLOOK | Nary ye mind.

AUGLOOK
DIALOG | P_NAME | How can I help look for Augustine?
DIALOG | Gelasio | You wanna help? Aww hell that's swell as heck, kid. So look._._._ we're not in the best of company.
DIALOG | P_NAME | Wh-what do you mean?
DIALOG | Gelasio | Well, there might be something else pulling strings here in Tir na nOg. And I have reason to believe that those same stings got around Ol' Augie's neck.
DIALOG | P_NAME | Wow, sounds-
DIALOG | Gelasio | Dastardly, I know.
DIALOG | P_NAME | Do you have any-
DIALOG | Gelasio | Proof?_ Nah not yet, but that's where you can come in.  Help me gather some intel and maybe you and me can get to the bottom of this.
DIALOG | P_NAME | What should I look for?
DIALOG | Gelasio | /'The diablo's in the details./' That's what Augie's abuela used to tell us. So let's start looking through anything you dig up. Notes, books, C_L_U_E_S. You'll be my ears on the street, a ummm,_\G_U_M_S_H_O_E_ L_E_V_E_L_ O_N_E_.
" +
//TODO: add GUMSHOE sound
"
WAIT | 0.3
NOTIFY | P_NAME is now GUMSHOE LEVEL ONE.
QUEST | hoopzGumshoe = 1
SOUND | sn_debug_eight
DIALOG | P_NAME = s_port_hoopzHappy | Wow gee, this is exciting, I've never been a detective before, well at least not that I can remember.
DIALOG | Gelasio | Don't get ahead of yourself, real detectives find Augustine.
DIALOG | P_NAME = s_port_hoopzHappy | Ah you're right! I'm on the case!
DIALOG | Gelasio | Great, got any clues?
QUEST | gelasioNoteBypass = 1
"
//Goto Gelasio's Note Chooser Event
event_user(1);
script += 
"

AUGNOLOOK  
IF gelasioFlavorRespond == 0 | GOTO | FLAVORRESPOND
DIALOG | P_NAME | Shucks I'll be back.
DIALOG | Gelasio | That's what Augie said. 
GOTO | END  

FLAVORRESPOND
DIALOG | P_NAME | Sorry, my schedule is bustin' at the seams. Look's like I'll have to help later.
DIALOG | Gelasio | That's okay sport. I mean look at me, sitting on my keister and pouring The Grape down my gullet. I could be out looking for Augie but, in times like these, maybe drinking is really all you can do...
" +
//TODO: GULP GULP
"
SOUND | sn_debug_seven
WAIT | 1.0
DIALOG | Gelasio | Sometimes it's all you can do._._._
QUEST | gelasioFlavorRespond = 1
GOTO | END

" +
//GELASIO STATES
"

GOV
DIALOG | Gelasio | 'eeey, you're the new Governor, right? Abdul! Gimme a grape on the rocks for our new governor, my treat!
DIALOG | P_NAME | That is a very generous offer, citizen! But remember what they say - /'generosity killed the cat!/' Well, I've got to run. Be sure to tell everyone you see that you got to meet me, the real, 100% authentic Governor!
GOTO | END

GELASIO05
DIALOG | Gelasio | Augustine still in the sewers? Can't be... I'm gonna need to check for myself.  After_ (gulp) this_ (gulp) drink.
GOTO | END

GELASIO04
DIALOG | Gelasio | HAHAHAHA! More Grape, Abdul! I got a whole brain's worth of neuroshekels to drink through!
DIALOG | P_NAME = s_port_hoopzAngry | ...
GOTO | END

GELASIO01
DIALOG | Gelasio | Hey, kid! Back for some fruit?
GOTO | GRAPEQUESTION01

GELASIO00
DIALOG | Gelasio | I tell ya Abdul... I survived the mines, and now I gorge on fine fruits. How could life be better? My pal Augustine usually gets grapes with me but alas... ah well, fruit and toil, fruit and toil!
DIALOG | P_NAME | (Interesting fellow...)
DIALOG | Gelasio | Huh? You!
DIALOG | P_NAME | (Gulp!) Me?
DIALOG | Gelasio | How did you get out?
CHOICE | Reaction?
REPLY | WHAT | Out of what?
REPLY | EGG | You mean the egg?

WHAT
DIALOG | P_NAME | Out of what?
DIALOG | Gelasio | Uh, um... I could have sworn...
WAIT | 0.3
DIALOG | Gelasio | Aww heck, nary ye mind!
GOTO | GELASIO00CONT

EGG
DIALOG | P_NAME | You mean the egg?
DIALOG | Gelasio | Egg? What egg?
DIALOG | P_NAME | I mean I came out of an egg and then-
DIALOG | Gelasio | Naw, tyke. Not an egg, Aw heck, nary ye mind!
GOTO | GELASIO00CONT

GELASIO00CONT
DIALOG | Gelasio | Here, you_ kid, come have a seat by Ol' Gelasio. Let me buy you a shot of_ The_ Grape!
DIALOG | P_NAME = s_port_hoopzSurprise | (Gulp, T_H_E_ _G_R_A_P_E_?_!)
QUEST | gelasioState = 1
GOTO | GRAPEQUESTION00

GRAPEQUESTION01
CHOICE | Drink with Gelasio?
REPLY | YESTOGRAPE | Well, if everyone's doing it...
REPLY  | NOTOGRAPE | Not yet, gotta think about that one.

GRAPEQUESTION00
CHOICE | Drink with Gelasio?
REPLY | YESTOGRAPE | Sure, I'm definitely of legal Grape drinking age.
REPLY  | NOTOGRAPE | Maybe in X number of years once I figure out how old I am.

NOTOGRAPE
DIALOG | P_NAME | No thanks, I'm staying GRAPEFREE this summer.
DIALOG | Gelasio | Suit yourself. Come back when you want some hair on your chest. HAHA!
GOTO | END

END
EXIT |
"
