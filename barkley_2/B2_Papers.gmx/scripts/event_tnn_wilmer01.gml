/* Script for Old Man Wilmer, he is always available.
Located in Tir na nOg inside his house.

Variables:
	wilmerState
		0 - beginning of game, not talked
		1 - encountered wilmer at the beginning of the game
		2 
	wilmerEvict
		0 - Wilmer hasn't sent you on the mission to pay his rent.
		1 - Wilmer HAS sent you on the mission to pay his rent.
		2 - Wilmer has been EVICTED! (this changes from 1 to 2 after one time unit)
		3 - Hoopz has talked to Wilmer after he has been kicked out
		4 - Mortgage paid via Minigame
		5 - Told Wilmer you paid his mortgage
		6 - Mortgage paid via governor
		7 - Talked to Wilmer that Governor forgave him
		8 = repeating dialoge if he's been Evicted
*/
script = "
IF body == governor | GOTO | GOVERNOR
IF wilmerSleep == 1 | GOTO | SLEEP
IF wilmerEvict == 6 | GOTO | GOVPARDON
IF wilmerEvict == 4 | GOTO | EVICTPAID
IF wilmerEvict == 1 | GOTO | WILMER01

GOVERNOR
IF wilmerSleep == 1 | GOTO | GOVSLEEP
IF wilmerSleep == 0 | GOTO | GOVAWAKE

QUESTIONS // Ask questions from ol' Wilmer //
CHOICE | I've got a question...
IF wilmerEvict == 1 | REPLY | MORTGAGEPAY | What was I supposed to do with your mortgage?
IF wilmWhere == 0 | REPLY | WHATISTNN | What is Tir na nOg, really?
IF wilmWhere == 1 | REPLY | WHEREAMI | Necron 7?
IF knowCuchu == 1 | REPLY | WHOCUCHU | Who is Cuchulainn?
IF wilmCdwarf == 0 | REPLY | WHOCDWARF | Who is the Cyberdwarf?
IF wilmEscape == 0 | REPLY | WHATTODO | What is there to do around here?
IF wilmEscape == 1 | REPLY | TNNESCAPE | How do I get out of Tir na nOg?
IF wilmDuergars == 0 | REPLY | WHOAREDWARFS | Who are the Dwarfs?
IF wilmDuergars == 1 | REPLY | WHOAREDUERGARS | Who are the Duergars?

MORTGAGEPAY // What was that mortgage thing you wanted me to do again?
DIALOG | P_NAME | Hey Mr. Wilmer, what was that mortgage thing you wanted me to do again?
DIALOG | Wilmer | Now listen *cough*cough* closely, youngster! This is real important, if you don't get this right ol' Mr. Wilmer's gonna be kicked out of his house! I need you to take the money and paper I gave you and go to the mortgage renewal center in the west end of town. Give them the money and paper. It's really that simple, but I need you to do it right now before you do anything else, because my mortgage is expiring today. Do you have all that? Money. Paper. Mortgage renewal center. It's real simple.
DIALOG | P_NAME | Yeah, I got it, Mr. Wilmer!
QUEST | wilmerSleepCount += 1
GOTO | SLEEPPROGRESS

WHEREAMI //WHERE AM I?
DIALOG | P_NAME | I know this is going to sound crazy but... what the hedge is Necron 7.
DIALOG | Wilmer | Youngster, it don't sound crazy at all. None of us... none of us really knows where we are anymore. But we do know a little. This... all of this... we're on the ancient Dwarf Space Ziggurat, the Necron 7. Now ain't that a mouthful, huh?
DIALOG | P_NAME | Dwarf space ziggurat? What does that even mean?
DIALOG | Wilmer | This is the Necron 7, this... space ship or somethin'. Nobody knows how big it is, but some people say it's the size of a whole planet. Maybe it's bigger, maybe it's smaller, I don't know. But right now, we're floating somewhere in outer space and that's where we've been for as long as Ol' Wilmer can remember.
DIALOG | Wilmer | We ARE in Necron 7, youngster! Tir na nOg is the part of Necron 7 we're in, the new home of the dwarfs... for better or for worse...
DIALOG | P_NAME | Oh...
KNOW | knowCuchu | 1
QUEST | wilmWhere += 1
QUEST | wilmerSleepCount += 1
GOTO | SLEEPPROGRESS

