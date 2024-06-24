///Speaking to Abdul-Gafur before Jinrich or Gumshoe Trigger
// usage: scr_tnn_abdul_gafur01

/*
variables
    0 = not talked
        if time is before 23:00, he just repeats
    1 = talked to him before 23:00
    2 = talked to him after 23:00, repeating Dialogue
    3 = he's offered you the Cyberspear Piece, go to event 1
*/

script = "
IF body == governor | GOTO | GOV
IF clock <= 0.9 | GOTO | ABDUL_EARLY
IF abdulOffer >= 5 | DIALOG | Bhroom | Goto Event 3
IF abdulState == 3 | DIALOG | Bhroom | Goto Event 2
IF abdulState == 2 | GOTO | ABDUL_02
IF abdulState <= 1 | GOTO | ABDUL_01

" +
//MAIN STATES
"
GOV
DIALOG | Abdul-Gafur | It's good to see you, Mr. Governor! I've been saving this bottle of The Grape for after your inaugural address, but since you're here I might as well give it to you now. It's pure strain Malbec, vintage 665X.
DIALOG | Governor Elagabalus | Mmmmmm! Grapes! Boy, do I love to drink grape juice! Because I'm the Governor, an full-grown adult, and it's legal for me to drink it! Well, goodbye!
NOTIFY | You got a Bottle of Vintage Grape
ITEM | Vintage Grape | 1

ABDUL_02
DIALOG | Abdul-Gafur | Like a mug of The Grape, sir. Stay frosty.
GOTO | END

ABDUL_01
FRAME | CAMERA_NORMAL | o_abdul_gafur01 | o_gelasio01
DIALOG | Gelasio | Hey! Abdul! 
DIALOG | Abdul-Gafur | Gafur, sir.
DIALOG | Gelasio | Huh, what?
DIALOG | Abdul-Gafur | Abdul-Gafur, sir. My name. It's hyphenated.
DIALOG | Gelasio | Hyphenated, eh?
WAIT | 0.3
DIALOG | HAHA Abdul! I like your style. Pour yourself a drink why don't ya, loosen up! And give yourself a nice tip too! Leave uh... leave what I'd leave!
DIALOG | Abdul-Gafur | Why thank you, Mr. Gelasio. You are very generous, as always.
WAIT | 0.5
FRAME | CAMERA_NORMAL | o_cts_hoopz | o_abdul_gafur01
DIALOG | Abdul-Gafur | Good day, what can I make for you?
DIALOG | P_NAME | Oh, um nothing I guess I was just soaking in the sights and sounds of this fair city.
DIALOG | Abdul-Gafur | Ah, a tourist?
DIALOG | P_NAME | Umm, I guess you could say that.
DIALOG | Abdul-Gafur | Hmmm, well as a passer-through, dare I warn you about the various pitfalls and pratfalls that could befall an statured person such as yourself walking the mean streets such as these.
DIALOG | P_NAME | Whoah, what do you mean?
DIALOG | Abdul-Gafur | Well, it's survival. Survival physically, mentally, cybiotically and most importantly, fiscally._ That's right, I speak of_ The Art of the Deal. Watch out for scams or even worse: flimflams.
DIALOG | P_NAME | What's a flimflam?
DIALOG | Abdul-Gafur | To truly understand a flimflam I think you'll need to be on the receiving end, unfortunately. But regardless, I will let you know if a deal comes around at any point, sir. Until then, fare thee well.
QUEST | abdulState = 2
GOTO | END

ABDUL_EARLY
IF abdulState == 1 | GOTO | EARLY01
IF abdulState == 0 | GOTO | EARLY00 

EARLY01
DIALOG | P_NAME | Hey, Abdul-Gafur. Open yet?
" +
//TODO: check and subtract time
"
DIALOG | Abdul-Gafur | No. Return in @timeTillOpen@.
GOTO | END

