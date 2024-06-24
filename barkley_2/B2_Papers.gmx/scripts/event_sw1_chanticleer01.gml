///Meeting Chanticleer
///Hermit in the sewers, will give his other bed to one roommmate
/// either Gutterhound or Aelfleda
/*
Essentially you just have to befriend Chanticleer in 1 of 2 ways:
    1 - Convince him to share his collection of Wild Hogs Memoribilia with a roommate
    2 - Give him x number for surplus fish gut's that you have left over from Turald's Quest

Variables
    chanticleerState
        0 = never talked
        1 = talked but didn't ask anything in return (repeating dialog)
        
    chanticleerHogs
        0 = hasn't mentioned Wild Hogs Collection
        1 = mentioned Wild Hogs Collection
        2 = told him that the Hogs Collection is best kept secret (this closes the potential for safety for 1 character)
3 = agreed to look for a Wild Hogs viewing roommmate
        
    chanticleerGuts
        0 = haven't heard about Chanti's fishgut's love
        1 = heard about his fishgut's love, repeating dialogue if you have them
        2 = given him the fishgut's
        
    chanticleerRebels
        0 = you haven't asked him about the rebels yet
        1 = he mentions the rebels and how he doesn't know anything
        
    chanticleerAlone
        0 = hasn't discussed his loneliness
        1 = has discussed his loneliness, you side with him leaving
        2 = has discussed his loneliness, you side with him staying as a hermit
        
    chanticleerSafety
        0 = haven't proved that you are trustworthy
        1 = told him you aren't trustworthy therefore he doesn't offer you safety for anyone
        2 = he trusts you and you can offer anyone to live with him (repeating dialog)
        3 = you've chosen to have Gutterhound Stay there
        4 = you've chosen to have Aelfleda stay there
        5 = you've chosen to stay there yourself

chanticleerRoommate
0 = no roommate
1 = Hoopz is Roommate
2 = Aelfleda is Roommate
3 = Gutterhound is Roommate
*/

script = "
IF chanticleerSafety == 5 | GOTO | HANGOUT
IF chanticleerSafety == 4 | GOTO | AELFLEDA_ROOMIE
IF chanticleerSafety == 3 | GOTO | GUTTERHOUND_ROOMIE
IF chanticleerSafety == 2 | GOTO | CHANTI_02
IF chanticleerSafety == 1 | GOTO | CHANTI_FAIL
IF chanticleerState == 1 | GOTO | CHANTI_01
IF chanticleerState == 0 | GOTO | CHANTI_00

CHANTI_02
DIALOG | Chanticleer | Hey, P_NAME_S, how is life out there with other dwarfs?
GOTO | CHANTI_QS

CHANTI_FAIL
DIALOG | Chanticleer | I'd appreciate if you kept these whereabouts a secret... I'm a hermit after all.
EXIT |

CHANTI_01
DIALOG | P_NAME | Hey, Mr Chanti-er Hermit, sir, I was wondering...
DIALOG | Chanticleer | Yes?
GOTO | CHANTI_QS

CHANTI_00
DIALOG | Chanticleer | Who-wha-whatsit?!
WAIT | 0.2
DIALOG | P_NAME = s_port_hoopzSurprise | Oh! Sorry! I didn't mean to startle you!
DIALOG | Chanticleer | Oh that's good,_ zooks I thought you were a Fiscian making a move on my collection!
QUEST | chanticleerState = 1
GOTO | CHANTI_QS

" +
//This is the root Question Chooser when you talk to Chanticleer
"
CHANTI_QS
CHOICE | What about it?
IF chanticleerOrigin == 0 | REPLY | ORIGIN | What are you doing out here?
IF chanticleerJustYou == 0 | REPLY | ALONE | Are you alone?
IF chanticleerHogs == 3 | REPLY | ROOMMATECHOOSER | I was thinking about a new roommate for you.
IF chanticleerAlone == 2 | IF chanticleerHogs == 1 | REPLY | SHARE | Maybe you should share the collection with a friend?
IF chanticleerRebels == 1 | IF chanticleerGuts == 0 | IF fishgutQuest == 1 | REPLY | FISHGUTS | I'm also looking for fishgut's.
IF chanticleerGuts == 1 | IF fishgutQuest == 1 | REPLY | FISHGUTGIVER | About those fishgut's you wanted...
IF chanticleerHogs == 0 | REPLY | COLLECTION | What collection?
REPLY | LEAVE | Nary ye mind. Gotta go...

