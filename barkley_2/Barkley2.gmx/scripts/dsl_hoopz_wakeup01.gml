/// Various hoopz wakeup scenes
external = 1; 
script  = "
IF fastTravel == 1 | GOTO | FAST_TRAVEL
IF hoopzGetup == 1 | GOTO | CPASTA
IF hoopzGetup == 2 | GOTO | FANTOMAS
IF hoopzGetup == 3 | GOTO | WAKEUPINTRO
IF hoopzGetup == 4 | GOTO | PISSPOISONED
IF hoopzGetup == 5 | GOTO | CGREMBONED
IF hoopzGetup == 6 | GOTO | CGREMBONED_AGAIN
IF hoopzGetup == 7 | GOTO | TNT

FAST_TRAVEL
CREATE_WAIT | o_cts_gatoraid01 | " +string(o_cinema0.x)+ " | " +string(o_cinema0.y)+ "
WAIT    | 0.25
EVENT   | o_cts_gatoraid01 | 0
SET     | o_cts_hoopz      | death
WAIT    | 1.75
EVENT   | o_cts_gatoraid01 | 1
WAIT    | 4.25
PLAYSET | o_cts_hoopz      | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
WAIT    | 0.5
QUEST   | fastTravel = 0

CPASTA
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death 
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 0
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHWEST   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHEAST    
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what? Where am I?
WAIT    | 0.5
LOOK    | o_cts_hoopz | NORTH
WAIT    | 0.5
DIALOG  | P_NAME = s_port_hoopzSurprise | This is the streets of Tir na Nog. How did I...?                
WAIT    | 0.25  
DIALOG  | P_NAME = s_port_hoopzSurprise | But... The computer... and that scary story. What happened? 
WAIT    | 0.75  
LOOK    | o_cts_hoopz | SOUTH 
WAIT    | 0.5  
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 1.5  
DIALOG  | P_NAME = s_port_hoopzSurprise | Was it all just a dream?
WAIT    | 0.5  
NOTIFYALT | You receive a +5 bonus to your Guts!
GLAMP   | guts | 5

FANTOMAS
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death 
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
WAIT    | 0.75    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 1.25    
DIALOG  | P_NAME = s_port_hoopzSmirk | ...
WAIT    | 0.5

WAKEUPINTRO
QUEST  | saveDisable = 0
scr_savedata_save | 
FADE   | 1 | 0
Misc   | dialogY | 8
WAIT   | 3.5
WAIT   | 1.5
DIALOG | Junk Lord | ._._._ what is this... fleshy interloper<question>
WAIT   | 1.0
DIALOG | Junk Lord | it doesn't belong... a swaddling babe... lying in a heap... it doesn't belong<exclamation>
WAIT   | 1.0
DIALOG | Junk Lord | br0ken... but still functioning._ It must be FiXeD._ Pr0ceed to HUD installation procedure<exclamation>
WAIT   | 0.5
QUEST  | NoChoicePortrait = 1
CHOICE | Learn about the Heads Up Display?
REPLY  | HUD_TUTORIAL_MEAT | Yes
REPLY  | HUD_TUTORIAL_END  | No