EARLY00
DIALOG | Abdul-Gafur | We're not open yet.
DIALOG | P_NAME | What is this place?
DIALOG | Abdul-Gafur | This is the Duergar's Officer's Club and I'm Abdul-Gafur. I run the finest bar in Tir na nOg, and the only one fit for a Duergar in this slum. I'm setting things up for a very important customer right now. Please return when we open at 23:00.
DIALOG | P_NAME | 23:00, got it.
QUEST | abdulState = 1
GOTO | END

END
EXIT |
" +
///Offer of the Cyberspear
/*
    This runs after you achieve Gumshoe Level 2 OR Pay Jindrich's Tab

    variables
        abdulOffer
            0 = haven't offered the spear
            1 = turn on the offer
            2 = have offered the spear for BIG MONEY
            3 = have offered the spear for LIL MONEY
            4 = have offered the spear for HALF MONEY
            5 = purchased the spear fully, waiting for it
            6 = purchased the first half of the spear, waiting for it
            
*/
script = "
IF abdulOffer >= 2 | GOTO | UPONRETURN
IF abdulOffer == 1 GOTO | PROPOSAL

UPONRETURN
DIALOG | Abdul-Gafur | Greetings, @P_NAME@. You have contemplated my offer, I trust.
IF money < @money_abdulHalfOffer@ | GOTO | IMBROKE02
CHOICE | Continue the negotiations?
REPLY | OFFERPARSER | Yeah, let's split hairs.
REPLY | LEAVE | Actually, no.

OFFERPARSER
IF abdulOffer == 4 | GOTO | HALFCHOICE
IF abdulOffer == 3 | GOTO | LILCHOICE
IF abdulOffer == 2 | GOTO | BIGCHOICE

PROPOSAL
DIALOG | Abdul-Gafur | I saw what you did for Jindrich. My, is it nice to see someone new sharing shekels here in Tir na nOg! Nice for me anyway, nice for Jindrich. I'd say nice for all of us, but I'm sure the Duergars won't like it.
DIALOG | P_NAME | Huh I didn't mean to do anything wrong. I thought you're supposed to share what you have!
DIALOG | Abdul-Gafur | Don't get me wrong, everyone loves big spenders. Take a look at Gelasio here. But you also put a target on your back. The Duergars like roughing up dwarfs, and roughing up rich dwarfs even more.
DIALOG | Gelasio | Bwahaha, you're crazy Abdul! And hey, how about some more fruit! Ummm, gimme a shot of the Concord this time!
DIALOG | P_NAME | I don't think I did anything wrong...
DIALOG | Abdul-Gafur | Agreed, sir. And as that is so, you'd be fully justified in defending yourself! Fortunately for you, my employment here gives me a few connections. I may be able to find something useful to that end. Anything you need?
CHOICE | What do you want?
REPLY | GUNS | Gun's.
REPLY | COMPUTERS | Computers.
REPLY | VIDCON | Vidcons.
REPLY | CANDY | Candy.

GUNS
DIALOG | P_NAME | I don't want to have to fight... but I'd wield a gun if I got into some deep you-know-what with the Duergars.
//ROUNDMOUND - add gun's
GOTO | ITEM_CONT

COMPUTERS
DIALOG | P_NAME | I like to solve problems with my mind... but some good tech's gotta help! Do you think you can get me a computer? Or something like a computer?
//ROUNDMOUND - add nothing
GOTO | ITEM_CONT

VIDCONS
DIALOG | P_NAME | When when I play games I can usually get a lot of thinking done. Maybe I just need to think of a plan over some great gameplay...
//ROUNDMOUND - add vidcons
GOTO | ITEM_CONT

CANDY
IF mortimerState >= 1 | DIALOG | P_NAME | I'll definitely need some candy, but I already know Mr. Mortimer. Candy is the only thing that keeps me going when things get really dark.
IF mortimerState == 0 | DIALOG | P_NAME | I'll definitely need some candy. Candy is the only thing that keeps me going when things get really dark.
//ROUNDMOUNT - add candy
GOTO | ITEM_CONT

