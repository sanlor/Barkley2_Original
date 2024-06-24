/*
turaldState
    0 - Not talked to
1 - Talked to, haven't helped (repeating)
2 - Declined to help, turald will disappear in 2 hours
    3 - Agreed to help
4 - Turald dissappears

turaldFailSafe
0 - failsafe off
1 - if you agree to help Turald AFTER declining once, this turns on to keep the turaldState = 4 from deactivaing
    
fishgutQuest 
    0 - Quest not active
    1 - Get fishgut's'
    2 - Thrown down 5, need 10
    3 - Thrown down 10, need 20
    4 - Thrown down 20, need 40
    5 - Thrown down 40, Turald has died    
*/

script = "
IF fishgutQuest >= 1 | GOTO | FISHQUEST1
IF turaldState == 2 | GOTO | TURALD2
IF turaldState == 1 | GOTO | TURALD1
IF turaldState == 0 | GOTO | TURALD0

TURALD2
DIALOG | Turald | Hey, P_NAME_S. Nothing yet at the end of my hook. Second thoughts about my Fishgut's Quest?
GOTO | HELPCHOICE

TURALD1 
DIALOG | Turald | Fishtical Greetings, P_NAME_S. How can I help you?
GOTO | WHYAREYOUHERE

TURALD0
DIALOG | Turald | Why, if it isn't a young youth? What brings you here? Was it the sound of the waves lapping against the riverbank? Or like me was it the allure of glittering gun'scales and the possibility of record catches?
DIALOG | P_NAME | Meets and greets. These are the Sewers right?
DIALOG | Turald | Splendid, another friend of the river. Eventually the ebbtide pulls us all down here, where the river speaks the loudest. I can tell you and she are close. I'm Turald, an angler, and this is my spot. I hate to tell you, there ain't much biting today.
QUEST | turaldState = 1
CHOICE | Nothin' bitin'...
REPLY | CLISPAETHBLESS | May Clispaeth bless your line.
REPLY | BBALLBLESS | May the Gods of Bball bless your line.
REPLY | CANDYBLESS | May your line be tipped with the enticing sweetness of candy.
" +
//ROUNDMOUND - add in effects to these three choices
"
CLISPAETHBLESS
DIALOG | P_NAME | May Clispaeth bless your line.
GOTO | FIRSTCATCH

BBALLBLESS
DIALOG | P_NAME | May the Gods of Bball bless your line.
GOTO | FIRSTCATCH

CANDYBLESS
DIALOG | P_NAME | May your line be tipped with a sweet alluring candy!
GOTO | FIRSTCATCH

FIRSTCATCH
DIALOG | Turald | What a pleasant thing to say, thank you, friend.
WAIT | 0.5
" +
//TODO: have small dark shadow appear and go towards fishing line
"
DIALOG | Turald | Huh, what's this?
"+
//TODO: it moves some more and bites the line
"
DIALOG | Turald | Well I'll be! Your blessing was genuine!
DIALOG | P_NAME = s_port_hoopzHappy | Is that a fish?!
DIALOG | Turald | A fish, yes. A gun, yes. A gun'sfish more precicely. But, take a look at that puny shadow. You can tell by the size and lack of fight it's a shit-tier material such as Carbon or Mythril. They're a neuro-shekel-a-dozen around these parts. I'm a lifetime angler seeking a more formidable challenge from the higher gun'stiers!
QUEST | knowGunstiers += 1
"+
//TODO: Turald pulls out a LOW DROP GUN! This gun needs to stay on the ground and not dissappear until you leave the room
"
DIALOG | Turald | And there we go, nothing to sneeze at but surely not the calibre of gun'sfish a true angler seeks. Feel free to take that one.
DIALOG | P_NAME = s_port_hoopzHappy | Gee, you mean it? Thanks!
DIALOG | Turald | Of course, there's no catch and release rule in the Sewers!
WAIT | 1.0
DIALOG | Turald | So, I don't see a fishing rod, you aren't here for angling are you?
GOTO | WHYAREYOUHERE

WHYAREYOUHERE
CHOICE | Why are you here?
IF turaldCdwarf == 0 | REPLY | HEREFORCDWARF | I'm here for The Cyberdwarf.
IF turaldLonginus == 0 | IF knowLonginus >= 1 | REPLY | HEREFORLONGINUS | I'm here for L.O.N.G.I.N.U.S!
IF turaldLoiter == 0 | REPLY | HERETOLOITER | I'm here to loiter.
IF turaldTiers == 0 | REPLY | TURALDTIER1 | I'm here to learn!
IF turaldTiers == 1 | REPLY | TURALDTIER2 | Can you tell me about Gun's Materials again.
REPLY | HERETOHELP | I'm here to help!
REPLY | HERETOLEAVE | I'm here to leave!

