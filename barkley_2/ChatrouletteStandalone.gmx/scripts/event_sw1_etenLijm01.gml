///Meeting Eten-Lijm
/*
Variables
    etenLijmState
        0 - have not talked
        1 - have talked once
        2 - talked again and heard the song, answered decently or great
        3 - heard song and answered poorly
        4 - crestfallen over Hoopz' dishonest rating
        5 - forgiven Hoopz about his dishonest rating of the song
*/
script = "
IF etenLijmGarlics == 3 | GOTO | GARLICSDONEREPEAT
IF etenLijmGarlics == 2 | GOTO | GARLICSDONE
IF etenLijmGarlics == 1 | GOTO | GARLICSWAIT
IF etenLijmState == 5 | GOTO | ETEN05
IF etenLijmState == 4 | GOTO | ETEN04
IF etenLijmState == 3 | GOTO | ETEN03
IF etenLijmState == 2 | GOTO | ETEN02
IF etenLijmState == 1 | GOTO | ETEN01
IF etenLijmState == 0 | GOTO | ETEN00

GARLICSDONEREPEAT
DIALOG | Eten-Lijm | /'Enjoy/' those Garlics, hehe.

GARLICSDONE
DIALOG | Eten-Lijm | Hey I got those Garlics you asked for. It took a while but these are about as potent a bulb as you can get.
DIALOG | P_NAME | Oh that's great, just what I needed.
DIALOG | Eten-Lijm | Here you are, still kinda perplexed on why you need them, but I learned a long time ago that it's best to not ask questions and assume no one is trying to take advantage of me.
" +
//TODO: USEAT | o_etenLijm01
"
ITEM | Garlics | 1
DIALOG | P_NAME | Thanks again, Eten-Lijm.
DIALOG | Eten-Lijm | Don't mention it please. Good luck.
EXIT |

GARLICSWAIT
DIALOG | Eten-Lijm | Garlics aren't done yet, but you can smell them already.
DIALOG | P_NAME | Okay, just checking.
DIALOG | Eten-Lijm | Come back in _____.
EXIT |

ETEN05
DIALOG | Eten-Lijm | Hey P_NAME_S, I have been thinking... I just want to say that it's water under the bridge. The whole singing thing. I kinda realized that I'm probably better off sticking to spoken word and SLAM poetry.
DIALOG | P_NAME | Oh? Well I guess that's a good hobby.
DIALOG | Eten-Lijm | Pretty lucrative, I've heard. Anyways... what can I do for you?
CHOICE | Anything for Eten-Lijm?
REPLY | GOTMOREGARLICS | Got any more Garlics?
REPLY | NARYYEMIND | Nary ye mind.

GOTMOREGARLICS
DIALOG | P_NAME | Do you have any Garlics on hand?
DIALOG | Eten-Lijm | Garlics, eh? The Devil's Bulb? No not really... we normally toss them right out as soon as we see them harvested. Why would you want something as undesirable as Garlics?
DIALOG | P_NAME | Let's just say I have my reasons.
DIALOG | Eten-Lijm | Well... I guess I could plant some of these Baby Columbus Day Garlics. But it'll take a few hours to get them mature. Could you come back then?
DIALOG | P_NAME | Hmmm, sure... so three hours?
DIALOG | Eten-Lijm | Yeah, come back at _____.
DIALOG | P_NAME = s_port_hoopzHappy | Okay sure! Thanks for doing this!
ClockTime | event | etenLijmGarlics | 2 | 160
QUEST | etenLijmGarlics = 1
EXIT |

ETEN04
DIALOG | Eten-Lijm | I'm trying to harvest and you're standing on my root vegetables.
DIALOG | P_NAME | Oh_ sorry.
EXIT |

ETENQUESTIONS
QUEST | etenLijmState = 2
CHOICE | Any questions for Eten-Lijm?
IF etenWhere == 0 | REPLY | WHEREAREWE | What is this place?
IF etenWhat == 0 | REPLY | WHATPLANTING | What are you planting?
IF etenWhere == 1 | IF etenWhat == 1 | REPLY | GARLICSINFO | Why do you need to remove the Garlics?
REPLY | NARYYEMIND | Gotta go...

