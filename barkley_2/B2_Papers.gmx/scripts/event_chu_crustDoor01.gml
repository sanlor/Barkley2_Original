///Cuchu's Door, serves as a point of no return
/*
This is the event that occurs just before the door to your battle with Cuchu-Crustacea.
*/
script = "
IF cdwarfSulk == 1 | GOTO | POINTOFNORETURN
IF csComplete == 1 | GOTO | CSPEARCOMPLETE
IF wiglafMission == 3 | GOTO | CUCHUMISSION
GOTO | CSINCOMPLETE

POINTOFNORETURN
" +
//TODO: TRIGGERWARNING: POINT OF NO RETURN
"
NOTIFY | TRIGGERWARNING: POINT OF NO RETURN
GOTO | DOORCHOICE01

CSPEARCOMPLETE
" +
//TODO: move to cinema marker
//TODO: FRAME | o_cts_hoopz and "cuchudoor"
//TODO: There is a FLASH of power and Hoopz pulls out the cyberspear
//TODO: OR the cyberspear floats out from Hoopz and then:
//TODO: projects an image of Cyberdwarf
"
WAIT | 1.0
DIALOG | The Cyberdwarf | Finally, we are ready my child. When we cross this threshold, Cuchulainn will certainly set his strongest force against us. But with the Cyberspear in hand, we have nothing to fear. Open the door, child and face Cuchulainn. Let us destroy him once and for all!
IF crustDoorTry >= 1 | GOTO | TRIEDCUCHU
GOTO | NOTTRIEDCUCHU

TRIEDCUCHU
DIALOG | P_NAME | There's a giant lobster in there, Cyberdwarf. I might need a minute to psych myself up.
DIALOG | The Cyberdwarf | You fell to him before, but you've gained such strength... your destiny lies in front of you. Snatch it up, and crush Cuchulainn!
GOTO | GIMMEASEC

NOTTRIEDCUCHU
DIALOG | P_NAME | Whoa... my final battle. Gimme a sec. I need to stretch first...
DIALOG | The Cyberdwarf | Stretch quickly! We have Cuchulainn on the ropes! There is little time to spare as the Necron 7 edges closer to Hell each passing moment!
GOTO | GIMMEASEC

GIMMEASEC
DIALOG | P_NAME | Yeah I know... it's just_ kinda a big deal.
DIALOG | The Cyberdwarf | All the more reason to stand tall and face this AI Scourge! What are you waiting for, P_NAME_S?
DIALOG | P_NAME | I don't know I just want to gather my wit's.
DIALOG | The Cyberdwarf | Gather your what-? I have waited for FOUR THOUSAND YEARS and as we stand at the precipice of our eternal glory you demand a rest-pause?
DIALOG | P_NAME | It's-_ it's not a rest-pause. Just gimme a minute Cyberdwarf. I'm gonna go in, I promise. I'm gonna do this.
DIALOG | The Cyberdwarf | When the future dwarf ealdormen speak of this moment in history will they remember the victory? Or will they speak of this... the hero, P_NAME_F, standing at the Door of F.A.T.E. and timidly demanding a rest-pause? For shame!
" +
//TODO: SURPRISEAT | cyberdwarf
"
DIALOG | P_NAME = s_port_hoopzSurprise | Whoah woah!
CHOICE | For shame?!
REPLY | DAFREAK | What the freak, man?
REPLY | SHOVEIT | Shove it Cdwarf, I'm restin'.
REPLY | GETBENT | Get bent, AI.

DAFREAK
DIALOG | P_NAME = s_port_hoopzSurprise | What the freak, man?! I'm about to brast this sucka, save the ship, save the dwarfs, save the universe and you are ridin' my jock on me catching my breath?
GOTO | CDWARFCHIDINGS

SHOVEIT
DIALOG | P_NAME | With all due respect Cdwarf... shove it. I'm gonna rest when I want to rest and I'm gonna brast when I want to brast!
" +
//TODO: beardstate achieved!
"
GOTO | CDWARFCHIDINGS

GETBENT
DIALOG | P_NAME | Get bent, AI. If you want to take on Cuchulainn so badly... why don't you do it yourself?_ Oh right, you need me to carry around the spear!
" +
//TODO: beardstate achieved!
"
GOTO | CDWARFCHIDINGS

