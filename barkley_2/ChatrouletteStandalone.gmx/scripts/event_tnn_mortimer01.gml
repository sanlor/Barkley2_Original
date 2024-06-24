///Event for Mortimer, normally goes to Candy Shop
/*
//TODO: Mortimer need a portrait!
NOTES: send to EVENT | o_mortimer01 | 2 when wanting to buy candy schemes

variables
    mortimerState
        0 - haven't met Mortimer
        1 - talked to Mortimer
        2 - cooldown has expired and you can now buy candy from Mortimer
    mortimerShopped
        0 - haven't purchased Candy Schemes
        1 - have looked at Candy from Mortimer (seen how expensive Chocomallows are)
    mortimerRobbed
        0 - haven't robbed Mortimer
        1 - have robbed Mortimer
        2 - repeating dialog until the robbery cooldown has expired
    mortimerJobOpen
        0 - haven't asked about the job for Eric
        1 - have asked, no longer available
*/

script = "
IF body == governor | GOTO | GOVERNOR
IF comServ == 4     | GOTO | ROBBERY
IF mortimerState == 3 | GOTO | MORTIMER_03
IF mortimerRobbed == 2 | GOTO | ROBBEDREPEAT
IF mortimerRobbed == 1 | GOTO | ROBBED
IF mortimerState == 1 | GOTO | MOTIMER_01
IF mortimerState == 0 | GOTO | MORTIMER_00

GOVERNOR
IF mortimerGov == 1 | GOTO | GOVERNOR1
DIALOG | Mortimer | Y-you must be the new g-g-governor! P-pleasure to meet you, sir! P-p-please take this black licorice recipe... It's on me, sir!
NOTIFY | Got Black Licorice Recipe!
DIALOG | Governor Elagabalus | Thank you! But you didn't need to do that...
QUEST  | mortimerGov = 1
GOTO | END

GOVERNOR1
DIALOG | Mortimer | M-m-mr. Governor! Please stop by Mortimer's Candy Shop anytime! W-w-we love to serve Duergars!
GOTO | END

" +
//ROBBERY SEQUENCE
"
ROBBERY
DIALOG | Mortimer | Welcome to Mortimer's Candy Shop! What can I get for you, youngster?
DIALOG | P_NAME   | Hi! I'm here to pick up some money for Mr. Cornrow and Mr. Juicebox. Mr. Cornrow said Mr. Juicebox gave you some money and got the wrong change in return.
DIALOG | Mortimer | Ha, kid, you're too nice to get mixed up with the likes of those two miscreants.
DIALOG | P_NAME = s_port_hoopzAngry | Isn't miscreant a kinda harsh word? Mr. Cornrow told me to show you his gun so you'd know I'm here for him.
" +
//TODO: add either a "aiming gun sprite", (which could be useful) or even further, a "fake gun draw" that essentially looks like this GUNDRAW | bando 1-5 | (direction of object to draw at)
"
SET    | o_mortimer01 | scared1
BREAKOUT | add | money
DIALOG | Mortimer | Wh-whoa! Let's s-slow down here! Uhhh, y-y-yeah! What the hell is Cornrow trying to pull? Tell him I wasn't moving in on his shipment, I was just trying to get my piece of the pie!
DIALOG | P_NAME | Oh, I'm sure this isn't that big of a deal... Mr. Cornrow is just trying to help Juicebox with his numbers.
DIALOG | Mortimer | Look, man. Take the recipe, and tell Cornrow I didn't mean anything by it.
DIALOG | P_NAME | What recipe?
WAIT | 0.3
NOTIFY | Mortimer coughed up the Chocomallow Recipe!
DIALOF | P_NAME = s_port_hoopzHappy | Wow, this looks like a great recipe! Cornrow will love it!
DIALOG | Mortimer | J-just, put the gun down and let me run my shop in peace...
DIALOG | P_NAME | Oh... what about Juicebox's change?
DIALOG | Mortimer | Clispaeth-christ... where are the Duergars when you need them?!
WAIT | 0.5
QUEST  | money += @money_mortimerRobbery@
DIALOG | P_NAME | Thanks, Morty! I'll see you later!
BREAKOUT | clear
SET    | o_mortimer01 | scared2
DIALOG | Mortimer | H-holy Clispaeth...
QUEST | mortimerRobbed = 1
QuestTime | mortimerState | 3 | 60
QUEST  | comServ = 5
GOTO | END

