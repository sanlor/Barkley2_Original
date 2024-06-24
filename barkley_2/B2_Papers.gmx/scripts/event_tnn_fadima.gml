/// event_tnn_fadima()
script = "
IF body == governor   | GOTO | GOVERNOR_IF
GOTO | MAIN_IF

GOVERNOR_IF
IF fadimaGov == 2 | GOTO | GOVERNOR2
IF fadimaGov == 1 | GOTO | GOVERNOR1
GOTO | GOVERNOR0

GOVERNOR2
DIALOG | Fadima | Thanks for the cash, square. You can go though.

GOVERNOR1
DIALOG | Fadima | Scram, suit. You don't know a good chair when you see it.

GOVERNOR0
DIALOG | Fadima | Nice clothes, man... hey, if you want the chair down there, it's just @money_fadimaGov@ neuro-shekels.
BREAKOUT | add | money
CHOICE | About the chair...
REPLY  | GOVERNOR_NO  | Get out of here!
REPLY  | GOVERNOR_YES | Buy the chair.

GOVERNOR_YES
IF money < @money_fadimaGov@ | GOTO | GOVERNOR_BROKE
QUEST  | money -= @money_fadimaGov@
DIALOG | Governor Elagabalus | A chair, yes, citizen? I'll... I'll take it!
BREAKOUT | clear
DIALOG | Fadima | Thanks, I knew stuffed shirts like you were good for something.
QUEST  | fadimaGov = 2

GOVERNOR_BROKE
BREAKOUT | clear
DIALOG | Governor Elagabalus | Hmmm... I forgot to bring the vast pile of neuro-shekels stashed at my mansion! I don't have the funds on me.
DIALOG | Fadima | ... just leave me alone.
DIALOG | Governor Elagabalus | Sorry...
QUEST  | fadimaChair = 1

GOVERNOR_NO
BREAKOUT | clear
DIALOG | Governor Elagabalus | When I think back on my youth at the Duergar Academy, I remember the joy chairs brought me. Yes. Long summers in chairs. Thank you for rekindling these wonderful, authentic memories of my childhood. Well, goodbye.
QUEST  | fadimaGov = 1

MAIN_IF
IF fadimaChair == 2 | GOTO | CHAIR2
IF fadimaChair == 1 | GOTO | CHAIR1
IF castorDead == 2  | GOTO | CASTOR2
IF castorDead == 1  | GOTO | CASTOR1
IF fadimaState == 1 | GOTO | STATE1
GOTO | STATE0

CHAIR2
DIALOG | Fadima | People like you don't come here. You don't belong here. Just go away.

CHAIR1
DIALOG | Fadima | ... go away.

CASTOR2
DIALOG | Fadima | If you want the chair, it's @money_fadimaCharity@ neuro-shekels.
DIALOG | P_NAME | Um... do you really need money?
DIALOG | Fadima | ... you're not better than me.
BREAKOUT | add | money
CHOICE | Should I...
REPLY  | BUY   | ... give her @money_fadimaCharity@ neuro-shekels.
REPLY  | SCOLD | ... give her a stern tongue wagging.
REPLY  | LEAVE | ... just leave.

BUY
IF money >= @money_fadimaCharity@ | GOTO | BUY_YES
GOTO | BUY_NO

BUY_YES
QUEST  | money -= @money_fadimaCharity@
DIALOG | P_NAME | Hey. Take this. It's @money_fadimaCharity@ neuro-shekels. It's not much, but just take it, okay?
BREAKOUT | clear
DIALOG | Fadima | You're such a good Samaritan. You saved me. Here are your karma points.
DIALOG | P_NAME | Whatever, just... take care of yourself. And leave if you can.
QUEST  | fadimaChair = 2

BUY_NO
BREAKOUT | clear
DIALOG | P_NAME | Uh oh, I'm outta cash. Look, I don't have any money to give you, but I'd give you some if I did. Looks like we're in the same boat, huh?
DIALOG | Fadima | ... just leave me alone.
DIALOG | P_NAME | Sorry...
QUEST  | fadimaChair = 1

SCOLD
BREAKOUT | clear
DIALOG | P_NAME | Now lookie here, missy. It sounds to me like you need to get off your rump and take some control over your life.  Get a job, get a life and most of all? Get a grip... capice?
DIALOG | Fadima | Shut up. Shut up! Clispaeth, shut up...
DIALOG | P_NAME | Well you'll never learn the value of a neuro-shekel with that attitude.
QUEST  | fadimaChair = 1
// ROUNDMOUND
// GILDERBERG

LEAVE
BREAKOUT | clear
DIALOG | P_NAME | Yeah, I know. Um... see you.
DIALOG | Fadima | Leave me alone.
QUEST  | fadimaChair = 1

CASTOR1
DIALOG | P_NAME | H-hey... are you with all those people wearing glasses? In the apartment back there?
DIALOG | Fadima | ... huh? Yeah. You want to buy a chair?
DIALOG | P_NAME | Uh, I think someone in there might... I think they might be dead. He had red glasses on and he wasn't breathing.
DIALOG | Fadima | The chair, uh... ... oh... I'll clean him up.
DIALOG | P_NAME | Y-yeah... I'm... I dunno what to say. I'm sorry.
DIALOG | Fadima | @money_fadimaOne@ neuro-shekels for the chair. No, @money_fadimaTwo@.
DIALOG | P_NAME | No, I don't want the chair. I... I just wanted to let you know.
DIALOG | Fadima | ... okay.
QUEST  | castorDead = 2

STATE1
DIALOG | Fadima | I don't really have anything to talk about unless you want to buy the chair. I'm kind of tired. Sorry.

STATE0
DIALOG | P_NAME | Hey, what are those glasses you're holding? They look pretty cool.
DIALOG | Fadima | Oh... they're nothing. Don't worry about them. Or me.
DIALOG | P_NAME | I've seen glasses like that used for vidcons. You put on the glasses and it's like you're actually inside the vidcon. Are they kinda like that?
DIALOG | Fadima | ... not really. Maybe. Do you want to buy a chair? That chair down there?
DIALOG | Fadima | ADD PAN TO CHAIR
DIALOG | P_NAME | I don't really have anywhere to put it. And it's kind of beat up, so no thanks.
DIALOG | Fadima | Oh... I'm trying to get rid of it. @money_fadimaOrig@ neuro-shekels. Lemme know if you know someone who wants it.
DIALOG | P_NAME | Sure... see ya.
QUEST  | fadimaState = 1
";
