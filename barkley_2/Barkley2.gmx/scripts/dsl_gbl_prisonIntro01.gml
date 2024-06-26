/// Prison Intro(s)
external = 1; 
script  = "
IF escapedFromTNN == 0 | QUEST | escapedFromTNN = 3
QUEST | farewellTNN = 2
IF prisonIntro == 1 | GOTO | PRISON_INTRO_1
IF prisonIntro == 2 | GOTO | PRISON_INTRO_2
IF prisonIntro == 3 | GOTO | PRISON_INTRO_3
IF prisonIntro == 4 | GOTO | PRISON_INTRO_4

PRISON_INTRO_1
FADE     | 0 | 1.5
Misc     | set | o_cts_hoopz | o_cinema0
Camera   | snap | o_cinema4
FRAME    | CAMERA_SLOW | o_cinema2
MOVETO   | o_astyages01 | o_cinema1 | MOVE_NORMAL
MOVETO   | o_cts_hoopz  | o_cinema2 | MOVE_NORMAL
MOVETO   | o_dozier01   | o_cinema3 | MOVE_NORMAL
WAIT     | 12
FADE     | 1 | 2 
WAIT     | 2
QUEST    | prisonIntro = 2
Teleport | r_pri_prisonCourt01 | 464 | 600 | 2

PRISON_INTRO_2
Misc     | alpha | o_thrax01 | 0 | 0
Camera   | snap | o_cinema8
FRAME    | CAMERA_SLOW  | o_cinema0
LOOK     | o_thrax01    | SOUTHEAST
LOOK     | o_astyages01 | NORTHWEST
LOOK     | o_dozier01   | NORTHWEST
LOOK     | o_cts_hoopz  | WEST
MOVETO   | o_astyages01 | o_cinema1 | MOVE_SLOW
WAIT     | 1.25
MOVETO   | o_cts_hoopz  | o_cinema0 | MOVE_SLOW
WAIT     | 0.75
MOVETO   | o_dozier01   | o_cinema2 | MOVE_SLOW
WAIT     | 0
LOOKAT   | o_astyages01 | o_cts_hoopz
LOOKAT   | o_cts_hoopz  | o_astyages01 
DIALOG   | Astyages | Stop right here, boot-licker. Looks like you have the privilege of witnessing one of `sq`Warden Thrax's`rt` legendary Gloom Sermons._ `s1`Pay attention!`s0`
LOOK     | o_cts_hoopz  | NORTHEAST
LOOK     | o_astyages01 | NORTHEAST
LOOK     | o_dozier01   | NORTHEAST
FRAME    | CAMERA_NORMAL  | o_cinema3
WAIT     | 1.5
EVENT    | o_thrax01 | 0
WAIT     | 1
Misc     | alpha | o_thrax01 | 1 | 0.5
WAIT     | 0.75
MOVETO   | o_thrax01 | o_cinema3 | MOVE_SLOW
WAIT     | 0
LOOK     | o_thrax01 | SOUTHEAST
WAIT     | 1.5
FOLLOWFRAME  | CAMERA_NORMAL | o_thrax01 | o_cinema20
DIALOG   | Thrax | Citizens of the Hoosegow! I am your Warden! I am your Future! I control your F.A.T.E. and your F.A.T.E. shall be thus...
WAIT     | 0.25
DIALOG   | Thrax | Your bones shall bleach in the glaring sun, and Clispaeth will not find you. Your puny bodies will be torn apart, and Clispaeth will not put you back together again.
WAIT     | 0
Misc     | flipx | o_thrax01 | 1
MOVETO   | o_thrax01 | o_cinema7 | MOVE_SLOW
WAIT     | 0.75
DIALOG   | Thrax | You will be cast into the deepest abyss without a torch, and Clispaeth will not light your way. You will be buried to your neck in the deepest trench in the deepest ocean, and Clispaeth will not part the waters for you. 
WAIT     | 0
Misc     | flipx | o_thrax01 | 0
MOVETO   | o_thrax01 | o_cinema3 | MOVE_SLOW
WAIT     | 0.75
DIALOG   | Thrax | Whatever you were in your past life is forfeit. Now, you all are meat, and the starving earthworms eagerly await what scant nutrition they can squeeze from your worthless corpse. Some of you may already be thinking of escape, but let me put these thoughts to rest:_ `s1``sq`There is no escape.`rt``s0`
WAIT     | 0
Misc     | flipx | o_thrax01 | 1
MOVETO   | o_thrax01 | o_cinema7 | MOVE_SLOW
WAIT     | 0.75
DIALOG   | Thrax | Everything you knew is gone. Everydwarf you knew is dead. Every hovel you cowered in is now destroyed. Every succulent fruit you tasted has rotted. Every gem you hoarded has been lost.
WAIT     | 0
Misc     | flipx | o_thrax01 | 0
MOVETO   | o_thrax01 | o_cinema3 | MOVE_SLOW
WAIT     | 0.75
DIALOG   | Thrax | You are the hoosegow. The hoosegow is you. Welcome to your new lives.
WAIT     | 0
MOVETO   | o_thrax01 | o_cinema3 | MOVE_SLOW
WAIT     | 0
MOVETO   | o_thrax01 | o_cinema9 | MOVE_NORMAL
WAIT     | 0
Misc     | alpha | o_thrax01 | 0 | 0.5
WAIT     | 0.75
EVENT    | o_thrax01 | 1
FRAME    | CAMERA_NORMAL | o_cts_hoopz | o_astyages01 | o_dozier01 
WAIT     | 0
LOOK     | o_cts_hoopz  | NORTHWEST
LOOK     | o_astyages01 | SOUTHEAST
LOOK     | o_dozier01   | NORTHWEST
DIALOG   | Astyages | Heh heh heh... How does it feel to know you have just lost every last bit of hope, shrimp?
DIALOG   | P_NAME   | B-but...
DIALOG   | Astyages | Silence! 
DIALOG   | Dozier | Enough dicking around. Move it, dickwad! You are about to get processed into the system for the REST of your natural life. `w1`Bwahahaha!`w0`
WAIT     | 0.25
FRAME    | CAMERA_SLOW | o_cinema6
WAIT     | 0.25
MOVETO   | o_astyages01 | o_cinema4 | MOVE_SLOW
WAIT     | 0.75
MOVETO   | o_cts_hoopz | o_cinema5 | MOVE_SLOW
WAIT     | 0.75
MOVETO   | o_dozier01 | o_cinema0 | MOVE_SLOW
WAIT     | 0.25
LOOK     | o_astyages01 | SOUTHEAST
FADE     | 1 | 1.5
WAIT     | 1.5
QUEST    | prisonIntro = 3
Teleport | r_pri_prisonProcessing01 | 272 | 232 | 1.5

