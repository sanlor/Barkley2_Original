/// Uschi, the b-ball girl.
/*
VARIABLES
    uschiState
        0 - never talked to Uschi
        1 - talked to her
    uschiBall
        0 - haven't talked about balling
        1 - turned her down to ball, you can come back and challenge later
        2 - agreed to find a 3rd Baller
        3 - you now have a baller and need to challenge the Duergars
        4 - you have a duergar challenge accepted - you can play the game now
        5 - you lost the game against the Duergars and can try again if you leverage something
    
    bballComplete
        1 - a switch to send you right to the snippet where Uschi reacts to the results of the game
    knowDwarfLeague
        0 - Never heard of the Dwarf Leagues
        1 - Heard of the Dwarf Leagues
        2 - Heard of "The Commish"
    oozeBall
        1 - Ooze offers to ball for a price
        2 - Ooze agrees to ball for a price
        3 - The game is over and Ooze no longer wants to ball
        4 - Ooze has played and is opened up for more games
        5 - Ooze needs more money to play again    
*/
script = "
IF uschiBall == 6 | GOTO | USCHIBALL06
IF uschiBall == 4 | GOTO | USCHIBALL04
IF uschiBall == 3 | GOTO | USCHIBALL02
IF uschiBall == 2 | GOTO | USCHIBALL02
IF uschiState == 1 | GOTO | USCHI01
IF uschiState == 0 | GOTO | USCHI00

OFFERHELP
CHOICE | Help Uschi find other ballers?
REPLY | LOOKFORBALLER | I can look for someone.
REPLY | NOLOOKFORBALLER | I've got better things to do, sucka.

KATSUBALLER
DIALOG | P_NAME | How about Katsu!
DIALOG | Uschi | Oh no, oh no. That square can't ball to save his life.
DIALOG | P_NAME | Oh he seemed really eager to lace up and jam.
DIALOG | Uschi | No just - anyone but Katsu - no.
DIALOG | P_NAME | Oh... okay then.
DIALOG | Uschi | There has gotta be a real baller out there... raised and trained on the mean streets of Tir na nOg...
DIALOG | P_NAME | I'll do my best.
QUEST | uschiBall = 2
QUEST | katsuBall = 2
EXIT |

