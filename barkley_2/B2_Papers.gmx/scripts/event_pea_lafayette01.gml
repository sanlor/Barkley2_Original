///Getting quests from Lafayette
/*
VARIABLES
duergarOutpost
     0 = haven't started the outpost quest
     1 = initiated the outpost quest
     2 = completed the outpost quest
     3 = cleared the outpost without taking the quest

prisonLiberated
    0 = prison is not liberated
    1 = heard about prison quest but haven't initiated it
    2 = initiated the prison quest
    3 = completed the prison quest
    4 = liberated the prison without taking the quest (getting arrested)

lafayetteState
    0 - not spoken to
    1 - spoken to, did not listen to quest
    2 - accepted the Duergar Outpost Quest, leads to LAFAYETTE questions
    3 - heard about the Hoosegow Quest
    4 - accepted the Hoosegow Quest
	
lafayetteNoteTry
	0 - haven't tried to give him the Dossier
	1 - have at least one note but exited the chooser
	2 - at one point didn't have any notes, if this is the case then you never got the sealed dossier from Lui, therefore Operation Thunderpig fails.

//TODO: add in Lafayette states for Prison Complete
*/
script = "
IF lafayetteState == 3 | GOTO | LAFAYETTE03
IF lafayetteState == 2 | GOTO | LAFAYETTE02
IF lafayetteState == 1 | GOTO | LAFAYETTE01
IF lafayetteState == 0 | GOTO | LAFAYETTE00

SAWTHEOUTPOST
DIALOG | P_NAME | I've peeped the Duergar Outpost... those baddies look both `w1`gnarly and nasty.`w0`
DIALOG | Cpl. Lafayette | Yeah, hence our quandary! `sq`We have orders to make the Duergars go away, scare them off_ or worse..._`rt` I don't like hurting anybody - I'm just a scout - but I'm too afraid what they'd do if they stayed here. 's1'We may all be killed!'s0'
DIALOG | P_NAME | That doesn't sound good. I should at least try to figure out why they're out here. Maybe I can talk them into leaving?
DIALOG | Cpl. Lafayette | Would you? I would hate for anybody else to not be able to climb anymore because of more landmines. There should be laws against landmines.
DIALOG | P_NAME | I agree. I'll see what I can do. Maybe it's time I put some of my own law down... heh.
DIALOG | Cpl. Lafayette | Great! `sq`The first thing you should always do is talk to Compson!`rt` He's our leader, I suppose.
DIALOG | P_NAME | Thanks. I'll let you know what happens.
QUEST | lafayetteState = 2
EXIT | 

PRISONALREADYLIBERATED
DIALOG | Cpl. Lafayette | I would say that you could go complete `sq`Our Most Dangerous Sortie.`rt` But I just received a carrier rat from headquarters that said the Hoosegow has already been liberated by a `w1`powerful young gun'sbraster!`w0`
DIALOG | P_NAME = s_port_hoopzSmirk | Ooh, must have been quite powerful indeed. 
WAIT | 0.5
DIALOG | Cpl. Lafayette | Hmmm... you don't think... Ah well, nary ye mind. Things are looking up around this `kw`Foopba`rt` as of late. `mq`Maybe the rebels are gaining the upperhand?`rt`
EXIT |

OUTPOSTALREADYCLEAR
DIALOG | P_NAME | Oh, I've already taken care of those lousy Duergars. You don't need to worry about them anymore.
DIALOG | Cpl. Lafayette | What? You did?
DIALOG | P_NAME | Yeah, I bumped into them earlier before I got here. You don't need to worry about them anymore. I think they were setting up a camp there, but the camp is `sq`thoroughly destroyed.`rt`
DIALOG | Cpl. Lafayette | Wow! You are the greatest!
CHOICE | Bask in the glory?
REPLY | AINTNOTHIN | Ain't nothin' but a thing.
REPLY | AINTNOTHINWING | Ain't nothin' but a thing, chicken wing.

AINTNOTHIN
DIALOG | P_NAME = s_port_hoopzSmirk | Of course. It wasn't nothin' but a thing. Duergars are tough customers, for sure... but with my trusty gun's and craftier wit's, I can serve them their `w1`just deserts.`w0`
GOTO | AINTNOTHINCARRYON

AINTNOTHINWING
DIALOG | P_NAME = s_port_hoopzSmirk | Of course. It wasn't nothin' but a thing_ chicken wing. Duergars are tough customers, for sure... but with my trusty gun's and craftier wit's, I can serve them their `w1`just deserts.`w0`
GOTO | AINTNOTHINCARRYON