" +
//He mentions his Wild Hogs Collection, if you have sympathized with him
"
COLLECTION
DIALOG | P_NAME | What kind of collection are you talking about?
DIALOG | Chanticleer | Well, I'll tell you but,_ can you be trusted?
CHOICE | Can you be trusted?
REPLY | TRUSTWORTHY | Yes I can, my word is bond.
REPLY | UNTRUSTWORTHY | Can't lie, my lips as as loose as a zaubermancer's robe.

TRUSTWORTHY
DIALOG | P_NAME = s_port_hoopzHappy | You can trust me! I'm great with secrets!
DIALOG | Chanticleer | I may not be the best judge of character since I haven't really met any characters for 40 years, but... ah what the hedge? I'll tell you my secret.
WAIT | 0.5
DIALOG | Chanticleer | You see... I have, for the last half century, been consolidating the ship's largest assemblage of canonical and unlicensed Wild Hogs merchandise.
DIALOG | P_NAME | Wild wha-?
DIALOG | Chanticleer | I'm talking the 50th Anniversary Laserdisc with Full Cast and Crew Commentary, the Centennial Edition Laserdisc, the Millenial Edition Laserdisc and Wild Hogs /'Lost Tapes/' Pirate Rebroadcast.
DIALOG | P_NAME | Sound like quite the-
DIALOG | Chanticleer | Wild Hogs Christmas Special... this only aired once. Oh also both Laserdiscs of the 2-Part /'Hog Wild: Life, Death and the Road with the Wild Hogs./' Docuseries.
QUEST | chanticleerHogs = 1
QUEST | chanticleerAlone += 1
IF chanticleerAlone >= 2 | GOTO | SHARE
GOTO | COLLECTIONSKIP | Well that's very cool...

COLLECTIONSKIP
WAIT | 1.0
DIALOG | P_NAME | I don't really know what to say to that... but maybe something else...?
GOTO | CHANTI_QS

SHARE
DIALOG | P_NAME | Okay but uh... you live still live alone right?
DIALOG | Chanticleer | Yeah, kinda hard to have a roommate AND be a hermit, don't you think?
DIALOG | P_NAME | Well I guess I was just thinking that maybe if you had a friend you could watch Wild-er what was it again?
DIALOG | Chanticleer | Wild Hogs. Or the abruptly cancelled sequel that I have a rare table-read of on Laserdi-
DIALOG | P_NAME | Yeah so that's what I'm thinking... maybe you just need someone to move in with you?
DIALOG | Chanticleer | Am I... ready to take that step?
DIALOG | P_NAME = s_port_hoopzHappy | Sure you are! All you have to do is open your heart and the right friend will enter.
DIALOG | Chanticleer | But... who?
QUEST | chanticleerHogs = 3
QUEST | chanticleerSafety = 2
GOTO | ROOMMATECHOOSER

UNTRUSTWORTHY
DIALOG | P_NAME | I value our young friendship, and my flagrant lack of Operational Security means your secret is as good as meme'd as soon as I hear it. Best keep it to yourself...
DIALOG | Chanticleer | Say no more... and off with you... skedaddle!
QUEST | chanticleerSafety = 1
EXIT |

ALONE
DIALOG | P_NAME | Is it just you?
DIALOG | Chanticleer | Well you see. I'm a hermit. Chanticleer Masamune is my name. I come from a long line of proud hermits. My father was hermit, and his father before him. We've found the hermit business to be rather lucrative.
QUEST | chanticleerJustYou = 1
CHOICE | Reply?
REPLY | SYMPATHY | You must get lonely...
REPLY | HERMITPRIDE | Sounds like your lineage would be proud.