HUD_TUTORIAL_MEAT
DIALOG | Junk Lord | look at it breath so hideously... supple skin... organs anointed in... b.b.b.b.b.balllsssss... send it back to the living...
DIALOG | Junk Lord | no<exclamation> it is `s1`2`s0` weak 2 exXxist in the world of `kw`Queklain...`rt` we mussst make it stronger... a babe... swaddled in absorbent liners... give it the clothes of the speaking ape... equip the babe with... `kw`a jerkin...`rt`
DIALOG | Junk Lord | yes_ a jerkin... a jerkin of `kw`C_O_R_N_H_U_S_S_S_K_K_K.`rt`
EVENT  | o_hud     | 2 // Hide all HUD elements
EVENT  | o_hud     | 1
" +
// BRING UP HUD with just FACE in Center with HP to the side
"
DIALOG | Junk Lord | now the thing has LIFE...
DIALOG | Junk Lord | look at this LIVING babe... grossly simian... repulsively B_I_O_T_I_C_
DIALOG | Junk Lord | yes look it is fully biotic...
EVENT  | o_hud     | 3
" +
// add transhumanism bar
// make transhumanism bar adjust to the dynamic effects of the HUD building
"
DIALOG | Junk Lord | there... it can now track its progress... when the body dies the matter is discarded... when the matter is discarded it joins with usss with the rest of the cast-off thingss... sentient... but not alive
DIALOG | Junk Lord | yes... joining with us in inevitable... with each ticktocking moment of T.I.M.E. with each cut, scrape and concussion... with each DEATH... the babe will inch closer to us... to the PILE
WAIT   | 1.0
EVENT  | o_hud     | 3
DIALOG | Junk Lord | now... give the babe its substanse... give the babe its `sq`G_U_T_S...`rt` the innards of gumption
EVENT  | o_hud     | 3
DIALOG | Junk Lord | also give the babe its `sq`L_U_C_K...`rt` the connection to F.A.T.E.
EVENT  | o_hud     | 3
DIALOG | Junk Lord | and its... `sq`AC_R_O_B_A_T_I_C_S...`rt` to excel in tumbling and floor exorcises
EVENT  | o_hud     | 3
DIALOG | Junk Lord | do not forget `sq`M_I_G_H_T...`rt` to lift heavy loads
EVENT  | o_hud     | 3
DIALOG | Junk Lord | and `sq`P_I_E_T_Y...`rt` to settle and ground the babe to holy scripture... if not the madness of the kosmos will consume it
Misc   | dnaCyber  | 5
" +
// add in GLAMP
// add in += .05 cyber humanism
"
WAIT | 1.0
DIALOG | Junk Lord | give it the power 2 wield the_ GUN'S OF THE DWARFS
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 5
" +
// add in Gun's Visualizer
// add in += .05 cyber humanism
"
DIALOG | Junk Lord | it is done... the babe now can brast with the multitudinous gun's of the dwarfs
DIALOG | Junk Lord | now<exclamation> give it arms 2 wield the gun's
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 3
" +
// add in the Gun's Weight and Ammo
// add in += .03 cyber humanism
"
DIALOG | Junk Lord | the little babe can now hold the heft of gun's... but will ever walk the `kw`line of encumbrance...`rt` and it will always know the `kw`count of the bullet's`rt`
DIALOG | Junk Lord | but a braster brasts with not bullet's alone
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 3
" +
// add periodic timer
// add in += .03 cyber humanism
"
DIALOG | Junk Lord | the `kw`periodic meter`rt` is now assembled... this babe of the Highest Order can now trigger the `kw`gun's special effect`rt`
DIALOG | Junk Lord | the gun's periodic effect<question> that means nothing... it is completely inconsequential 2 combat, mortal or otherwisseeee, we are a fool for adding the periodic effect
DIALOG | Junk Lord | fine... we will give the babe `kw`pocketssss for the jerkin`rt`
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 2
" +
// add pockets both zaubers and candy
// add in += .02 cyber humanism
"
DIALOG | Junk Lord | there... it now has a pocket for... whatever thingsss a biotic creature requiresss
DIALOG | Junk Lord | good and the other pocket can be for the `kw`zaubers...`rt` we sense that the zaubers will rise again... it has been many ticktocks since the...
DIALOG | Junk Lord | since the Gaze
DIALOG | Junk Lord | the `sq`Gaze=Belork Phenomenon...`rt` zaubers will rise again... rise as this babe will rise as well...
DIALOG | Junk Lord | we are doing so well with the babe... give it a `kw`SSSCROLLING MARQUEE...`rt` news is important in this ticktock... and democracy dies in dankness...
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 1
" +
// add in Scrolling Marquee
// add in += .01 cyber humanism
"
DIALOG | Junk Lord | yes the marquee is glorious... the babe will be within the zeitgeist at all ticktocks... and always reminded of what it is its purpose...
WAIT | 1.0
DIALOG | Junk Lord | good... we are please... the scrolling marquee is much more useful than those foolhardyyy special shotssss
DIALOG | Junk Lord | AND GIVE THE BABE `mq`WiFi<exclamation>`rt`
DIALOG | Junk Lord | YES<exclamation> WiFi<exclamation>
EVENT  | o_hud     | 3
Misc   | dnaCyber  | 1
" +
// add in WiFi
// add in += .01 cyber humanism
"
GOTO   | HUD_TUTORIAL_END

