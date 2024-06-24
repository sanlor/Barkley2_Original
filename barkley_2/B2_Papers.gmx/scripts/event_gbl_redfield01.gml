///Redfield the Gun'ssalesman
//(He's Chris, we don't even try to hide it. And he's lost a lot of good partners.)
/*
redfieldState
    0 - never talked
    1 - talked, sends you to PURCHASER
redfieldPast
    0 - haven't asked about his past
    1 - have asked about his past, gotten some stupid details
How he works:
you have to have a knowledgeVariable of knowGunstiers to a certain level, when you, you 
knowGunstiers
    0 - only get 50 point gun's
    1 - get 70 point gun's
*/
script = "
IF body == governor | GOTO | GOVERNOR
IF redfieldState == 1 | GOTO | REDFIELD01
IF redfieldState == 0 | GOTO | REDFIELD00

GOVERNOR
DIALOG | Redfield | Evening, sir. Nothing suspicious going on here.

REDFIELD01
DIALOG | Redfield | I've got gun's for sale. Top quality hardware. Some of these would have loved to brast in my days as a /'professional./' I can let you take a look. But remember, you only get one peek. Someone in my line of business needs to keep moving.
GOTO | PURCHASER

REDFIELD00
DIALOG | Redfield | I'm Redfield. Glad you found me. I sell gun's... at least, mostly gun's.
DIALOG | P_NAME | Hi, I'm P_NAME_S-
DIALOG | Redfield | Let me stop you there, kid. We aren't friends... I don't want to get to know you. I just want to know how many neuroshekels you have in that brainpan of yours and how much you are willing to part with.
DIALOG | P_NAME | Oh... sorry...
WAIT | 0.5
DIALOG | Redfield | Look, sorry kid. It's just_ it's best if we keep this strictly business. Best not get too close. Especially to me. Now whatcha buyin'?
GOTO | PURCHASER

PURCHASER
CHOICE | Whatcha buyin'?
IF redfieldUpgrade >= 2 | REPLY | SHOP90 | Show me the Ninety Pointers!
IF redfieldUpgrade >= 1 | REPLY | SHOP70 | Show me the good stuff.
IF redfieldUpgrade >= 1 | REPLY | SHOP50CHEAP | Show me the cheaper gun's.
IF redfieldUpgrade == 0 | REPLY | SHOP50FIRST | Show me your gun's.
IF knowGunstiers == 2 | IF redfieldShoppedNOW == 1 | REPLY | CHIDE70 | Those gun's blow.
IF knowGunstiers == 1 | IF redfieldShoppedNOW == 1 | REPLY | CHIDE50 | Those gun's suck.
IF redfieldPast == 1 | REPLY | YOURPAST | You seem to have a dark past.
REPLY | NARYYEMIND | Gotta go...

YOURPAST
DIALOG | P_NAME | You seem to have a dark past. Maybe I could help illuminate it?
DIALOG | Redfield | You are playing with fire, kid._ I'm dangerous... and the people that I care about have a funny way of turning up dead.
DIALOG | P_NAME = s_port_hoopzSad | Oh... I'm sorry.
DIALOG | Redfield | I was too._._._ sorry for too long. I knew I needed to honor the lives of my fallen comrades with something. So I got back to work.
DIALOG | P_NAME | Selling gun's?
DIALOG | Redfield | That's right. I plan to make enough money running brastware to dedicate a park or memorial to all those that I've lost. I hear you can get some nice plots of land in the Swamps.
DIALOG | P_NAME | That's very thoughful of you.
DIALOG | Redfield | Thank you, now, enough about me. Let's show you my stock...
QUEST | redfieldPast = 1
GOTO | PURCHASER

CHIDE50
DIALOG | P_NAME = s_port_hoopzAngry | I thought you said you had the good stuff? I know quality, and these gun's can't hack it.
DIALOG | Redfield | Heh heh heh... you got me kid. Not bad... I thought I could pass some of my low grade junk on to ya. But it looks like you actually have an eye for gun's...
WAIT | 0.5
DIALOG | Redfield | Alright. I'm gonna show you the primo material. Have a look...
QUEST | redfieldUpgrade = 1
QUEST | redfieldShoppedNOW = 1
GOTO | SHOP70

CHIDE70
DIALOG | Bhroom | Upgrade to 90 Point Gun's
QUEST | redfieldUpgrade = 2
QUEST | redfieldShoppedNOW = 1
GOTO | SHOP90

CHIDE90
DIALOG | Bhroom | Upgrade to 120 Point Gun's
QUEST | redfieldUpgrade = 3
QUEST | redfieldShoppedNOW = 1
GOTO | SHOP120

SHOP90
DIALOG | Bhroom | The 90 Point Shop Goes here!
GOTO | PURCHASER

SHOP120
DIALOG | Bhroom | The 90 Point Shop Goes here!
GOTO | PURCHASER

SHOP50CHEAP
DIALOG | P_NAME | Let me see the cheaper gun's.
DIALOG | Redfield | Alright, here they are.
QUEST | redfieldShoppedNOW = 1
GOTO | SHOP50

SHOP50FIRST
DIALOG | P_NAME | I'll take a look at your gun's.
DIALOG | Redfield | Alright, but let's be quick about it. Blue eyes abound.
QUEST | redfieldShoppedNOW = 1
GOTO | SHOP50

NARYYEMIND
IF area == sw1 | GOTO | INTHESEWERS
IF area == sw2 | GOTO | INTHESEWERS
IF redfieldEnd == 1 | GOTO | NARYYEMINDSECOND
GOTO | NARYYEMINDFIRST

NARYYEMINDSECOND
DIALOG | P_NAME | I'll have to talk to you later.
DIALOG | Redfield | Sounds good kid, but remember. I don't stick around for long.

NARYYEMINDFIRST
DIALOG | P_NAME | Sorry, gotta go.
DIALOG | Redfield | Alright, well I gotta move. If you see me again, I'll probably have a new inventory. Weapons move fast these days...
QUEST | redfieldEnd == 1
GOTO | END

INTHESEWERS
DIALOG | Redfield | Shooting wildly ain't gonna get you anywhere. Stick to the shadows.
GOTO | END

END
QUEST | redfieldShoppedNOW = 0
EXIT
"
