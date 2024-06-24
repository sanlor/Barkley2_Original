/// Amalberga
script = "

IF ericQuest >= 2     | GOTO | ERIC
IF cuthbertState == 0 | GOTO | CUTH0
IF cuthbertState == 1 | GOTO | CUTH1

CUTH0
DIALOG | Cuthbert | You looking for an animal companion? Dog? Cat? Lizard? Goldfish?
QUEST  | cuthbertState = 1 
GOTO   | CUTHCHOICE

CUTH1
DIALOG | Cuthbert | *Sigh* ...It doesn't look too good for the ol' pet shop...
DIALOG | P_NAME   | Hey, cheer up mister. You'll pull through.
DIALOG | Cuthbert | You think so? I don't know about that, youngster. No one seems to be interested in pets around here. I guess they have more urgent thigns to worry about...

CUTHCHOICE
CHOICE | Ask about...
IF wilmerEvict == 1 | IF cuthbertHousingDept == 0 | REPLY | MORTGAGE | Where's the Housing Department?
IF cuthbertMount == 0 | IF cuthbertState == 0 | REPLY | MOUNT | Got any sweet mounts?
REPLY | NOINTEREST | Not really interested in pets.

MORTGAGE
DIALOG | P_NAME   | Sorry no pets just now, I'm looking for the Housing Department.
DIALOG | Cuthbert | Housing Department? Well since I can't afford a house and sleep in a dry aquarium here, I don't really know much about housing... I know where the Department of Pet Accountability is. Does that help?
DIALOG | P_NAME   | I don't think he has any pets...
DIALOG | Cuthbert | Nobody here does...\Anyways try the west side of town, it's just housing tenements over here mostly.
DIALOG | P_NAME   | Okay, thanks!
QUEST  | cuthbertHousingDept = 1
QUEST  | knowCuthbert = 1
QUEST  | stateCuthbert = 1

MOUNT
DIALOH | P_NAME   | I'm looking for fast travel options. Particularly with buffs to resistances.
DIALOG | Cuthbert | Uh... I have mostly malnourished goldfish.
DIALOG | P_NAME   | Dang...
DIALOG | Cuthbert | Sigh... I promise I'll let you know if I get some in, kid. It's not easy running a pet store in Tir na Nog, especially when nobody knows this crummy place even exists. All that neon signage was such a waste of money. If only I had somebody to promote the store...
QUEST  | cuthbertMount = 1
QUEST  | knowCuthbert = 1
QUEST  | stateCuthbert = 1

NOINTEREST
DIALOH | P_NAME   | Nope, sorry. Not really interested in pets.
DIALOG | Cuthbert | Sigh... nobody is. It's not easy running a pet store in Tir na Nog, especially when nobody knows this crummy place even exists. All that neon signage was such a waste of money. If only I had somebody to promote the store...
QUEST  | knowCuthbert = 1
QUEST  | stateCuthbert = 1

ERIC
IF ericQuest == 2 | GOTO | ASKJOB
IF ericQuest == 3 | GOTO | AGREEDTOMAKEERICAPPLY
IF ericQuest == 4 | GOTO | AGREEDTOMAKEERICAPPLY
IF ericQuest == 5 | GOTO | RESUMEDONE
IF ericQuest == 6 | GOTO | RESUMEDISLIKE
IF ericQuest == 7 | GOTO | RESUMENEUTRAL
IF ericQuest == 8 | GOTO | RESUMELIKE
IF ericQuest == 9 | GOTO | ERICHIREDNOTHEREYET

ASKJOB
DIALOG | P_NAME   | Hi, so are you officially hiring right now?
DIALOG | Cuthbert | Well, I can't really afford to keep someone on for too long. But... but I think I've got a job you could do. Do you have any promoting experience? Do you think you could maybe advertise the place, convince people to check us out and get a pet?
DIALOG | P_NAME   | Well, I'm asking for a friend but I think that would be right up his alley.
DIALOG | Cuthbert | Okay, great! I'm excited to see what your friend's skills and qualifications are. Here, take this application and get your friend to fill it out. It's just basic resume stuff.
NOTIFY | Got Pet Shop Application.
NOTE   | take     | Pet Shop Application
DIALOG | P_NAME   | (Resume, huh...)
QUEST  | ericQuest = 3
QUEST  | knowCuthbert = 1
QUEST  | stateCuthbert = 1

AGREDTOMAKEERICAPPLY
DIALOG | Cuthbert | Hey youngster. Did your friend fill up all that paperwork yet?
DIALOG | P_NAME   | No, uh, not yet.
DIALOG | Cuthbert | Hurry it up then! I could really use the help right now.

RESUMEDONE
DIALOG | Cuthbert | Hey, you're back! You got your friend's resume for me?
CHOICE | Give Eric's application to Cuthbert?
REPLY  | NOPE | Not yet.
REPLY  | YEAH | Yes, turn in the application.

NOPE
DIALOG | P_NAME   | Umm, hold on, lemme make sure it's ready.
DIALOG | Cuthbert | Okay, I'm pretty desperate for someone to start working soon though...

YEAH
DIALOG | P_NAME   | Yep... here it is!
NOTIFY | Gave Cuthbert the Completed Application.
NOTE   | give     | Pet Shop Application
IF petManifestoReceived == 1 | GOTO | HAVEMANIFESTO
GOTO | NOCOVERLETTER

HAVEMANIFESTO
CHOICE | Give the Pet Manifesto?
REPLY  | GIVEMANIFESTO | Cuthbert should see the truth.
REPLY  | NOGIVEMANIFESTO | Keep this one close to the chest.