ITEM_CONT
DIALOG | Abdul-Gafur | Hmmm... a true survivalist in our midst. Outstanding. But let me , I have something that will keep you a little safer. I respect your wealth, @P_NAME_S@. I'm looking out for you! But you never know who's listening around here, so I can't say too much. But this item, while of immense value, will take equal parts money and machination to get to your hands. The item surely desires a wealthy patron as it's owner. It offers you unparalleled utility in return. Do you think you can make an investment, @P_NAME_S@? How does @money_abdulBigOffer@ neuro-shekels sound?
QUEST | abdulOffer = 2
GOTO | BIGCHOICE

" +
//MORE EXPENSIVE CHOICE, BUT YOU GET IT QUICKER (BIG)
//TODO: add proper standard for purchasing... is it in the CHOICE or in the REPLY?
"
BIGCHOICE
IF money < @money_abdulBigOffer@ | GOTO | IMBROKE
BREAKOUT | add | money
CHOICE | Buy the mystery item?
IF abdulItemInfo == 0 | REPLY | TELLME | Tell me what it is first.
REPLY | BUY_BIG | Sure thing, I love spending money!
REPLY | NOBUY_BIG_X | I'd like to, but that's too much.
REPLY | NOBUY_BIG_N | I just can't do it!

BUY_BIG
DIALOG | P_NAME | Sure, I've got @money_abdulBigOffer@ neuro-shekels right here.
DIALOG | Abdul-Gafur | Excellent. Cognate me the neuro-shekels, discreetly please.
WAIT | 0.5
QUEST | money -= @money_abdulBigOffer@
GOTO | ITEM_BUY

NOBUY_BIG
DIALOG | P_NAME | Sorry, I can't spend that much without knowing what I'm getting.
DIALOG | Abdul-Gafur | Hmm, wealthy and shrewd too. Maybe we can figure this out... how about @money_abdulLilOffer@?
QUEST | abdulOffer = 3
GOTO | LILCHOICE

NOBUY_BIG_N
DIALOG | P_NAME | No way, can't do it.
DIALOG | Abdul-Gafur | Listen, you're making a mistake. We are talking about fiscal survival here. This is a deal you should not, nay, cannot wantonly pass by. Come back if you are interested in more information.
DIALOG | P_NAME | Okay... I will, but you're gonna have to sweeten the deal.
DIALOG | Abdul-Gafur | We'll talk, but until then...
WAIT | 0.7
DIALOG | Abdul-Gafur | Stay Frosty.
GOTO | END

" +
//CHEAPER CHOICE (LIL)
"
LILCHOICE
IF money < @money_abdulBigOffer@ | GOTO | IMBROKE02
CHOICE | @money_abdulLilOffer@?
IF abdulItemInfo == 0 | REPLY | TELLME | Tell me what it is first.
REPLY | BUY_LIL | Sure, I can spend @money_abdulLilOffer@.
REPLY | NOBUY_LIL_X | That's still too much.
REPLY | NOBUY_LIL_N | I just can't do it!

BUY_LIL
DIALOG | P_NAME | You've got yourself a deal! @money_abdulLilOffer@ neuro-shekels right here.
DIALOG | Abdul-Gafur | Excellent. Cognate me the neuro-shekels, discreetly please.
WAIT | 0.5
QUEST | money -= @money_abdulLilOffer@
GOTO | ITEM_BUY