PRISON_INTRO_3
Misc   | set | o_cts_hoopz | o_teleport_mark
LOOK   | o_cts_hoopz  | NORTH
LOOK   | o_astyages01 | NORTHWEST
LOOK   | o_oolon01    | SOUTHEAST
FRAME  | CAMERA_FAST  | o_cts_hoopz | o_perry01
WAIT   | 1
DIALOG | Perry  | Well well well, what do we got here...
IF prisonArrested == 1 | GOTO | ARRESTED_FOR_GELASIO
IF prisonArrested == 2 | GOTO | ARRESTED_FOR_BOMB
IF prisonArrested == 3 | GOTO | ARRESTED_FOR_CURFEW
IF prisonArrested == 4 | GOTO | ARRESTED_FOR_BANK
IF prisonArrested == 5 | GOTO | ARRESTED_FOR_CHUP
IF prisonArrested == 6 | GOTO | ARRESTED_FOR_PISS

ARRESTED_FOR_GELASIO
DIALOG | Oolon  | This youngster was arrested during the last Tir na nOg Vagrancy Purge. Just another rebel scum.
DIALOG | Perry  | Pathetic. Let's see now... 1 count of plotting against Cuchu, 3 counts of associating with rebel scum, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
IF mainQuest < 2 | QUEST | mainQuest = 2
GOTO   | SENTENCE

ARRESTED_FOR_BOMB
DIALOG | Oolon  | This youngster was caught trying to plant a bomb in front of the Tir na nOg Governor's Mansion. He is a TERRORIST!
DIALOG | Perry  | Despicable. Let's see now... 1 count of attempted terrorism, 3 counts of possession of illegal explosives, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
IF mainQuest < 2 | QUEST | mainQuest = 2
GOTO   | SENTENCE

ARRESTED_FOR_CURFEW
DIALOG | Oolon  | This youngster was caught wandering about during curfew. A rebel plotting to overthrow the government, no doubt. Pfft... 
DIALOG | Perry  | Sad. Let's see now... 1 count of getting roughed up, 6 counts of walking on the street, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
IF mainQuest < 2 | QUEST | mainQuest = 2
GOTO   | SENTENCE

