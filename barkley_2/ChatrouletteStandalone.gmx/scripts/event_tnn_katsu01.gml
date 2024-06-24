// Katsu the less than impressive 3rd teammate for Basketball Tactics
/*
VARIABLES
katsuState
    0 - never talked to him
    1 - talked to him once
    2 - talked to him twice
    3 - heard about his skills

katsuBall
    1 - katsu talks about his willingness to ball
    2 - uschi tell hoopz that the court is no place for katsu's squareness
    3 - Hoopz tells katsu about the game and he begs to play
    4 - Hoopz reports to Uschi, she shuts him down, but then Katsu delivers his Hope Speech
    5 - delivered the speech to Uschi, katsu is part of the team!
    6 - told katsu and he expresses just how happy he is, shows his miserable court skills
    7 - given Katsu "Playerade" or "Prayerade" for Holy Skills on the court
    8 - Hoopz chooses another player (Ooze) over Katsu
    9 - Katsu's default END State if you don't choose him to help with bball (whether he knows about it or not)

katsuLockMission
    1 - you dissuade Katsu from removing the hoop locks
    2 - katsu takes the hoop locks off "during" curfew   
*/
script = "
IF body = governor | GOTO | GOV01
IF curfew == during | GOTO | CURFEW
IF katsuBall == 9 | GOTO | KATSUBALL09
IF oozeBall == 4 | GOTO | OOZEBALL
IF katsuBall == 4 | GOTO | KATSUBALL04
IF katsuBall == 3 | GOTO | KATSUREMIND
IF katsuState == 3 | GOTO | KATSU03
IF katsuState == 2 | GOTO | KATSU02
IF katsuState == 1 | GOTO | KATSU01
IF katsuState == 0 | GOTO | KATSU00

BBALLSEGMENT
DIALOG | P_NAME = s_port_hoopzHappy | We have a game starting up soon! I'll let them know I found a 6th baller.
DIALOG | Katsu | Oh you mean with other people? Like... competitively?
DIALOG | P_NAME | Yeah they just took the locks of the court, Uschi and her team are gonna play!
DIALOG | Katsu | Uschi? ... Oh yeah great! I love competitive sports! The glory of victory_._._._ the humiliating social anguish of total defeat...
WAIT | 2
DIALOG | P_NAME | Uh... so do you want to play?
DIALOG | Katsu | Of course I do! Katsu!
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
DIALOG | P_NAME = s_port_hoopzHappy | Okay great! Let me go tell Uschi!
SET | o_katsu01 | katsuStanding
QUEST | katsuBall = 3
GOTO | END

RECOMMEND
SET | o_katsu01 | katsuStanding
CHOICE | Recommend something for Katsu to do?
IF katsuCyberdwarf == 0 | REPLY | FINDCYBERDWARF | You could help me find the Cyberdwarf.
IF katsuState <= 2 | REPLY | KATSUSKILLS | Tell me your skills.
IF ericQuest == 2 | IF katsuJobSearch == 0 | REPLY | KATSUERIC | Any jobs available?
IF govBball == 1 | IF katsuLockMission == 0 | IF  curfew  == after | REPLY | KATSUHOOPLOCKS | Know anything about Hoop Lock removal?
IF katsuBall == 2 | REPLY | KATSUDENIED | About the game, you can't play.
REPLY | KATSUNOTHING | I've got nothing, Katsu.

FINDCYBERDWARF
DIALOG | P_NAME | You could help me find the Cyberdwarf.
DIALOG | Katsu | Great! Cool! Where is he?
DIALOG | P_NAME | That's what I don't know...
DIALOG | Katsu | Oh! I don't know either!
DIALOG | P_NAME | Yeah...
WAIT | 3
DIALOG | Katsu | Okay so anything we can get done now?
//Turn off this question
QUEST | katsuCyberdwarf = 1
GOTO | RECOMMEND

//If Katsu hasn't told you his skills yet
KATSUSKILLS
DIALOG | P_NAME | Uh, I dunno, what are you good at?
DIALOG | Katsu | What am I good at? What am I GOOD at?! Well everything! I'm Katsu, of course! Lead guitar, shred guitar, vocals, vocaloid, tambourine, wood blocks, B_A_S_K_E_T_B_A_L_L_, Uilleann Pipes, Eunuch Flute, you name it, I'm your man! Katsu!
WAIT | 0.5
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
//Turn off this question
QUEST | katsuState = 3
QUEST | katsuBall = 1
IF | uschiBall == 2 | GOTO | BBALLCONNECT
DIALOG | P_NAME | Wow, that's impressive. Maybe I can use some of your skills in the future...
GOTO | RECOMMEND

//Send to Bball Snippet if you've talked to Uschi
BBALLCONNECT
DIALOG | P_NAME = s_port_hoopzHappy | Bball?  You mean you can ball?
DIALOG | Katsu | Yeah I can ball! I'll ball with you to the ends of Necron 7!
DIALOG | P_NAME | Okay, um great!
GOTO | BBALLSEGMENT

//If you haven't talked to Uschi
DIALOG | P_NAME | Okay that's a pretty good list. I'll see if I can come up with anything.
GOTO | RECOMMEND