NOBUY_LIL_X
DIALOG | P_NAME | It's still too much for a blind purchase. I can't spend that much without knowing what I'm getting.
BREAKOUT | clear
DIALOG | Abdul-Gafur | Hmm, wealthy and shrewd too. Maybe we can figure this out... 
WAIT | 0.5
DIALOG | Abdul-Gafur | Yes, I think I may have a solution. You wish to know the identity of the item, and for that I cannot give it away for free. For you see, knowledge is power and power is money and money is insight and insight is truth. The contract such as the one I propose to you is not merely a transaction, it is a Covenant of Truth. You neuroshekels are the truth I desire and the item's true form is yours.
DIALOG | Abdul-Gafur | Pay me @money_abdulHalfOffer@ now, I will tell you what it is. Then you can pay me the other @money_abdulHalfOffer@ when I get the item.
QUEST | abdulOffer = 4
DIALOG | P_NAME | Wait you don't even have it on you?
DIALOG | Abdul-Gafur | An item such as this is not something kept in a glass case, but rather a Chobham Vault! You pay me the @money_abdulHalfOffer@ and I will order it's fetching. Then you'll have TWO HOURS to come up with the rest of the funds to cover the second half of the purchase. Do we have a deal?
GOTO | HALFCHOICE

NOBUY_LIL_N
DIALOG | P_NAME | Listen, I still can't do it. I can't buy something sight-unseen. I just can't...
BREAKOUT | clear
DIALOG | Abdul-Gafur | Tsk, tsk... an ancient dwarf koan: /'Where is the worth of a shekel found--in the sealed coffers of the miser, or the empty coinpurse of the fool?/'
DIALOG | P_NAME | W... wow...
DIALOG | Abdul-Gafur | Come back when you've changed your mind.

" +
//HALF PAYMENT CHOICE
"
HALFCHOICE
IF money < @money_abdulHalfOffer@ | GOTO | IMBROKE02
CHOICE | @money_abdulHalfOffer@ now and @money_abdulHalfOffer@ later?
IF abdulItemInfo == 0 | REPLY | TELLME | Tell me what it is first.
REPLY | BUY_HALF | I gotta know what it is, here is your fee.
REPLY | NOBUY_HALF_N | I just can't do it!

BUY_HALF
DIALOG | P_NAME | I gotta know, we have a deal.
DIALOG | Abdul-Gafur | Excellent. Cognate me the neuro-shekels, discreetly please.
WAIT | 0.5
QUEST | money -= @money_abdulHalfOffer@
GOTO | ITEM_BUY_HALF

NOBUY_LIL_N
DIALOG | P_NAME | Listen, I still can't do it. I can't buy something sight-unseen. I just can't...
BREAKOUT | clear
DIALOG | Abdul-Gafur | Tsk, tsk... an ancient dwarf koan: /'Where is the worth of a shekel found? In the sealed coffers of the miser, or the empty coinpurse of the fool?/'
DIALOG | P_NAME | W... wow...
DIALOG | Abdul-Gafur | Come back when you've changed your mind.

" +
//RESPONSES IF YOU DON'T HAVE THE MONEY
"
IMBROKE01
IF jindrichApricot >= 1 | DIALOG | P_NAME | I actually don't have that much right now. Almost though! Maybe that apricot I bought was one apricot too many...
IF jindrichApricot == 0 | DIALOG | P_NAME | I actually don't have that much right now.
BREAKOUT | clear
DIALOG | Abdul-Gafur | Money's always short around Tir na Nog... unless you know the right people. But I've got a deal for you. @money_abdulLilOffer@ now, and @money_abdulLilOffer@ later... how's that sound?
GOTO | LILCHOICE

IMBROKE02
DIALOG | P_NAME | I can't even afford that...
BREAKOUT | clear
DIALOG | Abdul-Gafur | I see, well the offer will stand for a while longer. That is, until the Duergars begin their patronage. See you, @P_NAME@.
GOTO | END