ARRESTED_FOR_BANK
DIALOG | Oolon  | This youngster was caught robbing the Tir na nOg bank with some other ne'er-do-well by the name of Gutterhound.
DIALOG | Perry  | Despicable. Let's see now... 1 count of intent to steal from Cuchu, 8 counts of lusting after earthly possessions, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
IF mainQuest < 2 | QUEST | mainQuest = 2
GOTO   | SENTENCE

ARRESTED_FOR_CHUP
DIALOG | Oolon  | One of our moles brought us this youngster who was trying to sell narcotics to the dwarfs in The Social. No doubt he was trying to bring relief to the molested dwarfs and make a quick buck on the side.
DIALOG | Perry  | Unforgivable. Let's see now... 1 count of intent to help dwarfs, 4 counts of back alley dealings, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
GOTO   | SENTENCE

ARRESTED_FOR_PISS
DIALOG | Oolon  | This despicable son of a bitch tried to steal piss from a duergar in the middle of Tir na nOg! Is there no limits to the depravity of dwarfs these days?
DIALOG | Perry  | `s1`Uoeagh!!`s0` A piss thief! Makes me sick... Time to answer for your crimes, you bastard. Let's see... 3 counts of malicious thievery, 10 counts of sub-dwarf behaviour, 2 counts of piss mishandling (AKA pisshandling), and 4 counts of being a dwarf.
IF mainQuest < 2 | QUEST | mainQuest = 2
GOTO   | SENTENCE

SENTENCE
DIALOG   | Perry  | That amounts to... `sq`1,293 years in hoosegow with no chance of parole.`rt` Get fucked, pal.
SURPRISEAT | o_perry01
DIALOG   | P_NAME = s_port_hoopzShock | Wha! But... But...
WAIT     | 0.25
LOOK     | o_cts_hoopz | WEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTHWEST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.25
PLAYSET  | o_cts_hoopz | sad0 | sad1
WAIT     | 0
DIALOG   | P_NAME = s_port_hoopzSad | 1,293 years..._ C-cyberdwarf... I'm sorry...
PLAYSET  | o_cts_hoopz | sad2 | sad3
WAIT     | 0
DIALOG   | Oolon  | `w1`Hyuck hyuck hyuck!`w0` Get fucked, pal! Get fuckin' fucked!
FADE     | 1 | 2
WAIT     | 2
QUEST    | prisonDoors = 1
QUEST    | prisonIntro = 4
QUEST    | behaveJaded += 1 
BodySwap | prison
Teleport | r_pri_prisonInside01 | 504 | 360 | 2

