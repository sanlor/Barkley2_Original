///Absalom, the L.O.N.G.I.N.U.S. Cryptodog
/*
Variables
absalomState
    0 = never talked
    1 = talked
govQuest
    0 = no quest
    1 = rejected the quest for now
    2 = accepted the quest, looking for Urine
    3 = have urine
    4 = ready to become governor
    5 = am the governor, attempting to do speech
    6 = finished speech
absalomLetter
    0 = haven't heard about letters
    1 = he mentions letters but you need one more to get it done
    2 = you know that Absalom is a Cryptodog and you can give him letters
absalomJoad
    0 = haven't given Absalom a Joad NOTE
    1 = given him the Tattered Paper
    2 = given him the Dead Soldier's Note
    3 = given him the Joad's Note
*/
script = "
IF govQuest == 6 | GOTO | GOVQUEST06
IF govQuest == 5 | GOTO | GOVQUEST05
IF govQuest == 4 | GOTO | GOVQUEST04
IF govQuest == 3 | GOTO | GOVQUEST03
IF govQuest == 2 | GOTO | GOVQUEST02
IF govQuest == 1 | GOTO | GOVQUEST01
IF absalomState == 1 | GOTO | ABSALOM01
IF absalomState == 0 | GOTO | ABSALOM00

ABSALOMQUESTIONS
CHOICE | Ask Absalom?
IF absalomLONGINUS == 0 | REPLY | ISTHISLONGINUS | Is this L.O.N.G.I.N.U.S.?
IF absalomLONGINUS == 1 | REPLY | ISTHISALLOFYOU | Is this the whole team?
IF absalomLONGINUS == 2 | IF absalomHelp == 0 | REPLY | CANIHELP | Is there anything I can do to help?
IF absalomDoing == 0 | REPLY | WHATAREYOUDOING | What are you doing?
IF absalomLetter >= 2 | REPLY | NOTEREPORT | I have a note you should see.
REPLY | HOWDOIGETOUT | How do I get out of here?
REPLY | NARYYEMIND | Nary ye mind.

ISTHISLONGINUS
DIALOG | P_NAME | Um, is this L.O.N.G.I.N.U.S.?
DIALOG | Absalom | Correct! This is the Tir na Nog branch of L.O.N.G.I.N.U.S. It's quite amazing to me that you managed to find us! I'm a little concerned you'll compromise our safety! I'm Absalom, the group technician. I assist Dr. Liu, our leader, with... secret weapons. Private Madison handles weapon supplies and our poker players over there handle the poker games.
DIALOG | P_NAME | You're supposed to be fighting the Duergars, right? That's all of you?
DIALOG | Absalom | Correct again! L.O.N.G.I.N.U.S. is the dwarf resistance force. We try to stymie the Duergars as much as we can, and improve living conditions for the dwarfs of Necron 7. We may be small group, but we're dedicated to the cause of dwarf liberation.
KNOW | knowLONGINUSTnn | 3
QUEST | absalomLONGINUS = 1
GOTO | ABSALOMQUESTIONS

ISTHISALLOFYOU
DIALOG | P_NAME | Is this all of you?
DIALOG | Absalom | All of L.O.N.G.I.N.U.S.? Heck no! This is just the Tir na nOg squad! We have a few other hideouts but the main one is in Brain City south of here... good luck getting through the swamps though...
DIALOG | P_NAME | Hmmm, darn. I'm hoping to find The Cyberdwarf.
DIALOG | Absalom | Cyberdwarf, eh? Well I'm not so sure he's affiliated with L.O.N.G.I.N.U.S., if he even exists in the first place. I have my finger on the collective pulse of Necron 7 and I think something would have come up on my scanners if he did exist. I hear there is a wise Dojo Master living at the top of the southern mountains.
KNOW | knowLONGINUSBct | 1
KNOW | knowDojoMaster | 2
QUEST | absalomLONGINUS = 2
GOTO | ABSALOMQUESTIONS

WHATAREYOUDOING
DIALOG | P_NAME | What are you doing with that rig?
DIALOG | Absalom | Right now? I'm decoding messages. You see this computer of mine? I've developed a powerful new decryption tool. Duergar messages, reports from our scouts, fragments of radio communication - you wouldn't believe the kinds of secrets contained in these messages. Duergars disguise their messages as songs, love letters, farewell letters - they're all codes! 
QUEST | absalomLetter += 1
QUEST | absalomDoing = 1
IF sviatoslavCrypto == 1 | GOTO | SVIATOSLAVFLAVOR
GOTO | SCANNERINTRO