AINTNOTHINCARRYON
DIALOG | Cpl. Lafayette | Wow, yeah! I should recommend you for a commendation over at headquarters!
DIALOG | P_NAME | Aww, shucks... you don't need to do that. Let's just keep the momentum going! `sq`Is it time for Operation Thunderpig?`rt`
DIALOG | Cpl. Lafayette | Well...
IF prisonLiberated == 2 | GOTO | PRISONALREADYLIBERATED
GOTO | MOSTDANGEROUSMISSION

OUTPOSTDESTROYED
DIALOG | P_NAME = s_port_hoopzHappy | Actually, I took care of those Duergars for you.
DIALOG | Cpl. Lafayette | What?! You did?
DIALOG | P_NAME | Yep, you don't need to worry about them anymore. I think they were setting up their own `kw`Foopba`rt` there, but the camp is now `sq`completely destroyed.`rt`
DIALOG | Cpl. Lafayette | Wow! That's great! Headquarters is going to `w1`flip their lid.`w0` Compson always says that these missions are suicide orders. But you look very alive and very well. How did you do it?
" +
//TODO: if there are different ways to beat them, add that conditional here
"
DIALOG | P_NAME = s_port_hoopzSmirk | Well, let's just say I made it worth their while to clear the heck out. Those Duergars are tough nuts to crack, but I've their number.
DIALOG | Cpl. Lafayette | Wow, yeah!
IF prisonLiberated == 3 | GOTO | PRISONALREADYLIBERATED
GOTO | MOSTDANGEROUSMISSION

MOSTDANGEROUSMISSION
DIALOG | Cpl. Lafayette | I just want to make sure._ It's 's1'really dangerous's0', so if you can't handle it, nary ye mind.
CHOICE | /'The Most Dangerous Mission?/'
REPLY | TELLMEMISSION | I'm ready for the Hoosegow!
REPLY | DELAYTHEMISSION | I gotta jet, but keep that mission for me later.

TELLMEMISSION
DIALOG | P_NAME | Sure. Hit me with the details again.
GOTO | MISSIONDETAILS

MISSIONDETAILS
DIALOG | Cpl. Lafayette | Great! Wonderful! Ok, so here goes.
DIALOG | Cpl. Lafayette | There are a whole bunch of fellow rebels who have been `sq`stuck in The Hoosegow in the foothills near the Wasteland.`rt` We have orders to break them all out! I'm sure the Duergars are being super crappy to them in there. I know if I was in `kw`The Hoosegow,`rt` I'd be hoping every day that somebody would come and boost me out. Problem is... us /'Foopba/' rebels here don't really have_ `w1`the chops`w0` to pull off a `sq`Hoosegow Break.`rt`
KNOW | knowHoosegow | 1
DIALOG | P_NAME | I don't know. Is there a way I could sneak in that you know about?
DIALOG | Cpl. Lafayette | Me? Hmmmm... Maybe you could disguise yourself. You look pretty different from most people, and duergars rely a lot on their sense of smell to identify people. Maybe you could trick them somehow?
DIALOG | P_NAME | Hmmm...
DIALOG | Cpl. Lafayette | `sq`You could talk more with Compson about it! You should always check with Compson.`rt` He's the big boss, the big cheese, he's in charge of everything. Compson always knows!
DIALOG | P_NAME | Okay, I'll talk to Compson, thanks.
EXIT |

DELAYTHEMISSION
DIALOG | P_NAME | Well I gotta run right now, but can we talk later about this sortie?
DIALOG | Cpl. Lafayette | Okay sure! Just let me know!
QUEST | prisonLiberated = 1
QUEST | lafayetteState = 3
EXIT |

LAFAYETTE03
DIALOG | Cpl. Lafayette | Oh, hi. Did you think any more about my hoosegow break idea? I know it's kind of a crazy idea, but I think it'll work `w1`like gangbusters`w0`. I'd do it if I wasn't...
CHOICE | So, what do you think?
REPLY | MISSIONDETAILS | Tell me more.
REPLY | DELAYTHEMISSION | Tell me naught.


LAFAYETTE02
DIALOG | Cpl. Lafayette | Hey, P_NAME_S. How's the work on that Outpost?
IF duergarOutpost == 2 | GOTO | OUTPOSTDESTROYED
DIALOG | P_NAME | Still working on it, but I have a few questions.
DIALOG | Cpl. Lafayette | Oh okay, shoot!
GOTO | LAFAYETTECHOICE

