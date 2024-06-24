///Tatijana the Doctor
/*
Variables
	tatijanaState
		0 - never talked
		1 - talked, haven't told her your Amnesia
		2 - talked, told her your amnesia, now wait 55 minutes until you can advance
		3 - the time period is over, you can talk to her, advances if you've drank grape
		4 - repeating dialog after you've been told about the Transhumanism procedure
		5 - prepping the table, will tell you to leave and come back later
		6 - ready to perform the surgery
*/
script = "
IF body == governor | GOTO | GOVERNOR01
IF tatijanaState == 6 | GOTO | TATIJANA06
IF tatijanaState == 5 | GOTO | TATIJANA05
IF tatijanaState == 4 | GOTO | TATIJANA04
IF tatijanaState == 3 | GOTO | TATIJANA03
IF tatijanaState == 2 | GOTO | TATIJANA02
IF tatijanaState == 1 | GOTO | TATIJANA01
IF tatijanaState == 0 | GOTO | TATIJANA00

GOVERNOR02
DIALOG | Governor Elagabalus | Carry on!
EXIT |

GOVERNOR01
IF tatijanaGov == 1 | GOTO | GOVERNOR02
DIALOG | Dr. Tatijana | You... you're the new Governor, right? I didn't expect to see you here. What brings you to the clinic, Mr. Governor?
DIALOG | Governor Elagabalus | Hello! Hello, good citizen! I'm just doing my neighborhood watch duty and patrolling our great city. Keep an eye out for scofflaws and roustabouts! You never know where they'll turn up. Well, goodbye citizen!
QUEST | tatijanaGov = 1
EXIT |

TATIJANA06
DIALOG | Dr. Tatijana | Alright, everything is ready. Let's begin...
DIALOG | P_NAME | I'm kinda nervous...
DIALOG | Dr. Tatijana | Well it's a big step, both financially and er... morally. Here, drink this.
" +
//TODO: USEAT | o_tatijana01
"
DIALOG | P_NAME | Er, okay...
" +
//TODO: SOUND | glug glug
"
DIALOG | P_NAME | What is it?
DIALOG | Dr. Tatijana | It's a potent tranquilizer and anesthetic. You'll be unconcious in no time.
DIALOG | P_NAME | I don't reall...
" +
//TODO: hoopz passes out onto the floor animation
"
FADE | 1 | 3
WAIT | 3.1
" + 
//TODO: move hoopz into hospital bed, run the second event of Tatijana, where she tells hoopz he is now 20% more CYBER.
"
EXIT |

TATIJANA05
DIALOG | Dr. Tatijana | I'm still preparing the room. Come back in ------.
" +
//TODO: check time
"
EXIT |

TATIJANA04
DIALOG | Dr. Tatijana | Ah the amnesiac, thought more about the procedure?
GOTO | TRANSHUMANISM

TATIJANA03
DIALOG | Dr. Tatijana | You... what was it again... morgellons?
DIALOG | P_NAME | Oh no, not me, I have amnesia.
DIALOG | Dr. Tatijana | Right right, amnesia. Did you get The Grape?
IF knowGrape == 3 | GOTO | DRANKGRAPE
GOTO | NODRANKGRAPE

NODRANKGRAPE
DIALOG | P_NAME | Oh uh, darn I forgot to.
DIALOG | Dr. Tatijana | I see, the amnesia is more pronounced than I thought... we might need to upgrade your gray matter with an SSD or some permanent tape archive...
DIALOG | P_NAME | What do you mean?
DIALOG | Dr. Tatijana | We'll get to that later, come back in an hour, with some Grape in you this time.
DIALOG | P_NAME = s_port_hoopzHappy | You got it!
QUEST | tatijanaState = 2
ClockTime | event | tatijanaState | 3 | 45
EXIT |

