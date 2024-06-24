/// Fadima, in BBALL Tenement, offering you the chair
/* Fadima is the woman sitting outside the VR den.
  Talking to her after you've found Castor's body initiates castorDead 2 and makes the body disappear.

Variables
    fadimaState
        0 = never talked, she offers chair but Hoopz auto-refuses
        1 = talked to her, repeating dialogue
        2 = castor is dead so you get offered the chair when you talk to her, this stays 2 ONLY if you don't have enough money
        3 = you've denied the Chair Purchase with an Excuse
        4 = you've denied the Chair Purchase with a CHIDING
        
    fadimaChairPurchase
        0 = you haven't purchased the chair
        1 = you have purchased the chair
        2 = you have refused the chair
        
    castorDead
        0 = you haven't come across the Dead Castor
        1 - you have seen the dead castor
*/

//Begin Script
script = "

IF body == governor | GOTO | FADIMAGOV0
IF castorDead == 1  | GOTO | FADIMACASTOR
IF fadimaState == 0 | GOTO | FADIMA0
IF fadimaState == 1 | GOTO | FADIMA1
IF fadimaState == 2 | GOTO | FADIMA2
IF fadimaState == 3 | GOTO | FADIMA3
IF fadimaState == 4 | GOTO | FADIMA4

FADIMAGOV2
DIALOG | Fadima | Thanks for the cash, square. You can go though.

FADIMAGOV1
DIALOG | Fadima | Scram, suit. You don't know a good chair when you see it.

FADIMAGOV0
IF fadimaGov == 1 | GOTO | FADIMAGOV1
IF fadimaGov == 2 | GOTO | FADIMAGOV2
DIALOG | Fadima | Nice clothes, man... hey, if you want the chair down there, it's just @money_chairGov@ neuro-shekels.
GOTO | CHAIR_CHOICE_GOV
" +
//TODO: add breakout box and money removal with GOVCHAIRBUY
"

CHAIR_CHOICE_GOV
CHOICE | About that chair...
REPLY | GOVCHAIRLEAVE | Get of there.
REPLY | GAVECHAIRBUY| Just buy the damn chair.

GOVCHAIRLEAVE
DIALOG | Hoopz | When I think back on my youth at the Duergar Academy, I remember the joy chairs brought me. Yes. Long summers in chairs. Thank you for rekindling these wonderful, authentic memories of my childhood. Well, goodbye.
QUEST | fadimaGov = 1

GOVCHAIRBUY
DIALOG | Hoopz | A chair, yes, citizen? I'll... I'll take it!
ITEM | Bought Fadima's Chair
DIALOG | Fadima | Thanks, I knew stuffed shirts like you were good for something.
QUEST | fadimaGov = 2
QUEST | chairPurchase = 1

FADIMA4
DIALOG | Fadima | People like you don't come here. You don't belong here. Enjoy the chair.

FADIMA3
DIALOG | Fadima | ... go away.

FADIMA2
DIALOG | Fadima | If you want the chair, it's @money_fadimaCharity@ neuro-shekels.
DIALOG | Hoopz | Um... do you really need money?
DIALOG | Fadima | What the hell does it look like?
GOTO | CHAIR_BUY

CHAIR_BUY
CHOICE | About that chair...
REPLY | CHARITY | Give her @money_fadimaCharity@ neuro-shekels.
REPLY | CHIDE | Give her a stern tounge wagging.
REPLY | DENY | Give her an excuse.
REPLY | AVOID | Don't give her anything.

CHARITY
DIALOG | Hoopz | Hey. Take this. It's @money_fadimaCharity@ neuro-shekels. It's not much, but just take it, okay?
DIALOG | Fadima | You're such a good Samaritan. You saved me. Here are your karma points.
DIALOG | Hoopz | Whatever, just... take care of yourself. And leave if you can.
QUEST | fadimaChair = 2

DENY
DIALOG | Hoopz | Uh oh, I'm outta cash. Look, I don't have any money to give you, but I'd give you some if I did. Looks like we're in the same boat, huh?
DIALOG | Fadima | ... just leave me alone.
DIALOG | Hoopz | Sorry...
QUEST | fadimaChair = 1
QUEST | fadimaState = 3

CHIDE
DIALOG | Hoopz | Now lookie here, missy. It sounds to me like you need to get off your rump and take some control over your life.  Get a job, get a life and most of all? Get a grip... capice?
DIALOG | Fadima | Shut up. Shut up! Clispaeth, shut up...
DIALOG | Hoopz | Well you'll never learn the value of a neuro-shekel with that attitude.
QUEST | fadimaChair = 1
QUEST | fadimaState = 3
" +
// ROUNDMOUND Stingy?
// GUILDERBERG ?
"
AVOID
DIALOG | Hoopz | Um sorry I can't help you.
DIALOG | Fadima | Then leave me alone.
QUEST | fadimaChair = 1

FADIMACASTOR
DIALOG  | Hoopz | H-hey... you're with all those people wearing glasses, yeah? In the apartment back there?
DIALOG  | Fadima | ... huh? Yeah. You want to buy a chair?
DIALOG  | Hoopz | Uh, I think someone in there might... I think they might be dead. He had red glasses on and he wasn't breathing.
DIALOG  | Fadima | The chair, uh... ... oh... Castor._._._ I'll clean him up.
DIALOG  | Hoopz | Y-yeah... I'm... I dunno what to say. I'm sorry.
" +
// TODO: add SAD HOOPZ portrait
"
DIALOG  | Fadima | @money_chairOne@ neuro-shekels for the chair. No, @money_fadimaCharity@.
QUEST   | castorDead = 2
QUEST   | fadimaState = 2
GOTO    | CHAIR_BUY

FADIMA1
DIALOG | Fadima | I don't really have anything to talk about unless you want to buy the chair. I'm kind of tired.

FADIMA0
DIALOG | Hoopz | Hey, what are those glasses you're holding? They look pretty cool.
DIALOG | Fadima | Oh... they're nothing. Don't worry about them. Or me.
DIALOG | Hoopz | I've seen glasses like that used for vidcons. You put on the glasses and it's like you're actually inside the vidcon. Are they kinda like that?
DIALOG | Fadima | ... not really. Maybe. Do you want to buy a chair? That chair down there?
" +
//Add chair camera frame and look, and back to Fadima
"
DIALOG | Hoopz | I don't really have anywhere to put it. And it's kind of beat up, so no thanks.
DIALOG | Fadima | Oh... I'm trying to get rid of it. @money_chairOrig@ neuro-shekels. Lemme know if you know someone who wants it.
DIALOG | Hoopz | Sure... see ya.
QUEST | fadimaState = 1
"
