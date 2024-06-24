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

/////////////////////////////////////////////////////////////////////////////////////
" +
// Too much time passed
//TODO: Check time for <= 3 hours since purchase
//if (scr_time_get() >= 2 + scr_quest_get_state("abdulGafurTime")) { // || (scr_time_get() == 5) {
"
"