DRANKGRAPE
DIALOG | P_NAME | Yeah I got some Grape, no big deal. I drink The Grape all the time.
DIALOG | Dr. Tatijana | And do you remember anything from your past?
DIALOG | P_NAME | Ummm, not really. In fact I kinda felt even more hazy.
DIALOG | Dr. Tatijana | Hmmmm. Must be Cybiotic Interference.
DIALOG | P_NAME = s_port_hoopzSurprise | Cyba-wha?
DIALOG | Dr. Tatijana | Look kid, don't you have WebMD or something? That is just as good as a real doctor, look it up.
DIALOG | P_NAME = s_port_hoopzSad | I don't remember what that is either...
WAIT | 1.0
DIALOG | Dr. Tatijana | Hmmm, alright kid, here listen. Cybiotic Interference. It's when your Biological self conflicts with your Cyberized Enhancements. You know what transhumanism is, right?_ The modification of the body to become something else-something greater.
DIALOG | P_NAME | Yeah, I guess that makes sense.
DIALOG | Dr. Tatijana | It's like this: you stick your fleshy hand in an industrial fan, lose your hand. You get shot in the head, loose some gray matter. No big deal, we just add in some Cybiotic Prosthetics. A new frontal plasticortex for your brain, an AutoClaw for your mangled fingers... bam, you're Transhuman.
DIALOG | P_NAME | Sounds dangerous.
DIALOG | Dr. Tatijana | That's where you're wrong. The danger is in the flesh. That's the stuff that's hard to replicate, hard to grow. Your AutoClaw can be repaired, replaced, and even upgraded. That's why you see so many Dwarfs walking around over fifty percent CYBER. Not in Tir na nOg as much, sure, but Brain City is filled with transhumanistic Dwarfs. Hell, just looking at you_ I can tell you are at least ten to fifteen percent CYBER already.
DIALOG | P_NAME = s_port_hoopzSurprise | I-I am?
DIALOG | Dr. Tatijana | Yeah you probably got cybiotic upgrades when you don't even realize it. You think that's your jaw you are using to chew your candy?_ Wrong, that's a /'Pneumati-Chew,/'_ as common among Dwarfs as a Vidcon Cerebro-link.
DIALOG | P_NAME | I still have a lot to learn.
DIALOG | Dr. Tatijana | These poor Dwarfs have a knack of getting in front of a Duergar's fist so business is booming in Transhumanism. I pull out their damaged body parts and slip in something with a lot less BIO Damage Culverable. I can do the same for you. If you need a boost to your Cyber-Identity, you let me know. It ain't cheap, but it's worth it.
QUEST | knowTranshuman += 1
GOTO | TRANSHUMANISM

TRANSHUMANISM
CHOICE | Interested in the NEXT step?
REPLY | RATES | What are your rates?
REPLY | JERKINS | Can't I just equip a resistant jerkin?
REPLY | LATER | Maybe later, I have to return some videotapes.

JERKINS
DIALOG | P_NAME | Can't I just equip a CYBER Resistant jerkin?
DIALOG | Dr. Tatijana | Resistance isn't the only story. Whatever damage goes through the jerkin is exponentially affected by your transhumanism. Not much good a BIO Bullet can do to a 100% CYBER Fullbot Dwarf.
DIALOG | P_NAME | Oh... so this whole damage thing is a lot more complicated than it looks on the surface...
DIALOG | Dr. Tatijana | Way more complicated, but hey, that's science. We're just gonna have to deal with it.
DIALOG | P_NAME | Gotcha.
QUEST | knowJerkins += 1
QUEST | knowTranshuman += 1
GOTO | TRANSHUMANISM

RATES
DIALOG | P_NAME | What are your rates?
DIALOG | Dr. Tatijana | Well it's @money_tatijana20@ neuro-shekels for a general 20% boost in Cyberization.  That means you'll be affected much less by Biotic Forces.
IF player.deaths.total >= 3 | DIALOG | Dr. Tatijana | From the smell of you I can tell you've been lingering in the Sewers... lots of BIO Damage down there. Some transhumanism will help you.
IF player.deaths.total < 3 | DIALOG | Dr. Tatijana | Well it doesn't smell like you've been in the Sewers all that much, but let me tell you: the baddies down there, all BIO Damage. That means tweaking your transhumanism towards the /'Cybersyde/' is a good strategy. The less meat your have on your body, they less those poison darts of the Fiscians can hurt you y'know?
DIALOG | P_NAME | I didn't know that would have such an effect...
DIALOG | Dr. Tatijana | After my surgeries, BIO Damage will slide off you like postnasal-drip on Teflon. What do you say?
BREAKOUT | add | money
IF money >= @money_tatijana20@ | GOTO | SURGERYCHOICE
GOTO | SURGERYPOOR

