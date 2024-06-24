///Katsu, the less than impressive 3rd teammate for BBTTX
/*
VARIABLES
katsuState
    0 - never talked to him
    1 - talked to him once
    2 - talked to him twice (flavor)
    3 - heard about his skills

knowKatsuBall
	0 - don't know he thinks he can ball
	1 - know he thinks he can ball
	2 - know that Uschi thinks he sucks
	3 - seen that he sucks

katsuBall
    1 - Katsu agrees to play, need to go tell Uschi about it
    2 - Uschi tells Hoopz that Katsu can go fuck himself
    3 - Hoopz tells Katsu he can't play but Katsu asks Hoopz to convince Uschi otherwise
    4 - Hoopz reports to Uschi, she shuts him down, but then Katsu delivers his Hope Speech
    5 - Repeating dialog before the game
    6 - Katsu's default END State if you don't choose him to help with bball (whether he knows about it or not)
    
oozeBall
    2 - Got Ooze to agree to play
    4 - Ooze is in the team officially, need to find Duergs now

bballMention (this is a band-aid variable for fuckerproofing, difference between telling Katsu you'll recommend him to Uschi or just doing it)
	0 - haven't mentioned the game to katsuBall
	1 - HAVE mentioned the game to katsu
*/
script = "
IF body = governor  | GOTO | GOV01
IF curfew == during | GOTO | CURFEW
IF katsuBall == 6   | GOTO | KATSUBALL06
IF oozeBall == 4    | GOTO | OOZEBALL
IF katsuBall == 5   | GOTO | KATSUBALL05
IF katsuBall == 4   | GOTO | KATSUBALL04
IF katsuBall == 3   | GOTO | KATSUREMIND
IF katsuState == 3  | GOTO | KATSU03
IF katsuState == 2  | GOTO | KATSU02
IF katsuState == 1  | GOTO | KATSU01
IF katsuState == 0  | GOTO | KATSU00

BBALLSEGMENT
DIALOG  | P_NAME = s_port_hoopzHappy | We have a game starting up soon! I'll let them know I found a 3rd baller.
DIALOG  | Katsu  | Oh you mean with other people? Like... competitively?
DIALOG  | P_NAME | Yeah! Uschi and I are starting a team!
DIALOG  | Katsu  | Uschi? ... Oh yeah great! I love competitive sports! The glory of victory_._._._ the humiliating social anguish of total defeat...
WAIT    | 2
DIALOG  | P_NAME | Uh... so do you want to play?
DIALOG  | Katsu  | Of course I do! `w1`Katsu!`w0`
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND   | sn_katsuFlourish01
DIALOG  | P_NAME = s_port_hoopzHappy | Okay great! Let me go tell Uschi!
SET     | o_katsu01 | katsuStand
QUEST   | katsuBall = 1
EXIT |

RECOMMEND
SET    | o_katsu01 | katsuStand
CHOICE | Recommend something for Katsu to do?
IF katsuCyberdwarf == 0 | REPLY | FINDCYBERDWARF | You could help me find the Cyberdwarf.
IF katsuState <= 2 | REPLY | KATSUSKILLS | Tell me your skills.
IF ericQuest == 2  | IF katsuJobSearch == 0 | REPLY | KATSUERIC | Any jobs available?
IF katsuBall == 1  | IF uschiBall == 2 | REPLY | BBALLASK | Want to play a game of bball?
IF bballMention == 1 | IF katsuBall == 2 | REPLY | KATSUDENIED01 | About the game, you can't play.
IF bballMention == 0 | IF katsuBall == 2 | REPLY | KATSUDENIED02 | Wish I could tell you you could join my team, but...
REPLY | KATSUNOTHING | I've got nothing, Katsu.

FINDCYBERDWARF
DIALOG | P_NAME | You could help me find the Cyberdwarf.
DIALOG | Katsu  | Great! Cool! Where is he?
DIALOG | P_NAME | That's what I don't know...
DIALOG | Katsu  | Oh! I don't know either!
DIALOG | P_NAME | Yeah...
WAIT   | 3
DIALOG | Katsu  | Okay so anything we can get done now?
QUEST  | katsuCyberdwarf = 1
GOTO   | RECOMMEND

KATSUSKILLS //If Katsu hasn't told you his skills yet
DIALOG | P_NAME | Uh, I dunno, what are you good at?
DIALOG | Katsu  | What am I good at? What am I `w1`GOOD`w0` at?! Well everything! I'm Katsu, of course! Lead guitar, shred guitar, vocals, vocaloid, tambourine, wood blocks, `kw`B_A_S_K_E_T_B_A_L_L,`rt` Uilleann Pipes, Eunuch Flute, you name it, I'm your man! `w1`Katsu!`w0`
WAIT   | 0.5
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01
QUEST  | katsuState = 3
QUEST | knowKatsuBall = 1
IF uschiBall == 2  | GOTO | BBALLCONNECT
DIALOG | P_NAME = s_port_hoopzHappy | Wow, that's impressive. Maybe I can use some of your skills in the future...
SET    | o_katsu01 | katsuStand
GOTO   | RECOMMEND

