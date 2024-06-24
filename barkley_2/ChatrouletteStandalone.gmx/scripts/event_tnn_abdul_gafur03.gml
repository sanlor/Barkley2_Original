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
script = "
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
