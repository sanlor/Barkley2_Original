/// event_zzz_test1_new()
script = "
IF creepypastaStory1 == 0 | GOTO | PASTA0
IF creepypastaStory1 == 1 | GOTO | PASTA1
IF creepypastaStory1 == 2 | GOTO | PASTA2
IF creepypastaStory1 == 3 | GOTO | PASTA3

PASTA0
MOVETO | o_cts_hoopz | o_cinema0 | MOVE_SLOW
WAIT |
LOOK | o_cts_hoopz  | NORTH
DIALOG | P_NAME     | What the heck is this computer doing here? There is something running on it... I don't know if it's right to look at other peoples computers but I'm really curious...
CHOICE | Should I take a peek?
REPLY | YES | I can't resist it!
REPLY | NO  | It's none of my business       

YES
DIALOG | P_NAME | Okay, I can't resist. Let's see what's on here...
CREATE | o_mg_creepypasta_story2 | 0 | 0
QUEST  | creepypastaStory1 | 2

NO
DIALOG | P_NAME | No, it's not my computer, and it's none of my business.
QUEST  | creepypastaStory1 | 1

PASTA1
MOVETO | o_cts_hoopz | o_cinema0 | MOVE_SLOW
WAIT |
LOOK | o_cts_hoopz  | NORTH
DIALOG | P_NAME | I don't know what it is but... this computer gives me the heebie-jeebies. Maybe if I take a closer look I'll understand what is going on.  
CHOICE | Should I take a glance?
REPLY | YES | I can't resist it!
REPLY | NO  | It's none of my business         

PASTA2
WAIT | 0.5
DIALOG | P_NAME | That... was the scariest story I've ever read. I... I'm shaking. I should get out of here... 
WAIT | 0.75
LOOK | o_cts_hoopz | NORTHWEST
WAIT | 0.25
LOOK | o_cts_hoopz | NORTH
WAIT | 0.25
LOOK | o_cts_hoopz | NORTHEAST
WAIT | 0.25
LOOK | o_cts_hoopz | NORTH
WAIT | 0.5
//scr_event_emote(exclamation, o_cts_hoopz, 0, 0)
WAIT | 0.25
DIALOG | P_NAME | W-what the...! There's no power outlets in here! This computer isn't plugged in! What the heck is going on here?!
WAIT | 1
PLAYSET | o_mg_creepypasta_computer | blood | dead
WAIT | 1
DIALOG | P_NAME | No... No! Noooooo!
WAIT | 0.25
QUEST | creepypastaStory1 | 3
QUEST | hoopzGetup | 1
//scr_event_build_teleport(r_tnn_warehouseDistrict01, 1048, 408, 3, 1)
";
exit;
script = "
DIALOG | P_NAME | testing script
go_to_hell
go_to_hell | test
dicks | hi
DIALOG | P_NAME | done testing
";

exit;
script = "
DIALOG | P_NAME | Hey
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
FRAME  | CAMERA_SLOW | o_cinema2
WAIT | 1
DIALOG | P_NAME | Is that the service tunnel you were talking about?
DIALOG | Dr. Pelekryte | Yesh, that musht be it. It should lead shtraight outshide the wallsh of Tir na Nog.
DIALOG | P_NAME | But how are we going to reach it? It's too high for either of us.
WAIT | 0.5
FRAME | CAMERA_SLOW | o_cts_hoopz | o_pelekryte01
WAIT | 1
DIALOG | Dr. Pelekryte | If only we had a length of rope...
// Hoopz walks to below the crate with he rope 
MOVETO | o_cts_hoopz | o_cinema3 | MOVE_NORMAL
WAIT   | 0
LOOKAT | o_cts_hoopz | o_pelekryte01
WAIT | 0.5
DIALOG | P_NAME | Here's some rope, doctor. But how can you utilize it without a grapnel?
DIALOG | Dr. Pelekryte | By ushing the Old Indian Rope Trick I mashtered yearsh ago.
DIALOG | P_NAME | How can I help?
DIALOG | Dr. Pelekryte | By shtanding right there and concentrating on the indian fakir command: Rassi... Seedha... Rucko... Hindi for " + '"' + "Rope shtay shtraight" + '"' + ". 
DIALOG | P_NAME | Fakir? What's that?
DIALOG | Dr. Pelekryte | Fakir ish like an indian Criss Angel. They excel at mindfreaking your assh into oblivion.
DIALOG | P_NAME | Oh, okay. Proceed.
MOVETO | o_pelekryte01 | o_cinema1 | MOVE_NORMAL
WAIT   | 0
WAIT   | 0.5
DIALOG | Dr. Pelekryte | Rassi... Seedha... Rucko...
// Gz do your fuckery
DIALOG | P_NAME | Uh...? Doctor? What just happened? Are you still there?
DIALOG | P_NAME | Doctor Pelekryte...?
DIALOG | P_NAME | ... What happened?
";