BBALLCONNECT //Send to Bball Snippet if you've talked to Uschi
DIALOG | P_NAME = s_port_hoopzHappy | Bball?  You mean you can ball?
DIALOG | Katsu  | Yeah I can ball! I'll ball with you to the ends of Necron 7!
DIALOG | P_NAME | Okay, um great!
GOTO   | BBALLSEGMENT

BBALLASK
DIALOG | P_NAME = s_port_hoopzHappy | Hey, how about a game of bball?
DIALOG | Katsu | Bball? Now you are speaking my language!
GOTO   | BBALLSEGMENT

KATSUDENIED01  //If Uschi has turned down Katsu and he's told you about ballin'
DIALOG | P_NAME | Katsu, we need to talk.
DIALOG | Katsu | Yeah let's talk! `w1`Katsu!`w0`
DIALOG | P_NAME = s_port_hoopzSad | It's about the game, they might be looking for another baller instead of you.
DIALOG | Katsu | I don't understand...
WAIT   | 0.5
LOOK   | o_cts_hoopz | WEST
WAIT   |
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   |
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0
PLAYSET | o_cts_hoopz | sad0 | sad1
WAIT   | 0
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry man, some ballers just aren't ready to T_R_U_S_T_.
DIALOG | Katsu | Did you mention how good I was at the Uilleann Pipes?
DIALOG | P_NAME = s_port_hoopzSad | Katsu, I just don't think I am gonna be able to convince them.
DIALOG | Katsu | We gotta try, I gotta do something! I'll follow you to the ends of Necron 7, this can't be the end!
GOTO | DENIAL_CONT

KATSUDENIED02
DIALOG | P_NAME | Hey Katsu, there's some rumblings of a `kw`b-ball game`rt` on the court.
DIALOG | Katsu | Oh great! I'll be ready! Can't wait to show my game!
DIALOG | P_NAME = s_port_hoopzSad | Well, uh... that's just the thing... I don't think you are invited, buddy. Full disclosure.
DIALOG | Katsu | Full disclosure, eh?
WAIT | 0.5
DIALOG | Katsu | This can't be the end! I'm ready to follow you to the end of Necron 7! `sq`Go convince them Katsu's `w1`ready to ball!`w0``rt`
GOTO | DENIAL_CONT

DENIAL_CONT
DIALOG | P_NAME = s_port_hoopzSad | Katsu... `sq`I'll try to convince them,`rt` but... don't get your hopes up.
QUEST  | katsuBall = 3
EXIT |

//If you are looking for a Job for Eric
KATSUERIC
DIALOG | P_NAME | You wouldn't know where any jobs are would you?
DIALOG | Katsu  | Jobs?
DIALOG | P_NAME | Yeah I'm looking for a job for a guy I know.
DIALOG | Katsu  | I thought that's what I was doing... looking for a job for me...
DIALOG | P_NAME | Oh.
DIALOG | Katsu  | Why would I be asking you for a job when I already had a job?
DIALOG | P_NAME | Uh, yeah that doesn't make much sense.
DIALOG | Katsu  | No it doesn't.
WAIT   | 1.5
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01
WAIT   | 1.25
QUEST  | katsuJobSearch = 1
GOTO   | RECOMMEND

KATSUNOTHING
DIALOG | P_NAME | Truth be told, I can't think of anything else to do.
DIALOG | Katsu  | Oh man, I really wanted to do something!
DIALOG | P_NAME | Yeah seems like it... I'll be back. Until then,_ `w1`stay frosty.`w0`
EXIT |

KATSUREMIND //Reminder to check with Uschi about ballin'
DIALOG | Katsu | Let me know about that bball game. Keep me posted! I'm all in! `w1`Katsu!`w0`
EXIT |

//if you're controlling the Governor.
GOV01
IF katsuGov == 1 GOTO | GOV02
DIALOG | Katsu | Yowza! Who are you?
DIALOG | Governor Elagabalus | I'm surely the governor!
DIALOG | Katsu | I'll follow you to the ends of Necron 7, Governor!
DIALOG | Governor Elagabalus | Indeed!
QUEST  | katsuGov = 1
EXIT |

GOV02
DIALOG | Governor Elagabalus | Carry on.
EXIT |

OOZEBALL // Tell Katsu that you went with another baller (presumably Ooze)
IF katsuBall >= 1 | GOTO | KATSUINRUNNING
IF katsuBall == 0 | GOTO | KATSUOUTOFRUNNING

