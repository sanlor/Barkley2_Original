/// Various hoopz wakeup scenes
external = 1; 
script  = "
QUEST   | rebelCaveFirstVisit = 1
KNOW    | knowLafayette | 2
SET     | o_lafayette01 | ambush
SET     | o_meinhardt01 | ambush
SET     | o_florian01   | ambush
SET     | o_compson01   | ambush
LOOK    | o_cts_hoopz | NORTH
FRAME   | CAMERA_NORMAL  | o_cinema1  
WAIT    | 0
WAIT    | 0.25    
MOVETO  | o_cts_hoopz    | o_cinema0 | MOVE_NORMAL
WAIT    | 0
WAIT    | 1.0
LOOK    | o_cts_hoopz    | NORTHEAST
WAIT    | 0.25
LOOK    | o_cts_hoopz    | NORTH
WAIT    | 0.25
LOOK    | o_cts_hoopz    | NORTHWEST
WAIT    | 0.25
LOOK    | o_cts_hoopz    | NORTH
WAIT    | 1.0
FRAME   | CAMERA_SLOW    | o_cinema6  
WAIT    | 0.25
MOVETO  | o_cts_hoopz    | o_cinema1 | MOVE_SLOW
WAIT    | 0
WAIT    | 0.5
EVENT   | o_lafayette01  | 1
SURPRISEAT | NORTHEAST
Emote   | !
WAIT    | 1
DIALOG  | Cpl. Lafayette | Hold it right there, bucko!
WAIT    | 0.5
DIALOG  | P_NAME = s_port_hoopzSurprise | W-what?
WAIT    | 0.5
DIALOG  | Cpl. Lafayette | Y-you're not a duergar?
DIALOG  | P_NAME = s_port_hoopzSurprise | No, I'm just a youngster! Don't shoot!
WAIT    | 0.75
DIALOG  | Cpl. Lafayette | Oh..._ Thank Clispaeth! I thought those duergs finally found our little hideout.
LOOK    | o_cts_hoopz    | NORTHEAST
DIALOG  | P_NAME         | `w1`*Phew*`w0` For a moment I thought I was a goner...
WAIT    | 0.75
IF operationX <= 3       | DIALOG  | P_NAME | Who are you guys anyway?
IF operationX >= 4       | DIALOG  | P_NAME | You guys are part of L.O.N.G.I.N.U.S., right?
DIALOG  | Cpl. Lafayette | This is the secret `mq`Gilbert's Peak branch of L.O.N.G.I.N.U.S.,`rt` at your service.
IF operationX <= 3       | DIALOG  | P_NAME | Wow!
IF operationX >= 4       | DIALOG  | P_NAME | Yes! Finally I've found you guys.
DIALOG  | Cpl. Lafayette | Are you one of the new recruits that HQ promised to send us?
DIALOG  | P_NAME         | No, I don't think I am.
DIALOG  | Cpl. Lafayette | Aw, shucks...
DIALOG  | Cpl. Lafayette | Well, I'm glad that you aren't a duergar at least. Here, let me introduce you to our merry band.
FRAME   | CAMERA_NORMAL  | o_lafayette01
WAIT    | 0.75
LOOKAT  | o_cts_hoopz    | o_lafayette01 
DIALOG  | Cpl. Lafayette | I'm `kw`Lafayette,`rt` the scout._ Ex-scout.
FRAME   | CAMERA_NORMAL  | o_meinhardt01
WAIT    | 0.75
LOOKAT  | o_cts_hoopz    | o_meinhardt01 
DIALOG  | Cpl. Lafayette | The disgruntled grunt is `kw`Meinhardt,`rt` our quartermaster. He's the silent type. Very mysterious.
DIALOG  | QM Meinhardt   | ...
FRAME   | CAMERA_NORMAL  | o_florian01
WAIT    | 0.75
LOOKAT  | o_cts_hoopz    | o_florian01 
DIALOG  | Cpl. Lafayette | Over yonder is `kw`Florian,`rt` our medic. But don't let that fool you. If you have a medical emergency, don't come here for help. You won't get any.
DIALOG  | Lt. Florian    | Hello!
FRAME   | CAMERA_NORMAL  | o_compson01
WAIT    | 0.75
LOOKAT  | o_cts_hoopz    | o_compson01 
DIALOG  | Cpl. Lafayette | Last but not least is, uh, `kw`Compson.`rt` I think he is our leader, but I'm not too sure on that. He is a bit of a debbie downer at times, but his mind is as sharp as a jewel encrusted dirk.
DIALOG  | Cpt. Compson   | Pfft... and here I was hoping I'd get to die in battle.
FRAME   | CAMERA_NORMAL  | o_lafayette01
WAIT    | 0
LOOKAT  | o_cts_hoopz    | o_lafayette01 
DIALOG  | Cpl. Lafayette | We used to have a bunch more guys and gals in here but our numbers have dwindled down to just the four of us I'm afraid.
DIALOG  | P_NAME         | Wow, sounds like this is a dangerous neighbourhood.
DIALOG  | Cpl. Lafayette | Indeed it is._ Alright fellas, the danger is over. Let's get back to being hopelessly crestfallen by our situation.
FADE    | 1 | 1
WAIT    | 1
Teleport | r_pea_caveRebel01 | 304 | 280 | 1
";
