/// Benedict, Fisher Dwarf
/*
Variables
	benedictState
		0 = not talked
		1 = talked, engages the "beneTime System"
		2 = sits down, offers you the fishing pole for money
		3 = you tell him good luck
		4 = heard the story of Turald's terrible past
		5 = ClockTime setting that has him disappear after you buy the pole or he give you it
		6 = bought the fishing pole
*/
script = "
IF body == governor | GOTO | GOVERNOR
IF benedictState == 0 | IF clock >= 6 | GOTO | MEETINSEWERS
IF benedictState == 4 | GOTO | BENEDICT04
IF benedictState == 3 | GOTO | BENEDICT03
IF benedictState == 2 | GOTO | BENEDICT02
IF benedictState == 1 | GOTO | TIMESORT
IF benedictState == 0 | GOTO | BENEDICT00

TIMESORT
IF clock >= 6 | GOTO | BENETIME06
IF clock >= 5 | GOTO | BENETIME05
IF clock >= 4 | GOTO | BENETIME04
IF clock >= 3 | GOTO | BENETIME03
IF clock >= 2 | GOTO | BENETIME02
IF clock >= 1 | GOTO | BENETIME01
IF clock < 1 | GOTO | BENETIME00

GOVERNOR
DIALOG | Benedict | Well if it ain't the new governor. I guess yer a real bigshot, huh? Well you'd be doin' me a big favor if you made the sewers a little safer to fish in. And let Cuchulainn know we're all ready for that prize.
EXIT |

MEETINSEWERS
DIALOG | Benedict | Just takin' my time down here in the sewers. Listin' to the machines of public works and driftin' off to sleep from time to time. Say hey, you wouldn't be interested in a fishin' pole would you? @money_benedictPole@ neuro-shekels?
GOTO | POLEBUYCHOICE

BENEDICT04
DIALOG | Benedict | So long, P_NAME_S. Thank you for this and enjoy the pole.
EXIT |

BENEDICT03
DIALOG | Benedict | Hey P_NAME_S, I was thinkin'... maybe I don't need this fishin' pole after all. I mean, it's probably too late to really catch a lunker anyways. Would you be interested in buyin' it?
QUEST | benedictState = 
GOTO | POLEBUYCHOICE

BENEDICT02
DIALOG | Benedict | Hey, P_NAME_S, did you reconsider that offer?
GOTO | POLEBUYCHOICE

BENETIME06
DIALOG | Benedict | Well look who finally decided to show up! What took you so long, P_NAME_S?
DIALOG | P_NAME | Oh well, uh, I've been around... doing stuff.
DIALOG | Benedict | Yeah I'm just takin' a little break before goin' into the darkness there and fishin'. Know how they are bitin' this mornin'?
CHOICE | How they bitin'?
IF fishgutsQuest == 5 | REPLY | DANGEROUS | Turald was eaten!
REPLY | YOUSURE | You sure about this?
REPLY | GOODLUCK | Good luck... you'll need it.

GOODLUCK
QUEST | benedictState = 3
DIALOG | P_NAME | Well, good luck and... fare thee well.
EXIT |

YOUSURE
DIALOG | P_NAME | You sure you want to go fishing, Benedict. Turald's been fishing for a while and it sounds dangerous... maybe even illegal.
DIALOG | Benedict | Oh, Turald, huh? He still fishin' over there?
DIALOG | P_NAME | Yeah, I think so. Why do you ask?
DIALOG | Benedict | Y'know, I'm kinda feelin' a little under the weather... maybe it's all this dankness.
DIALOG | P_NAME | That's too bad, it sounded like you were really ready to catch some gun'sfish.
DIALOG | Benedict | Yeah it's definitely the dankness. Hey, P_NAME_S, how about you go fishin' instead? I'll sell you my fishin' pole for really cheap, how about @money_benedictPole@?
GOTO | POLEBUYCHOICE

POLEBUYCHOICE
IF money < @money_benedictPole@ | GOTO | NOTENOUGHMONEY
BREAKOUT | add | money
CHOICE | Invest in a pole?
IF fishgutsQuest == 5 | REPLY | DANGEROUS | Turald was eaten!
CHOICE | BUYPOLE | Yeah I'll buy.
CHOICE | DONTBUYPOLE | I'll skip on the pole.