HUD_TUTORIAL_END
WAIT   | 1
DIALOG | Junk Lord | there... it is done... the babe is now a youngster... forlorn from its long resting place and cast into the land of the living
DIALOG | Junk Lord | we do the same... cast the creature back...
DIALOG | Junk Lord | let us hope it does not return... 4 itsss own ssaaakkkeee
EVENT  | o_hud | 0 // Hide hud
WAIT   | 1
Misc   | dialogY | -1
SET    | o_cts_hoopz | death
FADE   | 0 | 2
WAIT   | 2.0
QUEST  | hoopzGetup = 0
WAIT   | 2
PLAYSET| o_cts_hoopz | get_up | default
WAIT   | 0
LOOK   | o_cts_hoopz | SOUTHEAST
WAIT   | 0.75    
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.5
Emote  | ?   
WAIT   | 1.25    
DIALOG | Mysteriouse Youngster = s_port_hoopz | What...?
WAIT   | 0.75  
LOOK   | o_cts_hoopz | SOUTHEAST    
WAIT   | 0.25    
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.25    
LOOK   | o_cts_hoopz | SOUTHWEST 
WAIT   | 0.25    
LOOK   | o_cts_hoopz | SOUTH   
WAIT   | 0.75    
DIALOG | Mysteriouse Youngster = s_port_hoopzSurprise | What...? Where... Where am I?
LOOK   | o_cts_hoopz | SOUTHWEST 
WAIT   | 1.25
DIALOG | Mysteriouse Youngster = s_port_hoopzSurprise | ... Who am I?
MOVETO | o_cts_hoopz | o_cinema0 | MOVE_NORMAL
WAIT   | 0
WAIT   | 1
DIALOG | Mysteriouse Youngster = s_port_hoopz | Was I... dreaming just now?_ No, it was... something else.
LOOK   | o_cts_hoopz | WEST 
WAIT   | 0.8
SURPRISEAT | o_cinema1
Emote  | !
WAIT   | 1.25
FRAME  | CAMERA_NORMAL | o_cinema2
WAIT   | 0
WAIT   | 1.25
FRAME  | CAMERA_NORMAL | o_cts_hoopz
WAIT   | 0
DIALOG | Mysteriouse Youngster = s_port_hoopz | I hear voices in the distance... Screams for mercy, cries of despair. I see rusted rooftops and vandalized housing on the horizon, drowning in smog so thick you could cut it with a wakizashi._ A city of some sort...? 
WAIT   | 1
DIALOG | Mysteriouse Youngster = s_port_hoopz | There must be people there. People who know what's going on. I should probably go in there. 
WAIT   | 0.75
LOOK   | o_cts_hoopz | WEST
WAIT   | 0.15
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   | 0.15
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.75
DIALOG | Mysteriouse Youngster = s_port_hoopz | That one-eyed man... he said something about `mq`The Cyberdwarf.`rt`_ That name sounds so familiar...
WAIT   | 1.25
DIALOG | Mysteriouse Youngster = s_port_hoopz | I'd better get going...
FRAME  | CAMERA_SLOW | o_cinema2
MOVETO | o_cts_hoopz | o_cinema1 | MOVE_NORMAL
WAIT   | 1
FADE   | 1 | 4
QUEST  | sceneBrandingStart = 1
QUEST  | tutorialProgress = 100
QUEST  | NoChoicePortrait = 0
QUEST  | saveDisabled = 0
QUEST  | dropEnabled = 1
WAIT   | 4
Teleport | r_tnn_maingate02 | 0 | 0 | 2

PISSPOISONED
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death | death
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 0
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHWEST   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHEAST    
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH  
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what happened?
WAIT    | 0.75
DIALOG  | P_NAME | Oh... Now I remember.
WAIT    | 0.75
DIALOG  | P_NAME | ...
WAIT    | 1.5
DIALOG  | P_NAME | What happens in the sewers, stays in the sewers.

CGREMBONED
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death | death
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 0
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHWEST   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHEAST    
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what...?
WAIT    | 0.75
DIALOG  | P_NAME | Ugh... I feel so... inhuman. What happened to me...?
WAIT    | 0.75
SURPRISEAT | SOUTHEAST
Emote   | !
DIALOG  | P_NAME = s_port_hoopzSurprise | My bones!
WAIT    | 0.75
LOOK    | o_cts_hoopz | SOUTHEAST   
DIALOG  | P_NAME | How is this possible? How can I be here, standing? I have no bones!
WAIT    | 0.75
DIALOG  | P_NAME | I don't understand what's going on, but I gotta get my bones back! Pronto!

CGREMBONED_AGAIN
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death | death
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 0
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHWEST   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHEAST    
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what...?
WAIT    | 0.75
DIALOG  | P_NAME | Ugh... They boiled me again...
WAIT    | 0.75

TNT
QUEST   | hoopzGetup = 0
SET     | o_cts_hoopz | death | death
WAIT    | 2
PLAYSET | o_cts_hoopz | get_up | default
WAIT    | 0
LOOK    | o_cts_hoopz | SOUTHEAST
Emote   | o_cts_hoopz | question | 0 | 0
WAIT    | 0
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH     
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHWEST   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTH   
WAIT    | 0.25    
LOOK    | o_cts_hoopz | SOUTHEAST    
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what...?
WAIT    | 0.75
DIALOG  | P_NAME | Oh, now I remember. Wow... What was I thinking?
WAIT    | 0.75
";