PRISON_INTRO_4
Misc   | visible | oPrisonBolthiosLegs | 1
QUEST  | prisonIntro = 5
Create | o_astyages01 | " + string(o_cinema1.x) + " | " + string(o_cinema1.y) + "
Misc   | set | o_cts_hoopz | o_cinema4
LOOK   | o_cts_hoopz | NORTH
LOOK   | o_astyages01 | SOUTHEAST
Camera | snap | o_cinema5
FRAME  | CAMERA_FAST | o_cinema5
EVENT  | o_pri_cellGate | 10
WAIT   | 2
SOUND  | sn_prisondooropen01
EVENT  | " + string(instance_nearest(504, 320, o_pri_cellGate)) + " | 11
WAIT   | 1
MOVETO | o_cts_hoopz | o_cinema5 | MOVE_SLOW
WAIT   | 0 
WAIT   | 0.2
SOUND  | sn_prisondoorclosed01
EVENT  | " + string(instance_nearest(504, 320, o_pri_cellGate)) + " | 10
FRAME  | CAMERA_NORMAL | o_astyages01 | o_cts_hoopz
WAIT   | 0
LOOK   | o_cts_hoopz | SOUTH
LOOKAT | o_astyages01 | o_cts_hoopz
DIALOG | Astyages | Make your-cell-f at home, shrimp. `w1`Bwohohoho!`w0`
FRAME  | CAMERA_SLOW | o_cts_hoopz
MOVETO | o_astyages01 | o_cinema6 | MOVE_NORMAL
WAIT   | 2.5
DIALOG | Bolthios = s_port_bolthios_dark | What you in for, jugend?
LOOKAT | o_cts_hoopz | oPrisonBolthiosLegs
WAIT   | 0.25
FRAME  | CAMERA_NORMAL | o_cinema7 | o_cinema8
WAIT   | 0.5
MOVETO | o_cts_hoopz | o_cinema7 | MOVE_SLOW
WAIT   | 0
LOOK   | o_cts_hoopz | NORTH
WAIT   | 0
DIALOG | P_NAME | Me? Uh... well...
DIALOG | Bolthios = s_port_bolthios_dark | Heh, don't matter any more, youngster. This place has a way of forgetting the past,_ erasing history. Some dwarfs come in here, dwarfs with a future, with promise. They took a wrong turn. That's all it takes,_ `sq`one wrong turn.`rt`
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | ...who_ are_ you?
DIALOG | Bolthios = s_port_bolthios_dark | Heh, that don't matter either, youngster. When I get out of here, my old life won't be waitin'. My old lady, my kids... they've moved on, left me behind when Old Blue slapped the chains on me. For the best, all for the best. When I get out of here, ain't nobody gonna recognize the old me no longer.
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | Klispsakes... the hoosegow is scary.
DIALOG | Bolthios = s_port_bolthios_dark | Clispaeth has nothin' to do with it, kid. It ain't this place that frightens dwarfs. The real thing you should be frightened of, youngster,_ the thing that'll keep you up in a cold sweat on that bunk of yours._._._
Misc   | visible | oPrisonBolthiosLegs | 0
Create | o_pri_bolthios | " + string(o_cinema8.x) + " | " + string(o_cinema8.y) + "
WAIT   | 0.75
DIALOG | Bolthios | `sq`Is what this place turns you into.`rt`
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | (Golly...)
WAIT   | 1
SOUND  | sn_prisonbuzzer01
soundWAIT   | 1
DIALOG | Bolthios | Looks like my time is almost up, youngster.
WAIT   | 1
MOVETO | o_pri_bolthios | o_cinema9 | MOVE_SLOW
WAIT   | 0
LOOKAT | o_cts_hoopz | o_pri_bolthios
DIALOG | Bolthios | Here, take these... the dwarf that was here when I got locked up gave these to me... seems only fittin' that I pass them along. Plus, where I'm goin', I won't be needin' them.
USEAT  | o_pri_bolthios
NOTIFY | Got Pack of Smokes
ITEM   | Pack of Smokes | 1
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | Holy smacks..._ hoosegow smokes...
DIALOG | Bolthios | Maybe they can help you avoid the next wrong turn... Klisp knows they helped me through all these years.
DIALOG | P_NAME | Uh..._ thank you_?
DIALOG | Bolthios | Don't mention it.
SOUND  | sn_prisondooropen01
EVENT  | " + string(instance_nearest(504, 320, o_pri_cellGate)) + " | 11
WAIT   | 1
DIALOG | Bolthios | Time to see what's on the other side..._ so long, bitches.
MOVETO | o_pri_bolthios | o_cinema10 | MOVE_NORMAL
WAIT   | 1
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0
" +
//TODO: add a good sound here of the cell door sliding open
"
SOUND  | sn_prisondoorclosed01
EVENT  | " + string(instance_nearest(504, 320, o_pri_cellGate)) + " | 10
WAIT   | 1
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | (Wow... the hoosegow really changes you.)
WAIT   | 0.5
SOUND  | sn_stomachrumble01
Emote  | ! | o_cts_hoopz | 0 | 0
WAIT   | 0.5
PLAYSET| o_cts_hoopz | stomach_start | stomach_end
WAIT   | 0
QUEST  | prisonQuest = 1 // Show graphic of stomach
DIALOG | P_NAME | Uh oh_ I uh...
WAIT   | 0.25
SOUND  | sn_stomachrumble02
WAIT   | 1.0
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | I_ `w2`GOTTA GO!`w0`
SET    | o_cts_hoopz | stand_DOWN
WAIT   | 0.5
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | I need to find some place to uh... `sq`get relief quick`rt`_ `s1`or else...`s0`
Destroy| o_astyages01
Destroy| o_pri_bolthios
QUEST  | curfewAnnouncement = 2
QUEST  | prisonDoors = 0
QUEST  | toiletState = 1
";

/*
    prisonArrested
        0 = Not arrested
        1 = Arrested after going to rebel HQ and selling out your comrades via Gelasio
        2 = Arrested for trying to bomb the statue
        3 = Lost a battle against Duergar for the first time
        4 = Arrested for robbing the bank with Gutterhound
        5 = Arrested for chupsale
        6 = Tried to steal Constantine's piss
        
    prisonIntro
        0 = Intro not begun
        1 = Walking through the gates
        2 = Walking in to hear Thrax' speech
        3 = Walking to Processing
        4 = Processed
        5 = Locked up in the cell
        6 = Intro over
*/