CDWARFCHIDINGS
DIALOG | The Cyberdwarf | Have some RESPECT for your elder, you brat. I am The Cyberdwarf and you will get in this door this instant and SAVE THE UNIVERSE!
" +
//TODO: LOOKAT | cyberdwarf (to remove the surprise)
"
DIALOG | P_NAME = s_port_hoopzShock | Oh yeah?! You think I'll just cowtow to any thing you say? You-_ you-_
WAIT | 0.25
DIALOG | P_NAME = s_port_hoopzSurprise | You aren't my Dad!!
" +
//TODO: BGM kills off
"
WAIT | 1.5
DIALOG | The Cyberdwarf | Very well... so you're the adult now? You have emerged from the woods of infancy armed with sticks and stones and now you expect to survive in the City of Men? And without the help of a benevolent guardian, no less?
WAIT | 0.25
DIALOG | The Cyberdwarf | Well let's see it then, P_NAME_F... let's see what kind of ADULT you really are._._._ do this by yourself!
" +
//TODO: Cyberdwarf disappears and the spear falls to the ground.
//TODO: another SURPRISEAT | object
"
DIALOG | P_NAME = s_port_hoopzShock | C-cyberdwarf?!
" +
//TODO: move over to the spear and kneel
"
DIALOG | P_NAME = s_port_hoopzSad | (._._._)
" +
//TODO: crestfall event
//TODO: pick up the spear
"
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzAngry | Who needs him anyways... I'll take this Cuchu out myself!
QUEST | cdwarfSulk == 1
EXIT |

CUCHUMISSION
IF crustDoorTry == 2 | GOTO | THIRDTIME
IF crustDoorTry == 1 | GOTO | SECONDTIME01
IF crustDoorTry == 0 | GOTO | FIRSTTIME01

THIRDTIME
IF wiglafMission == 3 | DIALOG | P_NAME | (Nah, I need to check with Wiglaf.)
EXIT |

SECONDTIME01
IF wiglafMission == 3 | DIALOG | P_NAME = s_port_hoopzSurprise | (I don't think I wanna go back in there... that Cuchulainn thing is bad news. Wiglaf is insane. He's insane...)
WAIT | 0.25
DIALOG | P_NAME | (There must be something I'm missing... should I go back down and report?)
QUEST | crustDoorTry == 2
EXIT |

FIRSTTIME01
IF wiglafMission == 3 | DIALOG | P_NAME | (Whoa... I can feel a chilling power behind this door. Is this where Cuchulainn is? I could fight him... that is my mission...)
GOTO | DOORCHOICE01

DOORCHOICE01
CHOICE | Enter the door?
REPLY | ENTER_YES | Heck, yes.
REPLY | ENTER_NO | Heck, no.

ENTER_NO
DIALOG | P_NAME | Not yet, let me get my brast cannon's in working order. This door looks ominous.
EXIT | 

ENTER_YES
DIALOG | P_NAME | All right, here goes nothing!
QUEST | crustDoorTry == 1
GOTO | OPENANDENTER

CSINCOMPLETE
IF crustDoorTry == 2 | GOTO | THIRDTIME
IF crustDoorTry == 1 | GOTO | SECONDTIME01
IF crustDoorTry == 0 | GOTO | FIRSTTIME01

THIRDTIME
DIALOG | P_NAME | I gotta be missing something on the lower levels... The Cyberdwarf is definitely not here.
" +
//TODO: a good spot to add conditional responses to give the player HINTS as to where to go... add this in if we find too many people making this to Crust too early
"
EXIT |

SECONDTIME01
DIALOG | P_NAME = s_port_hoopzSurprise | (I don't think I wanna go back in there... that thing said it was Cuchulainn, not The Cyberdwarf... is this the right way?)
WAIT | 0.25
DIALOG | P_NAME | (There must be something I'm missing... should I go back down?)
QUEST | crustDoorTry == 2
EXIT |

FIRSTTIME01
DIALOG | P_NAME | (Whoa... I can feel a chilling power behind this door. Maybe this is where I'll find the Cyberdwarf... or maybe this is where I stop?)
GOTO | DOORCHOICE01

DOORCHOICE01
CHOICE | Enter the door?
REPLY | ENTER_YES | Heck, yes.
REPLY | ENTER_NO | Heck, no.

ENTER_NO
DIALOG | P_NAME | (I don't know... maybe I'll come back later.)

ENTER_YES
IF crustDoorTry == 0 | DIALOG | P_NAME | All right, here goes nothing!
QUEST | crustDoorTry = 1
GOTO | OPENANDENTER

OPENANDENTER
" +
//TODO: walk to the side of the door where the door control is
//TODO: USEAT | door control
//TODO: door open animation
//TODO: door smoke
"
Teleport | r_chu_crustRoom01 | 232 | 168
"
