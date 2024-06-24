///? ? ?
/*
Variables
stahlState
0 - not talked
1 - talked once (...)
2 - talked twice (..)
3 - talked thrice (.)
4 - talked four times, if you answer incorrectly you'll get stuck in the 4th spot for 30 minutes
5 - answered correctly

stahlGuns
0 - nothing
1 - the gun's salesman now gives you a better list of gun's
*/
script = "
IF stahlName == 0 | QUEST | stahlName = ? ? ?
IF stahlState == 9 | GOTO | STAHL09
IF stahlState == 8 | GOTO | STAHL08
IF stahlState == 7 | GOTO | STAHL07
IF stahlState == 6 | GOTO | STAHL06
IF stahlState == 5 | GOTO | STAHL05
IF stahlState == 4 | GOTO | STAHL04
IF stahlState == 3 | GOTO | STAHL03
IF stahlState == 2 | GOTO | STAHL02
IF stahlState == 1 | GOTO | STAHL01
IF stahlState == 0 | GOTO | STAHL00

STAHL08
DIALOG | @stahlName@ | What is it?
GOTO | STAHLQUESTIONS

STAHL07
DIALOG | @stahlName@ | You don't give up do you? Who are you working for?
GOTO | WORKFORME

STAHL05
DIALOG | @stahlName@ | Back to leer some more?
GOTO | YOUSTARE

STAHL03
DIALOG | @stahlName@ | You keep staring at me. What do you want?
DIALOG | P_NAME = s_port_hoopzSurprise | Zooks! You talk?
DIALOG | @stahlName@ | Yes I talk. I also walk and kick ass too. You're lucky you are only seeing the first part. Now why are you staring at me?
CHOICE | What do you want?
REPLY | NOTHING | N-nothing...
REPLY | YOUSTARE | You're the one staring at me!

NOTHING
DIALOG | P_NAME
DIALOG | @stahlName@ | Then go out the way you came in. Believe me, there's nothing for you here.
QUEST | stahlState = 4
ClockTime | event | stahlState | 5 | 30
EXIT |

YOUSTARE
DIALOG | P_NAME | You're the one staring at me.
WAIT | 1.0
DIALOG | @stahlName@ | Heh. You're the only person here that's looked at me-_actually stopped to find out more. Most dwarfs just pass me by. You must know something they don't.
DIALOG | P_NAME | Uh, not really. I have amnesia...
DIALOG | @stahlName@ | Doubtful. Come clean, who do you work for?
CHOICE | Who do you work for?
REPLY | DONTKNOW | I have no idea what you are talking about.
REPLY | WORKFORME | I'm my own boss.

DONTKNOW
DIALOG | P_NAME | I don't know what you're talking about.
DIALOG | @stahlName@ | It's a question you better think on a little bit. Now scram.
QUEST | stahlState = 6
ClockTime | event | stahlState | 7 | 30
EXIT |

WORKFORME
DIALOG | P_NAME = s_port_hoopzAngry | I work for three people. Me. Myself. And none of your beeswax.
DIALOG | @stahlName@ | Vigilante, huh?_ Me likey._ You're probably going to turn up dead, but it's nice to see someone plotting their own course out here at the red line of the universe.
DIALOG | P_NAME | What about you?
DIALOG | @stahlName@ | What about me?
QUEST | stahlState = 8
GOTO | STAHLQUESTIONS

STAHLQUESTIONS
CHOICE | What do you want to know?
IF stahlWho == 0 | REPLY | WHOISSTAHL | Who are you?
IF stahlGordo == 0 | IF gordoState >= 1 | REPLY | STAHLWORKGORDO | Do you work for the master of this plantation?
IF stahlGordo == 1 | IF stahlSlave == 0 | REPLY | NOTASLAVE | So you aren't a slave?
IF stahlCuchu == 0 | IF stahlGordo == 1 | REPLY | STAHLWORKFORCUCHU | So you work for Cuchulainn?
IF stahlCuhu == 1 | REPLY | CANIHELP | Can I help you?
REPLY | NARYYEMIND | Nary ye mind.