LAFAYETTE01
DIALOG | Cpl. Lafayette | Hey there! Did you look into those duergars?
IF duergarOutpost == 2 | GOTO | OUTPOSTDESTROYED
DIALOG | P_NAME | Still working on it.
DIALOG | Cpl. Lafayette | Oh... Well you don't have to if you don't want to. I just thought with your legs and your gun's you'd be a good fit for the mission. `sq`Talk to Compson if you have any questions.`rt` He knows way more than me, but I'll try to help if you need it.
GOTO | LAFAYETTECHOICE

LAFAYETTE00
DIALOG | Cpl. Lafayette | Hello! I'm Lafayette! Who are you? Where did you come from?
DIALOG | P_NAME | I'm P_NAME_F. I'm just a `kw`wayward young traveler`rt`,_ I guess.
DIALOG | Cpl. Lafayette | That sounds interesting! Did you climb through the mountains?
DIALOG | P_NAME | Not too much climbing. I walked a lot.
DIALOG | Cpl. Lafayette | You should try climbing sometime. It's really fun. I'm a scout, so I used to climb all sorts of things. Use to really `w1`attack the crag.`w0`
DIALOG | P_NAME | What happened to you? Why-_uh- can't you climb anymore?
DIALOG | Cpl. Lafayette | One of those vile Duergar brutes knew I was scouting this one area of the Peak so he put a landmine right on my route. I didn't see it..._ Now I can't climb so good anymore.
QUEST | lafayetteState = 1
CHOICE | Uh... waddya say to that?
REPLY | EMPATHY_BBALL | I can empathize... (bball)
REPLY | EMPATHY_VIDCON | I can empathize... (vidcon)
REPLY | BOTCHJOB | Sounds like you botched it.

EMPATHY_BBALL
DIALOG | P_NAME | I bet you were great at climbing. I like basketball probably as much as you like to climb. I'd be really sad if the Duergars did something to take it away from me.
" +
//TODO: ROUNDMOUND + BASKETBALL?
"
DIALOG | Cpl. Lafayette | Yeah, you understand what it's like! Even though I can't get around, I'm always thinking about cool stuff to do in these mountains.
GOTO | LAFAYETTECONT

EMPATHY_VIDCON
DIALOG | P_NAME | I bet you were great at climbing. I like conquering vidcons probably as much as you like to climb. I'd be really sad if the Duergars... (or parents) did something to take them away from me.
" +
//TODO: ROUNDMOUND + VIDCON?
"
DIALOG | Cpl. Lafayette | Yeah, you understand what it's like! Even though I can't get around, I'm always thinking about cool stuff to do in these mountains.
GOTO | LAFAYETTECONT

BOTCHJOB
DIALOG | P_NAME | You know what they say: Look before you leap, and scout before you scale. I always assume there is a landmine around every corner. I guess that's probably why I still have my legs.
DIALOG | Cpl. Lafayette | Oh... you didn't have to be so mean.
" +
//TODO: RM Points Loss because of being mean?
"
GOTO | LAFAYETTECONT

LAFAYETTECONT
WAIT | 0.5
DIALOG | Cpl. Lafayette | Well, anyways... we're part of the L.O.N.G.I.N.U.S. Resistance. They call this a `kw`Forward Operating Base,`rt`_ or `kw`/'FoopBa/'`rt` for short. We're supposed to run all kind of reconnaissance missions from here but `sq`we're kinda on lock-down with those Duergars in that Outpost close by, we can't really get anything done.`rt`
KNOW | knowDuergarCamp | 1
IF duergarOutpost == 3 | GOTO | OUTPOSTALREADYCLEAR
DIALOG | P_NAME | On lockdown, huh?
DIALOG | Cpl. Lafayette | Yup..._ it's quite a `s1`quandary.`s0` We can't make any progress unless we can get around those Duergars.
WAIT | 0.25
DIALOG | Cpl. Lafayette | Did you want to talk about something else?
GOTO | LAFAYETTECHOICE