" +
//PURCHASING THE ITEM (either LIL or BIG)
"
ITEM_BUY_FULL
NOTIFY | Paid Abdul-Gafur for the Mystery Item!
BREAKOUT | clear
DIALOG | P_NAME | This had better be good...
DIALOG | Abdul-Gafur | Trust me, don't worry. It'll take a bit of time to get here, so just check back with me later. I'm preparing to serve the Duergars later, so you probably should not be around then.
DIALOG | P_NAME = s_port_hoopzSurprise | What the girdz?! You don't even have it on you?
QUEST | abdulOffer = 5
DIALOG | Bad news is that it is a little too /'hot/' here to just hand it to you. Fear not, most magnanimous consumer, the item is in a safe place and well worth your while. Please, come back in TWO HOURS and I'll have it for you.
GOTO | ITEM_GIP_END

" + 
//PURCHASING THE ITEM BY HALF, LEARNING IT'S IDENTITY
"
ITEM_BUY_HALF
DIALOG | Abdul-Gafur | Thank you, for your business @P_NAME_S@. You're healthy investment only solididies your reputation as a dwarf of considerable means.
BREAKOUT | clear
DIALOG | P_NAME | I'm not really a dwarf though. Anyways, what is the item?
DIALOG | Abdul-Gafur | Ah yes, the item is ._._._
WAIT | 0.5
DIALOG | Abdul-Gafur | A weapon.
DIALOG | P_NAME | A weapon? What kind of weapon?
DIALOG | Abdul-Gafur | Well, some say it is a weapon...
DIALOG | P_NAME | Oh you're killing me, Abdul-Gafur! What is it?
DIALOG | Abdul-Gafur | Some say weapon, some say key. I can definitively say it is a spear, or at the very least, part of a spear.
DIALOG | P_NAME = s_port_hoopzAngry | A spear? Why would I need a spear, I'm a gun'sbraster!
DIALOG | Abdul-Gafur | No this spear is different, some say it holds, A_R_C_A_N_E_ B_-B_A_L_L_ E_N_E_R_G_I_E_S.
DIALOG | P_NAME | B-B-B-B-ball? Is that so?
DIALOG | Abdul-Gafur | Indeed, although alternatively I have heard it is just an oversized novelty USB-6.0 Flash Drive. Either way, the sheer value of your purchase will continue to reap dividends, especially with the devaluation of the neuroshekel against the Cuchubuck. You've made the right choice. I hope to see you soon with the other half of your payment.
DIALOG | P_NAME | WHAT? For @money_abdulLilOffer@ neuroshekels I'll get a FLASH DRIVE?
DIALOG | Abdul-Gafur | I'm sure it's the former, I'm sure it's a spear, a real spear, almost completely sure. Just make sure you come by with the other half in TWO HOURS. Soon I'll open up for the Duergars, and you really should not be around then.
QUEST | abdulOffer = 6
GOTO | ITEM_GIP_END

" +
//THIS ENDS BOTH PURCHASES
"
ITEM_GIP_END
DIALOG | P_NAME = s_port_hoopzAngry | Hmmm. I can't help but feel a little gipped here.
DIALOG | Abdul-Gafur | I assure you, @P_NAME_S@, there is no gip. No gipping of the sort, you will get your item on the agreed upon time or my name isn't Abdul-Gafur..._ (hyphenated).
" +
//TODO:ADD IN TIME + 2 hours here
"
DIALOG | P_NAME | Alright... I'll be back. Two hours. That's @time@.
GOTO | END
" +
// Too much time passed
//TODO: Check time for <= 3 hours since purchase
//if (scr_time_get() >= 2 + scr_quest_get_state("abdulGafurTime")) { // || (scr_time_get() == 5) {
///Returning to get the Spear
/*
    variables
        abdulOffer
            0 = haven't offered the spear
            1 = turn on the offer
            2 = have offered the spear for BIG MONEY
            3 = have offered the spear for LIL MONEY
            4 = have offered the spear for HALF MONEY
            5 = purchased the spear fully, waiting for it
            6 = purchased the first half of the spear, waiting for it
            7 = arrived too late and now need to go buy it from Zola
            8 = 
            9 = purchased the spear, upset at it's less than valuable state, repeating
*/
"
IF abdulOffer == 9 | GOTO | ABDUL_END
IF abdulOffer == 8 | GOTO | ZOLA_SOLD
IF abdulOffer == 7 | GOTO | FIND_ZOLA