WHOISSTAHL
DIALOG | P_NAME | So who are you? You seem different from everybody else I've met.
DIALOG | @stahlName@ | Just an observer, paid to keep an eye on things. Call me._._._ Stahl.
QUEST | stahlName = Stahl
QUEST | stahlWho = 1
GOTO | STAHLQUESTIONS

NOTASLAVE
DIALOG | P_NAME | So you're in disguise? You're not really a slave?
DIALOG | @stahlName@ | The only thing that can turly enslave a dwarf is their own inaction. And to answer your question, no, I'm not really a slave. I'm just laying low here for a while so I can collect information.
QUEST | stahlSlave = 1
GOTO | STAHLQUESTIONS

STAHLWORKGORDO
DIALOG | P_NAME | Do you work under the master of this plantaion?
DIALOG | @stahlName@ | Hah! Don't make me laugh. I wouldn't be under Gordo's employ no matter what the shekels. The last thing that found itself under that fat freak was that poor chair.
QUEST | stahlGordo = 1
GOTO | STAHLQUESTIONS

STAHLWORKFORCUCHU
DIALOG | P_NAME | So you work for Cuchulainn?
DIALOG | @stahlName@ | Definitely not. A lot of people around the neighboring galaxies are pretty interested in figuring out what's really going on here. Some say Cuchu's gone off his rocker. Others say it's a ploy and he's up to his old tricks.
DIALOG | P_NAME | Are others are coming to help? There are a lot of things wrong with this place.
DIALOG | @stahlName@ | Don't count on it. There are no good guys left anymore. It's all about money and risk now and there's not of the former around here. Dwarfs are dwarfs, and I'm not ready to start flooding the home office with reports that we can commoditize them. As for the risk, you're about the brightest person I've spoken to on this floating toilet, so I've had stamp this place as: /'Not worth our time./'
WAIT | 1.0
DIALOG | @stahlName@ | Of course, I don't know everything there is to know about this place yet. It's probably just a bad assignment.
QUEST | stahlCuchu = 1
GOTO | STAHLQUESTIONS

CANIHELP
IF hoopzGumshoe >= 1 | GOTO | GUMSHOE
DIALOG | P_NAME | So should I let you know if I see anything serious? Maybe something that could get other galaxies to come and help?
DIALOG | @stahlName@ | You're serious about this, aren't you?_
GOTO | HELP_CONT

GUMSHOE
DIALOG | P_NAME | Is there anything I can do to help? I am a GUMSHOE LEVEL ONE already!
DIALOG | @stahlName@ | Yeah, yeah, I've heard that song and dance before. Private Investigations. Let me tell you, the only thing that needs to be investigated is a Dwarf with too much money for his own good.
DIALOG | P_NAME | What are you saying?
DIALOG | @stahlName@ | Not saying anything, just watching...
GOTO | HELP_CONT

HELP_CONT
DIALOG | @stahlName@ | Tell you what, you go out and keep trying to make sense of this place. Try to_ /'prod the Cybergremlin's Nest/' as they say. I'll be watching.
DIALOG | P_NAME | Do you mean I should get into trouble?
DIALOG | @stahlName@ | Trouble seems to follow you around already, P_NAME. I don't think you needed me to tell you this. If it helps, tell the Gun'ssalesman that Stahl said to show him the good stuff... she'll hook up up.
DIALOG | P_NAME = s_port_hoopzHappy | Wow thanks, Stahl! I could always use an upgrade to my brasting!
QUEST | stahlGuns = 1
That's enough for now, I'll see you around.
QUEST | stahlState = 9
ClockTime | event | stahlState | 10 | 30

NARYYEMIND
DIALOG | P_NAME | Nary ye mind. I'm out of here.
DIALOG | @stahlName@ | Alright.
EXIT |

STAHL09
DIALOG | @stahlName@ | See you around...
EXIT |

STAHL06
DIALOG | @stahlName@ | Give me some space for a moment, will ya?
EXIT |

STAHL04
DIALOG | @stahlName@ | It's not polite to stare.
EXIT |

STAHL02
DIALOG | @stahlName@ | ...
QUEST | stahlState = 3
EXIT |

STAHL01
DIALOG | @stahlName@ | ..._.
QUEST | stahlState = 2
EXIT |

STAHL00
DIALOG | @stahlName@ | ..._._.
QUEST | stahlState = 1
EXIT |
"