//If Uschi has turned down Katsu and he's told you about ballin'
KATSUDENIED
DIALOG | P_NAME | Katsu, we need to talk.
DIALOG | Katsu | Yeah let's talk! Katsu!
DIALOG | P_NAME = s_port_hoopzSad | It's about the game, they might be looking for another baller instead of you.
DIALOG | Katsu | I don't understand...
WAIT | 0.5
LOOK | o_cts_hoopz | WEST
WAIT |
LOOK | o_cts_hoopz | SOUTHWEST
WAIT |
LOOK | o_cts_hoopz | SOUTH
WAIT |
PLAYSET | o_cts_hoopz | sad0 | sad1
WAIT |
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry man, some ballers just aren't ready to T_R_U_S_T_.
DIALOG | Katsu | Did you mention how good I was at the Uilleann Pipes?
DIALOG | P_NAME = s_port_hoopzSad | Katsu, I just don't think I am gonna be able to convince them.
DIALOG | Katsu | We gotta try, I gotta do something! I'll follow you to the ends of Necron 7, this can't be the end!
DIALOG | P_NAME = s_port_hoopzSad | Katsu... I'll try, but...
QUEST | katsuBall = 3
GOTO | END

//If you are looking for a Job for Eric
KATSUERIC
DIALOG | P_NAME | You wouldn't know where any jobs are would you?
DIALOG | Katsu | Jobs?
DIALOG | P_NAME | Yeah I'm looking for a job for a guy I know.
DIALOG | Katsu | I thought that's what I was doing... looking for a job for me...
DIALOG | P_NAME | Oh.
DIALOG | Katsu | Why would I be asking you for a job when I already had a job?
DIALOG | P_NAME | Uh, yeah that doesn't make much sense.
DIALOG | Katsu | No it doesn't.
WAIT | 2
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
QUEST | katsuJobSearch = 1
GOTO | RECOMMEND

//You can ask Katsu to try to get the Hoop Locks off (He'll get arrested and sent to the prison)
KATSUHOOPLOCKS
DIALOG | P_NAME | Oh I got something. There are those Hoop Locks on the bball hoops. We can't play a game!
DIALOG | Katsu | Ohhhh I know what you are getting at...
DIALOG | P_NAME | Well not really... why? What am I getting at?
DIALOG | Katsu | Sneak up to the hoops under the cover of curfew with a industrial cutter and LIBERATE THOSE HOOPS!
DIALOG | P_NAME = s_port_hoopzAngry | That wasn't what I was getting at.
DIALOG | Katsu | I can do it! I'm ready! Katsu!
DIALOG | P_NAME | I dunno those Duergars seem like they'd really rough up a dwarf who messes with their city-wide ordnances.
DIALOG | Katsu | Just you wait and see, I'll be a HERO!
CHOICE | Let Katsu go through with the mission?
REPLY | ENCOURAGE | Go be a HERO Katsu!
REPLY | DISSUADE | It's too dangerous, friend!

ENCOURAGE
DIALOG | P_NAME | You're right Katsu! You can do it! Good luck, just be careful!
DIALOG | Katsu | I don't need care when I have determination!
DIALOG | P_NAME | That's uh... the spirit
QUEST | katsuLockMission = 2
ClockTime | katsuLockMission | 3 | 45
GOTO | KATSUMISSIONFLOURISH

DISSUADE
DIALOG | P_NAME | Be prudent Katsu! Vandalism is only going to get you locked up.
DIALOG | Katsu | I don't need prudence when I have determination!
DIALOG | P_NAME | Well maybe there is a more ... democratic way of getting those locks off.
DIALOG | Katsu | I like that glint in your eye! I'll follow you to the ends of Necron 7! How can I help?
DIALOG | P_NAME | ... I'm not sure, but I'll let you know when I come up with something.
QUEST | katsuLockMission = 1
GOTO | KATSUMISSIONFLOURISH

KATSUMISSIONFLOURISH
//Katsu flourish regardless of taking the mission or not
DIALOG | Katsu | Okay!
WAIT | 2
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
GOTO | END

KATSUNOTHING
DIALOG | P_NAME | Truth be told, I can't think of anything else to do.
DIALOG | Katsu | Oh man, I really wanted to do something!
DIALOG | P_NAME | Yeah seems like it... I'll be back. Until then, stay frosty.
GOTO | END

KATSUREMIND
//Reminder to check with Uschi about ballin'
DIALOG | Katsu | Let me know about that bball game. I'm all in! Katsu!

//if you're controlling the Governor.
GOV01
IF katsuGov == 1 GOTO | GOV02
DIALOG | Katsu | Yowza! Who are you?
DIALOG | Governor Elagabalus | I'm surely the governor!
DIALOG | Katsu | I'll follow you to the ends of Necron 7, Governor!
DIALOG | Governor Elagabalus | Indeed!
QUEST | katsuGov = 1
GOTO | END

GOV02
DIALOG | Governor Elagabalus | Carry on.