SURGERYPOOR
DIALOG | P_NAME | Hmmm. Doesn't look like I have the scratch...
BREAKOUT | clear
DIALOG | Dr. Tatijana | Not many do. I'll be here if your situation changes.
DIALOG | P_NAME | Okay thanks, Doc.
QUEST | tatijanaState = 4
EXIT |

SURGERYCHOICE
CHOICE | What don't you like about yourself?
REPLY | COMMENCESURGERY | I would like to get more of that metal in me!
REPLY | THINKITOVER | I need to wait and think this over.

COMMENCESURGERY
DIALOG | P_NAME | I think I'm ready for the surgery... I want shed my old Biotic form and achieve metamorphosis to a state of Cyberization.
QUEST | money -= @money_tatijana20@
DIALOG | Dr. Tatijana | You're ready, huh? I'll get the operating room ready. Come back in one hour. In that time don't eat or drink anything. I need to do this while the patient is on an empty stomach.
BREAKOUT | clear
DIALOG | P_NAME | Okay, so no candy?
DIALOG | Dr. Tatijana | No candy, no nothing.
DIALOG | P_NAME | Okay, I'll be back!
QUEST | tatijanaState = 5
ClockTime | event | tatijanaState | 6 | 45
EXIT |

THINKITOVER
DIALOG | P_NAME | I think I need to think this over. It's a big step.
BREAKOUT | clear
DIALOG | Dr. Tatijana | That's fine. I'll be here.
EXIT |

TATIJANA02
DIALOG | Dr. Tatijana | Most people don't like to hang around a clinic... what makes you different?
DIALOG | P_NAME | Oh... um nothing I think I'm going to go.
DIALOG | Dr. Tatijana | Get some of The Grape and see me in _____
" + 
//TODO: check time
"
DIALOG | P_NAME | Ok!
EXIT |

TATIJANA01
DIALOG | Dr. Tatijana | Gonna tell me what's wrong this time?
DIALOG | P_NAME | Oh uh right...
GOTO | AILMENT

TATIJANA00
DIALOG | Dr. Tatijana | What's your problem?
DIALOG | P_NAME | Oh sorry I didn't know I couldn't be here.
DIALOG | Dr. Tatijana | You can... it's a clinic. What's your problem?
DIALOG | P_NAME | Oh, I see...
QUEST | tatijanaState = 1
GOTO | AILMENT

AILMENT
CHOICE | What seems to the be problem?
REPLY | AMNESIA | Amnesia.
REPLY | NOTHING | Nothing.

AMNESIA
DIALOG | P_NAME | I don't know who I am or where I came from... I think I might have been born out of an egg.
WAIT | 0.5
DIALOG | Dr. Tatijana | Hmmm...
WAIT | 1.0
DIALOG | Dr. Tatijana | Grapes, twice a day.
DIALOG | P_NAME | Grapes?
DIALOG | Dr. Tatijana | Yes, grapes.
IF knowGrape >= 3 | GOTO | DRANKGRAPE
DIALOG | P_NAME | How are grapes going to help me?
DIALOG | Dr. Tatijana | They contain an abundance of vitamins and plenty of other important things... tannins maybe... stuff like that. You aren't allergic are you?
DIALOG | P_NAME | To grapes?
DIALOG | Dr. Tatijana | Allegic to anything... grapes, Garlics, slamicite?
DIALOG | P_NAME | Um I want to say... diabetes?
DIALOG | Dr. Tatijana | Hmmm...
WAIT | 1.0
DIALOG | Dr. Tatijana | Grapes, thrice a day._ How old are you?
DIALOG | P_NAME | I don't know, I have amnesia, remember?
DIALOG | Dr. Tatijana | Good. Come and see me in an hour. Until then, get to a bar and drink some of The Grape.
DIALOG | P_NAME | Okay... thanks I guess...
QUEST | tatijanaState = 2
ClockTime | event | tatijanaState | 3 | 55
" +
//TODO: check time
"
EXIT |

NOTHING
DIALOG | P_NAME | Nothing...
DIALOG | Dr. Tatijana | Then why are you here?
DIALOG | P_NAME | I don't know. Bye!
EXIT |
";