LAFAYETTECHOICE
CHOICE | What to talk about?
IF operationThunderpig == 3 | IF lafayetteNoteTry == 0 | REPLY | DOSSIER_01 | Oh! I have something for a Lafayette!
IF operationThunderpig == 3 | IF lafayetteNoteTry == 1 | REPLY | DOSSIER_02 | I think I have something for you.
IF prisonLiberated == 1 | REPLY | READYFORPRISON | Tell me more about the Hoosegow.
IF knowDuergarCamp == 1 | REPLY | WHEREISOUTPOST | Where is this Duergar Outpost?
IF knowDuergarCamp >= 2 | REPLY | SAWTHEOUTPOST | I've peeped that outpost, what now?
IF duegarOutpost == 2 | REPLY | OUTPOSTCLEARED | I cleared out that Duergar Outpost.
IF knowMagus <= 1 | REPLY | LOOKINGFORCYBERDWARF | Seen any Cyberdwarfs around here?
REPLY | IMBUSY | Can't right now.

READYFORPRISON
DIALOG | P_NAME | I'm ready to hear about that `sq`Hoosegow Mission`rt` now.
GOTO | MISSIONDETAILS

IMBUSY
DIALOG | P_NAME | I'm kinda busy. Maybe later?
DIALOG | Cpl. Lafayette | Oh, ok. I understand. See ya, P_NAME_S.
EXIT | 

WHEREISOUTPOST
DIALOG | P_NAME | So where is this Outpost?
" +
//TODO: add in proper directions to the Outpost... it should be close by, and a little forward up above the LONGINUS Hideout
"
DIALOG | Cpl. Lafayette | Well, `sq`keep walking up the path that led you here, you can't miss it.`rt`
DIALOG | P_NAME | Okay... and what do you think I should do when I get there?
DIALOG | Cpl. Lafayette | Well they shouldn't attack you outright, they only really go after us dwarfs, and doubly so if they see us in green camoflage. `sq`Maybe just talk to them and see if they'll leave?`rt`
DIALOG | P_NAME | Uh, that seems like an easy way to get myself shot.
DIALOG | Cpl. Lafayette | Not as easy as wearing the L.O.N.G.I.N.U.S. badge. Plus aren't you,_-uh- not a dwarf?
QUEST | duergarOutpost = 1
QUEST | lafayetteState = 2
CHOICE | Are you a dwarf?
REPLY | IMADWARF | I'm a dwarf!
REPLY | IMSOMETHINGELSE | I'm something else!

IMADWARF
DIALOG | P_NAME = s_port_hoopzSurprise | No way! I'm a dwarf, through and through! I've just got a little more height, than the normal dwarf... and maybe a lot more melanin. 
DIALOG | Cpl. Lafayette | That's okay. If you think you are a dwarf than you're a dwarf. I don't see why not.
DIALOG | P_NAME = s_port_hoopzHappy | You think so? Thanks Lafayette. 
DIALOG | Cpl. Lafayette | No problem, my dwarfen brethren.
" +
//TODO: ROUNDMOUND - add something about dwarfs?
"
DIALOG | P_NAME = s_port_hoopzSmirk | Now... `sq`time to find this outpost and see what I can do about these pesky Duergars.`rt`
DIALOG | Cpl. Lafayette | Good luck, P_NAME_S!
EXIT |

IMSOMETHINGELSE
DIALOG | P_NAME = s_port_hoopzSad | I-_I think I'm something else... but I don't know what.
DIALOG | Cpl. Lafayette | I guess we are all trying to figure out what we are. I always thought I was a scout..._ but now I'm looking to be something else. Hopefully something of worth.
DIALOG | P_NAME = s_port_hoopzSad | Yeah, that's all we can strive for, Lafayette.
WAIT | 0.5 
" +
//TODO: ROUNDMOUND - add something about dwarfs?
"
DIALOG | P_NAME = s_port_hoopzSmirk | Now... time to find this outpost and see what I can do about these pesky Duergars.
DIALOG | Cpl. Lafayette | Good luck, P_NAME_S!
EXIT |

LOOKINGFORCYBERDWARF
DIALOG | P_NAME | I'm searching for my destiny... apparently `mq`The Cyberdwarf`rt` can help find it.
DIALOG | Cpl. Lafayette | Cyber-who?_ Oh you mean the guy who's supposed to be giving us orders?
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! I think that's the one! Do you know where he is?
WAIT | 0.5
IF operationThunderpig >= 4 | DIALOG | Cpl. Lafayette | Actually no I don't. Besides that `kw`Top Secret Dossier`rt` you brought me,  we only get communication through carrier rats and normally the paper is mostly chewed up. We're kinda flying blind here.
IF operationThunderpig <= 3 | DIALOG | Cpl. Lafayette | Actually no I don't. We get all our communication through carrier rats and normally the paper is mostly chewed through. We're kinda flying blind here.
DIALOG | Cpl. Lafayette | Although I can tell you one thing- `mq`at the top of Gilbert's Peak they say there is a wise Magus`rt` with mystical knowledge so vast that travelers brave the mountains just to get a minute of audience. She was called `kw`Famous Magus`rt` if I remember correctly. `mq`Maybe that's the Cyberdwarf you are looking for?`rt`
DIALOG | P_NAME | Hmm, I am pretty sure Cyberdwarf is a guy, but hey, it's the sixties! Gender labels are pretty antiquated.
DIALOG | P_NAME = s_port_hoopzHappy | `mq`Looks like I'm heading up the mountain!`rt`
KNOW | knowMagus | 2
DIALOG | Cpl. Lafayette | Anything else?
GOTO | LAFAYETTECHOICE

