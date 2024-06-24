///campfire event in cuchulainn's elevator
// only occurs if the player has Cyberdwarf and the Cyberspear
/*
QUEST VARIABLE:
campfireState
0 == not yet run
1 == ongoing, fire is burning
2 == concluded, fire is put out

ROUNDMOUND CHECK FOR ALIGNMENT
if Vengeance - Hoopz spraypaints FLUB CUCHULAINN onto the walls of the Elevator
if Candy - Hoopz roasts Marshmallows
if Vidcons - Hoopz plays on his wristconp, if he has it... if not he roasts mallows
if BBall - Hoopz dribbles
if Clispaeth - Hoopz prays on a prayer rug
if Brast - Hoopz cleans a brastcannon
*/
// TODO: fade out and move camera up top
// TODO: ROUND MOUND specific Campfire Sprites for Hoopz
// TODO: Campfire Added, embers float up the shaft
// TODO: SOUNDLOOP | fire crackling
script = "
WAIT |
" +
//TODO: Portraits should be made to flicker light and dark during the dialogue, at least for Hoopz.
//TODO: Cyberdwarf projects himself from the spear ... as he has already been installed into it from the previous scene in his Hideout
"
WAIT | 2
DIALOG | P_NAME | I-I can't believe we've come this far...
DIALOG | The Cyberdwarf | But why not, youngster? Do you not see the prophecy fullfilling itself before our eyes? 
IF knowProphecy >= 4 | GOTO | PROPHECYAGREE
GOTO | PROPHECYNOOB

PROPHECYAGREE
DIALOG | P_NAME | You're right C-dwarf... I've got to keep my head in the game.
DIALOG | The Cyberdwarf | Your head may lead, but your body must follow. Without the body,_ it is merely a dream.
GOTO | CAMPTALK

PROPHECYNOOB
DIALOG | P_NAME = s_port_hoopzSurprise | But I don't know anything about my prophecy! I mean,_ I know what you said, but... I haven't had much time to really wrap my 'hawk around the situation.
DIALOG | The Cyberdwarf | The adventurer who grips their torch too closely is blinded by the flame's light, whereas if they hold the torch high, as the pioneer does, the path is illuminated before them.
DIALOG | P_NAME | I-_I'm not sure what that might mean.
DIALOG | The Cyberdwarf | It means your destiny is already in front of you, regardless of if you know it or not.
GOTO | CAMPTALK

CAMPTALK
DIALOG | P_NAME | Cyberdwarf,_ I promise.
DIALOG | P_NAME | I'll push forward until the day that I die!
DIALOG | The Cyberdwarf | Fortunately I know that that time will be long from now, Son of Bball. There is much work to be done... work on the 666th Floor of this infernal ship.
DIALOG | P_NAME | What do I do when I come face to face with him?_ With Cuchulainn...
DIALOG | The Cyberdwarf | That, P_NAME_F, is when you will use this sacred weapon... The Gae Bolg... the one weapon that can defeat this despicable AI scourge and return the dwarfs to their happy hunting grounds.
DIALOG | P_NAME = s_port_hoopzSad | I hope... I have what it takes.
DIALOG | The Cyberdwarf | We all do. The entire Universe does.
DIALOG | P_NAME | It's just that... I got a lot on my mind!
IF rmVengeanceQualify == 1 | GOTO | ALIGN_VENGEANCE
IF rmCandyQualify == 1 | GOTO | ALIGN_CANDY
IF rmVidconQualify == 1 | GOTO | ALIGN_VIDCON
IF rmBballQualify == 1 | GOTO | ALIGN_BBALL
IF rmClispaethQualify == 1 | GOTO | ALIGN_CLISPAETH
IF rmBrastQualify == 1 | GOTO | ALIGN_BRAST

ALIGN_VENGEANCE
DIALOG | The Cyberdwarf | What you have on your mind is Vengeance, P_NAME_S. I am reminded of an ancienct Cyberpocalyptian Proverb... /'The blood-soaked cloth stains the hands when wrung./'
DIALOG | P_NAME | Are you saying... revenge is_ wrong?
DIALOG | The Cyberdwarf | Revenge? Maybe. But justice? Just d_e_s_e_r_t_s? Karma dictates the balance of all things, not man nor dwarf. There is no need for those already entwined with destiny to meddle in the affairs of F.A.T.E. Karma will see to it that all evil-doers get their /'sweet comeuppance./'
WAIT | 0.5
DIALOG | The Cyberdwarf | That being said, you've already made it this far. Might as well brast this Malevolent AI into the Hell he so desperately deserves!
GOTO | HECKYEAH

