// event_tnn_egidius01(
/* 
Variables
	egidiusState
		0 - never talked
		1 - talked, had your "misunderstanding"
		2 - talked and reconciled and can now shop
egidiusRental

egidiusCollateral
*/
script = "
IF body == governor | IF egidiusGovernor == 1 | GOTO | GOV01
IF body == governor | GOTO | GOV00
IF egidiusState == 2 | GOTO | EGIDIUS02
IF egidiusState == 1 | GOTO | EGIDIUS01
IF egidiusState == 0 | GOTO | EGIDIUS00

EGIDIUS02
DIALOG | Egidius | Why if it isn't my tallest customer, how may I help you?
GOTO | SHOPMENU

SHOPMENU
CHOICE | What to do?
REPLY | SHOP | Peruse your wares.
IF egidiusRental == 1 | REPLY | RENTALCOLLATERAL | Can I rent a jerkin?
IF egidiusRental == 2 | REPLY | RENTALRETURN | I'm returning my rented jerkin.
IF egidiusJerkinInfo == 0 | REPLY | JERKININFO_LONG | How do jerkins work?
IF egidiusJerkinInfo == 1 | REPLY | JERKININFO_SHORT | Can I about the jerkins again.
REPLY | LEAVE | That's it, thank you.

JERKININFO_LONG
DIALOG | P_NAME | I'd love to hear more about how jerkins work. Well besides the obvious /'its a short close-fitting jacket, made usually of light-coloured leather, and often without sleeves, worn over the doublet./'
DIALOG | Egidius | Ah yes... an educated consumer is my best customer. Allow me to explain...
DIALOG | Bhroom | Skipping this for now but I need to add in Jerkin Info!
" + 
//TODO: add in Jerkin Info
"
QUEST | egidiusJerkinInfo = 1
DIALOG | Egidius | Anything else?
GOTO | SHOPMENU

JERKININFO_SHORT
DIALOG | P_NAME | Can you give me that jerkin rundown again?
DIALOG | Egidius | But of course...
DIALOG | Bhroom | Skipping this for now but I need to add in Jerkin Info!
" + 
//TODO: add in Jerkin SHORT Info
"
DIALOG | Egidius | Anything else?
GOTO | SHOPMENU

SHOP
" +
//TODO: run the shop menu
"
QUEST | egidiusShopped = 1
DIALOG | Egidius | Anything else?
GOTO | SHOPMENU

PRICEY
DIALOG | P_NAME | Hmmm, all these jerkins are a little pricey... I don't know if I can afford these.
DIALOG | Egidius | Oh, then no matter! Financial security is hard to come by in Tir na Nog. I've worked out a try-before-you-buy program before with some previous clients. Put simply, with a small deposit and up front collateral, I can let you try on a new jerkin, wear it around, see how it fits. Let me know if that would work better for you.
QUEST | egidiusRental = 1 //initiate rental+shop
CHOICE | Interested in rentals?
REPLY | RENTALCOLLATERAL | How do rentals work exactly?
REPLY | LEAVERENT | I'll be on my way.

LEAVERENT
DIALOG | P_NAME | Renting sounds really interesting, but I'll have to check it out later.
DIALOG | Of course, fare thee well, youngster.
EXIT |

LEAVE
DIALOG | P_NAME | That's all for now, thanks!
DIALOG | Egidius | Fare thee well, youngster.
EXIT | 

RENTALCOLLATERAL
" +
//TODO: add the rental collateral system!
"
DIALOG | Bhroom | This is the rental collateral system for GZ to implement!
GOTO | SHOPMENU

RENTALRETURN
" +
//TODO: add the rental return system!
"
DIALOG | Bhroom | This is the rental return system for GZ to implement!
GOTO | SHOPMENU

GOV01
DIALOG | Egidius | Yes... yes...! Thank you, sir!

GOV00
DIALOG | Egidius | Greetings, Sir Governor! You're looking splendid in that uniform... I see it when I look at you... the vision of power! I hope it's satisfying you in every possible way. I hope your fitting was thorough enough. Does it require any alterations? Anything for you, sir! We in Tir na Nog, myself especially, are so grateful we may bask in Cuchulainn's glory for yet another day.
QUEST | egidiusGovernor = 1
IF milagrosChip == 1 | GOTO | GOVCHIP
DIALOG | Governor Elagabalus | Yes of course, as your duly appointed Governor I declare this Jerkinry Among the City's Best.
GOTO | GOV01