" +
//REPLACE this is the time comparison
"
CHOICE | What are you?
REPLY | EARLY | Early.
REPLY | ONTIME | On time.
REPLY | LATE | Late.

EARLY
QUEST | spearDeliveryStatus = 1
GOTO | OFFER_BRANCH

ONTIME
QUEST | spearDeliveryStatus = 2
GOTO | OFFER_BRANCH

LATE
QUEST | spearDeliveryStatus = 3
GOTO | OFFER_BRANCH

OFFER_BRANCH
IF abdulOffer = 6 | GOTO | HALF_TIMECHECK
IF abdulOgger = 5 | GOTO | FULL_TIMECHECK

FULL_TIMECHECK
IF spearDeliveryStatus = 3 | GOTO | FULL_TOOLATE
IF spearDeliveryStatus = 2 | GOTO | FULL_ONTIME
IF spearDeliveryStatus = 1 | GOTO | TOOEARLY

HALF_TIMECHECK
IF spearDeliveryStatus = 3 | GOTO | HALF_TOOLATE
IF spearDeliveryStatus = 2 | GOTO | HALF_ONTIME
IF spearDeliveryStatus = 1 | GOTO | TOOEARLY

TOOEARLY
DIALOG | P_NAME | Hey, I'm back!
DIALOG | Abdul-Gafur | Sorry kid, not ready yet.
DIALOG | P_NAME | Really? Dang...
DIALOG | Abdul-Gafur | No, but have faith. Give me a little more time.
DIALOG | P_NAME | Okay so @time@ left, right?
DIALOG | Abdul-Gafur | Yes, that will be perfect. So long.
GOTO | END

HALF_TOOLATE
DIALOG | P_NAME | Hey, so where's that thing?
DIALOG | Abdul-Gafur | What thing?
DIALOG | P_NAME | What thing? The spear! The cool thing you sold me! I paid for half of it, now I'm here. Is it ready?
GOTO | TOOLATE_ZOLA

FULL_TOOLATE
DIALOG | P_NAME | Hey, so where's that thing?
DIALOG | Abdul-Gafur | What thing?
DIALOG | P_NAME | What thing? I don't know, YOU'RE the one who's supposed to know... the cool thing. I paid for it and you said come back in TWO HOURS, now I'm here. Is it ready?
TOOLATE_ZOLA

TOOLATE_ZOLA
DIALOG | Abdul-Gafur | Ah, well, about that... you know how things are. I didn't know if you were coming, and it seemed wiser to do business with someone else...
PLAYSET | o_cts_hoopz | surpriseSW | surpriseSWHold
DIALOG | P_NAME = s_port_hoopzSurprise | So you sold it? Are you kidding me?
DIALOG | Abdul-Gafur | Well, only slightly. I was offered @money_zolaSpear@ for it, and that's more than I was going to get from you anyway, so I let it fall into the possession of a dwarf named Zola. Don't look at me like that! A lot of dwarfs disappear in Tir na Nog, how could I know you were coming back? I told you to be persistent, didn't I? No hard feelings, kid. Right?
DIALOG | P_NAME = s_port_hoopzSurprise | This is... this... come on!
DIALOG | Abdul-Gafur | Sorry, kid. I said two hours and you're @time@ too late. I just assumed you were floating face down in the Sewers. Death by Fishlian null and voids any fiscal contract. You can go see Zola if you're really dying for it. She's normally selling papers around here somewhere...
QUEST | abdulOffer = 7
DIALOG | P_NAME = s_port_hoopzAngry | I was right, this was a gip!
WAIT   | 0.25
LOOK   | o_cts_hoopz | WEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.25
PLAYSET| o_cts_hoopz | sad0 | sad1
WAIT   | 0.5
DIALOG | P_NAME = s_port_hoopzSad | (I guess I should have been here on time... smooth move @P_NAME_S@!)
GOTO | END

