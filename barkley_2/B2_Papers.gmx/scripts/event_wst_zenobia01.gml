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
    	6 = you've returned with the Cyberspear Piec
    7 = you've talked to Irmingard after giving Zenobia the piece
*/
script = "
IF zenobiaEncounter == 3 | GOTO | DEALWITHZENOBIA
IF zenobiaEncounter == 2 | GOTO | RETURNTOVILLAGE
IF zenobiaEncounter == 1 | GOTO | ENCOUNTERSTART

RETURNTOVILLAGE
//TODO: start in darkness, FADE IN
DIALOG | P_NAME | ._._._ ugh... ah._._._
WAIT | 0.5
DIALOG | Elder Zenobia | Well well ape-man iz back! `s2`(Guggle guggle)`s0` What iz it dis time? We already got ya bonez!
" +
//TODO: FRAME | the bonez of Hoopz in the altar
"
DIALOG | P_NAME = s_port_hoopzSurprise | Th-there it is... my skelly...
DIALOG | Elder Zenobia | Wrong! It Gremz skelly now... Iz da 'sq'Belork Relick'rt'. And u iddint gunna git it back!
DIALOG | P_NAME | Well, what if I told you that I could get you a better Relic... something much more impressive than a simple human skeleton.
DIALOG | Elder Zenobia | I dunno, ape-man... deez bonez r real gud 4 Gremz. Gud 4 Belork.
DIALOG | P_NAME | I mean... I guess so but I don't see that many Gremz here.
WAIT | 0.5
DIALOG | Elder Zenobia | Dats_ uh_ dats just cuz da Gremz r uh__ 
DIALOG | Elder Zenobia | Watta u know, ape-man?! Just cuz Gremz iddint here dont mean ur Bonez iddint good!
DIALOG | P_NAME | Oh I'm not saying that my skelly is a bad Relic, but what I am saying is that I think I could do you one better.
DIALOG | Elder Zenobia | Wut u mean ape-man? Speak now or git dropped agin.
DIALOG | P_NAME | Well...
GOTO | CLISPAETH_QUEST


