///Gutterhound Robbery Initiation!
/*

*/

script = "
IF gutterhoundQuest >= 4 | GOTO | GUTTERHOUSE

GUTTERHOUSE
DIALOG | Gutterhound | Hey partner, you find that safe house for us?
CHOICE | Find anything?
IF gutterhoundQuest != 5 | REPLY | ROBANYWAY | Fruck the safe house, let's start robbin'.
IF gutterhoundQuest == 5 | REPLY | HERMITYES | I found a place, let's do this!
REPLY | STILLLOOKING | I'm still looking.

HERMITYES
DIALOG | P_NAME = s_port_hoopzHappy | Yeah I got a place! It's a cozy little flat in the middle of the sewers. The guy who lives there says you can stay as long as you'd like!
DIALOG | Gutterhound | Whoah whoah, kid. You getting other people involved in this? I thought this was a two-man operation!
DIALOG | P_NAME = s_port_hoopzSurprise | But! I was jus-
DIALOG | Gutterhound | Ah! Nary ye mind, @P_NAME_S@. Just as long as you pay him from your cut, we're all square. Now, let's party!
QUEST | gutterhoundQuest = 5
GOTO | ROBCHOICE

ROBANYWAY
DIALOG | P_NAME | To heck with the safe house! Let's start the action N_O_W_!
DIALOG | Gutterhound | That's what I like to hear. Once the heat comes down you won't have time for candy shoppin' so you better be ready. You give the word.
QUEST | gutterhoundQuest = 6
GOTO | ROBCHOICE

ROBCHOICE
CHOICE | Rob the damn bank?
REPLY | GUTTERROB | I can't wait to rob!
REPLY | GUTTERWAIT | Robbin' can wait, gotta gear up.

GUTTERWAIT
DIALOG | P_NAME | Actually, I'll be right back. Gotta prep.
DIALOG | Gutterhound | Suit yourselfm kid, but remember, I'm going in at @temp@ anyways whether you are here or not.
" +
//TODO: say the actual time here
"
DIALOG | P_NAME | You got it, Mr. Hound!
GOTO | END

STILLLOOKING
DIALOG | P_NAME | Yeah sorry, still looking for an option...
DIALOG | Gutterhound | Options slow you down, kid. I only have one option ... and that's to rob this muthafuckin' bank. See you in _____
" +
//TODO: add in the Time Check above for time left until the Gutterhound Robbery
"
GOTO | END

GUTTERROB
" + 
//TODO: add Gutterhound drink and stand up animations
//scr_event_build_animation_play_and_set(gutterhound, "drink", "stand")
"
" +
//TODO: start the Gutterhound Robbery Minigame!
"
DIALOG | Bhroom | This is where the Robbery Minigame Begins!

END
EXIT |
"