NOTENOUGHMONEY
DIALOG | P_NAME | Hmmm, looks like I'm a little strapped for shekels right now. Can I get you later?
DIALOG | Benedict | Yeah sure... I'll be here for a little while longer.
QUEST | benedictState = 2
EXIT |

BUYPOLE
DIALOG | P_NAME = s_port_hoopzSmirk | Sounds like you have yourself a deal, Benedict!
BREAKOUT | clear
DIALOG | Benedict | Great, enjoy the pole. I'm just gonna hang here for a little longer.
ClockTime | benedictState | 5 | 70
EXIT |

DONTBUYPOLE
DIALOG | P_NAME | Hmmm, it's a tempting deal but I can't take it, sorry.
DIALOG | Benedict | Alright, I'll be here for a little longer... but I've definitely decided that fishin' isn't really my thin' anymore.
ClockTime | benedictState | 5 | 70
EXIT |

DANGEROUS
DIALOG | P_NAME = s_port_hoopzSurprise | Don't go fishin' Benedict! Turald tried to catch a lunker and ended up getting sucked into the sewer sludge! He's fish bait by now!
DIALOG | Benedict | What?! T-_ Turald... gone?
DIALOG | P_NAME = s_port_hoopzSad | Yes he was sucked up by a big honkin' gun'sfish before I could even react. I'm sorry...
DIALOG | Benedict | Sorry? Why sorry?
WAIT | 0.25
DIALOG | P_NAME | Huh?
DIALOG | Benedict | My sick plan is complete! Turald is dead! My vengeance has been exacted!
SURPRISEAT | o_benedict01
DIALOG | P_NAME = s_port_hoopzSurprise | What in the zooks do you mean?!
DIALOG | Benedict | SGICSO... The Sombrero Galaxy Introductory Charter School for Orphans... Thirty short years ago... I walk to my seat in the cafeteria, where I always sit, where I always minded my own business. I look down... a Choco-mallow on the ground, perfect in everyway. /'How lucky could one orphan be?/' I thought to myself. I reach down to pick up my new prize and... the mallow MOVES ON IT'S OWN. I drop my tray of /'Grapes Melange/' and dive for the mallow, it bounces away from my grasp._ I fall to the dirty floor of the orphanage as the other orphans erupt in laughter! Their cruel chuckles stin' and cut like pirahna bites. A third time I reach for the mallow, it just beyond my chubby orphan fin'ers. But this time I see somethin', a hook... a hook protrudin' from the confection, a ubiquitous monofilament line is fastened securely to it. I follow the clear line with my eyes, for even in my orphan days I am a skilled angler, and can make out the barely visible signature of 10-stone test line from even the free throw line. The cord stretches from the mallow down and alongside the crowded cafeteria benches. The benches brim and roil with riant orphan hecklers, churnin' in the merriment of schadenfreude. I am a laughin'stock. And that is when I see him... at the opposite end of the line from my would-be prize. Turald, that rat-bastard, he wears a grin as wide as his bullshit face would allow. He always was the alpha orphan... and he is makin' painfully clear with this sadistic prank. Through the tears wellin' up and overflowin' onto my rosy orphan cheeks I see Turald saunter over to me, standin' on the same dirty floor that I could not sink low enough into... he leans down to me, the smirk I so desperately loathe mere inches from my ear... he says...
WAIT |
DIALOG | Benedict | /'The big fish always eats the little fish./'
DIALOG | Benedict | Well guess what mother fucker?! I coudln't agree more! Bwahahahahahah!
DIALOG | P_NAME = s_port_hoopzShock | Mercy be to the Holy See! What have you done?
DIALOG | Benedict | I did nothin'! It was Turald's own haughtiness that led to his demise! I merely waited long enough to see it happen! Bwahahahahahah!
" +
//TODO: add in Clispaeth reference for a different take on things (maybe round mound)?
"
DIALOG | P_NAME = s_port_hoopzAngry | You shouldn't be so happy about someone else's death... all lives are precious... I think....
DIALOG | Benedict | When you live with pain for long enough, when you have been told that your life is exactly NOT precious... that is when you laugh in the face of death!
DIALOG | P_NAME = s_port_hoopzAngry | ...
DIALOG | Benedict | Well, I don't think I'll be needin' this fishin' pole anymore... I've been sittin' around waitin' for this moment for so long, walkin' down to this spot everyday just to listen for that big slash of Turald hittin' the water. You take it.
DIALOG | P_NAME | Take your fishing pole?
DIALOG | Benedict | Yeah go for it, take it. My gift, I won't need it. I'm just goin' to sit here for a while longer just wrap my head around everythin'..._ stay strong, P_NAME_S.
QUEST | benedictState = 4
QUEST | benedictPoleBuy = 1
ClockTime | benedictState | 5 | 70
EXIT |