SYMPATHY
DIALOG | P_NAME | That seems awfully lonely... just hanging out down here all by yourself.
DIALOG | Chanticleer | That's what the Masamune family name is built upon.  My father and my grandfather were born into hermitage and that is where they stayed for their entire lives. I have to carry on the tradition..._ right?
DIALOG | P_NAME | Well maybe not? These times, they are a-changin'
DIALOG | Chanticleer | You may have a point, P_NAME_S. What if I've been so wrapped up in my duty as a Masamune that I haven't really thought about my desires as a Chanticleer._._._? Has it all been for naught?
QUEST | chanticleerAlone = 2
GOTO | CHANTI_QS

HERMITPRIDE
DIALOG | P_NAME | Wow, carry on the tradition all by yourself. What a cross you must bear.
DIALOG | Chanticleer | All for the sake of the family liturgy. I honestly think someday we'll all be hermits, you should really try it.
DIALOG | P_NAME | I'll think about it.
QUEST | chanticleerAlone += 1
GOTO | CHANTI_QS

ORIGIN
DIALOG | P_NAME | What are you doing down here?
DIALOG | Chanticleer | What does it look like? Living the /'Necronian Dream!/' living off the land here in The Undersewers.
DIALOG | P_NAME | Oh_..._ I see.
DIALOG | Chanticleer | What are YOU doing down here?
QUEST | chanticleerOrigin = 1
QUEST | chanticleerAlone += 1
IF knowLONGINUSTnn == 0 | IF fishgutQuest == 0 | GOTO | NOCOMMENT
CHOICE | What are YOU doing?
IF knowLONGINUSTnn >= 1 | REPLY | LONGINUS | I'm searching for rebels.
IF fishgutQuest >= 1 | REPLY | FISHGUTS | I'm spelunking for fishgut's.
REPLY | NOCOMMENT | No comment.

FISHGUTS
DIALOG | P_NAME | I'm actually looking for fishgut's. I'm supposed to collect them from the Fiscians but maybe if you had some sitting around I could buy some from you?
DIALOG | Chanticleer | Buy from me? Oh heck, youngster, I'll BUY FROM YOU!_ I love fishgut's!
DIALOG | P_NAME = s_port_hoopzAngry | Really? They smell kind of rank to me.
DIALOG | Chanticleer | That's how you know they are ready for sautee! Take a skullful of fishguts and fry them up with churned cream from the buttergland of a Sewer Beast! Clispaeth knows there is nothing better!
WAIT | 0.3
DIALOG | Chanticleer | So..._ do you actually have some?
QUEST | chanticleerGuts = 1
GOTO | FISHGUTGIVER

FISHGUTGIVER
DIALOG | P_NAME | Hmm, fishgut's, let's see...
WAIT | 0.25
IF @Fiscian Gut's@ < 10 | GOTO | NOTENOUGHGUTS
CHOICE | Offload some fishgut's?
IF @Fiscian Gut's@ >= 10 | REPLY | GIVEGUTS | Sure take TEN, I don't need them...
REPLY | KEEPGUTS | Gonna hold on to these gut's for a bit sorry.

NOTENOUGHGUTS
DIALOG | P_NAME | Look's like I'm a little short of fishgut's, let me get back to you when I have at least ten.
DIALOG | Chanticleer | Fair enough.
GOTO | CHANTI_QS

GIVEGUTS
IF fishgutQuest == 1 | DIALOG | P_NAME | I guess you can have them, I was supposed to give them to a friend but... what the heck, you seem like you could really use some!
IF fishgutQuest == 2 | DIALOG | P_NAME | Here you go, these are just some I had left over!
WAIT | 0.1
NOTIFY | Gave 10 Fishgut's to Chanticleer.
ITEM | Fiscian Gut's | -10
DIALOG | Chanticleer | Wow thanks! These looks like Choice A Fishgut's, and fresh too!
DIALOG | P_NAME | Well, I pretty much just killed them...
DIALOG | Chanticleer | Can't wait to sprinkle these in the pan. There actually might be enough for two here!
DIALOG | P_NAME | Maybe you should share those fishgut's with a friend sometime. Maybe even a roommate?
DIALOG | Chanticleer | A roommate? That would be quite a leap for me...
QUEST | chanticleerSafety = 2
QUEST | chanticleerGuts = 2
GOTO | CHANTI_QS

