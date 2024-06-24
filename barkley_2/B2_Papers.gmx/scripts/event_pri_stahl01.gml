///Stahl in the Hoosegow
/*
VARIABLES
stahlPrison
    0 = haven't talked to Stahl in the Prison
    1 = have talked, but haven't guessed her identity
    2 = talked and guessed once incorrectly
    3 = talked and guessed twice incorrectly
    4 = talked and guessed thrice (you've failed)
    5 = you've guess Stahl correctly

TODO: there isn't any real TIME ANCHORS in this choice right now... we'll need to modify once we know how time progression in the prison works.
*/
script = "
IF toggleStahlStall == 1 | GOTO | LOOPINGSTALL
IF stahlPrison == 5 | GOTO | REPEATINSTRUCTIONS
IF stahlPrison == 4 | GOTO | FAILURE
IF stahlPrison == 3 | GOTO | THIRDTRY
IF stahlPrison == 2 | GOTO | SECONDTRY
IF stahlPrison == 1 | GOTO | FOLLOWUP
IF stahlPrison == 0 | GOTO | FIRSTMEET

THIRDTRY
DIALOG | ? ? ? = s_port_stahlJail | Back again?
DIALOG | P_NAME | Alright, this time I've got you pegged. Get ready to have your mask ripped off!
DIALOG | ? ? ? = s_port_stahlJail | ... alright then... hazard a guess?
CHOICE | Hazard a guess?
REPLY | LEMMEGUESS | I'm gonna doxxx the roof off this joint!
REPLY | AINTGOTTIME02 | This is the last I'll deal with this Goof Troop bullpuck.

SECONDTRY
DIALOG | ? ? ? = s_port_stahlJail | How goes it, P_NAME_S?
DIALOG | P_NAME | Think I could try to `sq`guess your identity again?`rt`
DIALOG | ? ? ? = s_port_stahlJail | Alright, but you're gonna have to make this one count. Ready?
CHOICE | Play the game?
REPLY | LEMMEGUESS | Time to cut to the chase and tell me who you are.
REPLY | AINTGOTTIME02 | Actually, I ain't got time for this Goof Troop bullpuck.

LOOPINGSTALL
DIALOG | ? ? ? = s_port_stahlJail | Come back `sq`after you get some rest and come up with a better guess.`rt`
EXIT |

FIRSTMEET
DIALOG | ? ? ? = s_port_stahlJail | Looks like you've gotten yourself into a tight spot, P_NAME_S. Not unlike the last time we spoke.
DIALOG | P_NAME | Oh hey, um...
DIALOG | P_NAME = s_port_hoopzSurprise | Wait! How do you know my name?
DIALOG | ? ? ? = s_port_stahlJail | What do you mean? You don't remember me? We've certainly met.
DIALOG | P_NAME | Uh, we have? I think I'd remember meeting you.
DIALOG | ? ? ? = s_port_stahlJail | What's that supposed to mean?_ I'm hurt, P_NAME_S, I really am. Here I was spillin' my guts to you just a few hours earlier, and now you don't have the decency to remember me? Hmmpf_ you think you know someone...
QUEST | stahlPrison = 1
CHOICE | Reply to the mystery madame?
REPLY | WHOAREYOU | Play time has transpired, proclaim thine identity!
REPLY | AINTGOTTIME01 | I ain't got time for this Goof Troop bullpuck.

AINTGOTTIME01
DIALOG | P_NAME | Look, whoever you are, I've got hard time to serve and can't be playin' games. See you in_ `w1`the yard.`w0`
DIALOG | ? ? ? = s_port_stahlJail | Heh, sure thing kid... I thought you'd want to know how to get out of here early on_ `sq`bad behavior.`rt`_ Doesn't look like it though. See you around.
WAIT | 0.5
" +
//TODO: Hoopz looks down
"
DIALOG | P_NAME = s_port_hoopzSurprise | (I wonder what_ `sq`bad behavior`rt` means...)
EXIT |

AINTGOTTIME02
DIALOG | P_NAME | Nary ye mind. Gotta run, weirdo.
DIALOG | ? ? ? = s_port_stahlJail | Suit yourself.
EXIT |

FOLLOWUP 
DIALOG | ? ? ? = s_port_stahlJail | Well, well the pwnable son returns. What is it?
DIALOG | P_NAME | Alright, I've been thinking about what you said about `sq`getting out of here early.`rt`
DIALOG | ? ? ? = s_port_stahlJail | Wanna play my game? Put those `sq`smokes`rt` up and we'll see if you can guess who I am.
CHOICE | Play the game?
REPLY | WHOAREYOU | Time to cut to the chase and tell me who you are.
REPLY | AINTGOTTIME02 | I STILL ain't got time for this Goof Troop bullpuck.