HEREFORCDWARF
DIALOG | P_NAME | I'm on a hero's quest for the Cyberdwarf, ... I think...
DIALOG | Turald | Ah the Hero's Journey!_ Not unlike the Sludge Salmon's annual sojourn back to its original spawning grounds. Some say they use the starry sky to guide themelves through the endless branching sewer pipes upstream. Others, insist that the fish merely follows the steady current of F_._A_._T_._E._
DIALOG | P_NAME | Wow that is deep.
DIALOG | Turald | Well you get a lot of time to think down here.
DIALOG | Turald | Unfortunately I can't help you with something so personal.
DIALOG | P_NAME | Oh that's okay.
QUEST | turaldCdwarf = 1
GOTO | WHYAREYOUHERE

HEREFORLONGINUS
DIALOG | P_NAME | I'm looking for L.O.N.G.I.N.U.S., seen any rebels in these parts?
DIALOG | Turald | Yeah sure, they are rare and secretive, but there are rebels in the sewers you can count your scales on that.
DIALOG | P_NAME | Oh good, how do I find them?
DIALOG | Turald | That I'm not sure. But if anyone knows it would be the Sewer Hermit.
DIALOG | P_NAME | Sewer Hermit?
DIALOG | Turald | Not a gun'sfisher. A man of the earth. I think he grows some sludgeplants and thats how he survives. He's in the lower floors, but I don't recommend looking for him, and even then I doubt he'll be able to tell you anything more about the rebels.
DIALOG | P_NAME | Oh okay, well it's worth a shot, thanks.
QUEST | turaldLonginus = 1
GOTO | WHYAREYOUHERE

HERETOLOITER
DIALOG | P_NAME | Just came down to loiter.
DIALOG | Turald | Loiterer, eh? Sounds like you and I both dip our toes on the dark side of the law.
DIALOG | P_NAME | Uh, fishing_ is-?
DIALOG | Turald | You bet your bobber... illegal. At least anywhere on the surface. Cuchulainn and his blue baddies have the whole thing on lock-down. But in the comfortable dankness of the sewers, you can get away with just about anything.
DIALOG | P_NAME | Seems like it.
QUEST | turaldLoiter = 1
GOTO | WHYAREYOUHERE

TURALDTIER2
DIALOG | P_NAME | Can you tell me more about those Gun's Materials?
DIALOG | Turald | Sure, there are seven tiers of Gun's Materials: Non,Shit,Low,Mid,High,Meme,God. I don't think anyone knows how many are in each tier, or how many overall, but I know it's more than I can count!
DIALOG | P_NAME | Gotcha!
QUEST | turaldTiers = 2
GOTO | WHYAREYOUHERE

TURALDTIER1
DIALOG | P_NAME | I'm here to learn something... you mentioned Gun'stiers?
DIALOG | Turald | Yeah, you know gun's materials. Every gun has one and they are not created equal. Something like a Shit Tier Material like Neon could never compare to a High Tier Material like Tin or a God Tier Material like Orb!
DIALOG | P_NAME | Wow, there are lots of materials, huh?
DIALOG | Turald | More than I can count, that's for sure.
DIALOG | P_NAME | Interesting...
QUEST | turaldTiers = 1
GOTO | WHYAREYOUHERE

HERETOLEAVE
DIALOG | P_NAME | Oh well I'm just passing through, see you later.
DIALOG | Turald | Aye.
GOTO | END

HERETOHELP
DIALOG | P_NAME | I'm here to help you! Need anything?
DIALOG | Turald | Help, eh? I guess us amatuer fisherdwarfs need to team up now and then, and my chum bucket over there is getting a little low.
WAIT | 0.5
DIALOG | Turald | So, what do you say about collecting some more fishgut's for me?
DIALOG | P_NAME | Fishgut's?
DIALOG | Turald | Sure, the sewers are teeming with Fiscians: sick, mutated abominations that are now more dwarfoid than fishloid. All you gotta do is brast them to pieces and collect what's left!
DIALOG | P_NAME | That sounds violent...
DIALOG | Turald | So are the Fiscians. No one really knows why they took to such hatred against us Dwarfs, but I think it's the xenophobic rhetoric of their duly elected leader: Bass Mother.
DIALOG | P_NAME | Gulp... Bass Mother?
DIALOG | Turald | Never seen her myself but she's a prize to be hooked that's for sure. A terrifying beast that patrols only the most polluted waters.
DIALOG | P_NAME | Sounds dangerous.
DIALOG | Turald | Probviously, friend. But good news is you can stick to the upper levels of the sewers and avoid her. What do you say, want to collect some fishgut's for me and help me achieve the glorious battle of Dwarf and Gun'sfish?
GOTO | HELPCHOICE