SVIATOSLAVFLAVOR
DIALOG | P_NAME | Oh I know all about secret codes. Sviatoslav in town taught me how to find them and even where to look!
DIALOG | Absalom | Yeah, Sviatoslav, I know him. He's a strange cat. Failed the L.O.N.G.I.N.U.S. Recruitment Exam because he wouldn't submit to a ocular cavity search. Said his civil liberties we're being contravened. A shame though, I thought he was a good candidate for The Cryptodogz.
QUEST | absalomLetter += 1
GOTO | SCANNERINTRO

SCANNERINTRO
DIALOG | Absalom | Anyways, this machine can scan and process anything to extract clandestine and encoded communique.
DIALOG | P_NAME | Sounds like really high end tech.
DIALOG | Absalom | This tech is so high end, it makes other tech look like rear ends.
DIALOG | P_NAME | (Gulp... applebottoms?)
GOTO | ABSALOMQUESTIONS

CANIHELP
DIALOG | P_NAME | I want to help out L.O.N.G.I.N.U.S. Is there anything I can do?
DIALOG | Absalom | Beyond helping Dr. Liu with the body transference device? Well, I've been expecting a report from our scout for some time now, but alas, he's not checked in with HQ for a few days. Liu and the others are starting to worry, but I know our scout, and he's way too /'handy with the steel, you know what I mean./'
QUEST | absalomHelp = 1
QUEST | absalomLetter += 1
GOTO | ABSALOMQUESTIONS

HOWDOIGETOUT
IF body == governor | GOTO | GOVGETOUT
DIALOG | P_NAME | How do I get out of here?
DIALOG | Absalom | I'm quite impressed that you made it to our hideout! Not even the Duergars can make it this far through the sewers. I hear there are accesses to the undersewers of Tir na nOg that lead to far off lands, but getting there? Not even sure that is possible. Also, I believe that you could potentially escape using the body transference device Dr. Liu and I made. You should ask her more about that.
REPLY | absalomGetOut = 1
GOTO | ABSALOMQUESTIONS

NARYYEMIND
DIALOG | P_NAME | Actually I think I need to go.  See you!
DIALOG | Absalom | Er... okay. See you.
EXIT |

GOVGETOUT
DIALOG | Governor Elagabalus | How do I get out of here?
DIALOG | Absalom | In your current state? I can't imagine why you'd want to. You've got a speech to give, Mr. Governor!
EXIT |

GOVQUEST06 // govQuest complete
DIALOG | Absalom | It was a long shot but you pulled it off - the people of Tir na Nog are the better for it and you've got an exit into the Necron 7 wilds. I'm quite impressed! I sincerely hope you find whatever it is you're looking for, and if you cross paths with L.O.N.G.I.N.U.S. again, I hope you help in any way you can. But about the governor, I'm not too sure what we're going to do with him...!
GOTO | ABSALOMQUESTIONS

GOVQUEST05 // Currently in Governor's Body
DIALOG | Absalom | Oh, don't worry, we'll make sure no harm comes to your body while your consciousness is inhabiting the Governor's. But please do be quick, just in case!
EXIT |

GOVQUEST04 // Ready to become Governor
DIALOG | Absalom | Look at him over there, convulsing in rage and indignation. Perhaps I shouldn't say this, but I almost take pleasure in his misery. Well, I suppose it's almost time to see if the body switching device is working correctly, then?
GOTO | ABSALOMQUESTIONS

GOVQUEST03 // Have Duergar Urine
DIALOG | Absalom | Ah, the Duergar solution! That must have been quite a challenge to obtain. I must say that I'm quite impressed. You should take it to Dr. Liu immediately.
GOTO | ABSALOMQUESTIONS

GOVQUEST02 // Accepted Governor Quest, need Duergar Urine
DIALOG | Absalom | Duergars are instinctually territorial creatures - they mark their turf with their, ah, fluids. It is my hope, as well as Dr. Liu's, that we can trigger Governor Elagabalus hormonal territorial instincts with a sample of ah, Duergar solution. I wish you good luck, P_NAME_F, but unfortunately I wouldn't know where to obtain any. But you made it through the sewers to get here, you're a tenacious youngster. I'm sure you can get your hands on some quite easily! So to speak. Maybe try elsewhere?
GOTO | ABSALOMQUESTIONS

GOVQUEST01 // Rejected Governor's Quest
IF absalomGov1Flavor == 1 | GOTO | GOVQUESTFLAVOR01
DIALOG | Absalom | I know it's a long shot, but if we can somehow capture the incoming governor and body switch with him, we'll be able to deliver his upcoming speech and lay out a plan that helps the people of Tir na Nog and L.O.N.G.I.N.U.S... at least temporarily. Think about it!
QUEST | absalomGov1Flavor = 1
GOTO | ABSALOMQUESTIONS

