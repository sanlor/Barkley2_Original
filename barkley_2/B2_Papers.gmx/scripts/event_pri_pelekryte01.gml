/// Inmate Pelekryte in Hoosegow
/*
VARIABLES
	pelekryteState
    		0 = Not talked to 								(arrested for vagrancy, no Brain City)
    		1 = Talked to before 							(arrested for vagrancy, no Brain City)
    		2 = Agreed to help 								(arrested for vagrancy, will Shank)
    		3 = Said you would maybe help 					((arrested for vagrancy, no Brain City)
    		4 = Reached 2nd floor of sewers 				((arrested for vagrancy, will shank)
    		5 = Mission complete, IRT has been performed 	(he'll appear in Brain City)
    		6 = Mission failed, Pele is arrested			(arrested for vagrancy, will Shank)
    		7 = Mission failed, Pele is gone				(unused currently?)
	prisonQuest (modified by o_prisonBedHoopz01)
		0 = have not advanced the quest at all
        1 = starts when the cell doors close after the Bolthios Scene (must "restpause")
        2 = on room load after restpausing in bed, initiate 20 minutes until state = 3
        3 = Hoopz can now restpause to next hour
        4 = Hoopz has restpaused, initiate 20 minutes until state = 5
        5 = Hoopz can now restpause to next hour
        6 = Hoopz has restpaused, initiate 20 minutes until state = 7
        7 = Hoopz is at the end of his (gut) rope
	pelekrytePrisonFlavor
    		0 - you don't need that flavor (first time talking to him)
    		1 - you need that flavor (second time talking to him)
	pelekrytePrisonShank
    		0 = haven't agreed to shank D'archimedes
    		1 = have agreed to shank D'archimedes
	shankPending
	   	0 = you've not offended an MS-13 character
	   	1 = you have offended them, Shank Scene is activated
	   	2 = you've been shanked
*/

script = "
IF pelekrytePrisonShank == 1 | GOTO | WAITINGTOSHANK
IF shankPending == 1 | GOTO | SHANKPENDING
IF pelekryteState == 0 | GOTO | NEVERMET
GOTO | PELE01

WAITINGTOSHANK
DIALOG | Inmate Pelekryte | What'sh the holdup?`sq` Shank that fucker.`rt`
EXIT |

SHANKPENDING
DIALOG | Inmate Pelekryte | Your end is coming, sweet ashsh. Don't drop the shoap...
EXIT |

NEVERMET
IF pelekrytePrisonFlavor == 1 | GOTO | PELESPLEEN
DIALOG | P_NAME | Hello... what are you in for?
DIALOG | Inmate Pelekryte | Vagrancy is why they `s1`put me in`s0` but eating shpleensh is why they `s2`keep me in.`s0`
DIALOG | P_NAME | I'm sorry?
DIALOG | Inmate Pelekryte | I'm a spleen-eatin' shunofabitch and itsh my lunch time. Pull up your shirt and let me get one chomp at your shtomach.
DIALOG | P_NAME = s_port_hoopzSurprise | Uh... no thanks... I uh just forgot I have to go hide my contraband... see you!
DIALOG | Inmate Pelekryte | I-_I once dreamt of the shtarsh now I only crave for the shpleensh... the Hooshegow really changesh you...
EXIT |

PELESPLEEN
DIALOG | Inmate Pelekryte | `w1`Shshshshshssshhh...`w0`
EXIT | 

PELE01
DIALOG | P_NAME = s_port_hoopzHappy | Oh, Pelekryte! I didn't think I'd see you in here.
DIALOG | Inmate Pelekryte | Shush your mouth shucker! You shtranded me!
DIALOG | P_NAME = s_port_hoopzSurprise | No I didn't abandon you! Its just that-
DIALOG | Inmate Pelekryte | It'sh jusht that you are a losher and a incompetent brashter and you left me to die in the shewersh!
DIALOG | P_NAME = s_port_hoopzShock | `w1`(Gadzooks! I never was able to get Pelekryte out of Tir na nOg!)`w0`
CHOICE | About that, Pelekryte...
REPLY | IMSORRY | I'm so sorry about that Pelekryte!
REPLY | TOUGHBUNK | Deal with it.

