///Zenobia Encounter
/*
variables
zenobiaState
    0 = haven't met Zenobia
    1 = have met zenobia
zenobiaEncounter
    0 = this scene hasn't run, you haven't triggered the trap
    1 = you have triggered the trap, Cauldron scene will now run
    2 = you didn't have the Clispaeth Quest activated, you were dropped in the cauldron
    3 = the Cauldron Scene has run and now you talk to zenobia in private, you've already activated the Clispaeth Quest
relicSearch (what Hoopz says he'll look for.)
    1 = The Iron Crown of Jackson
    2 = The Veil of Valanciunas
    3 = The Blood of Klisp
    4 = The Scala Iactus
    5 = The Mandyblue
    6 = The Crown of Jalapenos
    7 = The Shroud of Ballin'
    8 = The Grape-topped Grail
    9 = Boatloads of Trash
cgremQuest
    0 = you haven't started the quest
    1 = the search is activated/started/unpaused
    2 = the search is "paused" so that it turns off the "QUEST MARKERS" visual gag
    3 = you've found the particular "relicSearch" item
    4 = you've been denied the "relicSearch" item, and now have to look for the cyberSpear piece
    5 = you've found the Cyberspear Piece
    6 = you've returned with the Cyberspear Piece
    7 = you've talked to Irmingard after giving Zenobia the piece
*/
script = "
DIALOG | Elder Zenobia | Whatcha want, ape-man?
DIALOG | P_NAME | Well, uh...
GOTO | INFO_CHOICE

INFO_CHOICE
CHOICE | What you want?
IF relicItem >= 2 | REPLY | RELIC_CHECK | Feast your eyes on these sumptious relics!
IF relicItem == 1 | REPLY | RELIC_CHECK | Alright I found a sweet Relic.
IF cgremQuest == 6 | REPLY | RELIC_CSPIECE | What are you gonna do with this fancy Relic?
IF cgremQuest == 5 | REPLY | RELIC_CYBERSPEAR | Check out this doozy of a Relic!
IF relicTryTimes >= 1 | IF cgremQuest != 6 | REPLY | RELIC_BETTER | What do you think this better relic will look like?
IF cgremQuest == 2 | REPLY | RELIC_UNPAUSE | I'm ready to keep looking for that Relic.
IF cgremQuest != 1 | IF cgremQuest != 6 | REPLY | RELIC_PAUSE | I need a break from all this fetching.
IF cgremQuest == 1 | REPLY | RELIC_STILL_LOOKING | Still looking for that Relic.

RELIC_CHECK
DIALOG | P_NAME | Check this out!
" +
//TODO: have some sort of Relic List that you can offer her - (this list excludes any previously offered junks)
//TODO: add some logic here to move to right response
"
GOTO | DEBUG_OFFER