ROBBED
SET    | o_mortimer01 | scared2
DIALOG | Mortimer | You again?! J-just leave me alone!
DIALOG | P_NAME | I was thinking I could get some candy from you?
DIALOG | Mortimer | Shop's closed, give me some time to process what just happened!
GOTO | END

ROBBEDREPEAT
IF time >= timerReopen | GOTO | MORTIMER_02
DIALOG | Mortimer | Shop's closed.
GOTO | END

MORTIMER_03
QUEST | mortimerState = 3
SET | o_mortimer01 | scared2
DIALOG | Mortimer | I don't want any trouble, just buy what you need and get out of here!
GOTO | END

MORTIMER_01
DIALOG | Mortimer | Whattday know, P_NAME_S?
GOTO | CANDY_CHOICE

MORTIMER_00
DIALOG | Mortimer | Welcome to Mortimer's Candy Shop, youngster. What can I get for you?
DIALOG | P_NAME = s_port_hoopzHappy  | This is a candy store? Then I want CANDY, of course! Candy, candy, candy!
DIALOG | Mortimer | Well... I just sell recipes here actually. During the transition to the new governor, we can't sell candy, go to the bank, or get out of Tir na nOg.
DIALOG | P_NAME = s_port_hoopzAngry | A candy store with no candy? What kid of scam is this?
DIALOG | Mortimer | Well there's no law against selling recipes. In case you come across another confectioner out in the Wastelands or, I suppose a 3D Printer would work too...
QUEST | mortimerState = 1
GOTO | CANDY_CHOICE

CANDY_CHOICE
CHOICE | Whaddya want?
IF knowCandyPrint == 0 | REPLY | PRINTEDCANDY | 3D Printing Candy?
REPLY | SHOP | Let me see your recipes.
IF mortimerRobbed == 0 | IF mortimerShopped >= 1 | REPLY | CHOCOMALLOWS | Why are Chocomallows so expensive?
IF ericQuest == 2 | IF mortimerJobOpen == 0 | REPLY | JOBOPENING | Got any job openings?
REPLY | NEVERMIND | Nary ye mind.

PRINTEDCANDY
DIALOG | P_NAME | What did you mean by printing candy?
DIALOG | Mortimer | I meant what I said, candy printing from a 3D printer.
DIALOG | P_NAME = s_port_hoopzSurprise | Wow! You can do that?!
DIALOG | Mortimer | Of course you can! What year do you think we're livin' in, 2053?! You can print out anything you'd like, gun's, candy, organs... vidcons even if you aren't a purist.
DIALOG | P_NAME | Wow...
DIALOG | Mortimer | Too bad the Governor also outlawed 3D Printers... but maybe outside Tir na nOg you can find one. So what do you say, want some recipes?
QUEST | knowCandyPrint = 1
GOTO | CANDY_CHOICE

SHOP
DIALOG | P_NAME | Sure let me take a look at your recipes.
GOTO | CANDYSHOP

CHOCOMALLOWS
DIALOG | P_NAME | Why are those Chocomallows so expensive?
DIALOG | Mortimer | Supply and demand, kid. You see, there used to be a steady stream of Chocomallows coming into Tir na nOg, and prices were low. Problem was, it was all black market mallows, some say shipped in Underground from Al Akihabara. Recently the Duergars started cracking down illegal strweets - that's short for /'street sweets./'
DIALOG | Strweets? I was even listening to you and I have no idea how to prounounce that...
DIALOG | Mortimer | Well regardless, the crackdown hit and the strweets dried up, and with them Chocomallows became rarer than hen's nipples. Hence the price hike.
DIALOG | P_NAME | Doesn't seem fair to all the mallow lovers out there without the means.
DIALOG | Mortimer | Laissez-faire, kid. If you really want it, you'll buy it.
GOTO | CANDY_CHOICE

JOBOPENING
DIALOG | P_NAME | I was just wondering if you had any jobs available.
DIALOG | Mortimer | You gotta be joking, I can barely limp by now while the Candy Ban is active and the Chocomallow supply dried up. You'd be better off selling pet food than candy.
DIALOG | P_NAME | Ahh... good to know.
GOTO | CANDY_CHOICE

NEVERMIND
DIALOG | P_NAME | Nary ye mind, I'll check out your stock more later!
GOTO | END

END
EXIT |
" +
//EVENT01
"
CANDYSHOP
QUEST | mortimerShopped = 1
DIALOG | Bhroom | Add the Candy Shop Here!
IF mortimerState == 3 | DIALOG | Mortimer | You got what you came for, just go...
IF mortimerState != 3 | DIALOG | Mortimer | Thank you, come again.
EXIT |
"