GOVCHIP
DIALOG | Egidius | Why, sir Governor! Another day in paradise. Thank you! Thank you, sir! Thank you for your leadership and mercy! Please, take this offering. See? Contraband cyberware... I... I found it in a pocket, I was just about to report it.
ITEM | Cu-tel Basilard HD 488x90 with QRI-3 | 1
NOTIFY | Got the Cu-tel Basilard HD 488x90 with QRI-3!
DIALOG | Governor Elagabalus | A computer chip? Much appreciated, um... good citizen!
DIALOG | Egidius | Yes... yes...! Thank you! Thank you, sir! Thank you for your mercy!
EXIT |

EGIDIUS01
DIALOG | Egidius | Ahem... hello there youngster. What brings you back to my humble jerkinry?
DIALOG | P_NAME | I guess I blew up on you back there... you know... the whole jerkin thing... but I guess I'll see what you've got.
DIALOG | Egidius | Excellent! ... and my apologies, once again. I would hope you would find my jerkins pleasing to you. Unfortunately I have very little in your size, but while I look through my inventory, tell me... what are you looking for in a jerkin?
QUEST | egidiusState = 2
GOTO | JERKINDESIRES

EGIDIUS00
DIALOG | Egidius | Welcome, welcome! My, you may be one of the taller dwarfs I've seen. No matter, I'm sure I have something... perhaps in the duergar sizes... ah, forgive me! I have not introduced myself. I am Egidius - proprietor of the Tir na Nog Jerkinry. How may I assist you? Let's see what you're wearing...
" +
//TODO: egidius should stop animating when you talk to him and just look at you
"
WAIT | 1.0
" +
//TODO: is there a way to check what you are wearing?
"
IF wearing == @Cornhusk Jerkin@ | GOTO | CORNHUSKREACT
IF wearing == @Booty Jerkin@ | GOTO | BOOTYREACT

CORNHUSKREACT
DIALOG | Egidius | *Gasp* A... a Cornhusk Jerkin? How hideously out of fashion! Dwarfs haven't worn cornhusk for four millennia, at least! We're looking for timeless for you, not ancient! It's the 667th century after all! Surely we can get you out of that and into some more modern garb!
GOTO | LIKEHOWYOULOOK

BOOTYREACT
DIALOG | Egidius | *Gasp* A... a Booty Jerkin? Really? Well... such a compressed look may be popular with these /'booty youths/' nowadays, but I'm sure you'd look far more dapper in a traditional cut. Far less... ahem... G_L_U_T_E_A_L_. Surely we can get you out of that and into some more modest garb!
GOTO | LIKEHOWYOULOOK

LIKEHOWYOULOOK
CHOICE | Do you like the way you look?
REPLY | OLDJERKIN | I like the way I look!
REPLY | NEWJERKIN | Maybe I could use a new jerkin...

OLDJERKIN
IF wearing == @Cornhusk Jerkin@ | DIALOG | P_NAME | Well, Mr. Egidius... I happen to like the way I look! Maybe you're not with it, but Cornhusk is back! But maybe you've seen enough of it the first time around, you old coot! Fashion-shame someone else, I'm proud!
IF wearing == @Booty Jerkin@ | DIALOG | P_NAME | Well, Mr. Egidius... I happen to like the way I look! Booty's big... booty's back... and booty will keep rocking long after you're history, old-timer! Get with the program or stay lost!
DIALOG | Egidius | My, my... I suppose fashion is a young dwarf's game after all. What's the saying... /'Wovon Zwerg nicht tragen kann.../' I'll withdraw my foot from my mouth now, and offer a mere practical suggestion... if you're ever desirous of a more protective jerkin, or one with a more utilitarian pocket array, just return here.
DIALOG | P_NAME | Got it, old man. See you around.
QUEST | egidiusState = 1
EXIT |

NEWJERKIN
IF wearing == @Cornhusk Jerkin@ | DIALOG | P_NAME | You know... maybe I could use something a little more in vogue. What do you got?
IF wearing == @Booty Jerkin@ | DIALOG | P_NAME | You know... maybe I could use something a little more conservative. What do you got?
DIALOG | Egidius | Hm, splendid! Well, I'm afraid I may not have much in your size, but while I look through my inventory, tell me... what is it you are looking for in a jerkin?
QUEST | egidiusState = 2
GOTO | JERKINDESIRES