DEBUG_OFFER
CHOICE | WHAT DID YOU GIVE?
REPLY | OFFER_JUNK | (Offer random relic.)
REPLY | OFFER_CLISPRELIC | (Give Klisp Relic that you said you'd get.)
REPLY | NARYYEMIND | Nary ye mind.

OFFER_JUNK
DIALOG | P_NAME | How about this one?
DIALOG | Elder Zenobia | Hmmm...
USEAT | o_zenobia01
WAIT | 1.0
DIALOG | Elder Zenobia | Eh... wutsis? Dis iz just piece of friggin' junk! Wut da heck, ape-man?
DIALOG | P_NAME = s_port_hoopzSad | Well I thought it would fit perfect on your altar.
GOTO | AINT_RELIC

RELIC_CSPIECE
DIALOG | P_NAME = s_port_hoopzHappy | Here it is! The _____
" +
//TODO: pull the name of the relic that you were looking for
"
USEAT | o_zenobia01
WAIT | 1.0
IF relicTryTimes == 0 | GOTO | AINT_RELIC01
IF relicTryTimes == 1 | GOTO | AINT_RELIC02
IF relicTryTimes >= 2 | GOTO | AINT_RELIC03

AINT_RELIC01
DIALOG | Elder Zenobia | Uh... dis it?
DIALOG | P_NAME  = s_port_hoopzHappy | Yep! I can't speak enough about the sanctity of such a relevant piece of 'sq'Klispian Antiquity'rt'!
DIALOG | Elder Zenobia | Dis ain't a Relic. If Gremz wanted dis type of Relic for Belork den Gremz woulda crapped it out usselves!
DIALOG | P_NAME = s_port_hoopzSad | Oh... sorry.
DIALOG | Elder Zenobia | Git back out der an' keep lookin'! 'w1'Fetch'w0' dat relic, ape-man!
DIALOG | P_NAME | (I guess I'll need to 'sq'fetch something even better'rt' out there in the Wastland.)
QUEST | relicTryTimes += 1
EXIT |

AINT_RELIC02
DIALOG | Elder Zenobia | Try more times, ape-man. Dis Relic iz insult to make-beleive God Belork! 'w1'Fetch'w0' sumfin' betta, you hairless primate bitch! 
DIALOG | P_NAME = s_port_hoopzSurprise | Geez-lousie, I'm going, I'm going.
QUEST | relicTryTimes += 1
EXIT |

AINT_RELIC03
DIALOG | Elder Zenobia | Dis sucks, keep 'w1'fetchin''w0'.
DIALOG | P_NAME = s_port_hoopzSad | Durn, it.
EXIT |

RELIC_CSPIECE
DIALOG | P_NAME | So what are you gonna do with that fancy Relic there?
DIALOG | Elder Zenobia | Wut u think, dummy? Preach the Werd of Clispaeth! U da 1 who told me 2 do it!
DIALOG | P_NAME | Oh right... well then_ Klisp be with you.
DIALOG | Elder Zenobia | And 2 u.
EXIT |

RELIC_CYBERSPEAR
DIALOG | P_NAME = s_port_hoopzSmirk | Zenobia, have I got a Relic for you. Put those bloodshot peepers of yours on this thingamajigger!
USEAT | o_zenobia01
WAIT | 0.75
DIALOG | Elder Zenobia | `s2`(Guggle guggle!)`s0` What iz dis? It iz PERFECT RELIC! Where u fetch it from??
DIALOG | P_NAME | It was a pain in the keister but I found it out in the Wasteland!
DIALOG | Elder Zenobia | Dis wuz out in da Wasties?! `s2`(Guggle guggle!)`s0`_ U rly outdid urself dis time, apeman! So shiny and..._ and_ 'w2'powerful.'w0'
DIALOG | P_NAME = s_port_hoopzHappy | This'll be a perfect 'sq'Klispian Relic'rt'!
DIALOG | Elder Zenobia | U right again apeman..._ Here, take this.
" +
//TODO: Zenobia gives you something.
"
DIALOG | P_NAME = s_port_hoopzHappy | Swell! Thanks Elder!
DIALOG | Elder Zenobia | Now scram, ape-man. Ima gunna wait fer Gremz to cum back to Village.
DIALOG | P_NAME | (I should go tell Irmingard that my mission was a success!)
" +
//TODO: advance time
//TODO: mission complete
"
QUEST | cgremQuest = 6
EXIT |

RELIC_BETTER
DIALOG | P_NAME | So I'm at a loss for a better relic... what do you think I should me looking for.
DIALOG | Elder Zenobia | I dunno, ape-man! U da 1 carryin' on about Clippaste and da bestest of Relics! Gremz need something shiny! 'sq'Find somefin' shiny-n-glowy-like'rt', got it?
DIALOG | P_NAME | Shiny, glowing..._ okay I think I can do that... I have some ideas about where I can search.
DIALOG | Elder Zenobia | Gud, now git!
EXIT | 

RELIC_UNPAUSE
DIALOG | P_NAME | Hey I'm ready to start my search again, thanks for your patience.
DIALOG | Elder Zenobia | K, ape-man. Be fast dis time!
QUEST | cgremQuest = 1
EXIT |

RELIC_PAUSE
DIALOG | P_NAME | Hey do you think I could take a quick break from the search? I remember I have... uh practice tonight.
DIALOG | Elder Zenobia | Ugh... fine, ape-man... but come back when u wanna do da work u promise me and da Gremz!
DIALOG | P_NAME | You got it, thanks!
QUEST | cgremQuest = 2
EXIT |

RELIC_STILL_LOOKING
DIALOG | P_NAME | I'm still looking for that relic, thanks for your patience.
DIALOG | Elder Zenobia | No moar patience! U fetch Relic soon!
EXIT |
"
/*
DIALOG | Elder Zenobia | 
DIALOG | P_NAME | 
DIALOG | Elder Zenobia | 
DIALOG | P_NAME | 
DIALOG | Elder Zenobia | 
DIALOG | P_NAME | 
DIALOG | Elder Zenobia | 
DIALOG | P_NAME | 
DIALOG | Elder Zenobia | 