IMSORRY
DIALOG | P_NAME = s_port_hoopzSurprise |  Pelekryte! I'm so sorry! I didn't mean this to turn out the way it did!
DIALOG | Inmate Pelekryte | You shhould have thought about that before you left me high and_ shoaking wet_ in the shewersh!
DIALOG | P_NAME = s_port_hoopzSurprise | There was nothing I could do! I don't know what to say.
DIALOG | Inmate Pelekryte | I had to join the MSH-13sh! I think I'm a dwarf-shupremachist now. Look at theshe tatsh! All over my body. I shcare myshelf!
DIALOG | P_NAME | Uh_
DIALOG | Inmate Pelekryte | Look shee, I'm well aware I have a shpeech impediment but there ish one word that I can pronounche very clearly._._._ `s2`S_H_A_N_K_`s0`.
DIALOG | P_NAME = s_port_hoopzSurprise | (Egad. I'm in a real barnbuster here...)
CHOICE | Anything you can do?
REPLY | CANIDOSOMETHING | Is there anything I can do?
REPLY | TOUGHBUNK | TOUGH BUNK, SUCKA!

CANIDOSOMETHING
DIALOG | P_NAME = s_port_hoopzSad | Is,_ is there anything-_anything at all that I can do to make this right?
WAIT | 0.5
DIALOG | Inmate Pelekryte | Hmmm... well..._ Let me ashk you a queshtion. This hooshegow... what ish it mishshing?
CHOICE | What do the prishoners lack?
REPLY | LIBRARY | An arcade.
REPLY | BBALL | A bball court.
REPLY | DUEPROCESS | Due process.

LIBRARY
DIALOG | P_NAME | Well it might help for /'get away for a while/' and play some vidcons.
" +
//TODO: ROUNDMOUND - increase vidcons
"
GOTO | SHTARSH

BBALL
DIALOG | P_NAME | Well if I could think of any place in Necron 7 that could use a Bball Court it's the Hoosegow. I'm kind of surprised there isn't one here...
" +
//TODO: ROUNDMOUND - increase bball
"
GOTO | SHTARSH

DUEPROCESS
DIALOG | P_NAME | I don't think inmates are really given the chance to properly defend themselves. Maybe some competent representation could help? 
GOTO | SHTARSH

SHTARSH
DIALOG | Inmate Pelekryte | No... shtarsh... The hooshegow hash no windowsh... and sho I can't gazhe upon my beloved shtarsh...
DIALOG | P_NAME = s_port_hoopzSad | I-I'm sorry, Pelekryte...
DIALOG | Inmate Pelekryte | The MSH-13sh shay that if I shank a Klatchmember I'll get a chell in the top floor... and those have windowsh. I'll shank anyone and everyone to get back to my shtarsh... `s1`anyone.`s0`
Emote | ! | o_cts_hoopz | 0 | 0
SURPRISEAT | o_pelekrytePrison01
DIALOG | P_NAME = s_port_hoopzSurprise | You mean... `s1`a hoosegow shanking?!`s0`
DIALOG | Inmate Pelekryte | That'sh right. And you are gonna do the shanking for me, youngshter.
DIALOG | P_NAME = s_port_hoopzSurprise | `s1`Moi?!`s0`
DIALOG | Inmate Pelekryte | The MSH-13's don't care who dropsh ash long ash it'sh with a shiv to the kidneysh. And I need to take shomeone down. Or_ you can make it up to me by taking thish shiv and doing it for me... I'm thinking shomeone in the Gaming Klatch will do nichely.
IF knowGamingKlatch <= 1 | GOTO | KNOWKLATCH
GOTO | DONTKNOWKLATCH

KNOWKLATCH
DIALOG | P_NAME | I've heard of The Gaming Klatch but I had no idea they'd have a foothold in the Hoosegow.
DIALOG | Inmate Pelekryte | MSH-13 is about to root out the Klatch with an `sq`epic hoosegow shanking.`rt` It'sh up to me to stick it in the leader of the Klatch.
GOTO | WHOSINKLATCH

DONTKNOWKLATCH
DIALOG | P_NAME | The Gaming Klatch?
DIALOG | Inmate Pelekryte | `sq`They are shaid to be bashed in Al Akihabara,`rt` but they have representation here in the Hooshegow too.
KNOW | knowGamingKlatch | 2
" +
//TODO: fix location of the Gaming Klatch to be either Al Akihabara or Brain City
"
GOTO | WHOSINKLATCH

WHOSINKLATCH
DIALOG | P_NAME | How can you tell who's part of The Gaming Klatch?
DIALOG | Inmate Pelekryte | It'sh hard to tell who'sh in. They all ushe alternate identitiesh and I don't use thoshe new-fangled pershonal computersh. I only know of the one who hidesh in broad daylight: `sq`D'archimedesh.`rt`
IF knowDarchimedes >= 1 | GOTO | IKNOWHIM
IF knowDarchimedes == 0 | GOTO | DARCHIMEDESINFO

IKNOWHIM
DIALOG | P_NAME | Yeah I know him...
GOTO | WHATTODO

DARCHIMEDESINFO
DIALOG | P_NAME | Who is D'archimedes?
DIALOG | Inmate Pelekryte | He'sh monitoring the only turf the Klatch has in the Hooshegow, `w1`the terlet.`w0`
WAIT   | 0.5
SOUND  | sn_debug_one
Emote  | ! | o_cts_hoopz | 0 | 0
WAIT   | 0.5
PLAYSET | o_cts_hoopz | stomach_start | stomach_end
WAIT   | 0
DIALOG | P_NAME = s_port_hoopzPrison | (The terlet...)
WAIT   | 0.25
SOUND  | sn_debug_one
WAIT | 0.5
DIALOG | P_NAME | But what am I supposed to do?
GOTO | WHATTODO

WHATTODO
DIALOG | Inmate Pelekryte | `sq`You need to take my shiv and shtick it right into D'archimedesh kidney.`rt`
DIALOG | P_NAME = s_port_hoopzSad | I-_I_ don't know if I can do that... shank a dwarf?
DIALOG | Inmate Pelekryte | It'sh to shank or be shanked for you, eshe. What will it be?
CHOICE | Shank or be shanked?
REPLY | SHANK | Shank.
REPLY | BESHANKED | Be shanked.

SHANK
DIALOG | P_NAME | Alright, hand me the shiv... I guess I have no choice if I want to save my own kidney.
WAIT | 0.25
USEAT | o_pelekrytePrison01
WAIT | 0.25
" +
//TODO: NOTIFY | Got Inmate Pelekryte's Prison Shiv
//TODO: ITEM | Inmate Pelekryte's Shiv
"
DIALOG | Inmate Pelekryte | Take thish and deposit it in that hubbard'sh kidneysh. Do it now, before I take it back and ushe it for what I really should ushe it for_ YOU.
DIALOG | P_NAME | `w1`(Gulp...)`w0`_ Okay... here goes nothing._ I'm sorry again about all this mess.
DIALOG | Inmate Pelekryte | We're all shquare once you drop that mashk-wearing shucka. 
QUEST | pelekrytePrisonShank = 1
EXIT |

BESHANKED
DIALOG | P_NAME | I'd rather lose some blood from my kidney than wear that blood on my hands, no thank you...
DIALOG | Inmate Pelekryte | You just shigned your shpleen's death warrant. You'll never be able to do crunchesh the shame again I remove your shpleen from your body.
DIALOG | P_NAME = s_port_hoopzSurprise | (Gulp.)
DIALOG | Inmate Pelekryte | Watch yourshelf.
QUEST | shankPending = 1
EXIT |

TOUGHBUNK
DIALOG | P_NAME = s_port_hoopzSmirk | The chips fall, and so do lives. I just advise not being right under the next one, perp. So long.
DIALOG | Inmate Pelekryte | Oh you jusht fucked up. You just fucked yourshelf up.
DIALOG | P_NAME = s_port_hoopzSmirk | Try me, loo`w1`-SH-`w0`er!
QUEST | shankPending = 1
EXIT |
";
/*
DIALOG | P_NAME |
DIALOG | Inmate Pelekryte | 
DIALOG | P_NAME |
DIALOG | Inmate Pelekryte | 
DIALOG | P_NAME |