WHATISTNN //WHAT IS TIR NA nOg?
DIALOG | P_NAME | What is this place? What is Tir na nOg, really, and why is this the new home of the dwarfs?
DIALOG | Wilmer | Tir na nOg? Well... it's home, whether we like it or not. It's a rough and tumble place and we don't have much, but it's what we've got.
DIALOG | P_NAME | What do you mean?
DIALOG | Wilmer | You see, youngster, Cuchulainn's been - *cough*cough* - excuse me, got a little somethin' stuck in my windpipes there. He's been rounding up the dwarfs all over the galaxy and puttin' most of them in Tir na nOg. None of us knows why. Some people say it's because when all the dwarfs are here, he's going to take us to a new place... a better place. I don't know if I believe that, but I don't disbelieve it and it sure sounds nice.
DIALOG | P_NAME | But I don't get it, why is Cuchulainn doing this?
DIALOG | Wilmer | I don't get it either, *cough*cough* youngster. But what I do know is that we can't *cough* leave. Least not out the front door. Duergars 'll stop us. They're his lackeys. But some folks say you can get out through the sewer system at the north of town. Me? I'm stayin' put. Tir na nOg's a tough place, but Ol' Wilmer's *cough*cough* tougher.
QUEST | wilmDuergars = 1
QUEST | wilmWhere += 1
QUEST | wilmerSleepCount += 1
GOTO | SLEEPPROGRESS

WHOCUCHU // WHO IS CUCHULAINN?
DIALOG | P_NAME | Who is Cuchulainn?
DIALOG | Wilmer | That's a complicated question youngster. Who *cough*cough* WAS Cuchulainn? One of the greatest heroes in dwarf history, the wielder of the legendary Cyberspear of Destiny and some even say... one of the Apostles of Clispaeth. He fought for a dwarf homeland, for dwarf values and for the rights of all dwarfs all across the galaxy. But that was a long time ago and his legend is fading. Most people don't remember the hero Cuchulainn, who bravely faced every challenger to dwarf independence. Most people know Cuchulainn only as the force corralling dwarfs into Tir na nOg.
DIALOG | P_NAME | But what happened? Why did Cuchulainn change?
DIALOG | Wilmer | Did he change? Is it even the same Cuchulainn? Nobody knows. All we - *cough*cough* - all we know are vague rumors, stories... The Duergars, the TVs, they say Cuchulainn is gathering up all the dwarfs in the galaxies to give us a big surprise. A reward or somethin'. That sounds pretty good to me, but... but is it worth what we have to live now? Does Cuchulainn really have our best interests at heart? Is it even the same Cuchulainn, or something else entirely? A... M_a_l_e_v_o_l_e_n_t_ A._I.?
KNOW | knowCuchu | 3
QUEST | wilmerSleepCount += 1
GOTO | SLEEPPROGRESS

WHOCDWARF // WHO IS THE CYBERDWARF?
DIALOG | P_NAME | Mr. Wilmer... I have these strange memories. Feeling weightless and tired in this dark place for a long time, and then loud noises, explosions I think, and dwarfs pulling me out of this strange machine. I don't remember much, it's kind of a blur but... the dwarfs told me I had to find the Cyberdwarf. It was really important, I have to find the Cyberdwarf no matter what.
DIALOG | Wilmer | Well youngster, the Cyberdwarf is as much a mystery as Cuchulainn. They say he's got something to do with the rebels, those L.O.N.G.I.N.U.S. fellas in the sewers. Maybe he wasn't satisfied with life in Tir na nOg and took off, or maybe he's trying to take on Cuchulainn. Nobody knows much, but the Duergars sure don't like people talkin' about him.
DIALOG | P_NAME | L.O.N.G.I.N.U.S.? Rebels? Who are they and what do they have to do with the Cyberdwarf?
DIALOG | Wilmer | That's what I want to know too, but it *cough*cough* seems like these rebels, L.O.N.G.I.N.U.S., they don't like sittin' around waitin' for Cuchulainn to pick up every dwarf in the galaxy. And I guess I can understand where they're comin' from. Life in Tir na nOg ain't comfortable. Well, heck, it's not even decent. But to go against Cuchulainn like that? I don't know if I'd put my neck out that far.
DIALOG | P_NAME | So you don't know where the Cyberdwarf is then, do you?
DIALOG | Wilmer | Now I - *cough*cough* - ain't the socialite I used to be, but I can tell you this much: the Cyberdwarf ain't in Tir na nOg.
DIALOG | P_NAME | Hmmm. Alright, thank you Mr. Wilmer...
KNOW | knowCdwarf | 1
KNOW | knowLONGINUSTnn | 1
QUEST | wilmerCDwarf = 1
QUEST | wilmerSleepCount += 1
GOTO | WILMERCDWARF