NOLOOKFORBALLER
DIALOG | P_NAME | Sorry Uschi, I would have balled if the ballers were ready, but I have a destiny to discover.
DIALOG | Uschi | I thought that maybe your destiny was on the court, guess I was wrong.
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry... (I can't be everything to everyone.)
QUEST | uschiBall = 6
//ROUNDMOUND: lose out on bball points
EXIT |

3RDMANREPORT
IF katsuBall != 3 | IF katsuBall != 2 | IF oozeBall != 1 | GOTO | STILLLOOKING
CHOICE | Find a baller for Uschi's game?
IF katsuBall == 1 | REPLY | KATSUBALLER | I know I guy! Katsu!
IF katsuBall == 3 | REPLY | KATSUDEMAND | You should reconsider Katsu!
IF oozeBall == 1 | REPLY | OOZESUGGEST | Ooze said he'd play!
REPLY | STILLLOOKING | Still looking!

STILLLOOKING
DIALOG | P_NAME | I'm still looking for a baller.
DIALOG | Uschi | I wouldn't dally. Let's hope the governor doesn't change his mind about those hoop locks.
EXIT |

KATSUDEMAND
DIALOG | P_NAME | You know, you should maybe give Katsu a shot, he's-
DIALOG | Uschi | A dreck baller? A distraction on the court? Yeah that's what he is.
DIALOG | P_NAME | Oh c'mon how bad can he be?
DIALOG | Uschi | Real bad, he'll embarrass whichever team he's on AND the team he's playing against.
DIALOG | P_NAME = s_port_hoopzSad | He seemed so eager...
//TODO: Turn off pedestrians from circulating to prepare for Katsu's Speech
//TODO: scr_event_build_pedestrianCirculation(false)
DIALOG | Uschi | I don't think I have the stomach to watch him ball again. Dare I say, I don't have the H_E_A_R_T_.
GOTO | KATSUSPEECH

OOZESUGGEST
DIALOG | P_NAME = s_port_hoopzHappy | I know the perfect baller, Ooze!
DIALOG | Uschi | You mean that badass with the lazer sword?! How did you swing that?
DIALOG | P_NAME | I guess we uh, just saw eye to eye.
DIALOG | Uschi | Well that's great! So now we just need some oppenents!
QUEST | oozeBall = 4
GOTO | FINDOPPONENTS

YESTOBALL
DIALOG | P_NAME | Well, I'm kind of an amnesiac searching for the Cyberdwarf on a quest to find out my identity... but I guess I've got time to help you look.
DIALOG | Uschi | Haha, I knew you were down. Well we have a few players, but for pure three on three street ball we'll need one more. I know Emilio would love to play but he put on too many pounds cooped up waiting for the hoop locks to come off that he can't fit through the door frame.
IF emilioState == 0 | GOTO | EMILIODONTKNOW
IF emilioState >= 1 | GOTO | EMILIOKNOW

EMILIODONTKNOW
DIALOG | P_NAME | Too big for the game? Sounds like someone didn't PLAY 60.
DIALOG | Uschi | Yeah we kept telling him to PLAY 60 or even 45, but he wouldn't even PLAY 15.
DIALOG | P_NAME | I wish we could get the word out to more kids that even in the off season, PLAY 60 is an important part of your daily activities.
DIALOG | Uschi | You said it P_NAME_S, gotta PLAY 60.
GOTO | EMILIOCONNECT

EMILIOKNOW
DIALOG | P_NAME | Ah that's too bad, the big guy seems to love bball. What happened? Did he not PLAY 60?
DIALOG | Uschi | That's exactly what he didn't do. Too many SPORTS Vidcons like /'Ballermanx/' and /'Save Yourself from the Ballermanx HD/' that he didn't even think about PLAYING 60.
DIALOG | P_NAME = s_port_hoopzSad | That's so sad.
DIALOG | Uschi | Same old song. Another baller loses out for lack of PLAYING 60.
//TODO: move to room and show pouting Emilio dialogue
//TODO: scr_event_build_camera_move_to_point(424, 104, CAMERA_NORMAL)
WAIT | 
DIALOG | Emilio | If I could go back... I'd PLAY 90.
WAIT | 
FRAME | CAMERA_NORMAL | o_cts_hoopz | o_uschi01
WAIT | 
GOTO | EMILIOCONNECT

EMILIOCONNECT
DIALOG | Uschi | So anyways, we need to find a third baller. Any ideas?
GOTO | 3RDMANASK

TOOBUSY
DIALOG | P_NAME | Even though every bone in my body is telling me to ball... I've gotta turn you down. This is no time to game.
DIALOG | Uschi | Aww, bummer. I was kinda hoping you'd be down. Just so you know, there's always a spot for you if you ever feel like playing!
QUEST | uschiBall = 1
EXIT |

USCHIBALL06
DIALOG | Uschi | How about you scram and get jammed?
DIALOG | P_NAME = s_port_hoopzSad | ._._._
EXIT |

USCHIBALL04
DIALOG | Uschi | Remember P_NAME_S, go talk to /'The Commish/' but until then, play this thing close to the vest.

// Uschi's 3rd Baller Sequence
USCHIBALL02
DIALOG | Uschi | Find that third baller?
GOTO | 3RDMANREPORT

//turned down Uschi's offer to ball (NOTE: this is to START the baller quest, not to activate a game)
USCHIBALL01
DIALOG | Uschi | I knew you'd be back! You down to ball or are you still too chicken to throw it down with /'The Baller Queen of Tir na nOg/'?
GOTO | PLAYCHOICE

GOV00
IF uschiGov == 1 | GOTO | GOV01
DIALOG | Uschi | Hi, Mr. Governor, sir. Good luck with your speech and everything... I know it's a lot to ask, but if you don't mind, maybe you could organize a friendly Duergars versus Dwarfs charity competition. Just a suggestion...
DIALOG | Governor Elagabalus | Ho ho, young lady, if you are a good little girl maybe all your wishes will come true. Ho! Ho! Ho...
DIALOG | P_NAME | (Gadzooks what am I talking about?!)
DIALOG | Uschi | Uh, thank you for thinking about us ballers Mr. Governor, sir.
QUEST | uschiGov = 1
QUEST | govBball = 1
EXIT |

GOV01
DIALOG | Governor Elagabalus | Ho h-... carry on.
EXIT |

USCHI01
DIALOG | Uschi | Without enough players there is nothing we can do. Which is a bummer because it could be a real center of the community. And who knows, maybe the game's next rising star will come out of Tir na nOg. Now that's a thought.
GOTO | OFFERHELP

CURFEW
DIALOG | Uschi | Sigh... have you seen the b-ball court outside? It's a dump. Not only that but the Duergars put Hoop Locks up so any attempt at a Slam just ends up getting Jammed. I hate to say it, but it... it might just be a baller's worst nightmare.
DIALOG | P_NAME | That's really too bad.
DIALOG | Uschi | Sure is... hey, after this curfew is over, think you want to get a game going?

USCHI00
DIALOG | Uschi | Sigh... look at this court. It's a barren as the sands of Al Akihabara. Not to mention we don't have enough players so any attempt at a slam just ends up getting jammed. I hate to say it, but it... it might just be a baller's worst nightmare.
DIALOG | P_NAME | That's a crying shame. These hoops are useless without enough b-ballers.
DIALOG | Uschi | Yeah... hey, are you a baller?
QUEST | uschiState = 1
CHOICE | ... am I a baller?
REPLY | BALLTOLIVE | I ball to live.
REPLY | DABBLE | I've been known to dabble.
REPLY | SOCCER | I love soccer!
REPLY | BUPKIS | I know bupkis about balling.

BALLTOLIVE
//TODO: roundmound points (most)
DIALOG | P_NAME | Am I a baller? Heck yeah I am! I ball to live!
DIALOG | Uschi | Oh dang, me too! They call me the /'Tir na nOg Baller Queen/' so you better believe I'm all about ballin'! Word is they are starting up a new Dwarf League in Brain City... I'd love to put a team together but sadly... there is very little interest besides Emilio in the tenement building to the North.
DIALOG | P_NAME | Why is it so hard to find b-ballers? It's the best sport!
DIALOG | Uschi | Sign of the times._ I guess this brave new reality of Wrist-CONPs and MMOs keep prospective ballers off the courts and glued to their screens. Now I know Oligarchy Online is all the rage, but you'd think somedwarf would want to get out and Play 60 now and then.
DIALOG | P_NAME | (The /'Tir na nOg Baller Queen/'... Maybe there is some way I could help her out.)
KNOW | knowDwarfLeague | 2
KNOW | knowOligarchyOnline | 1
GOTO | OFFERHELP

DABBLE
//TODO: roundmound points (less)
DIALOG | P_NAME | Am I a baller? Yeah, I've been known to dabble.
DIALOG | Uschi | That's great. I for one am pretty passionate about /'The Sport of the Godz/', but not many people are. It's been really hard to solidify the community and get a game together, heck I've even thought about inviting the Duergars to play!
DIALOG | P_NAME | I'd love to play sometime.
DIALOG | Uschi | Yeah, same. We're still short four players, even with us two ready to ball.
GOTO | OFFERHELP

SOCCER
DIALOG | P_NAME | Am I a baller? Sure! I love soccer!
//TODO: roundmound lose bball points
DIALOG | Uschi | Oh... that's cool, I guess... I was talking more about b-ball, though._ Even if you're not really a b-ball lover, it'll still probably be fun to play. I mean, I've got a lot of pent up energy from sitting around Tir na nOg waiting for this dang prize, it would be good to just get the energy out, you know?
DIALOG | P_NAME | Yeah, I'd be down.
DIALOG | Uschi | Cool. Another player on the court now! We just need four more!
GOTO | OFFERHELP

BUPKIS
DIALOG | P_NAME | Balling? I know bupkis about balling. Absolute bupkis.
DIALOG | Uschi | Bupkis? Are you spoofing me? You've got that baller glimmer in your eye...
DIALOG | P_NAME | I uh... I don't think I'm a baller...
DIALOG | Uschi | Oh well I guess I'll just talk to you later. Mind stepping off my court while I pine over the /'Ballin' Days of Yore/'?
//TODO: roundmound - lose bball points
EXIT |
"