ALIGN_CANDY
DIALOG | The Cyberdwarf | You do not truly think because you approach the world through the eyes of a child, P_NAME_S. The 
DIALOG | P_NAME | 
DIALOG | The Cyberdwarf | 
DIALOG | P_NAME | 
DIALOG | The Cyberdwarf | 

ALIGN_VIDCON
DIALOG | The Cyberdwarf | The only thing on your mind is beating your personal best in /'Bolly Mixtures!/' There are more important things that your vidcons. The real world requires action and demands consequence. The convenience of a reset button is available only to an Eintag Dwarf and his kin! Focus!
DIALOG | P_NAME | Okay, okay, let me just get to a /'!Chak De Point./'_ Al_most_ there._ And_ okay, I'm good. What were you saying?
DIALOG | The Cyberdwarf | I am increasingly perturbed by your vidcon habits, P_NAME_F, but as I am not your father (no one can be...) I must stop short of scolding you.
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry Cyberdwarf...
DIALOG | The Cyberdwarf | Focus not on apologies but the task at hand:_ The defeat of the Malevolent AI Cuchulainn and his roundup of Duergars!

ALIGN_BBALL
DIALOG | The Cyberdwarf | You must play bball!
" +
//:TODO: needs reactions
//DIALOG | P_NAME | 
//DIALOG | The Cyberdwarf | 
//DIALOG | P_NAME | 
//DIALOG | The Cyberdwarf | 

//TODO: add ALIGN_CLISPAETH label
//TODO: add ALIGN_BRAST label
"

HECKYEAH
DIALOG | P_NAME = s_port_hoopzHappy | Heck yeah C-dwarf! I'm ready!
EXIT |
"
//TODO: camera follows the embers up the elevator shaft (up)
//TODO: some kind of connection to the elevator opening


/* KEEP THIS FOR NOTES!
alignBballLaw
you told me i'm the bball messiah... this must be what i have to do...
alignBballChaos
i've gotten so devastatingly powerful.
this malevolent ai cuchulainn may be strong, but i know he doesn't have my skills. i'll dash his brains upon the court...
alignCandyRarity
i wish i had a piece of candy
alignCandyVariety
you've never roasted a marshmallow, Cyberdwarf? we'll have to do it again sometime.
you think it will prepare you in the coming fight?
when we get out of this, I'll have to roast one with you...
there's enough mallows to go around for everybody, Cyberdwarf.
alignClispaethWorship
there's a lot i don't know out there....
alignClispaethHeresy
there's a lot i don't know out there... i want to know the truth
alignCyberdwarfOne
I'm really just doing it for you Cyberdwarf. i don't know what else to do... i trust you.
alignDwarfsLiberate
the dwarfs can't end here...
alignDwarfsTrouble
i just wish the dwarfs didn't get me into this mess...
alignDwarfsSavior
i want to lead my people home.
alignHomeOne
i wish we were home already...
alignHomeSombrero
i want to go home...
alignPowerLow
i don't want to have to fight... but i believe in myself...
alignPowerHigh
I'm just warming my hands... Cuchulainn doesn't know what's coming!
alignTruthNormal
i want to know the truth...
alignTruthReal
i want to know... /'the truth/'...
alignVengeanceOne
i need to destroy cuchulainn... i must... i must destroy whoever wronged me...
alignVidconsPlay
i want to just kick back and play a vidcon. do you ever game Cyberdwarf?
well...
yeah? come on, tell me!
the story goes something like this...
you must live life without regrets, just like the heroes and heroines of your vidcons...
dang... you may be right
alignVidconsConquer
i want to crush cuchulainn... so then i can get back to crushing more vidcons!
alignVidconsHoard
you said cuchulainn had a throne room, right?
yes...
i bet he's got the best game of them all
game displays: of course...
alignVidconsPreserve
i wonder what secrets necron 7 is hiding
i think i have every game known to exist... i don't know how it could happen... but it did.
Cuchulainn has a game you may desire?
* end Barkley 2 with a lost game
"