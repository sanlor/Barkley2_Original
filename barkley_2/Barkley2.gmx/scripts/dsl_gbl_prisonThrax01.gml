/// Prison Intro(s)
external = 1; 
script  = "
QUEST    | prisonEnding = 2
EVENT    | o_pri_courtGate_big01   | 1
EVENT    | o_pri_courtGate_small01 | 1
Misc     | set | o_thrax01 | o_cinema10
FADE     | 0 | 1.5
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 2.0
LOOK     | o_cts_hoopz | SOUTHWEST
WAIT     | 0.3
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.3
LOOK     | o_cts_hoopz | SOUTHEAST
WAIT     | 0.3
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 1
DIALOG   | P_NAME = s_port_hoopzSurprise | T-these dwarfs...!
DIALOG   | P_NAME | They are the Hoosegowers._ All the `kw`Hoosegowers are free.`rt`
WAIT     | 0.75
DIALOG   | P_NAME | I've set them free.
DIALOG   | P_NAME | It... feels good.
WAIT     | 1
DIALOG   | P_NAME | My work here is done. It's time to go.
FOLLOWFRAME  | CAMERA_NORMAL | o_cts_hoopz
MOVETO   | o_cts_hoopz | o_cinema20 | MOVE_NORMAL
EVENT    | o_thrax01 | 2 // Close tech door
WAIT     | 0
DIALOG   | ??? | ._._._ ha.
LOOK     | o_cts_hoopz | EAST
Emote    | !
WAIT     | 1
MOVETO   | o_thrax01 | o_cinema21 | MOVE_SLOW
DIALOG   | Thrax | Ha. `w1`HA HA!`w0`
WAIT     | 0.5
DIALOG   | Thrax | `w2`HAHAHAHAHA!`w0`
WAIT     | 0
DIALOG   | Thrax | You probably think that I have been defeated. That this prison is liberated. I am but one Duergar... among... `s1`MANY`s0`._ `sq`At least forty.`rt`
DIALOG   | Thrax | We can feel it in our blood. Every dwarf_ must be contained... incarcerated or `s1`destroyed.`s0`
DIALOG   | Thrax | Our blood screams out for the death of the `s1`infidel dwarf.`s0` All the dwarf subspecies `sq`will be cleansed from the Universe.`rt` Starting with you... `s1`YOU!`s0`
DIALOG   | P_NAME = s_port_hoopzSmirk | Sorry to dissapoint you `w2`overgrown huckleberry,`w0` but I'm no dwarf. 
DIALOG   | P_NAME = s_port_hoopzSurprise | `s1`I'm a BRASTER! Let me show you!`s0`
IF duergarInfoWilmer >= 1 | GOTO | WILMER_YES
GOTO | WILMER_NO

WILMER_YES
Misc     | set | o_thrax01 | o_cinema4
CREATE   | oPrisonThraxKill | " + string(o_cinema21.x) + " | " + string(o_cinema21.y) + "
WAIT     | 1.5
Emote    | !
SURPRISEAT | oPrisonThraxKill
WAIT     | 9
FRAME    | CAMERA_FAST | o_cinema22
WAIT     | 1
DIALOG   | P_NAME | Mr. Wilmer!
WAIT     | 0.75
DIALOG   | Wilmer = s_port_wilmerJail | You dead, you blue-skinned bitch! Viva la Dwarf Supremacy!
FRAME    | CAMERA_FAST | o_cinema21 | o_cts_hoopz
WAIT     | 0
DIALOG   | P_NAME | (Wow... What a badass...)
EVENT    | o_thrax01 | 3 // Revert tech door
Destroy  | o_thrax01
WAIT     | 0.25
FOLLOWFRAME | CAMERA_NORMAL | o_cts_hoopz
MOVETO   | o_cts_hoopz | o_cinema10 | MOVE_NORMAL
WAIT     | 0
LOOK     | o_cts_hoopz | SOUTHEAST
WAIT     | 0.25
DIALOG   | P_NAME | Wow thanks for that Mr. Wilmer... I thought I was going to have to brast my way through that maniac.
DIALOG   | Wilmer = s_port_wilmerJail | No problem, whippersnapper... Like I said, when you're in the yard, Ol' Wilmer's got your back. Sho'nuff.
DIALOG   | P_NAME | Uh... okay well thanks again._ I guess the Hoosegow is liberated now.
DIALOG   | Wilmer = s_port_wilmerJail | Looks like it.
DIALOG   | P_NAME | Where are you gonna go?
DIALOG   | Wilmer = s_port_wilmerJail | All the other gyms in Necron 7 have a membership. I've already paid my dues to this place. `w1`My membership is free.`w0` I'll stay here and finish my arms at least.
DIALOG   | P_NAME | Okay well... thanks again.
QUEST    | swoleWilmerState = 2
QUEST    | prisonEnding = 7
QUEST    | prisonLiberated = 3
QUEST    | prisonDoors = 1

WILMER_NO
EVENT    | o_pri_courtGate_big01   | 0
EVENT    | o_pri_courtGate_small01 | 0
EVENT    | o_thrax01 | 3 // Revert tech door
Destroy  | o_thrax01
Duergar  | spawn | thrax | " + string(o_cinema21.x) + " | " + string(o_cinema21.y) + "
Create   | oPrisonThraxCinema
";

/*
    prisonEnding
        0 = Nothing
        1 = You have flipped the switch and caused the riot
        2 = You have encountered Thrax on the courtyard
        3 = Lost to Thrax
        4 = Killed Thrax
        5 = Died to Astyages or Dozier
        6 = Got shanked
        7 = Wilmer kills Thrax
*/