BENETIME05
IF beneTime == 5 | GOTO | BENETIME05_RPT
DIALOG | Benedict | I can hear the telltale zip of a casted line... that means Turald is already fishin' down below! Time to pick up the pace, Benedict!
QUEST | beneTime  = 5
EXIT |

BENETIME05_RPT
DIALOG | Benedict | Just psychin' myself up for the journey down those stairs. I'll be at them in no time.
EXIT |

BENETIME04
IF beneTime == 4 | GOTO | BENETIME04_RPT
DIALOG | Benedict | Phew! Made it to the sewers! Just a bit more for those fabled fishin' grounds.
QUEST | beneTime = 4
EXIT |

BENETIME04_RPT
DIALOG | Benedict | Most dwarfs steer clear of the sewers, for good reason. I for one, find the oppressive dankness comfortin'. Like a blanket just a teensy bit too warm.
EXIT |

BENETIME03
IF beneTime == 3 | GOTO | BENETIME03_RPT
DIALOG | Benedict | At this rate I'll be in the sewers before 21:00! It's pretty remarkable that I only started my trip this mornin'. Like my nagymama used to say: /'The early worm gets the gun'sfish./'
QUEST | beneTime = 3
EXIT |

BENETIME03_RPT
DIALOG | Benedict | I'll be fishin' in no time... I wonder if Turald took the good spot...
EXIT |

BENETIME02
IF beneTime == 2 | GOTO | BENETIME02_RPT
DIALOG | Benedict | The sewers entrance is at the north east end of the Market District. The sign says /'Closed/' but I think that's just a suggestion.
QUEST | beneTime = 2
EXIT |

BENETIME02_RPT
DIALOG | Benedict | Yep, just slowly makin' my way to the sewers. These thin's take T_I_M_E_ you know...
EXIT | 

BENETIME01
IF beneTime == 1 | GOTO | BENETIME01_RPT
DIALOG | Benedict | Well, I'm goin' gun'sfishin', it just takes me a little T_I_M_E_ to get to the lower levels.
QUEST | beneTime = 1

BENETIME01_RPT
DIALOG | Benedict | They say the first step to fishin' in the sewers is gettin' to the sewers. That's where I'm at now.
EXIT |

BENETIME00
DIALOG | Benedict | A lot of people say the sewers aren't a safe place for a dwarf to go fishin' but I'm not worried. The rebels go in and out of the sewers all the time! What's the big deal?
EXIT |

BENEDICT00
QUEST  | benedictState = 1
DIALOG | Benedict | Hey there youngster, you know anythin' about the sewers?
CHOICE | Know about the sewers?
REPLY  | YES | Yeah. (Yes)
REPLY  | NO  | Neah. (No)

YES
DIALOG | P_NAME = s_port_hoopzSmirk | Huck yeah, I know about the sewers.
DIALOG | Benedict | Me too. I also know about the sewers.
WAIT | 0.5
DIALOG | Benedict | See you.
EXIT |

NO
DIALOG | P_NAME | Not really, what's the to know?
DIALOG | Benedict | Oh, I was goin' to ask you if you knew if the sewers are actually a dangerous place filled with Fiscian Baddies? Or if lots of dwarfs try to escape through the sewers and die tryin'? Or if there is a path through the sewers to where the L.O.N.G.I.N.U.S. rebels hide out? Or if there really is a plantaion run by a grotesque Duergar who barbarously forces slaves to farm for sewer treats? But I guess you don't know either.
KNOW | tnnLONGINUSTnn | 1
EXIT |
";
