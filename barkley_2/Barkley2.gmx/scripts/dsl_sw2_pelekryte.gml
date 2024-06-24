// Do not perform this if it has already happened //
if (Quest("indianRopeTrick") == 1) exit;
if (Quest("pelekryteState") < 2) or (Quest("pelekryteState") == 3) or (Quest("pelekryteState") >= 5) then exit;

// The ol' Indian Rope Trick //
external = 1;
script = "
QUEST  | indianRopeTrick = 1
QUEST  | pelekryteState = 5
MOVETO | o_cts_hoopz | o_cinema0 | MOVE_NORMAL
WAIT   | 0
LOOKAT | o_cts_hoopz | o_pelekryte01
DIALOG | Dr. Pelekryte | Ah, we made it. Thank you lad, I would've shurely been a goner had I tried to come here on my own.
DIALOG | P_NAME | Hey, don't celebrate yet. We're still down here in the sewers.
LOOK | o_cts_hoopz | NORTH
WAIT | 0.25
LOOK | o_cts_hoopz | NORTHEAST
WAIT | 0.25
LOOK | o_cts_hoopz | NORTH
WAIT | 0.25
LOOK | o_cts_hoopz | NORTHWEST
WAIT | 0.25
LOOK | o_cts_hoopz | NORTH
WAIT | 0.5
FRAME  | CAMERA_NORMAL | o_cinema2
WAIT | 1
DIALOG | P_NAME | Is that the service tunnel you were talking about?
DIALOG | Dr. Pelekryte | Yesh, that musht be it. It should lead shtraight outshide the wallsh of Tir na Nog.
DIALOG | P_NAME | But how are we going to reach it? It's too high for either of us.
WAIT | 0.5
FRAME  | CAMERA_NORMAL | o_cts_hoopz | o_pelekryte01 | o_cinema2
WAIT | 1
DIALOG | Dr. Pelekryte | If only we had a length of rope...
WAIT | 1
LOOK | o_cts_hoopz | NORTH
WAIT | 0.25
LOOK | o_cts_hoopz | NORTHWEST
WAIT | 0.5
MOVETO | o_cts_hoopz | o_cinema3 | MOVE_NORMAL
WAIT   | 0
WAIT   | 0.5
LOOKAT | o_cts_hoopz | o_pelekryte01
WAIT | 0.5
DIALOG | P_NAME | Here's some rope, doc. But how can you utilize it without a grapnel?
DIALOG | Dr. Pelekryte | By ushing the Old Indian Rope Trick I mashtered yearsh ago.
DIALOG | P_NAME | How can I help?
DIALOG | Dr. Pelekryte | By shtanding right there and concentrating on the indian fakir command...
DIALOG | Dr. Pelekryte | Rassi... Seedha... Rucko... 
DIALOG | Dr. Pelekryte | Hindi for " + '"' + "Rope shtay shtraight" + '"' + ". 
WAIT   | 0.25
FRAME  | CAMERA_NORMAL | o_cinema2
MOVETO | o_pelekryte01 | o_cinema1 | MOVE_NORMAL
WAIT   | 0
WAIT   | 1.25
DIALOG | Dr. Pelekryte | Rassi... Seedha... Rucko...
WAIT   | 0.5
PLAYSET | o_cts_hoopz | surpriseNE | surpriseHoldNE
WAIT   | 0.1
// Create ! emote
SOUND  | sn_indianropetrick01
CREATE_WAIT | o_ropetrickPelekryte
WAIT   | 0
WAIT   | 1
LOOK | o_cts_hoopz | NORTHEAST
WAIT   | 0.5
DIALOG | P_NAME | Uh...? Doctor? What just happened? Are you still there?
WAIT   | 1.25
DIALOG | P_NAME | Doctor Pelekryte...?
WAIT   | 2.0
DIALOG | P_NAME | ... What happened?
WAIT   | 0.75
DIALOG | P_NAME | The Old Indian Rope Trick... Such power...
WAIT   | 0.5
NOTIFY | You learned The Old Indian Rope Trick
";