FULL_ONTIME
DIALOG | P_NAME | Hey, I'm back. Where's that thing?
DIALOG | Ah yes, here you are, @P_NAME@. Your purchase has arrived.
GOTO | ITEM_GET

HALF_ONTIME
DIALOG | P_NAME | Hey, I'm back. Where's that thing?
BREAKOUT | add | money
DIALOG | Abdul-Gafur | Got the rest of the money? @money_abdulBigOffer@?
IF money < @money_abdulHalfOffer@ | GOTO | LITTLEMONEY
CHOICE | Pay the man?
REPLY | PAY_HALF | Yes, here's the money.
REPLY | DONT_PAY_HALF | Hmmm, let me think if I really want to spend the rest.

LITTLEMONEY
DIALOG | P_NAME | Uh... on me? Hold on a sec.
BREAKOUT | clear
DIALOG | Abdul-Gafur | This is a very in-demand item, @P_NAME_S@. 
DIALOG | P_NAME | Dagnabbit! Abdul-Gafur, I'm sorry. I'll be right back with the money.
DIALOG | Abdul-Gafur | Make it soon, @P_NAME@. You have @time@ left. I can't guarantee this item will wait around for you, regardless of your interest or investment.
DIALOG | Alright, alright.
GOTO | END

PAY_HALF
DIALOG | P_NAME | Of course I've got it.
QUEST | money -= @money_abdulHalf
DIALOG | Abdul-Gafur | Great, great. But keep it to yourself for the time being. I am not sure when a commodity of this import will grace the Tir na nOg market again, I would prefer that you keep your connections, i.e. ME, confidential.
BREAKOUT | clear
GOTO | ITEM_GET

ITEM_GET
" +
//TODO: Hoopz reaches out and grabs the spear
"
DIALOG | P_NAME = s_port_hoopzSad | This... this is it?
NOTIFY | Got the Object of Dubious Consequence
ITEM | Object of Dubious Consequence | 1
DIALOG | Abdul-Gafur | It is indeed.
DIALOG | P_NAME | I don't even know what to say... this... isn't anything at all...
WAIT | 0.5 
DIALOG | P_NAME = s_port_hoopzAngry | It's broken hunk of metal!
WAIT | 0.5
DIALOG | All sales final.
" +
//TODO: THE GATE ROLLS DOWN BLOCKING you from talking to Abdul-Gafur again.
"
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzSad | (Scammed again, @P_NAME_S@. Gotta get some street smarts.)
GOTO | END

FIND_ZOLA
DIALOG | Abdul-Gafur | Remember, kid... go see Zola. She sells papers all around the city.
GOTO | END

ZOLA_SOLD
DIALOG | Abdul-Gafur | Go see Zola.
DIALOG | P_NAME = s_port_hoopzSurpise | I did! She sold it too!
DIALOG | Abdul-Gafur | That... is unfortunate. But understand: in Tir na Nog, the lives of dwarfs are short, dangerous, and unpredictable. Death ruins contracts, most of the time. But money always works! Money always gets you what you want!
DIALOG | P_NAME | It's not right!
DIALOG | Abdul-Gafur | Maybe not. But it's a lesson.
DIALOG | P_NAME | It's not right!
DIALOG | Abdul-Gafur | An expensive lesson, but a lesson all the same.
GOTO | END

ABDUL_END
DIALOG | Abdul-Gafur | Good to see you, @P_NAME@. Remember, lay low and spend well...
DIALOG | P_NAME = s_port_hoopzAngry | Hmmpf...
GOTO | END

END
EXIT |
"