GARLICSINFO
DIALOG | P_NAME | So you don't want the Garlics?
DIALOG | Eten-Lijm | Well, I think they're delicious, but they are expressly forbidden by the Overlord.
DIALOG | P_NAME | Do you know why?
DIALOG | Eten-Lijm | Something to do with dibilitating autoimmune reactions? I'm not sure... the Overlord are really wise, so they would know what they can and cannot handle.
DIALOG | P_NAME | Who is this Overlord?
DIALOG | Eten-Lijm | They... or er, I_T_... is many. I guess it's hard to explain, you'll have to see for yourself. Plus I have to get back to my labor... talk to you later, P_NAME_S.
QUEST | knowGarlics = 3
QUEST | etenLijmState = 3
EXIT |

WHEREAREWE
DIALOG | P_NAME | Where are we? What is this place?
DIALOG | Eten-Lijm | Oh it's just a Glorious Sewer Plantation. What you've never seen a place like this?
DIALOG | P_NAME | Uh not really...
DIALOG | Eten-Lijm | Well you must have not been looking, our Plantation Overlord say that Sewer Plantations are locked in a tight economic battle for superiority.
DIALOG | P_NAME | Overlord?
DIALOG | Eten-Lijm | Yeah they are in that shack there, but I wouldn't go in unless you have something for them. Butter most likely. Unfortunately all we've planted recently are a variety of tubers and tuber-like root vegetables.
QUEST | etenWhere = 1
GOTO | ETENQUESTIONS

WHATPLANTING
DIALOG | P_NAME | So what exactly are you planting?
DIALOG | Eten-Lijm | Roots and tasteless tubers. The Overlord pretty much only want butter and there isn't much in the way of dairy in the sewers. So we grow a lot of root vegetables and boil them down to a sludge in those barrels. The sludge eventually coagulates into a foamy cream which is then further processed into a fatty, spoonable sustenance.
DIALOG | P_NAME | Wow, you Dwarfs are so resourceful.
DIALOG | Eten-Lijm | Well the Overlord and their desires are tantamount to all. My job is mainly just to fish out those troublesome Columbus Day Garlics that grow like weeds here in the sewers.
QUEST | butterBarrelState = 1
QUEST | etenWhat = 1
GOTO | ETENQUESTIONS

ETEN03
DIALOG | Eten-Lijm | Gotta get back to work. Maybe come back later and we can talk.
EXIT |

ETEN02
DIALOG | Eten-Lijm | Hey P_NAME_S.
DIALOG | P_NAME | Hey, I have a few more questions.
GOTO | ETENQUESTIONS

ETEN01
DIALOG | Eten-Lijm | Hey! I made a song about being trapped on a Sewer Plantation and constantly teetering on the precipice of diciplinary torture. Do you want to hear it?!
CHOICE | Hear the song?
REPLY | HEARSONG | Sure.
REPLY | NOSONG | No thanks.

HEARSONG
DIALOG | P_NAME | Oh, uh sure.
" +
//TODO: lower music!
"
DIALOG | Eten-Lijm | Okay great, ahem...
WAIT | 2.0
DIALOG | Eten-Lijm | OH I WORK ALL DAY AND I WORK ALL NIGHT,
DIALOG | Eten-Lijm | WHAT COMRADES CALL PLIGHT, I CALL DELIGHT.
DIALOG | Eten-Lijm | RUTABEGAS IN THE GREEN PILE, GARLICS IN THE REDDDDDDD!
WAIT | 1.5
DIALOG | Eten-Lijm | CONFUSE YOUR ROOTS AND YOU'LL END UP DEAD!
QUEST | knowGarlics += 1
WAIT | 0.5
" +
//TODO: music comes back on
"
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzSurprise | Wow, that's uh- a-
CHOICE | Rate the song?
REPLY | TEN | Ten out of Ten.
REPLY | NINE | Nine out of Ten.
REPLY | EIGHT | Eight out of Ten.
REPLY | SEVEN | Seven out of Ten.
REPLY | SIX | Six out of Ten.
REPLY | FIVE | Five out of Ten.
REPLY | FOUR | Four out of Ten.
REPLY | THREE | Three out of Ten.
REPLY | TWO | Two out of Ten.
REPLY | ONE | One out of Ten.
REPLY | ZERO | None out of Ten.

TEN
DIALOG | P_NAME | Ten out of Ten.
QUEST | etenRating = 10
QUEST | behaveFib += 1
GOTO | LIAR

NINE
DIALOG | P_NAME | Nine out of Ten.
QUEST | behaveFib += 1
GOTO | BESTRATING

EIGHT
DIALOG | P_NAME | Eight out of Ten.
GOTO | BESTRATING

SEVEN
DIALOG | P_NAME | Seven out of Ten.
GOTO | BESTRATING

SIX
DIALOG | P_NAME | Six out of Ten.
GOTO | DECENTRATING