NOCOMMENT
DIALOG | P_NAME | No comment on that one, playing this close to the vest.
DIALOG | Chanticleer | Oh... well alright, I guess I'll talk to the next fella who comes my way..._ in twenty-five years.
EXIT |

LONGINUS
DIALOG | P_NAME | I'm looking for rebels. Do you know anyone from L.O.N.G.I.N.U.S.?
DIALOG | Chanticleer | Can't say that I do, laddie. Oh sure I hear footsteps from time to time, but I rarely peek outside, probably for fear of getting a Fiscian dart in the eye.
DIALOG | P_NAME | Darn... I was hoping I was on the right track.
DIALOG | Chanticleer | You've got heart, I can see that about you, you remind me of someone very dear to me... his name is Dudley... but that's for another time. I hope you find these rebels you are looking for.
QUEST | chanticleerRebels = 1
GOTO | CHANTI_QS

LEAVE
DIALOG | P_NAME | Must have taken a wrong turn somewhere, see you.
DIALOG | Chanticleer | So long._._._ neigh_bor_?
QUEST | chanticleerState = 1
EXIT |
" +
/////////////////////////////////
//  Event 1 Roommate Chooser   //
/////////////////////////////////
///Move-In Prompt for Chanticleer
"
ROOMMATECHOOSER
CHOICE | Who should move in?
IF gutterhoundQuest = 4 | REPLY | GUTTERHOUNDSAFETY | Gutterhound!
IF aelfledaEvict == 1 | REPLY | AELFLEDASAFETY | Aelfleda!
IF aelfledaEvict == 4 | REPLY | AELFLEDASAFETY | Aelfleda!
REPLY | HOOPZSAFETY | Me!
REPLY | NOBODYSAFETY | Let me think about it...

GUTTERHOUNDSAFETY
DIALOG | P_NAME | I think I know a guy who might want to help you with that Wild Hogs collection.
DIALOG | Chanticleer | A ..._ viewing partner..? do you think I'm ready to take that step? Bare my collection to another? Everything I've worked so hard for?
CHOICE | Move in Gutterhound?
REPLY | GUTTERMOVE | Yes!
REPLY | NOBODYSAFETY | Let me think about it.

AELFLEDASAFETY
DIALOG | P_NAME | I think I know someone who could really use a spot to lay their head down.
DIALOG | Gutterhound | Oh? A lost soul?
DIALOG | P_NAME | Kinda like that, she's had some financial troubles and could use some relief.
DIALOG | Gutterhound | Do she like... motorcycles?
DIALOG | P_NAME | Well I don't really know, but you could ask her if she moves in.
DIALOG | Gutterhound | I don't know, P_NAME_S. What do you think? Am I ready?
CHOICE | Move in Aelfleda?
REPLY | AELFLEDAMOVE | Yes!
REPLY | NOBODYSAFETY | Let me think about it.

HOOPZSAFETY
DIALOG | P_NAME | How about yours truly?
DIALOG | Chanticleer | Well ... would you really want to make this your permanent abode?
CHOICE | Move yourself in?
REPLY | HOOPZMOVE | Yes!
REPLY | NOBODYSAFETY | Let me think about it.

NOBODYSAFETY
DIALOG | P_NAME | Actually, let me make sure who exactly is the /'right match./'
DIALOG | Chanticleer | I have no reason not to trust you, P_NAME_S... I have no reason not to trust anyone...
EXIT |

