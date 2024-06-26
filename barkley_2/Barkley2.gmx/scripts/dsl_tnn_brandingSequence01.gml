script = "GOTO | BRANDING

BRANDING
LOOK   | o_kim01       | SOUTHWEST
Misc   | set           | o_lucretia01 | 440 | 880
LOOK   | o_lucretia01  | SOUTHWEST
Misc   | set           | o_ox01 | 232 | 1160
LOOK   | o_ox01        | SOUTHEAST
Misc   | set           | o_cts_hoopz | o_cinema14      
LOOK   | o_janos01     | SOUTHEAST           
SET    | o_tv          | face
SET    | o_tv2         | face
SET    | o_janos01     | brandingStand
Camera | snap          | o_cinema18
FRAME  | CAMERA_NORMAL | o_cinema18
LOOK   | o_cts_hoopz   | NORTH            
WAIT   | 0          
WAIT   | 1.5
FRAME  | CAMERA_NORMAL | o_tv
WAIT   | 0            
DIALOG | Mounted TV = s_port_tvGuy01 | Congratulations, lucky dwarfs! You've been selected by the benevolent A.I. `mq`Cuchulainn`rt` to live in the absolutely fabulous `kw`Tir na Nog`rt`! Located aboard the space zigguraut Necron 7, Tir na Nog is the upscale, ultra-modern arcology of the future...
SET    | o_tv  | sunset
SET    | o_tv2 | sunset
FRAME  | CAMERA_NORMAL | o_janos01 
WAIT   | 0
DIALOG | Janos | NEXT!
WAIT   | 0.5
MOVE   | o_dwarf1 | 0 | -140 | MOVE_FAST
WAIT   | 0.1
MOVETO | o_dwarf3 | o_cinema10 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dwarf4 | o_cinema11 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dwarf6 | o_cinema12 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_cts_hoopz | o_cinema13 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_babalugats01 | o_cinema14 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dragline01 | o_cinema15 | MOVE_NORMAL
WAIT   | 0
Destroy | o_dwarf1
FRAME  | CAMERA_FAST | o_cts_hoopz
WAIT   | 0
DIALOG | Dragline | This... this is it! I've been waiting for this my whole life! We're finally in `s1`Tir na Nog!`s0`
DIALOG | Babalugats | I don't want to be here... I'm scared and I just want to go home... I don't like Cuchulainn...
FRAME  | CAMERA_FAST | o_janos01
WAIT   | 0
DIALOG | Janos | NEXT! Get movin'! You lazy sacks of...
WAIT   | 0.5
MOVE   | o_dwarf3 | 0 | -140 | MOVE_FAST
WAIT   | 0.1
MOVETO | o_dwarf4 | o_cinema10 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dwarf6 | o_cinema11 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_cts_hoopz | o_cinema12 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_babalugats01 | o_cinema13 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dragline01 | o_cinema14 | MOVE_NORMAL
WAIT   | 0
Destroy | o_dwarf3
SET    | o_tv  | face
SET    | o_tv2 | face
DIALOG | Mounted TV = s_port_tvGuy01 | ... features many wonderful amenities, from all the fruit, grapes and prunes you can eat, to free, first-class housing to dozens of fun activities like weekly bingo and calisthenics, all provided free of charge by the generous and munificent Cuchulainn...
SET    | o_tv  | beach
SET    | o_tv2 | beach
FRAME  | CAMERA_FAST | o_cts_hoopz 
WAIT   | 0
DIALOG | Dragline | Weekly bingo and free grapes! I love bingo!! And I love Cuchulainn!
DIALOG | Babalugats | I do too... but I just want to go home..._ `sq`to the Sombrero Galaxy...`rt`
LOOK   | o_kim01 | SOUTHWEST
Emote  | ! | o_kim01
WAIT   | 1.25
DIALOG | Kim | What was that? What the hell was that!?
MOVETO | o_kim01 | o_cinema16 | MOVE_FAST
//o_babalugats01.x + 32 + 8 + 5, o_babalugats01.y - 64 + 6 - 2
WAIT   | 0
LOOK   | o_kim01 | SOUTHWEST
SET    | o_babalugats01 | scared
FRAME  | CAMERA_FAST | o_kim01 | o_babalugats01
WAIT   | 0           
DIALOG | Babalugats | Wh-what?
DIALOG | Mounted TV = s_port_tvGuy01 | ... truly Tir na Nog is the premiere intergalactic luxury vacation destination, and with our helpful Duergar assistants, waiting on hand and knee for your call, you never need to move a finger...
DIALOG | Kim | Was that `kw`rebel`rt` talk I heard? Are you a plant? Hey boys, it looks like we've got a `kw`rebel`rt` on our hands!
DIALOG | Babalugats | I-I'm not a rebel...
DIALOG | Kim | You wanna know what Cuchulainn does to rebels around here? `s1`You wanna know?!`s0`
PLAYSET | o_kim01 | punch0 | punch0s
WAIT   | 0
SOUND  | sn_fistpunch02
PLAYSET | o_kim01 | punch1 | punch2
PLAYSET | o_babalugats01 | punched | hurt
MOVE   | o_babalugats01 | -32 | 0 | MOVE_FAST
WAIT   | 0.1
SOUND  | sn_mg_creepypasta_scream3
WAIT   | 0
DIALOG | Babalugats | `s1`Ugh...`s0`
DIALOG | Kim | That's what we do to rebels around here! Let that be a lesson to all of you: `mq`mess with Cuchulainn, get out of line, and you deal with us!`rt`
MOVETO | o_kim01 | o_cinema17 | MOVE_NORMAL
WAIT   | 0
LOOK   | o_kim01 | SOUTHWEST
FRAME  | CAMERA_FAST | o_janos01
DIALOG | Janos | NEXT! Get a move on, slackers!
MOVE   | o_dwarf4 | 0 | -140 | MOVE_FAST
WAIT   | 0.1
Misc   | flip | o_dwarf6 | -1
MOVETO | o_dwarf6 | o_cinema10 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_dragline01 | o_cinema13 | MOVE_NORMAL
WAIT   | 0.1
MOVETO | o_cts_hoopz | o_cinema11 | MOVE_NORMAL
WAIT   | 0.1
SET    | o_tv  | face
SET    | o_tv2 | face
FRAME  | CAMERA_FAST, o_janos01
DIALOG | Mounted TV = s_port_tvGuy01 | ... and the best part of all is that when every dwarf in the galaxy is in Tir na Nog, Cuchulainn is going to give each and every one of you a prize...
SET    | o_tv  | beach
SET    | o_tv2 | beach
FRAME  | CAMERA_FAST | o_janos01
Destroy | o_dwarf4
DIALOG | Janos | NEXT! Get over here!
MOVE   | o_dwarf6 | 0 | -140 | MOVE_FAST
WAIT   | 0.1
MOVETO | o_cts_hoopz | o_cinema10 | MOVE_NORMAL
WAIT   | 0.1
MOVE   | o_dragline01 | o_cinema11 | MOVE_NORMAL
WAIT   | 0
Destroy | o_dwarf6
SET    | o_cts_hoopz | before_punched
SET    | o_janos01 | shadowKeep
FRAME  | CAMERA_FAST | o_janos01 | o_cts_hoopz
DIALOG | Janos | Alright kid, what's your name and where are you from?
DIALOG | Mysteriouse Youngster = s_port_hoopzSurprise | I... I don't know.
DIALOG | Janos | Not gonna tell me your name, kid?
DIALOG | Mysteriouse Youngster = s_port_hoopzSurprise | I don't know my name... I don't remember who I am! I don't know where I am! I just want to go home!
DIALOG | Janos | Alright, well if you're not gonna tell me your name...
SET    | o_tv  | face
SET    | o_tv2 | face
DIALOG | Mounted TV = s_port_tvGuy01 | ... can you believe that!? A prize for each and every dwarf! What do you think it will be?!
SET    | o_tv  | sunset
SET    | o_tv2 | sunset
DIALOG | Janos | ... then I'm gonna give you one!
PLAYSET | o_cts_hoopz | punched | ground 
SOUND  | sn_hoopzBranded 
WAIT   | 0
DIALOG | Janos | Heh heh heh, looks like from now on, your name's gonna be...
SET    | o_tv  | face
SET    | o_tv2 | face
DIALOG | Mounted TV = s_port_tvGuy01 | ... what do you think YOUR prize is going to be?
FRAME  | CAMERA_NORMAL | o_cts_hoopz
DIALOG | Janos | P_NAME ...            
CREATE | o_hoopz_black | 0 | 0
FADE   | 1 | 3
WAIT   | 4
DIALOG | Mysteriouse Youngster = s_port_hoopzSad | ... is that... is that me...? Is that who I have to be? Is this who I am...?
WAIT   | 2
DIALOG | P_NAME = s_port_hoopzSad | X__1__1__4__JAM__9__..................................
WAIT   | 1
QUEST  | sceneBrandingStart = 2        
scr_equipment_guns_bandolier_clear | 
scr_equipment_guns_bag_clear | 
Teleport | r_tnn_wilmer02 | 328 | 144 | 2
";  
// 230, 132
