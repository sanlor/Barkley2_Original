/// Uschi, the b-ball girl.
/*
VARIABLES
	uschiGov
		0 - Not talked to Uschi as governor
		1 - Have talked to Uschi as governor
	uschiLookingFlavor 
		0 - Slight response change
		1 - Slight response change
    uschiState
        0 - never talked to Uschi
        1 - talked to her
    uschiBall
        0 - haven't talked about balling
        1 - turned her down to ball, you can come back and challenge later
        2 - Quest for the third baller has begun
        3 - You now have a baller and need to challenge the Duergars
        4 - You have a duergar challenge accepted - you can play the game now
        5 - You lost the game against the Duergars and can try again if you leverage something
        6 - You won the game and got the Clandestine Courts Baller Zine
        7 - Commish repeat
        8 - You forgot to get back to Uschi in time and the quest is locked out
        9 - You told Uschi to frub off, failing the quest
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
IF body == governor | IF uschiGov == 0  | GOTO | GOVERNOR_0
IF body == governor | IF uschiGov == 1  | GOTO | GOVERNOR_1
IF curfew == during | IF uschiBall <= 1 | GOTO | CURFEW_NO_AGREEMENT
IF curfew == during | IF uschiBall >= 2 | GOTO | CURFEW_PRIOR_AGREEMENT
IF uschiBall == 9  | IF room == r_tnn_bballcourt02    | GOTO | BBALL_ANGRY
IF uschiBall == 9  | IF room == r_tnn_bballtenement01 | GOTO | BBALL_ANGRY_INDOORS
IF uschiBall == 8  | IF uschiFailSafe == 0 | GOTO | BBALL_INTEREST_LOST
IF uschiBall == 7  | GOTO | COMMISH_TALK_TO
IF uschiBall == 6  | GOTO | GAME_WAS_WON
IF uschiBall == 5  | GOTO | GAME_WAS_LOST
IF uschiBall == 4  | GOTO | BBALL_DUERGARS_FOUND
IF uschiBall == 3  | GOTO | BBALL_FIND_DUERGARS
IF uschiBall == 2  | GOTO | THIRD_BALLER_DID_YOU_FIND_BALLER
IF uschiBall == 1  | GOTO | BBALL_RETURN_AFTER_DECLINE
IF uschiState == 1 | GOTO | BBALL_NOT_ENOUGH_BALLERS
IF uschiState == 0 | GOTO | BBALL_CRESTFALLEN

GOVERNOR_0
IF uschiGov == 1 | GOTO | GOVERNOR_1
DIALOG | Uschi  | Hi, Mr. Governor, sir. Good luck with your speech and everything... I know it's a lot to ask, but if you don't mind, maybe you could organize a friendly Duergars versus Dwarfs charity competition. Just a suggestion...
DIALOG | Governor Elagabalus | Ho ho, young lady, if you are a good little girl maybe all your wishes will come true. Ho! Ho! Ho...
DIALOG | P_NAME | (Gadzooks what am I talking about?!)
DIALOG | Uschi  | Uh, thank you for thinking about us ballers Mr. Governor, sir.
QUEST  | uschiGov = 1

GOVERNOR_1
DIALOG | Governor Elagabalus | Ho h-... carry on.

CURFEW_NO_AGREEMENT
DIALOG | Uschi = s_port_uschiBummed | `w1`Sigh...`w0` have you seen the b-ball court outside? It's a dump. Not only that but the Duergars sometimes put `kw`Hoop Locks`rt` up so our attempts to `w1`slam`w0` get frequently `s1`jammed.`rt` I hate to say it, but it... `sq`it might just be a baller's worst nightmare.`rt`
DIALOG | P_NAME | That's really too bad.
DIALOG | Uschi = s_port_uschiBummed  | Sure is...
WAIT | 0.5
DIALOG | Uschi | Hey, after this curfew is over, think you want to get a game going?
DIALOG | P_NAME | I guess I might be interested. `kw`I'll get back to you on that after the curfew.`rt`
DIALOG | Uschi | Wow you're the first person that's interested! `sq`Don't forget to come back after curfew!`rt`
QUEST | uschiState = 1
EXIT |

CURFEW_PRIOR_AGREEMENT
DIALOG | Uschi  | Hey P_NAME! I can't wait for this dumb curfew to end so that we can get back to setting up a game of B-Ball.
DIALOG | P_NAME | Yeah, me too. Until then,_ `w1`Stay frosty.`w0`

CHOICE_FIND_BALLERS
CHOICE | Help Uschi find other ballers?
REPLY  | FIND_BALLERS_ACCEPT  | I can look for someone.
REPLY  | FIND_BALLERS_DECLINE | I'd love to help but not right now.
REPLY  | FIND_BALLERS_FUCKYOU | Frub off! I've got better things to do, sucka.

FIND_BALLERS_ACCEPT
DIALOG | P_NAME | Well, I'm kind of an amnesiac searching for the Cyberdwarf on a quest to find out my identity... but I guess I've got time to help you look.
DIALOG | Uschi  | Haha, I knew you were down. The name of the `sq`game is pure three-on-three street ball`rt` so we'll need a third baller for our team and then three others to play against. I know Emilio would love to play but he put on too many pounds cooped up waiting for more players and now he can't fit through the door frame.
IF emilioState == 0 | GOTO | EMILIO_DONTKNOW
IF emilioState >= 1 | GOTO | EMILIO_KNOW

EMILIO_DONTKNOW
DIALOG | P_NAME | Too big to ball? Sounds like someone didn't `w1`PLAY 60`w0`.
DIALOG | Uschi  | Yeah we kept telling him to `w1`PLAY 60`w0` or even 45, but he wouldn't even `w1`PLAY 15.`rt`
DIALOG | P_NAME | I wish we could get the word out to more kids that even in the off season, `w1`PLAY 60`w0` is an important part of your daily activities.
DIALOG | Uschi  | You said it P_NAME_S, gotta `w1`PLAY 60`w0`.
WAIT | 1.5
GOTO   | EMILIO_FOLLOWUP

EMILIO_KNOW
DIALOG | P_NAME | Ah that's too bad, the big guy seems to love bball. What happened? Did he not `w1`PLAY 60`w0`?
DIALOG | Uschi  | That's exactly what he didn't do. Too many SPORTS Vidcons like `kw`Ballermanx`rt` and `kw`Save Yourself from the Ballermanx HD`rt` that he didn't even think about `kw`PLAYING 60.`rt`
DIALOG | P_NAME = s_port_hoopzSad | That's so sad.
DIALOG | Uschi  | Same old song. Another baller loses out for lack of `kw`PLAYING 60.`rt`
GOTO   | EMILIO_FOLLOWUP

EMILIO_FOLLOWUP
DIALOG | Uschi  | So anyways, we need to find a third baller. Any ideas?
QUEST  | uschiBall = 2
GOTO   | THIRD_BALLER_IDEAS

FIND_BALLERS_DECLINE
DIALOG | P_NAME | Well I'd love to help but I kind of am in search of my destiny and might need to do some searching for that first.
DIALOG | Uschi  | Hey I get it. I just thought maybe your destiny could be on the court.
DIALOG | P_NAME = s_port_hoopzSurprise | Destiny... on the court?
DIALOG | Uschi  | Well, I'll be here for a bit longer. Make sure you let me know if you want to throw down some slam jams.
QUEST  | uschiBall = 1
ClockTime | uschiBall | 8 | 240

FIND_BALLERS_FUCKYOU
DIALOG | P_NAME = s_port_hoopzSad | Frub off! I would have balled if the ballers were ready, but I have a destiny to discover.
DIALOG | Uschi  | I thought that maybe your destiny was on the court, guess I was wrong. So long, `w1`player hater.`w0`
DIALOG | P_NAME = s_port_hoopzSad | I-I'm sorry... (I can't be everything to everyone.)
QUEST  | uschiBall = 9
//ROUNDMOUND: lose out on bball points

THIRD_BALLER_DID_YOU_FIND_BALLER
DIALOG | Uschi | Find that third baller?
GOTO   | THIRD_BALLER_IDEAS

THIRD_BALLER_IDEAS
IF katsuBall != 3 | IF katsuBall != 1 | IF oozeBall != 2 | IF knowKatsuBall == 0 | GOTO | THIRD_BALLER_STILL_LOOKING
CHOICE | Third baller for Uschi's game?
IF knowKatsuBall >= 1 | REPLY | THIRD_BALLER_KATSU | I know a guy! Katsu!
IF katsuBall == 3 | REPLY | THIRD_BALLER_KATSU_RECONSIDER | You should reconsider Katsu!
IF oozeBall == 2  | REPLY | THIRD_BALLER_OOZE  | Ooze said he'd play!
REPLY | THIRD_BALLER_STILL_LOOKING | Still looking!

THIRD_BALLER_STILL_LOOKING
IF uschiLookingFlavor == 0 | DIALOG | P_NAME | Nobody comes to mind, but I'm on the case!
IF uschiLookingFlavor == 1 | DIALOG | P_NAME | I'm still looking for a baller.
DIALOG | Uschi | I wouldn't dally. Let's hope the governor doesn't catch wind of our game and put hoop locks up.
QUEST  | uschiLookingFlavor = 1

THIRD_BALLER_KATSU
DIALOG | P_NAME | How about Katsu!
DIALOG | Uschi = s_port_uschiBummed | Oh no, oh no. That square can't ball to save his life.
DIALOG | P_NAME | Oh he seemed really eager to lace up and jam.
DIALOG | Uschi = s_port_uschiBummed | No just - anyone but Katsu - no.
DIALOG | P_NAME | Oh... okay then.
DIALOG | Uschi  | There has gotta be a real baller out there... raised and trained on the mean streets of Tir na nOg...
DIALOG | P_NAME | I'll do my best.
QUEST  | uschiBall = 2
QUEST  | katsuBall = 2
KNOW | knowKatsuBall | 2
EXIT | 

THIRD_BALLER_KATSU_RECONSIDER
DIALOG | P_NAME | You know, you should maybe give Katsu a shot, he's-
DIALOG | Uschi  | A dreck baller? A distraction on the court? Yeah that's what he is.
DIALOG | P_NAME | Oh c'mon how bad can he be?
DIALOG | Uschi  | Real bad, he'll embarrass whichever team he's on AND the team he's playing against.
DIALOG | P_NAME = s_port_hoopzSad | He seemed so eager...
PLAYSET| o_uschi01 | facepalm | facepalmLast
WAIT   | 0
WAIT   | 1
PLAYSET| o_uschi01 | unpalm | bummed
WAIT   | 0
DIALOG | Uschi | I don't think I have the stomach to watch him ball again. Dare I say, I don't have the H_E_A_R_T_.
GOTO   | AUDACITY_OF_HOPE

THIRD_BALLER_OOZE
DIALOG | P_NAME = s_port_hoopzHappy | I know the perfect baller, Ooze!
DIALOG | Uschi  | You mean that badass with the lazer sword?! How did you swing that?
DIALOG | P_NAME | I guess we uh, just saw eye to eye.
DIALOG | Uschi  | Well that's great! So now we just need some oppenents!
DIALOG | P_NAME | But it was hard enough finding Ooze, how can we find three more?
QUEST  | oozeBall = 3
GOTO   | BBALL_OPPONENTS_FIND

BBALL_ANGRY
DIALOG | Uschi | How about you scram and get jammed?
DIALOG | P_NAME = s_port_hoopzSad | ._._._

BBALL_ANGRY_INDOORS
DIALOG | Uschi | Hey, this household is for sportslovers only! Go `w1`sportshate`w0` someplace else.
DIALOG | P_NAME = s_port_hoopzSad | ._._._

BBALL_INTEREST_LOST
DIALOG | Uschi | Hey. Sorry. I don't think I'm ready to ball anymore. Just lost interest... along with everyone else.
DIALOG | P_NAME = s_port_hoopzSad | ._._._

COMMISH_TALK_TO
DIALOG | Uschi | Remember P_NAME_S, go talk to /'The Commish/' but until then, play this thing close to the vest.

BBALL_FIND_DUERGARS
DIALOG | Uschi | Find some Duergars to challenge!

BBALL_DUERGARS_FOUND
DIALOG | Uschi  | Hey, did you find any Duergars for a game of B-Ball?
DIALOG | P_NAME | Yeah, almost got goofed into a pine box in the process. Good thing your Duergar theory rang true._ `w1`They couldn't back down from a challenge.`w0`
DIALOG | Uschi  | Heh, they seem tough and mean and dangerous and cruel, but in the end you just have to know how to handle them.
DIALOG | Uschi  | Alright, are you ready to do this thing?
CHOICE | Game on?
REPLY  | BBALL_PLAY_THE_MATCH     | Bring it on... bitch. 
REPLY  | BBALL_POSTPONE_THE_MATCH | Hold on!

BBALL_PLAY_THE_MATCH 
DIALOG | P_NAME | Game on, game hard.
// Begin the match

BBALL_POSTPONE_THE_MATCH
DIALOG | P_NAME | Hold it! I've got a few things to do first.
DIALOG | Uschi  | Uh, okay, but don't take too long. I don't think the Duergars are very good at patience, but they are very good at molesting dwarfs.

BBALL_RETURN_AFTER_DECLINE
DIALOG | Uschi | I knew you'd be back! You down to ball or are you still too chicken to throw it down with `kw`The Baller Queen of Tir na nOg?`rt`
GOTO   | CHOICE_FIND_BALLERS

BBALL_NOT_ENOUGH_BALLERS
DIALOG | Uschi | Without enough players there is nothing we can do. Which is a bummer because it could be a real center of the community. And who knows, maybe the game's next rising star will come out of Tir na nOg. Now that's a thought.
GOTO   | CHOICE_FIND_BALLERS

BBALL_CRESTFALLEN
DIALOG | Uschi  = s_port_uschiBummed | Sigh... look at this court. It's a barren as the sands of Al Akihabara. Not to mention we don't have enough players so any attempt at a slam just ends up getting jammed. I hate to say it, but it... it might just be a baller's worst nightmare.
DIALOG | P_NAME | That's a crying shame. These hoops are useless without enough b-ballers.
DIALOG | Uschi  = s_port_uschiBummed | Yeah... hey_
DIALOG | Uschi | -are you a baller?
QUEST  | uschiState = 1
CHOICE | ... am I a baller?
REPLY  | BBALL_TO_LIVE | I ball to live.
REPLY  | BBALL_DABBLE  | I've been known to dabble.
REPLY  | BBALL_SOCCER  | I love soccer!
REPLY  | BBALL_BUPKIS  | I know bupkis about balling.

BBALL_TO_LIVE
DIALOG | P_NAME | Am I a baller? Heck yeah I am! I ball to live!
" +
//TODO: roundmound points (most)
"
DIALOG | Uschi  | `w1`Oh dip,`w0` me too! They call me the `kw`Tir na nOg Baller Queen`rt` so you better believe I'm all about ballin'! Word is they are starting up a new Dwarf League in Brain City... I'd love to put a team together but sadly... there is very little interest besides Emilio in the tenement building to the North.
DIALOG | P_NAME | Why is it so hard to find b-ballers? It's the best sport!
DIALOG | Uschi  | Sign of the times._ I guess this brave new reality of Wrist-CONPs and MMOs keep prospective ballers off the courts and glued to their screens. Now I know `kw`Oligarchy Online`rt` is all the rage, but you'd think somedwarf would want to get out and `w1`PLAY 60`w0` now and then.
KNOW | 
DIALOG | P_NAME | (The `kw`Tir na nOg Baller Queen...`rt` Maybe there is some way I could help her out.)
KNOW   | knowDwarfLeague | 2
KNOW   | knowOO | 1
GOTO   | CHOICE_FIND_BALLERS

BBALL_DABBLE
DIALOG | P_NAME | Am I a baller? Yeah, I've been known to dabble.
" +
//TODO: roundmound points (less)
"
DIALOG | Uschi  | That's great. I for one am pretty passionate about `kw`/;The Sport of the Godz/',`rt` but not many people are. It's been really hard to solidify the community and get a game together, heck I've even thought about inviting the Duergars to play!
DIALOG | P_NAME | I'd love to play sometime.
DIALOG | Uschi  | Yeah, same. We're still short four players, even with us two ready to ball.
GOTO   | CHOICE_FIND_BALLERS

BBALL_SOCCER
DIALOG | P_NAME | Am I a baller? Sure! I love soccer!
" +
//TODO: roundmound lose bball points
"
DIALOG | Uschi  | Oh... that's cool, I guess... I was talking more about b-ball, though._ Even if you're not really a b-ball lover, it'll still probably be fun to play. I mean, I've got a lot of pent up energy from sitting around Tir na nOg waiting for this dang prize, it would be good to just get the energy out, you know?
DIALOG | P_NAME | Yeah, I'd be down.
DIALOG | Uschi  | Cool. Another player on the court now! We just need four more!
GOTO   | CHOICE_FIND_BALLERS

BBALL_BUPKIS
DIALOG | P_NAME | Balling? I know bupkis about balling. Absolute bupkis.
" +
//TODO: roundmound - lose bball points
"
DIALOG | Uschi  | Bupkis? Are you spoofing me? You've got that baller glimmer in your eye...
DIALOG | P_NAME | I uh... I don't `w1`think`w0` I'm a baller...
DIALOG | Uschi  | Oh well I guess I'll just talk to you later. Mind stepping off my court while I pine over the `kw`/;Ballin' Days of Yore?/'`rt`

GAME_WAS_WON
//TODO: Add links to this minigame
DIALOG | P_NAME = s_port_hoopzHappy | We won!
DIALOG | Uschi  | Heh, you've got skillz, P_NAME_S. `kw`Skillz to pay billz`rt` for sure.
DIALOG | P_NAME | (Wow sounds like she said skillz with a 'z'...)
DIALOG | Uschi  | Hey, think you can do me a favor? You see, you're not really from around here, and since you can get out and all, maybe you could help me with something?
DIALOG | P_NAME | Sure what do you need?
DIALOG | Uschi  | Well there's been word from Brain City about getting the Legendary Dwarf Leagues back together. Some say it's a pipe dream, others a hoop dream, but this certain someone in Brain City is trying to make it a reality. He's well known too. Wise and strong beyond his years.
DIALOG | P_NAME | (Could it be... The Cyberdwarf...?)
DIALOG | Uschi  | He goes by `kw`The Commish.`rt` He puts out this underground zine tri-weekly... let's just say when you read it you'll be ready to pump up your sneaks. The way he describes /;The Golden Game/' is enough to raise every dwarf off the bench.
DIALOG | P_NAME = s_port_hoopzHappy | This sounds important!
DIALOG | Uschi  | Hush, there's not much we can do here, but take this to the /'The Commish/' in Brain City.  He'll know us in Tir na nOg are behind him when he gets this back.
NOTIFY | Got the Clandestine Courts Baller Zine
NOTE   | take | Clandestine Courts Baller Zine
DIALOG | P_NAME = s_port_hoopzHappy | Okay you can count on me!
QUEST  | knowDwarfLeague = 2
QUEST  | uschiBall = 4
IF oozeBall == 3 | QUEST | oozeBall = 4
QUEST  | bballComplete = 0

GAME_WAS_LOST
//TODO: move the ballers to the proper positions
DIALOG | P_NAME | Man, we got whupped.
DIALOG | Uschi  | Nice try P_NAME_S, but you'll need proper skillz to pay my billz.
DIALOG | P_NAME | I just need more open lanes to drive.
DIALOG | Uschi  | That's a fool's errand with my omnipresent defense, let me know if you ever want a rematch, I could always show you again how I /'shut it down/'.
QUEST  | knowDwarfLeague=3

AUDACITY_OF_HOPE
//TODO: kill the bgm music, add environment sound to this room with proper functionality
//Misc   | music | mus_tnn_shadowrun2 | 0
//PEDESTRIAN | off
DIALOG | Katsu | Heart you say?
/*
CREATE | o_katsu_gooflord01 | 120 | 352
WAIT   | 0
MOVETO | o_cts_hoopz | o_cinema1 | MOVE_FAST
WAIT   | 0
LOOK   | o_cts_hoopz | SOUTHWEST
FOLLOWFRAME | CAMERA_NORMAL | o_katsu_gooflord01 | o_cts_hoopz
MOVETO | o_katsu_gooflord01 | o_cinema0 | MOVE_FAST
WAIT   | 0
PLAYSET| o_uschi01 | facepalm | facepalmLast
WAIT   | 0
DIALOG | Katsu | It's a funny thing, the dwarf heart. They say that a dwarf heart beats 50 million gallons of blood in a lifetime.
WAIT   | 1
DIALOG | Katsu | Enough to fill four B-ball Arenas.
FRAME  | CAMERA_SLOW | o_cinema2
MOVETO | o_katsu_gooflord01 | o_cinema2 | MOVE_SLOW
WAIT   | 0
LOOKAT | o_cts_hoopz | o_katsu_gooflord01
DIALOG | Katsu | They also say that as dwarfs mature their hearts can grow from the size of a peanut to the size of a melon. The best dwarf ballers have hearts on average twenty percent larger than their non-athletic counterparts...
PLAYSET | o_katsu_gooflord01 | katsuHeadLower | katsuHeadDown
WAIT   | 1.0
DIALOG | Katsu | That's a lot of blood on the court.
WAIT   | 1
FRAME  | CAMERA_NORMAL | o_cts_hoopz | o_katsu_gooflord01 | o_uschi01
WAIT   | 0
DIALOG | Katsu | The truth is I wasn't blessed with a heart any bigger or stronger than the rest, but what flows through my veins is something more powerful and plentiful than blood... HOPE. Hope against hope._
WAIT   | 0.25
PLAYSET| o_uschi01 | unpalm | bummed
WAIT   | 0
DIALOG | Katsu | `w1`The Audacity of Hope.`w0`
WAIT   | 0.5
DIALOG | Katsu | So you may not let me play because I lack fleet of foot or inch of up, but I swear I won't ever give up as long as I have one drop of fight left in this ticker of mine.
DIALOG | Katsu | I measure hope in parts per million.
WAIT   | 1.5
PLAYSET | o_katsu_gooflord01 | katsuFlourish | katsuHold
SOUND  | sn_katsuFlourish01
WAIT   | 2
FRAME  | CAMERA_NORMAL | o_cts_hoopz | o_uschi01 | o_katsu_gooflord01
WAIT   | 0
SET    | o_uschi01 | default
WAIT   | 0.25
DIALOG | Uschi | Wow... that was... inspiring.
SOUND  | o_katsu_gooflord01 | katsuStanding
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! Great speech Katsu!
LOOKAT | o_katsu_gooflord01 | o_uschi01
DIALOG | Uschi | I know someone who'd love to hear your words about sportsmanship and the wherewhithal to compete at any cost. But until then, you have a spot on the team! Here, show us your shot!
//PLAYSET | o_uschi01 | uschiPass | default
EVENT  | o_uschi01 | 10 // Create scene
WAIT   | 1
EVENT  | oCinemaKatsu | 10 // Do pass
WAIT   | 1.5
EVENT  | oCinemaKatsu | 10 // Katsu turns to shoot
DIALOG | Uschi = s_port_uschiBummed | Katsu! That's our only ball!
FRAME  | CAMERA_FAST | o_cinema6
EVENT  | oCinemaKatsu | 10 // Katsu shoots
WAIT   | 3
Emote  | ! | o_uschi01
Emote  | ! | o_katsu_gooflord01
DIALOG | Uschi | What the flying huck is that?!_ P_NAME_S! How are you doing this?!
DIALOG | P_NAME = s_port_hoopzShock | I don't know I just tried to stop the ball!
FRAME  | CAMERA_SLOW | o_cts_hoopz | o_katsu_gooflord01 | o_uschi01
EVENT  | oCinemaKatsu | 10 // Hoopz brings in ball
WAIT   | 4.5
SET    | o_uschi01 | standEmpty
//SET  | o_katsu_gooflord01 | default
LOOKAT | o_katsu_gooflord01 | o_cts_hoopz
SET    | o_cts_hoopz | ballDribbleLast
EVENT  | o_uschi01 | 11 // Kill scene
DIALOG | Uschi  | This power... I read about it in...
//TODO: Uschi Consults the Clandestine Courts Magazine
DIALOG | Uschi  | Here, page 34... but... it says that they were destroyed in a space explosion four thousand years ago.
DIALOG | Katsu  | You don't mean...
DIALOG | Uschi  | Yes, Katsu... The Choosen is amongst the dwarves!
//TODO: Personae Rubric Attain! | The Choosen
DIALOG | P_NAME = s_port_hoopzSurprise | What? The Choosen?! What is that?
LOOKAT | o_cts_hoopz | o_uschi01
DIALOG | Uschi  | It doesn't say much, just a few lines, but_ The Choosen is prophesized to walk amongst the dwarfs once more, searching for his lost destiny... P_NAME_S, that could be you!
DIALOG | P_NAME = s_port_hoopzSurprise | B-but... I wouldn't know what to do as the Choosen! I barely know what I need to do as an amnesiac!
WAIT   | 1.0
DIALOG | Uschi  | You know what, P_NAME_S, you're right.
DIALOG | Uschi  | There is a time and place for prophecy and salvation, but for now, let's focus on the game at hand! You. Me. Katsu. We have our team, now we just need opponents.
*/
DIALOG | P_NAME | But it was hard enough finding Katsu, how can we find three others?
QUEST  | katsuBall = 4
GOTO   | BBALL_OPPONENTS_FIND

