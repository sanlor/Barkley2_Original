// This is just a short scene where Hoopz enters the elevator.
if (Quest("wiglafMission") == 3 && Quest("elevatorIntro") = 0) 
{
external = 1;
script = "
IF campfireState == 1 | GOTO | CAMPFIRE
GOTO   | ELEVATORINTRO

ELEVATORINTRO
QUEST  | elevatorIntro = 1
Misc   | set  | o_cts_hoopz | o_cinema0
LOOK   | o_cts_hoopz | NORTH
Camera | snap | o_cinema2
FRAME  | CAMERA_FAST | o_cinema2
WAIT   | 0
WAIT   | 1
FRAME  | CAMERA_NORMAL | o_cinema3
WAIT   | 1
MOVETO | o_cts_hoopz | o_cinema1 | MOVE_SLOW
WAIT   | 0
LOOK   | o_cts_hoopz | NORTHEAST
WAIT   | 0.4
LOOK   | o_cts_hoopz | EAST
WAIT   | 0.4
LOOK   | o_cts_hoopz | NORTHEAST
WAIT   | 0.4
LOOK   | o_cts_hoopz | NORTH
WAIT   | 0.4
LOOK   | o_cts_hoopz | NORTHWEST
WAIT   | 0.4
LOOK   | o_cts_hoopz | WEST
WAIT   | 0.4
LOOK   | o_cts_hoopz | NORTHWEST
WAIT   | 0.4
LOOK   | o_cts_hoopz | NORTH
WAIT   | 1.0
DIALOG | P_NAME      | This must be the elevator up to this `kw`Cuchulainn's lair...`rt` am I ready?
WAIT   | 0.25
LOOK   | o_cts_hoopz | NORTHWEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | WEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.25
DIALOG | P_NAME      | Well, as the great Charles Dickens once wrote ... 'Procrastination is the thief of time, collar him.' ...
DIALOG | P_NAME      | ... How do I know that...?
EXIT |
" +
/// CAMPFIRE in cuchulainn's elevator
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
if Vidcon - Hoopz plays on his wristconp, if he has it... if not he roasts mallows
if BBall - Hoopz dribbles
if Clispaeth - Hoopz prays on a prayer rug
if Brast - Hoopz cleans a brastcannon
*/
// TODO: fade out and move camera up top
// TODO: ROUND MOUND specific Campfire Sprites for Hoopz
// TODO: Campfire Added, embers float up the shaft
// TODO: SOUNDLOOP | fire crackling
"
CAMPFIRE
Light  | portrait flicker | 1
SOUNDLOOP | sn_elevatorupsustain01
QUEST  | elevatorFloor = 26
QUEST  | elevatorFloorGoal = 665
QUEST  | elevatorTransit = 1
EVENT  | o_chu_elevator_button01  | 0
EVENT  | o_mg_elevator_door_light | 0
QUEST  | campfireScene = 2
Misc   | set  | o_cts_hoopz | o_cinema8
Camera | snap | o_cinema7
FRAME  | CAMERA_FAST | o_cinema7
WAIT   | 0
WAIT   | 1
FRAME  | CAMERA_NORMAL | o_cinema9
SET    | o_cts_hoopz | peelSit0
Light  | set | 0.5
Light  | add | o_campfire01 | 192 | 0.1
FADE   | 0 | 1
WAIT   | 0
" +
//TODO: Portraits should be made to flicker light and dark during the dialogue, at least for Hoopz.
//TODO: Cyberdwarf projects himself from the spear ... as he has already been installed into it from the previous scene in his Hideout
"
WAIT   | 2
DIALOG | P_NAME         | I-I can't believe we've come this far...
DIALOG | The Cyberdwarf | But why not, youngster? Do you not see the prophecy fullfilling itself before our eyes? 
IF knowProphecy >= 4    | GOTO | PROPHECYAGREE
GOTO   | PROPHECYNOOB

PROPHECYAGREE
DIALOG | P_NAME         | You're right C-dwarf... I've got to keep my head in the game.
DIALOG | The Cyberdwarf | Your head may lead, but your body must follow. Without the body,_ it is merely a dream.
GOTO   | CAMPTALK

PROPHECYNOOB
DIALOG | P_NAME = s_port_hoopzSurprise | But I don't know anything about my prophecy! I mean,_ I know what you said, but... I haven't had much time to really wrap my 'hawk around the situation.
DIALOG | The Cyberdwarf | The adventurer who grips their torch too closely is blinded by the flame's light, whereas if they hold the torch high, as the pioneer does, the path is illuminated before them.
DIALOG | P_NAME         | I-_I'm not sure what that might mean.
DIALOG | The Cyberdwarf | It means your destiny is already in front of you, regardless of if you know it or not.
WAIT   | 1.5
GOTO   | CAMPTALK

CAMPTALK
DIALOG | P_NAME         | Cyberdwarf,_ I promise...
DIALOG | P_NAME         | I promise I'll push forward until the day that I die!
DIALOG | The Cyberdwarf | Fortunately I know that that time will be long from now, Son of Bball. There is much work to be done... work on the 666th Floor of this infernal ship.
DIALOG | P_NAME         | What do I do when I come face to face with him?_ With Cuchulainn...
DIALOG | The Cyberdwarf | That, P_NAME_F, is when you will use this sacred weapon... The Gae Bolg... the one weapon that can defeat this despicable AI scourge and return the dwarfs to their happy hunting grounds.
DIALOG | P_NAME = s_port_hoopzSad | I hope... I have what it takes.
DIALOG | The Cyberdwarf | We all do. The entire Universe does.
DIALOG | P_NAME         | It's just that... I got a lot on my mind!
WAIT   | 1
IF rmCandy >= 10        | GOTO | ALIGN_CANDY
IF rmVidcon >= 10       | GOTO | ALIGN_VIDCON
IF rmBball >= 10        | GOTO | ALIGN_BBALL
IF rmClispaeth >= 10    | GOTO | ALIGN_CLISPAETH
IF rmBrast >= 10        | GOTO | ALIGN_BRAST
GOTO   | ALIGN_VENGEANCE

ALIGN_VENGEANCE
DIALOG | The Cyberdwarf | What you have on your mind is Vengeance, P_NAME_S. I am reminded of an ancient Cyberpocalyptian Proverb... /'The blood-soaked cloth stains the hands when wrung./'
DIALOG | P_NAME         | Are you saying... revenge is_ wrong?
DIALOG | The Cyberdwarf | Revenge? Maybe. But justice? Just d_e_s_e_r_t_s? Karma dictates the balance of all things, not man nor dwarf. There is no need for those already entwined with destiny to meddle in the affairs of F.A.T.E.. Karma will see to it that all evil-doers get their /'sweet comeuppance./'
WAIT   | 0.5
DIALOG | The Cyberdwarf | That being said, you've already made it this far. Might as well brast this Malevolent AI into the Hell he so desperately deserves!
GOTO   | HECKYEAH

ALIGN_CANDY
DIALOG | The Cyberdwarf | You do not truly think because you approach the world through the eyes of a child, P_NAME_S. You mind is filled with thoughts of tender sugary flavors.
DIALOG | P_NAME         | W-what do you mean?
DIALOG | The Cyberdwarf | A sweet sugary treat caressing your tongue, giving you comfort. Giving you the will to move forward, if only for the chance to have another bite. This is the way all children act. Ever yearning for sweet nectar to tingle their taste buds. 
DIALOG | P_NAME         | But it's all so good. The flavors, the colors, the boost of energy._ Are you saying I'm too obsessed with candy?
DIALOG | The Cyberdwarf | Obsessed? No, I do not think so. But I do believe it gives you focus. It gives you purpose._ You must channel that purpose, draw strength from it so that you may send that Malevolent AI to the depths of hell. 
GOTO   | HECKYEAH

ALIGN_VIDCON
DIALOG | The Cyberdwarf | The only thing on your mind is beating your personal best in /'Bolly Mixtures!/' There are more important things than your vidcons. The real world requires action and demands consequence. The convenience of a reset button is available only to an Eintag Dwarf and his kin! Focus!
DIALOG | P_NAME         | Okay, okay, let me just get to a /'!Chak De Point./'_ Al_most_ there._ And_ okay, I'm good. What were you saying?
DIALOG | The Cyberdwarf | I am increasingly perturbed by your vidcon habits, P_NAME_F, but as I am not your father (no one can be...) I must stop short of scolding you.
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry Cyberdwarf...
DIALOG | The Cyberdwarf | Focus not on apologies but the task at hand:_ The defeat of the Malevolent AI Cuchulainn and his roundup of Duergars!
GOTO   | HECKYEAH

ALIGN_BBALL
DIALOG | The Cyberdwarf | P_NAME_S, how much do you remember about your past?
DIALOG | P_NAME         | My past...?
WAIT   | 1
DIALOG | P_NAME         | I...
DIALOG | P_NAME         | Not a whole lot, Cyberdwarf. 
DIALOG | The Cyberdwarf | And yet you know how to dribble, how to pass and shoot, how to slamdunk, and how to foul a teammate. Do you remember ever learning about those things?
DIALOG | P_NAME         | No, I just always knew about all of that. I guess Bball in my nature.
DIALOG | The Cyberdwarf | That is exactly right, P_NAME_S. You know everything there is to know about bball, and yet you have never been taught anything about it. The essence of bball is etched deep down in the core of your soul, P_NAME_S.
DIALOG | The Cyberdwarf | I would dare to say that you, P_NAME_S, are one with Bball.
WAIT   | 1
DIALOG | P_NAME         | I don't know what that means, Cyberdwarf. I mean, I love the sport._ But does it really go beyond that? Can it go beyond that?
DIALOG | The Cyberdwarf | If you dare to look deep inside yourself, you will find the answer...
GOTO   | HECKYEAH

ALIGN_CLISPAETH
DIALOG | The Cyberdwarf | I can sense that there is a lot of deep thoughts and philosophies blooming and dying inside your mind. That is how all pious men are.
DIALOG | P_NAME         | Do you really think so?
WAIT   | 1.25
DIALOG | The Cyberdwarf | P_NAME_S, you are troubled by the enormous weight of your destiny. I understand this. Come, P_NAME_S, let me try and help your ailing heart. Join me in a prayer.
DIALOG | P_NAME         | P-prayer...?
DIALOG | The Cyberdwarf | Yes, my child. Prayer is the sacred solace given to us by Clispaeth himself. 
DIALOG | The Cyberdwarf | P_NAME_S, close your eyes, and hold your hands together. Find the calmn within you, and in the depths of your mind and soul speak words of praise to our lord and saviour, Clispaeth.
DIALOG | P_NAME         | Oh, okay. I'll try it, I guess...
WAIT   | 5
DIALOG | The Cyberdwarf | How do you feel now, P_NAME?
WAIT   | 0.75
DIALOG | P_NAME         | I feel... I feel mostly the same as before, honestly._ Nervous and... a little bit crestfallen.
DIALOG | The Cyberdwarf | That's quite alright, P_NAME. Clispaeth's strength is your strength. He will be there for you in your times of trouble.
DIALOG | P_NAME         | I'll remember that, Cyberdwarf.
GOTO   | HECKYEAH

ALIGN_BRAST
DIALOG | The Cyberdwarf | P_NAME_S, when I look at you I see a True Braster. An ancient Cyberpocalyptian Proverb springs to mind... /'One bullet in the chamber is better than ten in the belfry./' 
DIALOG | P_NAME         | W-what does that mean?
DIALOG | The Cyberdwarf | I have no idea, but what you should understand that every society can only exist at the point of a gun. Though a more benevolent and civilized notion is presented, at the end of the day all laws are enforced with violence. Those who give up their own selfish desires and take up arms are the soldiers who keep everything from crumbling into ashes.
WAIT   | 1
DIALOG | P_NAME         | Wow. That's pretty deep, Cyberdwarf. I never really thought about it like that.
DIALOG | The Cyberdwarf | P_NAME_S, I believe you to one of these soldiers. You are a True Braster after all. It is up to you to brast that wicked beast Cuchulainn into oblivion and save all of dwarfkind.
DIALOG | P_NAME         | ... Such responsibility...
DIALOG | The Cyberdwarf | Do not fret, my child. Galvanize your focus with your bloodlust and nothing can stand in your way.
GOTO   | HECKYEAH

HECKYEAH
WAIT   | 1.5
DIALOG | The Cyberdwarf | P_NAME_S, we are almost at Cuchulainn's Lair._ Are you ready to take the plunge?
DIALOG | P_NAME = s_port_hoopzHappy | Heck yeah C-dwarf! I'm ready!
Misc   | visible | o_chu_cyberdwarf | 0
Light  | portrait flicker | 0
MOVETO | o_cts_hoopz | o_cinema10 | MOVE_SLOW
WAIT   | 0
LOOK   | o_cts_hoopz | SOUTHWEST
EVENT  | o_chu_cyberdwarf | 1
WAIT   | 1
DIALOG | P_NAME | ...
DIALOG | P_NAME = s_port_hoopzSmirk | Say your prayers, Cuchulainn._ I'm coming for you.
WAIT   | 0.5
FRAME  | CAMERA_SLOW | o_cinema6 
WAIT   | 1
FADE   | 1 | 5
WAIT   | 5
QUEST  | campfireScene = 2
SOUNDSTOP | sn_elevatorupsustain01
SOUND  | sn_elevatoruprelease01
WAIT   | 4
Teleport | r_chu_entrance02 | 256 | 144 | 1
";
}
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
}