HOOPZMOVE
DIALOG | P_NAME = s_port_hoopzHappy | Let's do it!
WAIT | 0.2
DIALOG | Chanticleer | I guess it's official then, we're roommates.
" +
//TODO: I like the idea of doing a "social link achieved" here, like monster quest
//  from barkley 1 or MISSION COMPLETE from Cornrow and Juicebox
//  CHECK #1796
"
DIALOG | Bhroom | Run a /'Mystic I Ching Synergy/' dialog box here! (check ticket #1796)
WAIT | 0.5
DIALOG | P_NAME = s_port_hoopzHappy | Sounds great!_ When can I move in?
DIALOG | Chanticleer | Consider yourself moved!
DIALOG | P_NAME = s_port_hoopzHappy | Hooray! What are the house rules?
DIALOG | Chanticleer | Hmmm_ simple enough, uh the trash is under the sink, it's commingled, so we're in the sewers trash day is everyday so just drop it outside the door. I guess that's about it.
DIALOG | P_NAME | I can do that.
QUEST | chanticleerSafety = 3
QUEST | chanticleerRoommate = 1
WAIT | 0.3
DIALOG | Chanticleer | So uh_._._._ want to watch a movie?
GOTO | HANGOUT

GUTTERMOVE
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! You'll make great roommates! When can he move in?
DIALOG | Chanticleer | Right away, I guess.
DIALOG | P_NAME | Okay, I'll let him know. And good news also is that I think he'll have a fair amount of shekels on hand for a security deposit.
DIALOG | Chanticleer | Oh great, I was gonna ask... but felt awkward. See you later, P_NAME_S.
QUEST | time += 1
QUEST | gutterhoundQuest = 5
QUEST | chanticleerRoommate = 3
QUEST | chanticleerSafety = 3
EXIT |

AELFLEDAMOVE
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! You'll make great roommates! When can she move in?
DIALOG | Chanticleer | Right away, I guess.
DIALOG | P_NAME = s_port_hoopzHappy | Okay, I'll let her know! thanks!
QUEST | aelfledaEvict = 6
QUEST | chanticleerRoommate = 2
QUEST | chanticleerSafety = 3
QUEST | time += 1
EXIT |
" +
/////////////////////////////////////
/// MOVEIN RESPONSES per roommate ///
/////////////////////////////////////
"
AELFLEDA_ROOMIE
DIALOG | Chanticleer | She doesn't really... smile all that much...
EXIT |

GUTTERHOUND_ROOMIE
DIALOG | Chanticleer | I'm not so sure if Gutterhound is rooting for the Hogs or the Fuegos...
FRAME | CAMERA_NORMAL | o_chanticleer01 | o_gutterhound02
LOOKAT | o_cts_hoopz | o_gutterhound02
WAIT |
DIALOG | Gutterhound | Ha! Ha! Ha! Look at ol' Jackie give 'em the business!  Ha! Ha! Go Jackie Go!
FRAME | CAMERA_NORMAL | o_chanticleer01 | o_cts_hoopz
LOOKAT | o_cts_hoopz | o_chanticleer01
WAIT |
WAIT | 0.25
DIALOG | Chanticleer | Also I might be out of beer soon...
EXIT |

HANGOUT
CHOICE | Want to hang?
REPLY | MOVIE | Yeah, let's watch a flick!
REPLY | LEAVE | Maybe later.

MOVIE
DIALOG | P_NAME | How about we pop in a disc and watch a talkie?
DIALOG | Chanticleer | You thinkin' what I'm thinkin?
DIALOG | P_NAME = s_port_hoopzHappy | Ride hard, or go home!
" + 
//TODO: this is the yet-to-be-decided "movie watch" portion of Chanticleer's event
//  we don't actually need it and it could be cut out, but it's here as a placeholder
"
DIALOG | Bhroom | RUN THE MOVIE WATCH MINIGAME
QUEST | time += 1
EXIT |

LEAVE
DIALOG | P_NAME | Maybe later, Chanti, I got a lot of things on my mind right now. Gotta go.
DIALOG | Chanticleer | No problem, roommie. Catch you later.
EXIT |
"
