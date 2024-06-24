/// Prison after the Dive
external = 1; 
script  = "
IF prisonDive == 11 | GOTO | RETURN_AS_PRISONER_SOLO
IF prisonDive == 21 | GOTO | RETURN_AS_PRISONER_GUTTER
IF prisonDive == 31 | GOTO | LONGINUS
IF prisonDive == 41 | GOTO | STUMBLE

RETURN_AS_PRISONER_SOLO
QUEST    | prisonDive = 12
MOVETO   | o_cts_hoopz | o_cinema25 | MOVE_NORMAL
WAIT     | 0
WAIT     | 0.4
LOOK     | o_cts_hoopz | WEST
Emote    | !
WAIT     | 1
DIALOG   | P_NAME | Oh what the cuff? I'm back at the Hoosegow again!
WAIT     | 0.4
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.25
LOOK     | o_cts_hoopz | EAST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.4
DIALOG   | P_NAME | Oh no...
WAIT     | 0.4
DIALOG   | P_NAME | There's no way out of here!
WAIT     | 0.6
LOOK     | o_cts_hoopz | WEST
DIALOG   | P_NAME | Wait...
FRAME    | CAMERA_NORMAL | o_cinema31
WAIT     | 0
DIALOG   | P_NAME | That must be the control room. I bet you anything I could open these gates from there.
FRAME    | CAMERA_FAST | o_cts_hoopz
WAIT     | 0
DIALOG   | P_NAME | I just have to make sure I don't get caught by those blue baddies.

RETURN_AS_PRISONER_GUTTER
QUEST    | prisonDive = 22
MOVETO   | o_cts_hoopz | o_cinema25 | MOVE_NORMAL
WAIT     | 0
WAIT     | 0.4
LOOK     | o_cts_hoopz | WEST
Emote    | !
WAIT     | 1
DIALOG   | P_NAME | Oh what the cuff? I'm back at the Hoosegow again!
DIALOG   | P_NAME | I knew I shouldn't have trusted Gutterhound...
WAIT     | 0.4
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.25
LOOK     | o_cts_hoopz | EAST
WAIT     | 0.25
LOOK     | o_cts_hoopz | SOUTH
WAIT     | 0.4
DIALOG   | P_NAME | There's no way out of here!
WAIT     | 0.6
LOOK     | o_cts_hoopz | WEST
DIALOG   | P_NAME | Wait...
FRAME    | CAMERA_NORMAL | o_cinema31
WAIT     | 0
DIALOG   | P_NAME | That must be the control room. I bet you anything I could open these gates from there.
FRAME    | CAMERA_FAST | o_cts_hoopz
WAIT     | 0
DIALOG   | P_NAME | I just have to make sure I don't get caught by those blue baddies.

LONGINUS
QUEST    | prisonDive = 32
MOVETO   | o_cts_hoopz | o_cinema25 | MOVE_NORMAL
WAIT     | 0
WAIT     | 0.4
LOOK     | o_cts_hoopz | WEST
Emote    | !
WAIT     | 1
DIALOG   | P_NAME | Whoa! That must be the Hoosegow. Yikes...
WAIT     | 0.75
DIALOG   | P_NAME | Hmm... I'm going to have to find a way to get inside. 
FRAME    | CAMERA_NORMAL | o_cinema30
WAIT     | 0
WAIT     | 1
FRAME    | CAMERA_NORMAL | o_cinema31
WAIT     | 0
WAIT     | 1
DIALOG   | P_NAME | One of those doors has gotta be the answer.
FRAME    | CAMERA_FAST | o_cts_hoopz
WAIT     | 0
DIALOG   | P_NAME | I'll have to be careful not to get caught by the patrols. Alright, time to move!

STUMBLE
QUEST    | prisonDive = 42
MOVETO   | o_cts_hoopz | o_cinema25 | MOVE_NORMAL
WAIT     | 0
WAIT     | 0.4
LOOK     | o_cts_hoopz | WEST
Emote    | !
WAIT     | 1
DIALOG   | P_NAME | Whoa! This place looks like a Hoosegow.
WAIT     | 0.75
FRAME    | CAMERA_NORMAL | o_cinema30
WAIT     | 0
WAIT     | 1
FRAME    | CAMERA_NORMAL | o_cinema31
WAIT     | 0
WAIT     | 1
FRAME    | CAMERA_FAST | o_cts_hoopz
WAIT     | 0
DIALOG   | P_NAME | Hmm... Yet another ghoulish site ran by the duergars.
WAIT     | 1
DIALOG   | P_NAME | I'll have to figure out a way to get out of here...
";
