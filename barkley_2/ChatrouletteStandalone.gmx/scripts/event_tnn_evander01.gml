script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF clock >= 1       | GOTO | CLOCK1
GOTO | CLOCK0

MATTHIAS
DIALOG | Evander | You never give up, do you kid? I can't serve you juice till your ID says you're of age... maybe Cornrow can help you with that, ha ha!

GOVERNOR
DIALOG | Evander | Hello, Mr. Governor, sir. May I serve you the house grape puree? It's a fine craft for the refined palette with one grape of every strain, each distilled five times through reverse osmosis. It's rare vintage reserved exclusively for our Duergar clientele.
DIALOG | Governor Elagabalus | (I don't think I'm old enough to drink grape juice...)

CLOCK1
IF evanderState == 2 | GOTO | EVANDER2_1
IF evanderState == 1 | GOTO | EVANDER1_1
GOTO | EVANDER0_0

EVANDER1_1
DIALOG | Evander | What's the deal, kid? I told you, I can't serve you any juice!
DIALOG | P_NAME  | I'm a little thirsty, but okay.
DIALOG | Evander | Ah! Some reverse psychology, huh? You're just like that young punk Matthias, always scheming for juice! Even if I wanted to, the Duergars would really rough me up if they found out.
DIALOG | P_NAME  | The Duergars are really opposed to underaged drinking, huh?
IF curfew == before | DIALOG | Evander | That's not it at all. They just need a reason. They always come up with new laws, just so we break 'em. And when we break 'em they really let loose on us. We've supposedly got a new Governor arriving soon... I'm sure when they get here they'll make a big speech laying out all the new offenses we're committing, and how it's for our own saf... oh no... is this dissident speech? It is, isn't it? There's a Dissident Speech Statute... I...
IF curfew != before | DIALOG | Evander | That's not it at all. They just need a reason. They always come up with new laws, just so we break 'em. And when we break 'em they really let loose on us. That curfew? That's new too. Never used to have that until they needed an excuse to bea-... oh no... is this dissident speech? It is, isn't it? There's a Dissident Speech Statute... I...
DIALOG | P_NAME  | Don't worry, Evander, I-
DIALOG | Evander | Shut up kid! Shut up, shut up, shut up! Don't say another word! Speak a word of this to anyone and you're dead meat!
QUEST  | evanderState = 2

EVANDER2_1
DIALOG | Evander | Get outta here, kid!

CLOCK0
IF evanderState == 1 | GOTO | EVANDER1_0
GOTO | EVANDER0_0

EVANDER1_0
IF jindrichApricot == 2 | DIALOG | Evander | Thanks for helping me out with Jindrich. But I still can't serve you, kid.
IF jindrichApricot != 2 | DIALOG | Evander | I can't serve you, kid. 

EVANDER0_0
DIALOG | Evander | This ain't for you, youngster.
DIALOG | P_NAME  | What do you mean? What is this place?
DIALOG | Evander | It's a fruit juice bar, kid? What does it look like? Old timers like Dubuque come here to sip away their sorrows. Old timers, got it? NOT for youngsters. 
DIALOG | P_NAME  | Yikes... you don't have to be so mean about it... I didn't know...
DIALOG | Evander | Aw, kid, cheer up... you'll grow up fast in Tir na Nog! Heh heh heh!
QUEST  | evanderState = 1
";
