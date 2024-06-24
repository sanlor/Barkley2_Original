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
"