GOVQUESTFLAVOR01
DIALOG | Absalom | Think about reconsidering the mission, P_NAME_S. Could be beneficial to your quest and ours.
GOTO | ABSALOMQUESTIONS

ABSALOM01
DIALOG | Absalom | Hey, P_NAME_S. What do you need?
GOTO | ABSALOMQUESTIONS

ABSALOM00
DIALOG | Absalom | I'm quite pleased with the body transfer system Dr. Liu and I devised. Without going into the specifics, when two individuals are strapped properly into the chairs with the electrodes in place and the lever is pulled, the consciousness of each individual is transferred to the other. And there's only a minimal chance of cerebro-scalding!
QUEST | absalomState = 1
GOTO | ABSALOMQUESTIONS
" +
/////////////////////////
//  Absalom Note Giver //
/////////////////////////
"
NOTEREPORT
DIALOG | P_NAME | Hey, I think I've got a note you told me about.
DIALOG | Absalom | Oh, really? Let's see what you got!
GOTO | NOTECHOOSER

NOTECHOOSER
NOTE | select | Absalom
IF note == exit | GOTO | NARYYEMIND
IF note == none | GOTO | NONE
IF note == Printed Invitation | GOTO | NOTE_GENERIC
IF note == Clandestine Courts Baller Zine | GOTO | NOTE_GENERIC
IF note == Gamesmasterjasper's Vidcon Almanac | GOTO |  VIDCONALMANAC
IF note == Ancient Scroll | GOTO | NOTE_ANCIENTSCROLL
IF note == Bloody Paper | GOTO | NOTE_BLOODYPAPER
IF note == Dead Soldier's Note | GOTO | NOTE_SOLDIER
IF note == Joad's Note | GOTO | NOTE_JOAD
IF note == Dead Soldier's Note (reused) | GOTO | NOTE_SOLDIER
IF note == Joad's Note (reused) | GOTO | NOTE_JOAD
IF note == Tattered Paper | GOTO | NOTE_TATTERED
IF note == Cornrow's Plea | GOTO | CORNROW
IF note == Suicide Note | GOTO | SUICIDE
IF note == Augustino's Letter | GOTO | AUGUSTINO
IF note == Blank Paper | GOTO |  NOTE_BLANK
IF note == Pravda Tir na nOg | GOTO | NOTE_PRAVDA
IF note == Decoded Pravda | GOTO | NOTE_DECODED
GOTO | NOTE_GENERIC

NOTE_ANCIENTSCROLL
DIALOG | P_NAME | I have this scroll.
DIALOG | Absalom | Hmmm, let's see...
USEAT | o_absalom01
NOTIFY | Gave the Ancient Scroll to Absalom.
WAIT | 0.25
" +
//TODO: Tells you to go to Wiglaf in AI RUINS
"
DIALOG | Absalom | Oh, this is very interesting. An ancient scroll of some sort.
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

NOTE_BLOODYPAPER
DIALOG | P_NAME | 
USEAT | o_absalom01
NOTIFY | Gave the Bloody Paper to Absalom.
WAIT | 0.25
//Releases ULTRABOSS!
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

NOTE_DECODED
DIALOG | P_NAME | Here is a newpaper with a hidden message on it.
USEAT | o_absalom01
NOTIFY | Gave the Decoded Pravda to Absalom.
WAIT | 0.25
//Sviatoslav is the Cryptodog in Brain City
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

NOTE_JOAD
DIALOG | P_NAME | Um I found this in the sewers, it was given to me by a dwarf named Joad,_ but he_ he didn't make it...
DIALOG | Absalom | Joad? Let me see that letter!
USEAT | o_absalom01
NOTIFY | Gave Joad's Note to Absalom.
WAIT | 0.25
QUEST | absalomJoad = 3
DIALOG | Absalom | So... our worst fears are true. Sgt. Joad is K_I_A._ This is the only record we have of his sortie...
NOTE | give | note
GOTO | JOADSTORY

NOTE_SOLDIER
DIALOG | P_NAME | Um I found this in the sewers, it was given to me by a dwarf but he_ he didn't make it...
DIALOG | Absalom | Let's see...
USEAT | o_absalom01
NOTIFY | Gave the Dead Soldier's Note to Absalom.
WAIT | 0.25
QUEST | absalomJoad = 2
DIALOG | Absalom | So... our worst fears are true. Sgt. Joad is K_I_A._ This is the only record we have of his sortie...
NOTE | give | note
GOTO | JOADSTORY