WILMERCDWARF //Wilmer Asks about Cdwarf
QUEST | wilmerCDwarf = 2
DIALOG | Wilmer | Now wait right there, youngster. Before you go off lookin' for some Cyberdwarf and getting tangled up in this whole L.O.N.G.I.N.U.S. thing, you need to know what you're gettin' into. I like you. You're a smart kid and I don't want to see you gettin' into something you can't handle. Now *cough*cough* ol' Mr. Wilmer can take care of himself, but you're still wet behind the ears. I just don't want you getting hurt, you see?
DIALOG | P_NAME | Yeah Mr. Wilmer. I know. But it's something I have to do. What I mean is... this might be the only way I can find out who I am, where I'm from, why I'm here... who I used to be.
DIALOG | Wilmer | Well... maybe you can just be you. It don't mean a thing what I did 60 years ago. Maybe there's a reason you don't know who you are. Why do you want to find the The Cyberdwarf anyway?
CHOICE | Why look for The Cyberdwarf?
REPLY | FINDOUTME | So I can find out who I am.
REPLY | HATECUCHU | Because I hate Cuchulainn.
REPLY | GETOUTOFHERE | I want to get out of here.
REPLY | CDWARFPOWER | I need the Cyberdwarf's power!
REPLY | BBALLREASONS | Basketball-related reasons.
REPLY | SOMETHINGTODO | It's something to do.

FINDOUTME // SO I CAN FIND OUT WHO I AM!
DIALOG | P_NAME | Because, Mr. Wilmer, I need to know who I am. I woke up in the engine room of a strange place with people all around me, people trying to get me, chaos everywhere... I don't know who I am or why I'm here. The only thing I know is that maybe the Cyberdwarf knows something. I don't know who he is or what he knows or why any of this is happening, but maybe he knows who I am, or at least has clues.
DIALOG | Wilmer | I see, youngster. Yeah. Yeah, finding yourself is important. I'm just afraid you might not like what you find is all... and maybe I'm afraid you'll get in over your head. I don't know. I like you, kid.
DIALOG | P_NAME | I'll be okay, Mr. Wilmer. I'm kinda scared... but it's something I have to do.
" +
//TODO: go to #1 and activate identity variable
//TODO: add ramifications of this
"
GOTO | SLEEPPROGRESS

HATECUCHU // BECAUSE I HATE CUCHULAINN!
DIALOG | P_NAME | Because I want payback. Cuchulainn had me in that big machine thing for who knows how long. I coulda been playing vidcons and balling, but I was stuck there. So I'm not gonna stop until Cuchulainn is history.
DIALOG | Wilmer | Those are big words, youngster. Big, dangerous words. I'm not going to stop you. I'm not sure I could stop you, but I want you to know you're up against something bigger than us all. I like you, kid so... so just be safe, okay?
DIALOG | P_NAME | Yeah Mr. Wilmer. I'll be safe, I promise...
" +
//TODO: go to #1 and activate revenge variable
//TODO: add ramifications of this
"
GOTO | SLEEPPROGRESS

GETOUTOFHERE // I WANT TO GET OUT OF HERE!
DIALOG | P_NAME | No offense, Mr. Wilmer, but this place is pretty boring. No vidcons, no b-ball and heck, the candy's not even that good! If I don't get outta here, I'm gonna go stir crazy!
DIALOG | Wilmer | It's a good pace for ol' *cough*cough* Wilmer here, but they could at least have a Friday night bingo going. You're a youngster, you need to be out there seeing the world. I understand.
DIALOG | P_NAME | Thanks, Mr. Wilmer!
" +
//TODO: add ramifications of this
//TODO: go to #1 and activate home variable
"
GOTO | SLEEPPROGRESS

CDWARFPOWER // I NEED THE CYBERDWARF'S POWER!
DIALOG | P_NAME | The way those dwarfs talked about him, he's powerful, Mr. Wilmer. And I want that power for myself.
DIALOG | Wilmer | Power can be a dangerous thing, youngster. Look what it did to Cuchulainn... I don't want to see you going down that road, but *cough*cough*... but if it's what you have to do, then I won't stop you. And - *cough*cough* - what do I know? I'm an old man gumming at my butterscotch.
CHOICE | 
REPLY | POLITE | Thank you Mr. Wilmer.
REPLY | RESPONSIBLE | I'll be responsible.
REPLY | POWERMAD | Bwahahaha!