BBALL_OPPONENTS_FIND
DIALOG | Uschi  | Hmm...
WAIT   | 1.0
DIALOG | Uschi  | There is one way... but it's risky.
DIALOG | P_NAME = s_port_hoopzSmirk | I'm listening.
DIALOG | Uschi  | Well, you see, the Duergars may seem like a motley crew of savage overlords but they actually adhere to a code of conduct called `kw`The Wooden Rule.`rt` The rule has a few basic tenets like `w1`Fortune favors the bold`w0` and `w1`Protect ya neck`w0` But also:_ `w1`Never back down from a challenge.`w0`
DIALOG | P_NAME | So what? Go challenge the Duergars to a game of hoops?
DIALOG | Uschi  | Yeah, but it's gotta look genuine, so I'd rile them up first.
DIALOG | P_NAME = s_port_hoopzSurprise | You mean pick a fight?! No way! The last time I got on the bad side of a duergar there was a fist in my gut!
DIALOG | Uschi  | P_NAME, trust me. Just go infuriate a Duergar and then instead of throwing down with gun's, challenge them to a match!
DIALOG | P_NAME | I don't like the sound of this but... I have the supreme urge to ball, Choosen or not.
DIALOG | Uschi  | That's the spirit!  Good luck, P_NAME_S!
//EVENT  | o_uschi01 | 1
QUEST  | uschiBall = 3
";


// TRASH HEAP 
/*

" +
//TODO: move to room and show pouting Emilio dialogue
//TODO: scr_event_build_camera_move_to_point(424, 104, CAMERA_NORMAL)
"
WAIT   | 0
DIALOG | Emilio | If I could go back... I'd PLAY 90.
WAIT   | 0
FRAME  | CAMERA_NORMAL | o_cts_hoopz | o_uschi01
WAIT   | 0