//Flavor repeat for Katsu after you've gone with another baller (regardless if he knows)
KATSUBALL09
DIALOG | Katsu | Maybe not this time, but the next, or the time after that, but we're eventually gonna do someting, I just know it! Katsu!
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
WAIT | 0.5
SET | o_katsu01 | katsuStanding
GOTO | END

// Tell Katsu that you went with another baller (presumably Ooze) ... I went with oozeBall variable because there is a possibility that you never mention the game to Katsu, so he won't be dissapointed
OOZEBALL
IF katsuBall >= 1 | GOTO | KATSUINRUNNING
IF katsuBall == 0 | GOTO | KATSUOUTOFRUNNING

//Katsu's reaction if he knew about the bball game (common occurence)
KATSUINRUNNING
DIALOG | P_NAME | Hey Katsu...
DIALOG | Katsu | If it isn't the baller man himself! When is the game happening? Let's do it!
DIALOG | P_NAME | Uh, about that...
DIALOG | Katsu | Kat._._._su?    
DIALOG | P_NAME = s_port_hoopzSad | Yeah I think I'm gonna go with another baller for my team. I'm sorry but things just happened that way.
DIALOG | Katsu | But, what about hope?    
DIALOG | P_NAME | I guess hope is gonna have to hold out for the next one.
DIALOG | Katsu | ... you know ... my hope is just audacious enough to hold out for the next one!
WAIT | 1
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01         
QUEST | katsuBall = 9
GOTO | END

//If Katsu has never heard of the bball game
KATSUOUTOFRUNNING
DIALOG | Katsu | Hey! What's going down?
DIALOG | P_NAME | I umm, I still don't know Katsu.
DIALOG | Katsu | Okay, well when you have something to do, make sure you tell me!
DIALOG | P_NAME | I will for sure.
QUEST | katsuBall = 9
GOTO | END

//If curfew is active
//Less flavor during curfew (spoken to him a bunch)
CURFEW
IF katsuState >= 2 | GOTO | CURFEWNOFLAVOR
IF katsuState < 2 | GOTO | CURFEWFLAVOR
DIALOG | Katsu | After this curfew, I'm ready to follow you to the ends of Necron 7! Katsu! What are we gonna do?
GOTO | RECOMMEND

CURFEWFLAVOR
DIALOG | Katsu | This curfew really busts my chops. We need to get out and DO SOMETHING! Yeah! Katsu!
DIALOG | P_NAME | I know what you mean, but I'm not sure what can be done.
DIALOG | Katsu | Neither do I... I can't think, in fact I WON'T think. I'm a doer not a thinker!
WAIT | 1
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
WAIT | 1.0
SET | o_katsu01 | katsuStanding
GOTO | RECOMMEND

//Third, repeating time talking to Katsu
KATSUBALL04
DIALOG | Katsu | You gotta give it one more shot! We can do it! Talk to Uschi. Mention the Uillean Pipes again!
GOTO | END

KATSU03
DIALOG | Katsu | Met anyone that could use my special skills?
CHOICE | Anyone?
IF katsuBall < 2 | REPLY | SKILLSAGAIN | Tell me your skills again.
IF katsuBall == 2 | REPLY | KATSUDENIED | About the game, you can't play.
REPLY | SOMETHINGELSE | Maybe something else...

SKILLSAGAIN
DIALOG | P_NAME | What were those skills again?
DIALOG | Katsu | Lead guitar, shred guitar, vocals, vocaloid, tambourine, wood blocks, B_A_S_K_E_T_B_A_L_L_, Uilleann Pipes, Eunuch Flute.
WAIT | 0.5
DIALOG | Katsu | Katsu!
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
WAIT | 0.5
SET | o_katsu01 | katsuStanding
WAIT |
DIALOG | P_NAME | Oh yeah, right, thanks! Still working on it.
GOTO | END

SOMETHINGELSE
DIALOG | P_NAME | Actually, I'm thinking about something else.
GOTO | RECOMMEND

//Third, repeating time talking to Katsu
KATSU02
DIALOG | Katsu | Well what are we waiting for? Let's do something! Katsu!
GOTO | RECOMMEND

// Second time talking to Katsu
KATSU01
DIALOG | Katsu | I'm in! What are we doing?
DIALOG | P_NAME = s_port_hoopzSurprise | Uh nothing yet I don't think.
DIALOG | Katsu | Well what are we waiting for? Let's do something!
QUEST | katsuState = 2
GOTO | RECOMMEND

// First time talking to Katsu
KATSU00
DIALOG | Katsu | Katsu!
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND | sn_katsuFlourish01
WAIT | 1
DIALOG | P_NAME = s_port_hoopzSurprise | Uh, hello.
SET | o_katsu01 | katsuStanding
DIALOG | Katsu | Katsu's game for it all! Let's do this thing!
DIALOG | P_NAME | Uh what thing?
DIALOG | Katsu | Whatever it is you gotta do! I'll follow you to the ends of Necron 7!
DIALOG | P_NAME | Well that's great but I'm not sure what we could do. Let me think...
QUEST | katsuState = 1
GOTO | RECOMMEND

END
EXIT |
"