WHOAREYOU
DIALOG | P_NAME = s_port_hoopzAngry | Alright, cut the bunk, who are you? And how do you know me?
DIALOG | ? ? ? = s_port_stahlJail | Not so fast, P_NAME_S. Information is shekels and shekels are `s1`power`s0`. There is no such thing as a free lunch in this parsec of the galaxy._ If you want me to_ `sq`refresh your memory,`rt` you'll need to pay up. 
" +
//TODO: add in money popup
"
DIALOG | P_NAME = s_port_hoopzAngry | Oh yeah? How much?
DIALOG | ? ? ? = s_port_stahlJail | No no... shekels may be power, but I'm more interested in the former: `w1`INFORMATION.`w0` Tell you what, `sq`let's play a game. `sq`If you can figure out who I am, I'll tell you how to get out of here T_O_D_A_Y.`rt`
" +
//TODO: super awkward line here about getting out and getting "smokes" I'm not sure how to resolve this just yet
"
DIALOG | P_NAME = s_port_hoopzSurprise | (My smokes! How did she know?)
DIALOG | ? ? ? = s_port_stahlJail | Whattya say, P_NAME_S?
" +
//TODO: have Hoopz face down and think to himself
"
DIALOG | P_NAME | (Hmmm... think, P_NAME_S._ Who have a met that I couldn't see their face? Someone... `w1``sq`with a mask?`rt``w0`)
" +
//TODO: Hoopz faces back up.
"
GOTO | LEMMEGUESS

LEMMEGUESS
REPLY | P_NAME | Alright... let me_ hazard a guess.
GOTO | IDENTITYCHOICE

IDENTITYCHOICE
CHOICE | Guess who she is?
" +
//TODO: add additional "faceless" characters we find throughout the game
"
IF stahlDuergar == 0 | REPLY | YOUREADUERGAR | You can't fool me, Duergar!
IF stahlBolthios == 0 | REPLY | YOUREBOLTHIOS | You're the bandaged prisoner who gave me these smokes! Bolthios!
IF knowStahl >= 2 | REPLY | YOURESTAHL | You're Stahl, from the plantation!
IF stahlRedfield == 0 | IF knowRedfield >= 2 | REPLY | YOUREREDFIELD | You're Redfield, the gun'ssalesman!
IF knowBagler >= 2 | REPLY | YOUREBAGLER | You're Bagler, from the Gamer's Tabernacle!
IF stahlDarchimedes == 0 | IF knowDarchimedes != 0 | IF knowDarchimedes != 4 | REPLY | YOUREDARCHIMEDES | You're D'archimedes from the Gaming Klatch!

YOUREDARCHIMEDES
DIALOG | P_NAME s_port_hoopzSmirk | I don't know how you can jump around so quickly but it's painfully obvious that you are D'archimedes! Now cast of that mask!
DIALOG | Stahl = s_port_stahlJail | Good Klisp in heaven and all that is holy in the Sombrero Galaxy._ Of course I'm not D'archimedes. `s1`He's inside the prison isn't he?!`s1`
DIALOG | P_NAME = s_port_hoopzSad | Well,_ I,_ ugh... thought maybe you could move pretty fast and be in two pla-
DIALOG | Stahl = s_port_stahlJail | Let me stop you right there before you hurt yourself. Go lay down and think this over for a second. I am having reservations about playing this game with you, P_NAME_S, your dimness concerns me.
DIALOG | P_NAME = s_port_hoopzSad | Aww,_ shucks.
DIALOG | ? ? ? = s_port_stahlJail | Give me some time to recover from that devastating show of mental aptitude.`sq`Come back in an hour when you have something less insulting.`rt`
DIALOG | P_NAME = s_port_hoopzSad | Daggit... if you say so.
QUEST | stahlPrison += 1
QUEST | stahlDarchimedes = 1
QUEST | toggleStahlStall = 1
IF stahlPrison == 4 | GOTO | FAILURE
EXIT |

YOUREADUERGAR
DIALOG | P_NAME = s_port_hoopzAngry | I don't know what your angle is, but I can smell a Duergar from a mile away. You're not gettin' my smokes, blueskin!
DIALOG | ? ? ? = s_port_stahlJail | What?_ `w2`Ha ha ha!`w0` You think I'm a Duergar?! What is wrong with you?_ `sq`I'm no Duergar.`rt`
DIALOG | P_NAME = s_port_hoopzSad | Dag-fraggit... I thought I had you dead-to-rights.
DIALOG | ? ? ? = s_port_stahlJail | More like dead-to-wrong, plus Duergars are blue last time I checked-_ and all the other times I checked before that.
DIALOG | P_NAME = s_port_hoopzSad | Yeah,_ I guess that's true.
DIALOG | ? ? ? = s_port_stahlJail | Look, I've got other things to get done here, P_NAME_S. Things like not getting insulted by half-cocked guesses from young brasters. Maybe `sq`come back in an hour and see if you can give it another shot.`rt`
DIALOG | P_NAME | Oh,_ okay. I guess I'll be back soon.
DIALOG | ? ? ? = s_port_stahlJail | See you then._._._ a Duergar-_ HA!
QUEST | stahlPrison += 1
QUEST | stahlDuergar = 1
QUEST | toggleStahlStall = 1
IF stahlPrison == 4 | GOTO | FAILURE
EXIT |

YOUREBOLTHIOS
DIALOG | P_NAME = s_port_hoopzSmirk | I can see through your guise. You are Bolthios! This is some kind of scam. What's your angle?
DIALOG | ? ? ? = s_port_stahlJail | A clever deduction, however painstakingly ignorant it might be.
WAIT | 0.5
DIALOG | P_NAME = s_port_hoopzSurprise | Wait,_ so you aren't Bolthios?
DIALOG | ? ? ? = s_port_stahlJail | Of course I'm not. You haven't been paying attention at all.
DIALOG | P_NAME | Uh, well... that wasn't my final answer.
DIALOG | ? ? ? = s_port_stahlJail | It was for now. `sq`Come back in an hour and maybe we'll see if you can get your head out of your ass and make an educated guess.`rt`
DIALOG | P_NAME = s_port_hoopzSad| Durn it...
QUEST | stahlPrison += 1
QUEST | stahlBolthios = 1
QUEST | toggleStahlStall = 1
IF stahlPrison == 4 | GOTO | FAILURE
EXIT |

YOUREREDFIELD
DIALOG | P_NAME = s_port_hoopzSmirk | The jig is up, Redfield. I know that you've been following me for a while to push your hardware, I just didn't know you'd go so far as to get incarcerated to get to your_ `w1`best customer.`w0`
DIALOG | ? ? ? = s_port_stahlJail | Redfield, eh? Do you honestly think I'm that brast-peddlin' buffoon.
DIALOG | P_NAME = s_port_hoopzSurprise | Wait so,_ that's not you? You aren't the Gun'ssalesman?
DIALOG | ? ? ? = s_port_stahlJail | Not only am I not him `sq`but I told you to go talk to him before!_`rt` I tell ya, you've gotta work on your deduction skills. Redfield is only in it for the coin, and do I need to explain again that I'm all about the_ `w1`INFORMATION?`w0`
DIALOG | P_NAME = s_port_hoopzSad | Aww shoot, totally thought something else...
WAIT | 0.5
DIALOG | P_NAME | You gotta gimme another shot! 
DIALOG | ? ? ? = s_port_stahlJail | Another shot? With how off you were and the last one, I'm not so sure that's wise..._ Tell you what `sq`come back in an hour and I'll give you another shot`rt`
DIALOG | P_NAME = s_port_hoopzSad | I guess I have no choice...
DIALOG | ? ? ? = s_port_stahlJail | That's right, you don't. Now go brush up on your facts and maybe you won't embarass yourself come the morning.
QUEST | stahlPrison += 1
QUEST | stahlRedfield = 1
QUEST | toggleStahlStall = 1
IF stahlPrison == 4 | GOTO | FAILURE
EXIT |

YOUREBAGLER
DIALOG | P_NAME | Come clean, Bagler! I know it's you!
DIALOG | ? ? ? = s_port_stahlJail | Who the hell is Bagler?
WAIT | 0.25
EMOTE | ? | o_cts_hoopz | 0 | 0
DIALOG | P_NAME | Uh..._ you're not Bagler?
DIALOG | ? ? ? = s_port_stahlJail | Of course I'm not. Who calls themselves /'Bagler?/'
DIALOG | P_NAME | Well, there is this dwarf I met in the Gamer's Tab-
DIALOG | ? ? ? = s_port_stahlJail | That camp of nincompoopery is an insult to the word `w1`INTELLIGENCE.`w0` How in Necron 7 did you think that I could be one of those dummies?
DIALOG | P_NAME | Well, I just was connecting the dots.
DIALOG | ? ? ? = s_port_stahlJail | Which dots were those? You should probably get checked for a concussion.
DIALOG | P_NAME = s_port_hoopzSad | Yeah,_ I'm sorry.
DIALOG | ? ? ? = s_port_stahlJail | `sq`Come back in an hour and maybe you'll get another shot.`rt`
DIALOG | P_NAME | An hour? What will I do until then?
DIALOG | ? ? ? = s_port_stahlJail | I dunno... everydwarf here has gotten pretty good at passing the time. Why don't you give them a chat?
DIALOG | P_NAME = s_port_hoopzSad | Hhmpf... fine.
QUEST | stahlPrison += 1
QUEST | stahlBagler = 1
QUEST | toggleStahlStall = 1
IF stahlPrison == 4 | GOTO | FAILURE
EXIT | 

YOURESTAHL
DIALOG | P_NAME | I got it. You're Stahl from the plantation!
WAIT |
DIALOG | ? ? ? = s_port_stahlJail | Well, well, well. Looks like you have a brain on you after all, kid.
DIALOG | P_NAME = s_port_hoopzHappy | Yeah?! I knew you were Stahl! 
DIALOG | Stahl = s_port_stahlJailFace | It's not that difficult, I mean the clues were all there. Who else on Necron 7 speaks at my vocabulary level?
DIALOG | P_NAME | Uh,_ you all kind of sound the same to me to be honest.
DIALOG | Stahl = s_port_stahlJail | That's because we're all from the same Maker.
DIALOG | P_NAME = s_port_hoopzSurprise | Uh,_ what? 
DIALOG | Stahl = s_port_stahlJail | `sq`Our Lord and Savior Clispaeth,`rt` He gave His life so we could have ours.
DIALOG | P_NAME | I didn't take you to be religious.
DIALOG | Stahl = s_port_stahlJail | We all have to find our way somehow._ Now `sq`give me those Smokes and take this `s2`Military Grade M80`s0` and drop it down the terlet.
DIALOG | P_NAME = | The terlet?
DIALOG | Stahl = s_port_stahlJail | Yeah, the terlet. `sq`Drop this thing in there and you'll have you'll have your way out of this place.`rt`
" +
//TODO: USEAT | o_stahl01
//TODO: NOTIFY | Swapped The Smokes with the Military Grade M80
//TODO: ITEM | Military Grade M80 | 1
//TODO: ITEM | Pack of Smokes | -1
"
DIALOG | P_NAME = s_port_hoopzHappy | Gee whiz, a real M80... I've only read about these things in_ /'The Anarchist's Cookbook./'
DIALOG | Stahl = s_port_stahlJail | Well now you have one in the palm of your hand.
DIALOG | P_NAME | But I'm still confused about what to do.
DIALOG | Stahl = s_port_stahlJail | Alright, look. See that room over there?
" +
//TODO: FRAME | the door to the control room | CAMERA_NORMAL
//TODO: LOOKAT | o_cts_hoopz | the same door
//TODO: WAIT | 0.25
//TODO: FRAME | o_cts_hoopz | o_stahl01 | CAMERA_NORMAL
//TODO: LOOKAT | o_cts_hoopz | o_stahl01
"
DIALOG | P_NAME | Yeah, what about it? Isn't that where the Warden went in before?
DIALOG | Stahl = s_port_stahlJail | Yep. Inside is `sq`the control room`rt` for the whole prison. If you can get in there, you'll be able to open not only the cell doors, but the gate to the prison as well.
DIALOG | P_NAME = s_port_hoopzHappy | And then I can get out of here..._ `w1`WE`w0` can get out of here!
DIALOG | Stahl = s_port_stahlJail | Exactly.
DIALOG | P_NAME | But how does the toilet factor in?
DIALOG | ? ? ? = s_port_stahlJail | You'll see... `sq`just drop that charge into the prison terlet and the path will be obvious to you.`rt`
DIALOG | P_NAME | Gee, thanks Stahl._ Uh, why are you helping me so much?
DIALOG | ? ? ? = s_port_stahlJail | Let's just say `sq`I represent some_ `w1`vested interests.`w0` You've got a lot of fans out there in the galaxy, P_NAME_S._ `w1`GOOD_ LUCK,_ you'll need it.`w0`
QUEST | stahlPrison = 5
EXIT |

REPEATINSTRUCTIONS
DIALOG | Stahl = s_port_stahlJail | What's the hold up, P_NAME_S? `sq`Get to the prison terlet and drop in the M80.`rt` It's the only way to get out of here.
DIALOG | P_NAME = s_port_hoopzHappy | You got it, Stahl.
EXIT |

FAILURE
DIALOG | ? ? ? = s_port_stahlJail | Looks like `sq`our time is up.`rt` You're gonna need to find another way out of this prison.
DIALOG | P_NAME = s_port_hoopzSurprise | Wait, I have a `s2`real emergency!`s0` If I don't get out of here soon, it'll be_ `s1`really,`s2` Really,`s3`REALLY BAD!`s0`
DIALOG | ? ? ? = s_port_stahlJail | Not my problem anymore, so long.
"
//TODO: Stahl disappears in some way?
/*
DIALOG | Stahl = s_port_stahlJail | 
DIALOG | P_NAME | 
DIALOG | Stahl = s_port_stahlJail | 
DIALOG | P_NAME | 
DIALOG | Stahl = s_port_stahlJail | 
DIALOG | P_NAME | 