NOTE_TATTERED
DIALOG | P_NAME | Um I found this in the sewers, on a dead dwarf... I can't make head's or tail's of what it means... do you think he maybe was L.O.N.G.I.N.U.S.?
DIALOG | Absalom | Let's see...
USEAT | o_absalom01
NOTIFY | Gave the Tattered Paper to Absalom.
WAIT | 0.25
QUEST | absalomJoad = 1
DIALOG | Absalom | So... our worst fears are true. Sgt. Joad is K_I_A._ This is the only record we have of his sortie...
NOTE | give | note
GOTO | JOADSTORY

NOTE_BLANK
DIALOG | P_NAME | Well I have this paper, but maybe there is something on it?
USEAT | o_absalom01
NOTIFY | Gave the Blank Paper to Absalom.
WAIT | 0.35
DIALOG | Absalom | Nope, as blank as blank can be. Disappointing... let me give this back.
USEAT | o_absalom01
WAIT | 0.25
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

NOTE_PRAVDA
DIALOG | P_NAME | How about this newspaper?
USEAT | o_absalom01
NOTIFY | Gave the Pravda Tir na nOg to Absalom.
WAIT | 0.25
DIALOG | Absalom | Ah yes, the Pravda! You know this is how we communicate with the more resistant-minded dwarfs of the town, right?  There's a hidden cyphers contained in this paper... impressive that you made it through the sewers without actually decoding it. Well done!
DIALOG | P_NAME | Uh, thanks.
DIALOG | Absalom | Let me take this off your hands, the intel contained within is only pertinent to Tir na nOgians, and I have a feeling your destiny lies beyond these walls.
DIALOG | P_NAME | Okay, it did cost me a few shekels though.
BREAKOUT | add | money
DIALOG | Absalom | Oh no problem, I can reimburse you with pettycash. Here you are, does @money_absalomReimburse@ neuro-shekels sound about right? For your troubles, of course.
DIALOG | P_NAME = s_port_hoopzHappy | Gee, yeah swell!
QUEST | money += @money_absalomReimburse@
WAIT | 0.5
DIALOG | Absalom | No problem, thanks for helping the cause.
BREAKOUT | clear
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

NONE
DIALOG | P_NAME | Jag-giggit, I don't actually have any notes... sorry.
DIALOG | Absalom | Oh don't worry about it. I'm not going anywhere.
EXIT |

NOTE_GENERIC
DIALOG | Absalom | Hmmm, let's see..._ Yeah nothing sticks out at me with this. Got anything else?
GOTO | NOTECHOOSER

JOADSTORY
WAIT | 0.5
DIALOG | Absalom | I remember the morning his mission began. Cold. Light drizzle. I said /'take your coat Joad./' But he just smirked and said... /'Where I'm going, I won't need a coat, I'll need a wing and a prayer./'_ That's what he'd always say. And now it seems that he needed more than that... Clispaeth damn you Joad! You left us too soon!
DIALOG | P_NAME = s_port_hoopzSad | I-_I'm sorry, Absalom.
IF absalomJoad == 3 | GOTO | GETJERKIN
IF absalomJoad == 2 | GOTO | GETSOMETHING
IF absalomJoad == 0 | GOTO | GETNOTHING

GETJERKIN
DIALOG | Absalom | Confound it Joad! W-why didn't you just take your damn coat?
DIALOG | P_NAME = s_port_hoopzSad | Well I he said some things ... about a Bainshee attack... I think he needed more than just a coat.
DIALOG | Absalom | Well this wasn't any old coat... it was a_ Bespoke Jerkin.
DIALOG | P_NAME = s_port_hoopzSurprise | Whoah! What's that?
DIALOG | Absalom | Well it used to be a coat but Joad, ever the /'rebel's rebel,/' tore the sleeves off to create a defensive jerkin-like armor. I don't know why he didn't take it... left it right here.
DIALOG | P_NAME = s_port_hoopzSad | Poor, Joad.
WAIT | 0.5
DIALOG | Absalom | Look, P_NAME_S, Joad gave you this note for a reason. His mission was Top Secret yet he trusted you enough to tell you his name. Now me? I'm just a pencil pusher for the resistance, I'm not cut out for field work. But if you made it through the sewers here, you probably need this more than me._ Take it.
USEAT | o_absalom01
NOTIFY | You got the Bespoke Jerkin!
" +
//TODO: give the Bespoke Jerkin to Hoopz!
"
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

" +
//TODO: this needs to be ... something, I don't know!
"
GETSOMETHING
DIALOG | Bhroom | We need to give the player something here!
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER

" +
//TODO: this needs to give the player nothing
"
GETNOTHING
DIALOG | Bhroom | We need to give the player nothing here!
DIALOG | Absalom | Anything else?
GOTO | NOTECHOOSER
"