DOSSIER_01
DIALOG | P_NAME | Oh! You're Lafayette? I'm supposed to give this to you... now let's see... which one was it?
GOTO | NOTE_CHOOSER

DOSSIER_02
DIALOG | P_NAME | Okay, let me see if I have that thing I was supposed to give you.
GOTO | NOTE_CHOOSER

NOTE_CHOOSER
NOTE | select | Cpl. Lafayette
IF note == exit | GOTO | EXIT_NOTE
IF note == none | GOTO | NO_NOTE
IF note == Top Secret Dossier | GOTO | THUNDERPIG
GOTO | GENERIC_NOTE

EXIT_NOTE
DIALOG | P_NAME | Actually, let me wait on that...
DIALOG | Cpl. Lafayette | Anything else, then?
QUEST | lafayetteNoteTry = 1
GOTO | LAFAYETTECHOICE

NO_NOTE
DIALOG | P_NAME = s_port_hoopzSurprise | Uh oh...
DIALOG | P_NAME = s_port_hoopzSad | I must have_ gotten rid of it. `w1`Shucks.`w0`
DIALOG | Cpl. Lafayette | Aww, that's too bad. I was getting excited. I guess `sq`that's the end of that adventure.`rt` Anything else then?
QUEST | lafayetteNoteTry = 2
DIALOG | P_NAME = s_port_hoopzSad | Man that really bugs me... I'm a `w1`dingus.`w0`
GOTO | LAFAYETTECHOICE

THUNDERPIG
WAIT | 0.5
DIALOG | Cpl. Lafayette | Hmm...
WAIT | 0.5
DIALOG | Cpl. Lafayette | Wowee! This is some juicy intel! `w1`Juiced to the gills!`w0`
DIALOG | P_NAME = s_port_hoopzHappy | Really? What's it say?
DIALOG | Cpl. Lafayette | Well there's a whole slew of neuroshekels in here... and_ it says we in the `kw`FoopBa`rt` need to keep `kw`Operation Thunderpig`rt` going! `w1`Wow..._ Whoah..._ Wow...`w0`
DIALOG | P_NAME | That's it? What are we supposed to do?
DIALOG | Cpl. Lafayette | It says..._ `sq`liberate the Hoosegow.`rt`
SURPRISEAT | o_lafayette01
DIALOG | P_NAME = s_port_hoopzSurprise | `w1`Liberate?`w0` How do we do that?
DIALOG | Cpl. Lafayette | Looks like HQ figured out a way into the Hoosegow through an underwater stream. We're supposed to `sq`access the stream and then swim into the compound and liberate the inmates!`rt` Sounds risky!
WAIT | 0.5
DIALOG | Cpl. Lafayette | I wonder who's gonna actually do this mission?
LOOKAT | o_lafayette01
WAIT | 1.0
DIALOG | P_NAME | Well..._ I think it's pretty obvious that I'm gonna do it, right?
DIALOG | Cpl. Lafayette | Yeah, probably. But `sq`I don't think anything can be done until you get those Duergars out of that encampment on the Peak.
DIALOG | P_NAME | Right... `sq`well I'll do that first then and report back here.`rt`
EXIT |

GENERIC_NOTE
DIALOG | Cpl. Lafayette | I'm not sure what this is... got anything else?
DIALOG | P_NAME | Oh yeah how about this?
GOTO | NOTE_CHOOSER
"

/*
DIALOG | P_NAME | 
DIALOG | Cpl. Lafayette | 
DIALOG | P_NAME | 
DIALOG | Cpl. Lafayette | 
DIALOG | P_NAME | 
DIALOG | Cpl. Lafayette | 
DIALOG | P_NAME | 
DIALOG | Cpl. Lafayette | 
