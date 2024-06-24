/// BIO Magician Ooze
/* Variables
	oozeState
		0 = not talked
		1 = talked
		2 = talked to Ooze enough that you know he's a baller
	oozeBball
		0 = haven't offered to play
		1 = haven't agreed to pay his fee
		2 = agreed to pay his fee		
	uschiBall
		2 = you are looking for a Baller to play with Uschi and yourself
		3 = you have a baller
*/
script = "
IF body == governor | GOTO | GOVERNOR
IF oozeBball == 2 | GOTO | OOZEBBALL02
IF oozeBball == 1 | GOTO | OOZEBBALL01
IF uschiBall == 3 | IF oozeCheckKicks >= 1 | GOTO | ASKTOBALL
IF uschiBall == 2 | IF oozeCheckKicks >= 1 | GOTO | ASKTOBALL
IF oozeState == 2 | GOTO | OOZE02
IF oozeState == 1 | GOTO | OOZE01
IF oozeState == 0 | GOTO | OOZE00
GOTO | OOZE

GOVERNOR
DIALOG | Ooze | 'Governor.'
DIALOG | Governor Elagabalus | (???)

OOZEBBALL02
DIALOG | Ooze | When's the game?
DIALOG | P_NAME | Soon!
EXIT |

OOZEBBALL01
BREAKOUT | add | money
DIALOG | Ooze | Offer still stands.
GOTO | OOZEPAYMENT

CHECKOUTCHOICE
CHOICE | Check out Ooze?
IF oozeCheckBandana == 0 | REPLY | CHECKOUTBANDANA | Check out his bandana.
IF oozeCheckJacket == 0 | REPLY | CHECKOUTJACKET | Check out his jacket.
IF oozeCheckSword == 0 | REPLY | CHECKOUTSWORD | Check out his sword.
IF oozeCheckGloves == 0 | REPLY | CHECKOUTGLOVES | Check out his gloves.
IF oozeCheckKicks == 0 | REPLY | CHECKOUTKICKS | Check out his kicks.
REPLY | NARYYEMIND | Nary ye mind.

NARYYEMIND
DIALOG | P_NAME | Nary ye mind.
DIALOG | Ooze | Alright._ I won't.
EXIT |

CHECKOUTBANDANA
DIALOG | P_NAME | That's a really swank bandana.
DIALOG | Ooze | Yeah kid, I scored this a while back. I'd say it keeps the sweat out of my eyes but I've never really broken one.
DIALOG | P_NAME | Whoah...
WAIT | 0.5
DIALOG | Ooze | That it? Just gonna ogle?
DIALOG | P_NAME | Oh er um...
QUEST | oozeCheckBandana = 1
GOTO | CHECKOUTCHOICE

CHECKOUTJACKET
DIALOG | P_NAME | That jacket is really fly.
DIALOG | Ooze | Thanks, kid, it's an anti-balistic, alumi-crete polymer. It normally comes in jerkin, but_ mine's got sleeves.
DIALOG | P_NAME = s_port_hoopzSurprise | Wow!
DIALOG | Ooze | Anything else?
QUEST | oozeCheckJacket = 1
GOTO | CHECKOUTCHOICE

CHECKOUTSWORD
DIALOG | P_NAME | That sword is...
DIALOG | Ooze | Psionic?_ Nah, but I get that a lot. It's a refined plas-steel and rare bio-modded zaubric earth metal amalgamate.
DIALOG | P_NAME | Whoah, what do you call it?
DIALOG | Ooze | Her name...-
" +
//TODO: if we use Ooze elsewhere (he becomes a bigger character), we'll have him do a POSE and Baba Yaga flourish!
"
DIALOG | Ooze | -is Baba Yaga!
SURPRISEAT | o_ooze01
WAIT | 0.5
DIALOG | Ooze | Half BIO damage, have Cyber. At fifty-fifty, I can pretty much take out anything on Necron 7.
DIALOG | P_NAME = s_port_hoopzSurprise | Whatttt? That's incredible!
DIALOG | Ooze | Incredible is as incredible does. Unfortunately for our enemies, me and Baba Yaga do /'incredible/' a lot. Any more questions?
LOOKAT | o_cts_hoopz | o_ooze01
DIALOG | P_NAME | Oh, um...
KNOW | knowOozeSword | 3
QUEST | oozeCheckSword = 1
GOTO | CHECKOUTCHOICE