KATSUINRUNNING //Katsu's reaction if he knew about the bball game (common occurence)
DIALOG | P_NAME | Hey Katsu...
DIALOG | Katsu  | If it isn't the baller man himself! When is the game happening? Let's do it!
DIALOG | P_NAME | Uh, about that...
DIALOG | Katsu  | Kat._._._su?    
DIALOG | P_NAME = s_port_hoopzSad | Yeah I think I'm gonna go with another baller for my team. I'm sorry but things just happened that way.
DIALOG | Katsu  | But, what about hope?    
DIALOG | P_NAME = s_port_hoopzSad | I guess hope is gonna have to hold out for the next one.
DIALOG | Katsu  | ... you know ... my hope is just `w1`audacious`w0` enough to hold out for the next one!
WAIT   | 1
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01         
QUEST  | katsuBall = 6
EXIT | 

KATSUOUTOFRUNNING //If Katsu has never heard of the bball game
DIALOG | Katsu  | Hey! What's going down?
DIALOG | P_NAME | I umm, I still don't know, Katsu.
DIALOG | Katsu  | Okay, well when you have something to do, make sure you tell me!
DIALOG | P_NAME | I will for sure.
QUEST  | katsuBall = 6

//If curfew is active
//Less flavor during curfew (spoken to him a bunch)
CURFEW
IF katsuState >= 2 | GOTO | CURFEWNOFLAVOR
IF katsuState < 2  | GOTO | CURFEWFLAVOR
DIALOG | Katsu | After this curfew, I'm ready to follow you to the ends of Necron 7! Katsu! What are we gonna do?
GOTO | RECOMMEND

CURFEWFLAVOR
DIALOG | Katsu  | This curfew really `w1`busts my chops.`w0` We need to get out and `s1`DO SOMETHING!`rt`
DIALOG | P_NAME | I know what you mean, but I'm not sure what can be done.
DIALOG | Katsu  | Neither do I... I can't think, in fact I WON'T think. I'm a doer not a thinker! `w1`Katsu!`w0`
WAIT   | 1
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01
WAIT   | 1.0
SET    | o_katsu01 | katsuStand
GOTO   | RECOMMEND

KATSUBALL06 //Flavor repeat for Katsu after you've gone with another baller (regardless if he knows)
DIALOG  | Katsu | Maybe not this time, but the next, or the time after that, but we're eventually gonna do someting, I just know it! `w1`Katsu!`w0`
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND   | sn_katsuFlourish01
WAIT    | 0.5
SET     | o_katsu01 | katsuStand

KATSUBALL05
DIALOG | Katsu | These Katsu fingers are itching for some B-Ball!

KATSUBALL04
DIALOG | Katsu | I'm ready to game at a moments notice! `w1`Katsu!`w0`
QUEST  | katsuBall = 5

KATSU03
DIALOG | Katsu | Met anyone that could use my special skills?
CHOICE | Anyone?
IF katsuBall < 2  | REPLY | SKILLSAGAIN | Tell me your skills again.
IF bballMention == 1 | IF katsuBall == 2 | REPLY | KATSUDENIED01 | About the game, you can't play.
IF bballMention == 0 | IF katsuBall == 2 | REPLY | KATSUDENIED02 | Wish I could say you could join my team, but...
REPLY | SOMETHINGELSE | Maybe something else...

SKILLSAGAIN
DIALOG | P_NAME | What were those skills again?
DIALOG | Katsu  | Lead guitar, shred guitar, vocals, vocaloid, tambourine, wood blocks, `w1`B_A_S_K_E_T_B_A_L_L_`w0`, Uilleann Pipes, Eunuch Flute.
WAIT   | 0.5
DIALOG | Katsu  | `w1`Katsu!`w0`
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01
WAIT   | 0.5
SET    | o_katsu01 | katsuStand
DIALOG | P_NAME | Oh yeah, right, thanks! Still working on it.

SOMETHINGELSE
DIALOG | P_NAME | Actually, I'm thinking about something else.
GOTO   | RECOMMEND

//Third, repeating time talking to Katsu
KATSU02
DIALOG | Katsu | Well what are we waiting for? Let's do something! `w1`Katsu!`w0`
GOTO   | RECOMMEND

// Second time talking to Katsu
KATSU01
DIALOG | Katsu | I'm in! What are we doing?
DIALOG | P_NAME = s_port_hoopzSurprise | Uh nothing yet I don't think.
DIALOG | Katsu | Well what are we waiting for? Let's do something!
QUEST  | katsuState = 2
GOTO   | RECOMMEND

// First time talking to Katsu
KATSU00
DIALOG  | Katsu | `w1`Katsu!`w0`
PLAYSET | o_katsu01 | katsuFlourish | katsuHold
SOUND   | sn_katsuFlourish01
WAIT    | 1
DIALOG  | P_NAME = s_port_hoopzSurprise | Uh, hello.
SET     | o_katsu01 | katsuStand
DIALOG  | Katsu  | Katsu's my name and I'm `w1`game`w0` for it all! Let's do this thing!
DIALOG  | P_NAME | Uh what thing?
DIALOG  | Katsu  | Whatever it is you gotta do! I'll follow you to the ends of Necron 7!
DIALOG  | P_NAME | Well that's great but I'm not sure what we could do. Let me think...
QUEST   | katsuState = 1
GOTO    | RECOMMEND
"