JERKINDESIRES
CHOICE | Looking for...
REPLY | PROTECT | Protection.
REPLY | MOBILITY | Mobility.
REPLY | POCKETS | Pockets.
REPLY | STYLE | Style.

PROTECT
DIALOG | P_NAME | I'm looking for protection. I'll need it if I'm gonna make it to the Cyberdwarf in one piece. Wherever he is...
" +
//TODO: ROUNDMOUNT
//QUEST | rmCyberdwarf += 1
"
GOTO | VERYGOOD

MOBILITY
DIALOG | P_NAME | I'm looking for something lightweight. I gotta stay mobile when I'm brasting out there.
DIALOG | Egidius | Hmm? A gun'sbraster, are you? You want to be the most powerful one in Tir na Nog?
CHOICE | You a Gun'sbraster?
REPLY | WHOOP | Yeah! I'll be the one to whoop them all.
REPLY | GUMPTION | I brast just enough to get by.
REPLY | BBALL | No way... it's for my b-ball game!

WHOOP
DIALOG | P_NAME | Yep, that's right... you said it! I'll be strong! I'll be the one to whoop all comers!
" +
//TODO: ROUNDMOUND
//QUEST | rmPower += 1
//QUEST | alignPowerHigh += 1
"
GOTO | VERYGOOD

GUMPTION
DIALOG | P_NAME | Nope, power is overrated. I just wanna get by on my gumption, and get the heck outta here.
" +
//TODO: ROUNDMOUND
//QUEST | rmPower += 1
//QUEST | alignPowerLow += 1
"
GOTO | VERYGOOD

BBALL
DIALOG | P_NAME | No way! I'm not trying to brast! I mean, maybe if I gotta... I'm just trying to stay lightweight on the blacktop, man! I can't afford to slow down when I'm clutching the orb!
" +
//TODO: ROUNDMOUND
//QUEST | rmBball += 1
//QUEST | alignBballLaw += 1
//QUEST | alignBballChaos += 1
"
GOTO | VERYGOOD

POCKETS
DIALOG | P_NAME | I'm looking for a jerkin with pockets! I need room for my stash!
DIALOG | Egidius | Hmm, pockets is it? For candy, I presume?
CHOICE | Collecting candy?
REPLY | CANDY_ALL | Yep... I want all the candy.
REPLY | CANDY_RARE | Yep... only the best candy.
REPLY | CANDY_ZAUBER | Nope... something more mysterious.

CANDY_ALL
DIALOG | P_NAME | Yep... I want my jerkin and my belly to be stuffed to the brim with sweets!
" +
//TODO: ROUNDMOUND
//QUEST | rmCandy += 1
//QUEST | alignCandyVariety += 1
"
GOTO | VERYGOOD

CANDY_RARE
DIALOG | P_NAME | Yep... but not just any candy. Gourmands like me only want the best!
" +
//TODO: ROUNDMOUND
//QUEST | rmCandy += 1
//QUEST | alignCandyRare += 1
"
GOTO | VERYGOOD

CANDY_ZAUBER
DIALOG | P_NAME | Nope... I want 'em for um... something more mysterious...
" +
//TODO: ROUNDMOUND
//QUEST | rmZauber += 1
//QUEST | alignZauberMystery += 1
"
GOTO | VERYGOOD

STYLE
DIALOG | P_NAME | I'm looking for something stylish.
DIALOG | Egidius | Hmm? Is there a dwarf in particular you want to impress?
CHOICE | Who do you want to impress?
REPLY | IMPRESS | All of 'em. I'm new here, I need to look good!
REPLY | NOTIMPRESS | No way! I don't need to impress any dwarfs!

IMPRESS
DIALOG | P_NAME | All of 'em. I'm still pretty new... I bet if I'm more fashionable I'll make some more friends.
" +
//TODO: ROUNDMOUND QUEST | alignDwarfsLiberate += 1
"
GOTO | VERYGOOD

NOTIMPRESS
DIALOG | P_NAME | No way! I don't need to impress any dwarfs! It's MY self-image I wear my clothes for, okay?
" +
//TODO: ROUNDMOUND QUEST | alignDwarfsTrouble += 1
"
GOTO | VERYGOOD

VERYGOOD
DIALOG | Egidius | Very good, sir. A dwarf with a mission sees the world like a jerkin,_ with the sleeves off. Now please, how can help you?
GOTO | SHOPMENU
"