HELPCHOICE
CHOICE | Agree to help Turald?
REPLY  | AGREE | I'll help!
IF turaldFishForFish == 0 | REPLY | FISHFORFISH | Why don't you just fish for Fiscians?
REPLY  | DECLINE | I must decline...

AGREE
DIALOG | P_NAME | Sounds like a fun distraction from my main quest, and something that I can probably complete in parallel, saving myself time.
DIALOG | Turald | Okay great. So all you need to do is look out for Fiscians in the sewers and pick up the gut's that will inevitably drop from their lifeless gibbing husks.
DIALOG | P_NAME = s_port_hoopzHappy | Okay!
DIALOG | Turald | So let's start with FIVE fishgut's... think you can fetch FIVE gut's and we'll try our luck out with that?
DIALOG | P_NAME | Mhm, I'll go fetch them now.
DIALOG | Turald | Excellent, I'll keep the river company while you fetch. Good luck, P_NAME_F.
QUEST | turaldFailSafe = 1
QUEST  | turaldState = 3
QUEST  | fishgutQuest = 1
GOTO | END

FISHFORFISH
DIALOG | P_NAME | Why don't you just fish for Fiscians? Then you don't need to brast them.
DIALOG | Turald | Hmmm. Never though of that. I guess just gun'sfishing is my real calling. The thrill of the duel. My hardened muscles on one end of the line,_ the thrashing stock of a gun'sfish on the other. Something about it seems more pure to the sport than plucking a disgusting Fiscian from the water. 
DIALOG | P_NAME | Ah, I guess I see your point.
DIALOG | Turald | So what do you say? Want to help me?
QUEST | turaldFishForFish = 1
GOTO | HELPCHOICE

DECLINE
DIALOG | P_NAME | You know, I really have my own quests I have to take care of first. Gotta search for my identity, my destiny, lots of things. I don't think I have time to pick up anythign on the side.
DIALOG | Turald | Fair enough. I'll be here for a little while longer so if you decide you want to help, come on back.
DIALOG | P_NAME | Okay, fare thee well Turald.
DIALOG | Turald | Fare thee well. May your waters run deep and bountiful.
QUEST  | turaldState = 2
ClockTime | turaldState | 4 | 80
GOTO | END

FISHQUEST1
DIALOG | Turald | How goes the fetching, P_NAME_S?
GOTO | FISHCHOICE

FISHCHOICE
CHOICE | Anything to report?
REPLY | GUTSCOUNT | Checking to see how many gut's I have.
REPLY | GOFISHING | I got some gut's for you!
REPLY | NARYYEMIND | Nary ye mind.

GUTSCOUNT
DIALOG | P_NAME | Just checking on my gut's count!
DIALOG | Turald | Let's see...
" + 
//TODO: we can add an option to display the amount of fistgut's using the Crash Bandicoot system
"
IF @Fiscian Gut's@ <= 81 | GOTO | CORRECTCOUNT
GOTO | INCORRECTCOUNT

CORRECTCOUNT
DIALOG | Turald | You have @item_Fiscian Gut's@ fishgut's.
GOTO | FISHCHOICE

INCORRECTCOUNT
DIALOG | Turald | Man that is too many gut's for me to count... you've got a lot!
GOTO | FISHCHOICE

GOFISHING
IF fishgutQuest == 1 | IF @Fiscian Gut's@ >= 5  | GOTO | FISHGUT5
IF fishgutQuest == 2 | IF @Fiscian Gut's@ >= 10 | GOTO | FISHGUT10
IF fishgutQuest == 3 | IF @Fiscian Gut's@ >= 20 | GOTO | FISHGUT20
IF fishgutQuest == 4 | IF @Fiscian Gut's@ >= 40 | GOTO | FISHGUT40
IF fishgutQuest == 1 | IF @Fiscian Gut's@ < 5  | GOTO | FISHGUT5_SHORT
IF fishgutQuest == 2 | IF @Fiscian Gut's@ < 10 | GOTO | FISHGUT10_SHORT
IF fishgutQuest == 3 | IF @Fiscian Gut's@ < 20 | GOTO | FISHGUT20_SHORT
IF fishgutQuest == 4 | IF @Fiscian Gut's@ < 40 | GOTO | FISHGUT40_SHORT