POLITE	//Polite answer.
DIALOG | P_NAME | Thank you, Mr. Wilmer. I'll be okay and I won't forget what you said.
" +
//TODO: add more stuff to this
//TODO: add ramifications of this
//TODO: go to #1 and activate home variable
"
GOTO | SLEEPPROGRESS

REPSONSIBLE //Responsible answer.
DIALOG | P_NAME | You don't need to worry about me, Mr. Wilmer. I can handle myself. I'll be responsible, I promise.
" +
//TODO: add more stuff to this
//TODO: add ramifications of this
//TODO: go to #1 and activate home variable
"
GOTO | SLEEPPROGRESS

POWERMAD //Power-mad answer.
DIALOG | P_NAME = s_port_hoopzSmirk | M'bwahahahaha!
" +
//TODO: add more stuff to this
//TODO: add ramifications of this
//TODO: go to #1 and activate home variable
"
GOTO | SLEEPPROGRESS

BBALLREASONS // BASKETBALL-RELATED REASONS!
DIALOG | P_NAME | I have explicit basketball-related reasons. Coaches, refs, dribbling, that sort of thing.
DIALOG | Wilmer | Basketball? You mean the sport? I... I don't even follow you, youngster, but... but I'll respect your choice. I'm sorry if it came off like I was trying to stop you. Just do what you feel like you have to do.
DIALOG | P_NAME | Thanks Mr. Wilmer... I will...
" +
//TODO: add ramifications of this
//TODO: go to #1 and activate basketball variable
"
GOTO | SLEEPPROGRESS

SOMETHINGTODO // IT'S SOMETHING TO DO!
DIALOG | P_NAME | I don't know, it seems like something to do. I don't have anything going on.
DIALOG | Wilmer | Is that it?
DIALOG | P_NAME | Yeah, I guess so.
DIALOG | Wilmer | I... I see. Well be careful out there, youngster. I can't stop you.
DIALOG | P_NAME | Thanks.
" +
//TODO: add ramifications for this
//TODO: go to #1 and activate some kind of ambivalence variable
"
GOTO | SLEEPPROGRESS

TNNESCAPE //HOW DO I GET OUT OF TIR NA nOg?
DIALOG | P_NAME | Do you know how I can get out of Tir na nOg, Mr. Wilmer?
DIALOG | Wilmer | Well, I don't know for sure. I don't even know what's out there beyond Tir na nOg, but there must be something, cuz I know the rebels are always goin' back and forth. Now I guess there's a lead. You might try asking the rebels for help with that.
DIALOG | P_NAME | Okay, thanks Mr. Wilmer.
DIALOG | Wilmer | Now this is real dangerous, youngster, but you could probably get out through the sewers too. I see rebels goin' in and out of the sewers every once in a while. I wouldn't go in there if you gave me a bushel of butterscotches, but if it's what you're dead set on, I'm not gonna stop you. Just know that as dangerous as the streets of Tir na nOg are, the sewers are even worse.
QUEST | wilmEscape == 2
QUEST | wilmerSleepCount += 1
GOTO | SLEEPPROGRESS
I like to party!

WHATTODO // What's there to do around here?
DIALOG | P_NAME | Hey Mr. Wilmer, this place seems kinda boring. What is there to do around here?
DIALOG | Wilmer | Hmm, that's a good question. I guess that depends on what you're interested in. What do you like?
QUEST | wilmEscape == 1
CHOICE | What you into?
REPLY | INTOBBALL | I'm into b-ball.
REPLY | INTOVIDCONS | I like vidcons.
REPLY | INTOQUESTS | I like quests.
REPLY | INTOPARTY | I like to party.

INTOBBALL //Into b-ball
DIALOG | P_NAME | I'm into b-ball. Just b-ball.
DIALOG | Wilmer | Well, there is a basketball court a ways north of here but the ol' Blueskins . You should talk to that lass Uschi about it, she's a *cough*cough* whippersnapper about your age, maybe she can help you fix it up.
GOTO | SLEEPPROGRESS