CHECKOUTGLOVES
DIALOG | P_NAME | Your gloves-
DIALOG | Ooze | That's right, fingerless.
DIALOG | P_NAME = s_port_hoopzSurprise | So outrageous!
QUEST | oozeCheckGloves = 1
GOTO | CHECKOUTCHOICE

CHECKOUTKICKS
DIALOG | P_NAME | Those are some fresh kicks.
IF knowOozeSword == 1 | Ooze | Heh, Jordan XIs, these are over four millenia old but haven't a scuff on them. That's no accident. If anyone get's close to these suckers, Baba Yaga cuts them down like fresh grass on the weekend.
IF knowOozeSword == 0 | DIALOG | Ooze | Heh, Jordan XIs, these are over four millenia old but haven't a scuff on them. That's no accident. If anyone get's close to these suckers, my blade cuts them down like fresh grass on the weekend.
DIALOG | P_NAME | Wow. Fierce.
DIALOG | Ooze | What I wear is a reflection of my spirit, and my sprit is a Badass BIO Magician and Atma Jock.
DIALOG | P_NAME | Atma Jock?
DIALOG | Ooze | Atma Jocks excel in all sports, especially the ball and puck sports like b-ball or hockey.
DIALOG | P_NAME | B-b-b-ball?
DIALOG | Ooze | That's right b-ball, what's it to you?
IF uschiBall == 2 | GOTO | ASKTOBALL
DIALOG | P_NAME | Oh well, uh, nothing I guess.
QUEST | oozeCheckKicks = 1
GOTO | CHECKOUTCHOICE

ASKTOBALL
CHOICE | Ask Ooze to ball?
REPLY | CANYOUBALL | Do you want to play a game with Uschi and me?
REPLY | NARYYEMIND | Nary ye mind, you wouldn't wanna anyways.

CANYOUBALL
DIALOG | P_NAME | Hey we have a game of b-ball starting pretty soon and we need some more ballers. Want to join?
DIALOG | Ooze | B-ball, eh? Why that old pastime and not something more athletic like LAN Darts?
DIALOG | P_NAME | Well there is a whole b-ball court on the other end of town.
DIALOG | Ooze | Hmmmm._._._
WAIT | 1.0
DIALOG | Ooze | @oozeBball@ sheks.
DIALOG | P_NAME | What? @oozeBball@ neuroshekels?
DIALOG | Ooze | That's right. If you want the skills you gotta pay the bills.
BREAKOUT | add | money
DIALOG | P_NAME | Diabolical...
GOTO | OOZEPAYMENT

OOZEPAYMENT
CHOICE | Pay for Ooze's skillz?
REPLY | FINEPAY | Fine, here's your fee.
REPLY | TOOMUCH | It's too much.

FINEPAY
DIALOG | P_NAME | Fine, here. You better be good.
QUEST | money -= @money_oozeBball@
DIALOG | Ooze | I ain't good. I'm better.
BREAKOUT | clear
DIALOG | P_NAME | Okay well, I'll try to get the game going soon.
DIALOG | Ooze | Alright, kid. Let me know.
QUEST | oozeBball = 2
EXIT |

TOOMUCH
DIALOG | P_NAME | I'm sorry but @oozeBball@ is too rich for my blood.
BREAKOUT | clear
DIALOG | Ooze | Suit yourself. I'll be here if you are looking for a sure thing.
QUEST | oozeBball = 1
EXIT |

OOZE02
DIALOG | Ooze | Move on, kid. Unless you got a job for me, I'm not interested.
DIALOG | P_NAME | Oh, sorry.
EXIT |

OOZEBBALLWAIT
QUEST | oozeState = 2
DIALOG | Ooze | Done staring or do you plan on making me uncomfortable?
DIALOG | P_NAME | Oh sorry.
EXIT |

OOZE01
IF oozeCheckBandana == 1 | IF oozeCheckJacket == 1 | IF oozeCheckSword == 1 | IF oozeCheckGloves == 1 | IF oozeCheckKicks == 1 | GOTO | OOZEBBALLWAIT
DIALOG | Ooze | What is it, kid?
GOTO | CHECKOUTCHOICE

OOZE00
WAIT | 0.5
DIALOG | Ooze | Piss off, kid.
WAIT | 0.5
DIALOG | P_NAME = s_port_hoopzAngry | (Well that was rude... but I have to admit, this guy is fresh dressed like a million shekels!)
QUEST | oozeState = 1
GOTO | CHECKOUTCHOICE
";
/*
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
DIALOG | P_NAME | 
DIALOG | Ooze | 
*/