ENCOUNTERSTART
//TODO: start in darkness, FADE IN
DIALOG | P_NAME | ._._._ ugh... ah._._._
WAIT | 0.5
DIALOG | P_NAME | Wh-_where am I?
DIALOG | Elder Zenobia | Where u iz? U iz in BIG TROUBLE ape-man!
DIALOG | P_NAME = s_port_hoopzSurprise | C-cauldron... 
DIALOG | Elder Zenobia | Bwahaha! Wut matter ape-man? The bubbles 2 hawt 4 u?
" +
//TODO: Hoopz struggles to get free
"
DIALOG | P_NAME | Sorry Gremlin, but I have no interest in being your lunch today. Untie me!
DIALOG | Elder Zenobia | `s2`(Guggle guggle)`s0`... u no lunch! Dunneh flatter urself ape-man... we Gremz eat veggiez only. No no. U no lunch... dose bubbles not 4 ur meat... bubbles r to get 2 ur BONEZ! Ape-man has best bonez for Belork Relic!
DIALOG | P_NAME | Uh... Belork?
DIALOG | Elder Zenobia | Belork iz new God o' Gremz. Imma Grem Chief. Belork cum to me and tell me... Zeno... ur bonny-beauty-n-strong-_so-smart... make me relic in my honor... Belork told me in vizion!
DIALOG | P_NAME = s_port_hoopzShock | (`s2`Gulp!`s0` They're gonna cook the skin right off my skelly! Gotta do something and quick!)
" +
//TODO: verify that the magnet is the thing that kills you... delete this when the image has been created
"
DIALOG | Elder Zenobia | We lucky dat magnet drop diddint mince ur bonez 2 much... now time 2 get that meat off u and make the bestest relic for Belork! Dump-im Gremz!
DIALOG | P_NAME = s_port_hoopzShock | No! Wait!
WAIT | 1
DIALOG | Elder Zenobia | What'z it ape-man? I want dem bonez!
IF conversionQuest != 4 | GOTO | DROP_ME
GOTO | STOP_CHOICE

STOP_CHOICE
CHOICE | Any ideas?
IF conversionQuest == 4 | REPLY | CLISPAETH_QUEST | I'm here about Clispaeth.
REPLY | DROP_ME | Nary ye mind, drop me.

CLISPAETH_QUEST
DIALOG | P_NAME | Do you have a moment to talk about our lord and savior Clispaeth?
WAIT | 1.0
DIALOG | Elder Zenobia | Who-za-wut? Clip_?
DIALOG | P_NAME | I'd like to talk to you about something important today. I'd like to talk to you about your soul, your salvation_ and the F.A.T.E. of the Cybergremlin_-er-_ people. I'd like to talk to you about Clispaeth.
DIALOG | Elder Zenobia | Clispaste? What that?
DIALOG | P_NAME | Believe it or not, your soul is in danger. Not just yours, but the souls of all Cybergremlins are in danger. What F.A.T.E. awaits the souls of the Cybergremlin people? I hate to say it, but, well? Eternal darnation. But don't be afraid - this course is reversable... but only if you choose to cast aside your sinful, Belorkian ways and follow the light of Clispaeth. 
IF zenobiaEncounter == 2 | DIALOG | Elder Zenobia | Belork wants Relic!
IF zenobiaEncounter == 1 | DIALOG | Elder Zenobia | Deez Bonez are gud Relic!
IF zenobiaEncounter == 2 | DIALOG | P_NAME = s_port_hoopzSurprise | I'll get you a relic!
IF zenobiaEncounter == 1 | DIALOG | P_NAME = s_port_hoopzSurprise | I'll get you a better relic!
DIALOG | P_NAME | You don't want my bones... Clispaeth's relics are way way way more interesting than bones.
DIALOG | Elder Zenobia | Better 'dan bonez u say? Like wat?
DIALOG | P_NAME | Well um...
CHOICE | Better than bones?
REPLY | CROWN | The Iron Crown of Jackson
REPLY | VEIL | The Veil of Valanciunas
REPLY | BLOOD | The Blood of Klisp
REPLY | SCALA | The Scala Iactus
REPLY | MANDYBLUE | The Mandyblue
REPLY | CROWN | The Crown of Jalapenos
REPLY | SHROUD | The Shroud of Ballin'
REPLY | GRAIL | The Grape-topped Grail
REPLY | TRASH | Boatloads of Trash

CROWN
DIALOG | P_NAME | There's the uh... The Crown... the Iron Crown of Jackson,_ that's a good one!
DIALOG | Elder Zenobia | Crown, eh?
DIALOG | P_NAME | Oh yeah. And it's totally amazing... made of the finest iron with some really choice gemstones. I'm sure it's around here somewhere...
QUEST | relicSearch = 1
GOTO | CUTDOWN

VEIL
DIALOG | P_NAME | Well my bones are great and all but they are nothing compared to the Veil of_ um... Veil of Valanuciunas!
DIALOG | Elder Zenobia | Veil, eh?
DIALOG | P_NAME | Yeah it's a... cloth_ or cloth-like fabric that_ uh... was used to as a sweatband when Clispaeth played some hoop and ball in his youth...
DIALOG | Elder Zenobia | Sounds boring... maybe bonez r better.
DIALOG | P_NAME = s_port_hoopzSurprise | (`s1`Zooks!`s0` Think quick P_NAME_S!)
DIALOG | P_NAME = s_port_hoopzSurprise | No! No! Look_ can you put a skeleton in your pocket?
DIALOG | Elder Zenobia | Hmmm... well not whole thing.
DIALOG | P_NAME | Exactly, but you see... this Veil can easily be folded and carried with you... it takes up little space and is the perfect...
DIALOG | P_NAME = s_port_hoopzSmirk | .../'relic-on-the-go./'
QUEST | relicSearch = 2
GOTO | CUTDOWN

BLOOD
DIALOG | P_NAME | The uh... The Blood of Klisp! Holiest of hemoglobins!
DIALOG | Elder Zenobia | Hemo...
DIALOG | P_NAME | Well uh... when Clispeath was alive, he taught his disciples about the virtues of charity and He led by example... commonly donating blood to various clinics.
DIALOG | Elder Zenobia | Blud? Hmmm... blud wud be gud relic, where iz?
DIALOG | P_NAME | Oh well, I'm sure it's out in the Wasteland somewhere... I could find it for you!
QUEST | relicSearch = 3
GOTO | CUTDOWN

SCALA
DIALOG | P_NAME | How about the Scala_ uhhh... Iactus..._?
DIALOG | Elder Zenobia | Wut da huck is dat?
DIALOG | P_NAME | Oh well they are the steps_ that Clispaeth used to um... train... He ran stadiums... worked on his calves to get more ups with his jump shot.
DIALOG | Elder Zenobia | How r stairs bein' relics? Makes no sense! Get ready to drop'im, Gremz!
DIALOG | P_NAME = s_port_hoopzSurprise | Wait! Wait! (Think quick, P_NAME_S!)
DIALOG | P_NAME = s_port_hoopzSmirk | Yeah okay so... that's a valid point... You're smart Zenobia... Nothing gets past you!
DIALOG | Elder Zenobia | Yah yah, I already no dis!
DIALOG | P_NAME | Just think about it though... I can find you the Scala Iactus and you can set up a sanctioned pilgramage to the site... think of the tourism revenue!
QUEST | relicSearch = 4
GOTO | CUTDOWN

MANDYBLUE
DIALOG | P_NAME | Well there is the Mandyblue!
DIALOG | Elder Zenobia | Mandee_bloo?
DIALOG | P_NAME = s_port_hoopzHappy | Yes! The Mandyblue is a famous relic of Klispian Antiquity. It's said to be the TRUE IMAGE of Clispaeth, miraculously imprinted onto an_ uh... unused_ uh... jockstrap... 
DIALOG | Elder Zenobia | Me likey... Where iz?
DIALOG | P_NAME | Well I am sure it's out in the Wasteland somewhere... let me get it for you!
QUEST | relicSearch = 5
GOTO | CUTDOWN

CROWN
DIALOG | P_NAME | How about the Crown of... uh... Jalapenos?
DIALOG | Elder Zenobia | What iz dis?
DIALOG | P_NAME | On Clispaeth's deathbed they say that his closest apostle Wilt places upon his cranium a bundle of Jalapenos in a futile attempt to rouse the Messiah from the brink of his demise! It's quite a collectors item!
DIALOG | Elder Zenobia | Us Gremz have gon' veg... so we like dis Jalapeno idear!
DIALOG | P_NAME | Great, so let me down and I can go find it for you!
QUEST | relicSearch = 6
GOTO | CUTDOWN

SHROUD
DIALOG | P_NAME | How about the Shroud of Ballin'! Nothing would convey the awesome power of Clispaeth more than such a sacred cloth. They_ uh... say that the Shroud was a game-used towel by Clispaeth... 
DIALOG | Elder Zenobia | What it do?
DIALOG | P_NAME = s_port_hoopzSmirk | Besides guide you and your tribe down the Sacred Path? Well... the possibilities are endless...
QUEST | relicSearch = 7
GOTO | CUTDOWN

GRAIL
DIALOG | P_NAME | Well allow me to regail you about the precious /'Grape-topped Grail/'
DIALOG | Elder Zenobia | What dat iz?
DIALOG | P_NAME | Well... uh_ at a party one time Clispaeth performed_ uh... what would be later known as /'The Imaculate Pour./' The most perfect pour of The Grape in the history of dwarf-kind... his followers doubled that day... and his personal dogma went viral.
DIALOG | Elder Zenobia | Me likey Grape, The Grape is veggie and all gremz are veg.
DIALOG | P_NAME | Great so._._._ can you let me down and I can get to you the Grail?
QUEST | relicSearch = 8
GOTO | CUTDOWN

TRASH
DIALOG | P_NAME | Just tons-upon-tonnes of trash and refuse... piled high as the eyes can see. Clispaeth is the patron of rubbish, rubble and the dregs of civilized society.
QUEST | relicSearch = 9
GOTO | CUTDOWN

CUTDOWN
DIALOG | Elder Zenobia | Hmmm... me like the sound of that...
WAIT | 1.0
DIALOG | Elder Zenobia | Cut the ape-man down! Take ape-man to me private chambers.
DIALOG | P_NAME | (Oh thank Klisp...)
QUEST | zenobiaEncounter = 3
" +
//TODO: play cutting down animation
//TODO: FADE OUT
//TODO: TELEPORT TO the same map (normal spec cgrem village)
"
EXIT |

DROP_ME
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzSad | Ugh, nary ye mind... I got nothing... just drop me.
DIALOG | Elder Zenobia | `s2`(Guggle guggle)`s0` Belork will be pleaz'd!
DIALOG | P_NAME = s_port_hoopzSad | (Here it comes... father... mother... I wish I knew,_ or remembered you...)
DIALOG | Elder Zenobia | Drop'im!
" +
//TODO: play drop and boil animation
//TODO: set specific JUNK LORD even as true (this will increase CYBER HUMANISM A LOT)
//TODO: FADE OUT
//TODO: since this isn't a death in combat... how do we get this to register as a death and trigger the Junk Lord?
"
EXIT |

DEALWITHZENOBIA
" +
//TODO: FADE IN to hoopz and Zenobia behind the couch.
//TODO: there are two gremlins standing looking NORTHWEST
"
DIALOG | Elder Zenobia | Ape-man and me gunna hav a chit-chat. Just betwixt us! Scram Gremmies!
" +
//TODO: the two gremlins walk SOUTH and out of the frame
"
DIALOG | Elder Zenobia | Okay ape-man lemme level wit'u._ There iz no Belork. Belork not cum to me. Belork made up.
DIALOG | P_NAME = s_port_hoopzSurprise | `w2`What?!`w0` You mean you were gonna melt me off my own skeleton for no reason?!
DIALOG | Elder Zenobia | No. No. Me have reason. Zenobia always have reason!
WAIT | 1.0
DIALOG | P_NAME | Well... what is it then?
DIALOG | Elder Zenobia | Look around u, ape-man. U think thisiz nice village?
CHOICE | U think it nice village?
REPLY | NICEVILLAGE | It's quaint.
REPLY | BADVILLAGE | It ain't.

NICEVILLAGE
DIALOG | P_NAME | Well, the charm is apparent.
DIALOG | Elder Zenobia | Blah!_ No charm in village cuz village has no Gremz!
DIALOG | P_NAME | Well there are a few here and there...
DIALOG | Elder Zenobia | No like b4 Ape-man! U no here, u wouldn't no! Gremz inda trash, Gremz indis couch, Gremz inda toilet. Gremz outda yang!
DIALOG | P_NAME | Well there certainly isn't enough of them to be considered /'out the yang./' Where did they all go?
GOTO | WHEREGREMS

BADVILLAGE
DIALOG | P_NAME | To be honest, I found the Village's Welcome a little lacking. 
DIALOG | Elder Zenobia | U no wut else lacking in this village? Gremz! Village use-ta have tonza Gremz, It wuz a big honkin' grem party.
DIALOG | P_NAME | Huh... I only see a few gremlins here and there. Where did they all go?
GOTO | WHEREGREMS

WHEREGREMS
DIALOG | Elder Zenobia | Gremz out in da Wasties. Dey gon' Belork.
DIALOG | P_NAME | Wait isn't Belork the god you made up?
DIALOG | Elder Zenobia | O-ya..._ Belork iz both! Gremz stay in village cuz Gremz wait for Belork... Gremz want Relic. When Relic not here, Gremz go into the Wasties 2 look 4 it. Gremz look 4 Belork and dats when Gremz lose their Gremliness... and turn WYLD.
DIALOG | P_NAME | So that's why I'm always getting attacked out there? Those Gremlins have gone crazy looking for your made up Relic?
DIALOG | Elder Zenobia | No doy, Ape-man. U think Gremz r all wyld savage? Pfft. We Gremz are `sq`benevolent`rt` 'n kultured. We gone veg, 'member?
DIALOG | P_NAME | Oh... right.
DIALOG | Elder Zenobia | So, ape-man. Me have idear. Listen and u don't get cooked. U go get Relic, this _____ and come back and we add it to dis altar. Got it?
" +
//TOGO: add a string that is called from the 9 "relic names"
"
DIALOG | P_NAME = s_port_hoopzAngry | You mean I gotta find this thing?
DIALOG | Elder Zenobia | Ya! Dats da way u dont get boiled off ur bonez!_ Go git Relic!
DIALOG | P_NAME | Uh... I guess I have no choice.
DIALOG | Elder Zenobia | Oh and ape-man... u don't even think about leavin' the Wasties until u git dat Relic! U must swear it.
DIALOG | P_NAME | Well I don't swear but I 'w1'promise'w0' to find you gremlins your Relic.
DIALOG | Elder Zenobia | Gud. Werd iz bond, 'member dat.
DIALOG | P_NAME | Right._ Word is bond.
" +
//TODO: Zenobia walks up and away
//TODO: Hoopz looks down and puts head down
"
DIALOG | P_NAME | (Daggummit. What did you get yourself into now, P_NAME_S?)
QUEST | cgremQuest = 1
"