INTOVIDCONS //Vidcons
DIALOG | P_NAME | I guess I'm into vidcons. I really like RPGs, actually. My favorite series is Hyperborea no Legends. Oh man, did you ever play Hyberborea IX, the part where Klaaust Mitsu-
DIALOG | Wilmer | Slow down! Slow down! Ol' Wilmer can barely follow what you're talking about! Bingo and canasta are more my speed. I'm sure there are vidcons around here, just ask around.
GOTO | SLEEPPROGRESS

INTOQUESTS //Quests
DIALOG | P_NAME | I'm into quests. Doing quests, receiving quests, finding quests. That kinda thing.
//Haven't done the Wilmer eviction stuff yet.
IF wilmerEvict == 1 | DIALOG | Wilmer | Quests, huh? Well don't forget to renew my mortgage or else I'm outta here! You should do that before you start rooting around for /'quests/'. This is Tir na nOg, for Pete's sake! Everyone here needs help with something! So help me with my mortgage before you bother with anyone else!
IF wilmerEvict == 0 | DIALOG | Wilmer | Quests, huh? Well this is Tir na nOg so I'd say just about everyone needs a hand. I don't get out too much these days, but I think that knucklehead Eric is looking for a job, if you can consider that a quest. There are people all over the place who need help, just poke your head around.
GOTO | SLEEPPROGRESS

INTOPARTY //Partying
DIALOG | P_NAME = s_port_hoopzHappy | I like to party!
DIALOG | Wilmer | I used to be a real party man myself back before I busted my hip. Oooh, I could jitterbug like nobody's business... well, I guess if you want to party, you could always head over to the warehouse district west of here. I hear there's some kind of /'Booty Bass/' contest going on...
GOTO | SLEEPPROGRESS

WHOAREDUERGARS // WHO ARE THE DUERGARS?
DIALOG | P_NAME | Mr. Wilmer, who are the Duergars? Aren't they dwarfs too?
DIALOG | Wilmer | Well, they don't make life easy, that's for sure. And yes, the Duergars are dwarfs too. They're working for Cuchulainn, his henchmen I guess... I don't know for sure. They *cough*cough* police Tir na nOg. I don't know why, but they've sure got a mean streak in 'em.
DIALOG | P_NAME | Yeah, I've seen that for myself. But why do they treat everyone so bad?
" +
//TODO: add in some GENIE references
"
DIALOG | Wilmer | It's just their nature, I suppose. They're cruel and there's nothing we can do about it. Maybe life in Tir na nOg wouldn't be so bad if it weren't for them, but we can't do anything about it. I guess it's why dwarfs join those L.O.N.G.I.N.U.S. rebels. And I guess I don't blame 'em.
DIALOG | P_NAME | L.O.N.G.I.N.U.S. huh...
KNOW | knowLONGINUSTnn | 1
QUEST | wilmDuergars = 2
GOTO | SLEEPPROGRESS

WHOAREDWARFS // WHO ARE THE DWARFS?
DIALOG | P_NAME | Um, this is going to sound kind of strange I guess but... who are dwarfs?
DIALOG | Wilmer | Dwarfs? Haha, now that's a question. I'd need days to give you a good answer, but I'll sum it up for you. We're not the strongest or the brightest, the bravest or the wisest, but we're a kind and honest people. We love fruits and gems and opals and goblets. We don't like to fight, we keep to ourselves and we scare easy. But we're good people. And that's what matters.
QUEST | wilmDuergars = 1
GOTO | SLEEPPROGRESS

GOODBYE // GOODBYE
DIALOG | P_NAME | I think I'm going to be leaving Tir na nOg soon, Mr. Wilmer. I just wanted to thank you for taking care of me and giving me a home. It's been fun, I mean, I don't want to leave, but...
DIALOG | Wilmer | Enough of that! You've been a big help around here, but youngsters like you can't hang around old-timers like me all the time. Sure I'll be a little lonely, but there's a lot for you to see out there! Go out there and show the world what you've got!
DIALOG | P_NAME | Th-thanks Mr. Wilmer. I guess this is goodbye then...
DIALOG | Wilmer | Just remember to come by again when your travels are over. I've got a lot of old dwarf stories I never told you.
QUEST | wilmerGoodbye = 1
EXIT |

SLEEPPROGRESS
IF wilmerSleepCount == 3 | GOTO | SLEEP03
IF wilmerSleepCount == 2 | GOTO | SLEEP02 
IF wilmerSleepCount == 1 | GOTO | SLEEP01
IF wilmerSleepCount == 0 | GOTO | SLEEP00