FIVE
DIALOG | P_NAME | Five out of Ten.
GOTO | DECENTRATING

FOUR
DIALOG | P_NAME | Four out of Ten.
GOTO | BADRATING

THREE
DIALOG | P_NAME | Three out of Ten.
GOTO | BADRATING

TWO
DIALOG | P_NAME | Two out of Ten.
GOTO | BADRATING

ONE
DIALOG | P_NAME | One out of Ten.
GOTO | BADRATING

ZERO
DIALOG | P_NAME | None out of Ten.
GOTO | BADRATING

LIAR
DIALOG | Eten-Lijm | Really? So you're saying I have no room for improvement?
DIALOG | P_NAME | Well uh, I thought it was really good.
DIALOG | Eten-Lijm | You know, I opened my heart and voice to you, and was looking for honest feedback not patronizing fibbery.
IF bootyBassQuest == 3 | GOTO | BOOTYWIN
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry I was just trying to be nice...
DIALOG | Eten-Lijm | Nothing nice about lying to new friends. I'll get back to sorting root vegetables now. Good bye.
DIALOG | P_NAME = s_port_hoopzSad | Bye...
QUEST | etenLijmState = 4
ClockTime | event | etenLijmState | 5 | 120
EXIT |

BESTRATING
DIALOG | Eten-Lijm | Really?! You think so?
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! I think you have a real gift for libretto. Your plight as a slave clearly inspires your transportative lyrics.
DIALOG | Eten-Lijm | Oh, well I was going for a more celebratory tone, but it's still open for revision and I guess, uh interpretation. Anyways, thank you, what can I help you with?
GOTO | ETENQUESTIONS

DECENTRATING
DIALOG | Eten-Lijm | Really? That's not so bad!
IF faveMusic == 0 | DIALOG | P_NAME | It wasn't at all. I just really haven't found my musical calling yet... it feels like maybe I just missed my big break in that area, but if I had... I probably would have really appreciated whatever it was you just sang.
IF faveMusic != 0 | DIALOG | P_NAME | It wasn't at all. I'm more into @faveMusic@, so that's probably what threw me off at first. But I think if this whole slavery thing doesn't work out, you might find a comfortable profession in the realm of songwriting.
DIALOG | Eten-Lijm | Why thank you very much, P_NAME_S. Moving on, is there something I can help you with?
GOTO | ETENQUESTIONS

BADRATING
DIALOG | Eten-Lijm | Ouch... that low huh?
DIALOG | P_NAME | Well, I was trying to be as honest as I can.
IF bootyBassQuest == 3 | GOTO | BOOTYWIN
GOTO | NOBOOTY

BOOTYWIN
DIALOG | P_NAME | Also, I do kinda know what I am talking about though when it comes to music. I am @djName@, the Baron of Booty.
DIALOG | Eten-Lijm | Wow, really?! The Baron of Booty! In the flesh!
IF etenRating != 10 | DIALOG | Eten-Lijm | Great to meet you and thank you so much for your devastating yet brutally fair criticism of my heart and soul that I poured out to you.
IF etenRating == 10 | DIALOG | Eten-Lijm | Great to meet you and thank you so much for bolstering my confidence as a performer. Coming from such an illustrious musical dignitary as yourself...
DIALOG | @djName@ = s_port_hoopzHappy | Well heh, I wouldn't get too carried away...
DIALOG | Eten-Lijm | Oh yes, of course, Baron. How can I help you otherwise?
GOTO | ETENQUESTIONS

NOBOOTY
DIALOG | Eten-Lijm | Well what do you know about music?
DIALOG | P_NAME | Oh_ uh... well nothing I guess.
DIALOG | Eten-Lijm | Yeah maybe next time you should think about that before dropping such a harsh numerical critique of my work. Now if you'll excuse me... I have a hard labor quota to fall just short of.
DIALOG | P_NAME = s_port_hoopzSad | Oh, okay sorry...
QUEST | etenLijmState = 3
ClockTime | event | etenLijmState | 4 | 50
EXIT | 

NOSONG
DIALOG | P_NAME | Um, not right now, that okay?
DIALOG | Eten-Lijm | Ok! Let me know if you change your mind!
EXIT |

ETEN00
DIALOG | Eten-Lijm | This is so much more fun than my last forced servitude!
QUEST | etenLijmState = 1
EXIT | 

NARYYEMIND
DIALOG | P_NAME | Nary ye mind, I'll take my leave.
DIALOG | Eten-Lijm | Fare thee well.
EXIT |
";