GIVEMANIFESTO
DIALOG | P_NAME   | ... here's the cover letter. You can tell, he really wants to work.
NOTIFY | Gave Cuthbert the Pet Manifesto
NOTE   | give     | Pet Manifesto
DIALOG | Cuthbert | Huh... the /'Pet Manifesto/'? Dear Clispaeth, this has got to be 50 pages long! I asked for a cover letter, not a book... okay, um... don't tell your friend, but I'll just hang onto it and read this later. I'm trying to run a business, I don't have time for a novella. But I'll take it as a good sign. I guess your friend must really want this job!
DIALOG | P_NAME   | (I can't believe that went over well...)
DIALOG | Cuthbert | Okay, now for the application itself. Let's see...
QUEST  | petManifestoReceived = 2
IF petshopApplicationQuality >= 13 | GOTO | RESUMEWASGOOD
IF petshopApplicationQuality >= 10 | GOTO | RESUMEWASNEUTRAL
IF petshopApplicationQuality >= 0  | GOTO | RESUMEWASSHIT

NOGIVEMANIFESTO
DIALOG | P_NAME   | Uh, nary ye mind...
DIALOG | Cuthbert | Huh? Oh... okay. Hm, there was supposed to a cover letter. That's a shame, but I guess I can't complain. At least I'm getting an application. Let's see...

NOCOVERLETTER
DIALOG | Cuthbert | Okay, great. Let's see what your friend's all about. Hm, no cover letter? That's a shame, but I guess I can't complain. At least I'm getting an application. Anyway, let's see...

RESUMEWASGOOD
DIALOG | Cuthbert | Hmmm... this guy, Eric... he seems, uh, passionate about animals.
DIALOG | P_NAME   | Uh, yeah, definitely. He's a big time animal... guy.
DIALOG | Cuthbert | Can't say I've ever seen a resume this colorful before, but I'm not in much of a position to turn down help right now. Alright, tell him he's got his job - I want him here as soon as he can get here. There's a lot of work to do!
DIALOG | P_NAME   | Got it! Thanks, mister! I'll go tell him...! (Unbelievable...)
QUEST  | petEric = 1.2            
QUEST  | petEric += @clock@
QUEST  | ericQuest = 8

RESUMEWASNEUTRAL
DIALOG | Cuthbert | This... this is um... this is really tough. I can't tell if this guy's serious or not.
DIALOG | P_NAME   | I assure you, he's serious. He's extremely serious, actually.
DIALOG | Cuthbert | Well I tell you what, serious or not, this guy needs to learn some professionalism. He can't just phone in an application and expect to get a job just because I'm desperate and going to be destitute if I don't turn the store around! I mean... he can, he totally can. That's my problem. But what a screwed up thing to do! I just want to be a businessman...
DIALOG | P_NAME   | I understand your reservations, he's a strange guy for sure. He definitely cares about pets though. That much I can guarantee.
DIALOG | Cuthbert | Damn... I suppose I'll have to take a chance. I'm not in much of a position to turn down help right now. All right, tell him he's got his job - I want him here as soon as he can get here. There's a lot of work to do!
DIALOG | P_NAME   | Got it! Thanks, mister! I'll go tell him...! (Unbelievable...)
QUEST  | petEric = 1.2            
QUEST  | petEric += @clock@
QUEST  | ericQuest = 7

RESUMEWASSHIT
DIALOG | Cuthbert | Hmmm... what... what the hell is this? Is this some kind of joke?
DIALOG | P_NAME   | N-no, sir! This is Eric's resume! He's kind of a weird guy bu-
DIALOG | Cuthbert | Look, kid. I'm an honest, hard-working guy. I'm not the greatest guy in Tir na Nog but I treat the animals and the people around me with respect. I'm not some crazy fucking animal lunatic, I'm just a tired guy trying to make ends meet in a world I didn't ask for. Is this what kids do these days, kick guys while they're down? Is that what you do? The pet store's not solvent, I'm in debt, people don't even know this place exists. Is that what you do?
DIALOG | P_NAME   | No, mister! I'm not making fun of you, this is Eric's real-
DIALOG | Cuthbert | Just... just go, kid. Just leave me alone.
QUEST  | ericQuest = 6

RESUMEDISLIKE
DIALOG | Cuthbert | I don't know what kind of joke you thought you were pulling by bringing that fake resume down here, but it wasn't funny. I'm not some crazy animal man. Selling animal companions is my business, my life, and it's dangerously close to falling apart. To mock me when my life is this close to disintegrating...
DIALOG | P_NAME   | No, mister, it isn't like that-
DIALOG | Cuthbert | Just get out of here, kid. Just leave me alone.

RESUMENEUTRAL
DIALOG | Cuthbert | I hope this friend of yours is better at working with animals than he is at filling up job applications...

RESUMELIKE
DIALOG | Cuthbert | Maybe my business won't go under after all. This friend of yours might just be the thing I've been looking for.

ERICHIREDNOTHERE
DIALOG | P_NAME   | Hey Cuthbert, I let Eric know. I'm sure he'll be here soon. 
DIALOG | Cuthbert | Thanks, kid! Maybe things will turn around here...

LOLLYGAGGED
DIALOG | Cuthbert | Hey, what's the deal, " + P_NAME + "? Your friend never showed up! Did you even tell him? I thought I had some help coming. Nope. Don't bother getting your friend. I threw in the towel. /'Cuthbert's Friends/' is no more...
DIALOG | P_NAME   | Cuthbert, I'm... I'm sorry...
DIALOG | Cuthbert | It's better this way. This way, your friend doesn't have to work for a failure...
QUEST  | ericQuest = 11
"