SLEEP00
DIALOG | Wilmer | 
QUEST | wilmerSleepCount += 1
GOTO | QUESTIONS

SLEEP01
DIALOG | Wilmer | *Yaaaaaaaawn* My eyes are gettin' a little heavy, youngster. I think it's almost time for old man Wilmer to take a nap. Was there something else?
QUEST | wilmerSleepCount += 1
GOTO | QUESTIONS

SLEEP02
DIALOG | Wilmer | So anyway, the point is... zzz... ZZZ... uh, what's that?! I think I dozed off there for a minute. Was there something else you wanted, youngster?
QUEST | wilmerSleepCount += 1
GOTO | QUESTIONS

SLEEP03
DIALOG | Wilmer | And by the way, youngster... I wanted to... zzzZZZzzz... salt water taffy... zzzZZZzzz...
DIALOG | P_NAME | Uh, Mr. Wilmer? Mr. Wilmer?
WAIT  | 0.5
EVENT | o_wilmer01 | 0
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzHappy | (Aww, he fell asleep. The conversation must have gotten to him. Well I guess I'll be on my way. I'll check back in half an hour or so...)
QUEST | wilmerSleep = 1
ClockTime | event | wilmerSleep | 0 | 30
EXIT |
        
GOVSLEEP //Wilmer is asleep you are the Governor
DIALOG | Wilmer | Zzz... butterscotch... maple nut goodies... NECCO wafers... zzz...
DIALOG | Governor Elagabalus | (Mr. Wilmer is sleeping... I don't want to wake him up... Especially when I look like this.)
EXIT |

GOVAWAKE // Wilmer is awake, you are the Governor
DIALOG | Wilmer | Oh my, you must be the new governor. Your shining suit... it radiates such authority. I am yours to command, my liege!
DIALOG | Governor Elagabalus | Uh, rest easy, Wilm- I mean citizen. I, the governor, was just about to leave. Farewell.
EXIT |

GOVPARDON //Took care of Wilmer's mortgage as governor.
DIALOG | P_NAME = s_port_hoopzHappy | Mr. Wilmer! I heard the good news, you've got your house back!
DIALOG | Wilmer | Yessiree, I sure did! I didn't catch the new governor's speech, but apparently he took pity on an old man and decided to give me back the only thing I had left!
DIALOG | P_NAME | I'm glad to hear that, Mr. Wilmer. I was pretty worried to be honest.
DIALOG | Wilmer | Well you should've been! You're the one who got me in that mess to begin with! All that *cough*cough* smog and grime out there in the streets of Tir na nOg couldn't have been good for ol' Mr. Wilmer... but... but I've got my bungalow back and that's all that matters. Let's let bygones be bygones and just forget about it, X1. You're a good kid, I'm sure you learned a good lesson from it! Now was there something you wanted?
QUEST | wilmerEvict = 7
GOTO | QUESTIONS

EVICTPAID //Took care of Wilmer's mortgage by waiting at the office.
DIALOG | P_NAME | Hey, Mr. Wilmer! I took care of your mortgage, you're good to stay here for another 30 years!
DIALOG | Wilmer | I - *cough*cough* - I knew you'd pull through! Now that wasn't so hard, was it?
DIALOG | P_NAME | Nah, it wasn't too bad, just some really long, slow lines. I was kinda afraid that I wouldn't make it in time, but I guess I did.
DIALOG | Wilmer | Well you did, and I can't thank you enough! I can't handle the lines and the crowds like I used to. Now, was there something ol' Wilmer can do for you?
QUEST | wilmerEvict = 5
GOTO | QUESTIONS

WILMER01
DIALOG | P_NAME | Mr. Wilmer, thank you for taking care of me. I... well, this is all kind of overwhelming for me. I know you've done a lot for me already but... but could I ask you a few questions?
DIALOG | Wilmer | That's *cough cough*... that's what I'm here for, youngster. Ol' Wilmer's got nothin' goin' on. Now tell me, what can I *cough* do for you?
DIALOG | P_NAME | Well...
GOTO | QUESTIONS

SLEEP // Wilmer mutters in his sleep //
IF wilmerMutter == 3 | DIALOG | Wilmer | Zzz... jelly sweets...
IF wilmerMutter == 2 | DIALOG | Wilmer | Zzz... NECCO wafers... 
IF wilmerMutter == 1 | DIALOG | Wilmer | Zzz... maple nut goodies...
IF wilmerMutter == 0 | DIALOG | Wilmer | Zzz... butterscotch...
QUEST | wilmerMutter += 1
IF wilmerMutter == 4 | QUEST | wilmerMutter = 0
EXIT | 

GOODBYE // Say goodbye to sleeping Wilmer after his mortgage is OK //
IF wilmerGoodbye == 1 | GOTO | GOODBYEAGAIN
DIALOG | P_NAME | (Mr. Wilmer's sleeping so peacefully, I shouldn't wake him up...)
WAIT | 0.75
DIALOG | P_NAME | ... in case I don't get the chance to tell you this when you're awake, goodbye Mr. Wilmer. Thank you for taking care of me.
QUEST | wilmerGoodbye = 1

GOODBYEAGAIN // Second time //
DIALOG | P_NAME | (Mr. Wilmer's sleeping so peacefully, I shouldn't wake him up... Goodbye again, Mr. Wilmer.)                    
"
/*
 // Talk to Wilmer again after you've said your goodbyes //
if (scr_quest_get_state("wilmerGoodbye") == 1)
DIALOG | Wilmer | Hm? What's that? *cough*... *hack*... that you, " + P_NAME + "? You're still here? I thought you were *hack*... *cough*... hitting the road, leaving Ol' Wilmer in the dust! What can I do for you? 

//Time = 2
DIALOG | Wilmer | *Cough*... *cough*... ah, there you are, youngster. I was beginning to wonder where you'd gone off to. What kind of trouble are you getting yourself into?
DIALOG | P_NAME | No trouble...! I hope... but I did want to ask you something if you have the time...

DIALOG | Wilmer | *Cough*... *cough*... *hack*... X1, it's... *cough*... it's good to see you again. I was starting to think you'd taken off without saying goodbye to ol' man Wilmer!
DIALOG | P_NAME | Mr. Wilmer, that cough sounds pretty serious! Maybe you should visit a doctor about it.
DIALOG | Wilmer | Awww, it ain't nothin', kid. Ol' Wilmer's not gettin' any younger and there ain't nothin' a few cough drops could do for me. You get old, kid. We all do.
DIALOG | P_NAME | But...
DIALOG | Wilmer | But nothin'! 'sides, I ain't goin' up to the clinic just to have Dr. Tatijana tell me I need to watch my diet. They won't NEVER take my butterscotch from me. They'll have to pry 'em from my cold, dead hands. But enough of that. What can I do for you, youngster?
/*
// CUCHULAINN IS MY DAD!
with (scr_event_build_add_choice(cyberdwarf, "Cuchulainn is my dad."))
DIALOG | P_NAME | This is just a hunch, but I've got a feeling Cuchulainn's my dad. Call it intuition.
DIALOG | Wilmer | ...is that something you really believe?
DIALOG | P_NAME | It's not really something you believe. It's something you feel. I just feel like Cuchulainn is my dad.
DIALOG | Wilmer | Alright youngster. I think I understand. Or maybe I don't, but if it's that important to you, I'm not gonna stop you.
DIALOG | P_NAME | Thank you, Mr. Wilmer...
//TODO: go to #1 and activate cuchulainn dad variable

// THE CYBERDWARF IS MY DAD!
with (scr_event_build_add_choice(cyberdwarf, "The Cyberdwarf is my dad."))
DIALOG | P_NAME | This is just a hunch, but I've got a feeling Cyberdwarf's my dad. Call it intuition.
DIALOG | Wilmer | Your father? But how do you know?
DIALOG | P_NAME | I don't know. It's not really something you know or believe, it's more something you feel. I just FEEL that I have this connection with the Cyberdwarf that goes beyond mere acquaintance. I just FEEL that he's my father.
DIALOG | Wilmer | I see. I don't know if I follow you, youngster, but I'm not going to stop you. Do what you feel like you have to do.
DIALOG | P_NAME | Thank you, Mr. Wilmer...
//TODO: go to #1 and activate cyberdwarf dad variable

DIALOG | P_NAME | I think that's it, Mr. Wilmer. Thanks for the help. And in case I don't get the chance to say it before I leave, goodbye.
DIALOG | Wilmer | Aw, it was nothin' kid. Don't sweat it. And don't you forget me out there! I'm always here to help!
DIALOG | P_NAME | I won't forget you, Mr. Wilmer! Take care!
QUEST | wilmerSleepCount -= 1
EXIT |