FISHGUT5
DIALOG | P_NAME | Well I have your FIVE fishgut's.
DIALOG | Turald | Oh swell! Here, do me a favor and take those gut's go over to that bucket there.
WAIT | 0.2
LOOKAT | o_cts_hoopz | o_chumBucket01
FRAME | o_cts_hoopz | o_chumBucket01
WAIT |
DIALOG | P_NAME = s_port_hoopzHappy | You got it!
MOVETO | o_cts_hoopz | o_cinema0 | MOVE_FAST
WAIT |
LOOKAT | o_cts_hoopz | o_turald01
WAIT |
DIALOG | P_NAME | Ready!
DIALOG | Turald | Okay now toss in those FIVE guts!
" +
//TODO: Add in the chum throw animation
"
DIALOG | P_NAME | Now what?
DIALOG | Turald | Now, we wait...
WAIT | 3.0
DIALOG | Turald | Looks like we won't have to wait that long! There's a gun now!
" +
//TODO: add in dark spot that swims up to the line and GETS CAUGHT!
//TODO: spawn a Shit Tier Gun that doesn't decay
//TODO: remove 5 fishguts
"
DIALOG | Turald | Now let's see what we can get with TEN fishgut's.
DIALOG | P_NAME | I like where your mind is at, Turald.
QUEST  | fishgutQuest = 2
GOTO | END

FISHGUT10
DIALOG | P_NAME | I fetched those TEN gut's you wanted.
DIALOG | Turald | Great, head over to the bucket and toss them in, we'll see what bounty the river has in store for us.
" + 
//TODO: link to fishing sequence
//TODO: Spawn a Low Tier Gun
//TODO: remove 10 fishguts
"
DIALOG | Turald | Ah! A Low Tier Material, not bad! Now let's see what we can get with TWENTY fishgut's.
DIALOG | P_NAME | I agree, time to double down on this gut's-to-gun's return scheme, see how high the beanstalk grows.
DIALOG | Turald | Good luck out there, P_NAME_S.
QUEST  | fishgutQuest = 3
GOTO | END

FISHGUT20
DIALOG | P_NAME | Alright this time I have TWENTY fishgut's.
DIALOG | Turald | What are you waiting for? My line is taut and my biceps tauter... I'm ready to haul in a High Tier gun!
" + 
//TODO: link to fishing animation
//TODO: Spawn a Mid-Tier Gun
//TODO: remove 20 fishguts
"
DIALOG | Turald | Well not High Tier but Mid Tier, so this is promising!
DIALOG | P_NAME | Yeah that's great! You sure I can keep this gun too?
DIALOG | Turald | Of course. Like I said, it's the thrill of the fight that I'm after. Let's try for FORTY fishgut's this time!
DIALOG | P_NAME | Wow that's gonna take me... forever!
DIALOG | Turald | Patience and forbearance are the mainstays of any great Fisherdwarf. That and also hubris, but I still think we should go for FORTY!
DIALOG | P_NAME | Alright I'll give it a shot!
QUEST  | fishgutQuest = 4
GOTO | END

FISHGUT40
DIALOG | P_NAME | Alright, here are your FORTY fishgut's. Are you sure you want to do this?
DIALOG | Turald | Of course I'm sure. Whatever the river has in store for me, I'm ready to wrap my arms around it.
DIALOG | P_NAME | I'm more afraid of whatever is in there wrapping its arms around you.
WAIT | 1.0
DIALOG | Turald | Throw in the gut's.
" + 
//TODO: link to fishing animation where Turald is EATEN!
//TODO: Spawn NO GUN
//TODO: remove 40 fishguts
"
DIALOG | P_NAME = s_port_hoopzShock | GADZOOKS!
WAIT | 2.0
DIALOG | P_NAME | Well I guess I shouldn't really be surprised... Turald fished too close to the sun...
QUEST | time += 1
QUEST  | fishgutQuest = 5
GOTO | END

FISHGUT5_SHORT
DIALOG | P_NAME | Got some gut's for you!
DIALOG | Turald | Hmmm.
WAIT | 1.0
DIALOG | Turald | Looks like you are a little short, P_NAME_S. I need 5 gut's this time.
DIALOG | P_NAME = s_port_hoopsAngry | Durn it!
GOTO | END

FISHGUT10_SHORT
DIALOG | P_NAME | Got some gut's for you!
DIALOG | Turald | Hmmm.
WAIT | 1.0
DIALOG | Turald | Looks like you are a little short, P_NAME_S. I need 10 gut's this time.
DIALOG | P_NAME = s_port_hoopsAngry | Flub it!
GOTO | END

FISHGUT20_SHORT
DIALOG | P_NAME | Got some gut's for you!
DIALOG | Turald | Hmmm.
WAIT | 1.0
DIALOG | Turald | Looks like you are a little short, P_NAME_S. I need 20 gut's this time.
DIALOG | P_NAME = s_port_hoopsAngry | Bubdub it!
GOTO | END

FISHGUT40_SHORT
DIALOG | P_NAME | Got some gut's for you!
DIALOG | Turald | Hmmm.
WAIT | 1.0
DIALOG | Turald | Looks like you are a little short, P_NAME_S. I need 20 gut's this time.
DIALOG | P_NAME = s_port_hoopsAngry | Zhang Dang it!
GOTO | END

NARYYEMIND
DIALOG | P_NAME | Nary ye mind...
GOTO | END

END
EXIT |
"
