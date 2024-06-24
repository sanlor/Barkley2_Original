///Cutscene when entering Rebel Base for the first time.
script = "
QUEST | govIntro = 1
KNOW | knowLONGINUSTnn | 3
LOOK | o_cts_hoopz | NORTH
WAIT | 1
FRAME  | CAMERA_NORMAL | o_dr_liu01
WAIT | 
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu | I've done it! The body transference device is finally complete! Listen up, L.O.N.G.I.N.U.S., Operation: S.A.B.O.T.A.G.E. is officially in the final stages! All we need to do now is kidnap the incoming governor, strap him in the body transference device, and then have a brave L.O.N.G.I.N.U.S. volunteer switch bodies with him and impersonate him at his inaugural address. This should be a snap!
FRAME | CAMERA_FAST | o_cts_hoopz | o_ritkonen01
WAIT |
SET | o_ritkonen01 | pause
LOOKAT | o_cts_hoopz | o_ritkonen01
DIALOG | Soldat Ritkonen | Hey, keep it down! We've got a game goin' on over here!
SET | o_ritkonen01 | play
WAIT |
FRAME | CAMERA_FAST | o_dr_liu01
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu | Alright, now do we have any volunteers? Naoko? Gormlaith?
FRAME | CAMERA_FAST | o_naoko01 | o_gormlaith01 | o_vanboekel01 | o_ritkonen01
WAIT |
SET | o_naoko01 | pause
LOOKAT | o_cts_hoopz | o_naoko01
DIALOG | Sergeant Naoko | Um, I'm kind of busy. This poker game's getting intense.
SET | o_naoko01 | play
FRAME | CAMERA_FAST | o_dr_liu01
WAIT | 
LOOKAT | o_cts_hoopz | o_dr_liu01
DIALOG | Dr. Liu | C'mon! We'll never take Cuchulainn down with that attitude! Someone's got to volunteer or all this work was for nothing!
FRAME | CAMERA_FAST | o_cts_hoopz | o_pvtmadison01
WAIT |
LOOKAT | o_cts_hoopz | o_pvtmadison01
DIALOG | Private Madison | Kidnap the governor? Transfer bodies with him? Impersonate him at his speech? Are you out of your mind? Not only will it not work and get us all killed, but it doesn't make a lick of sense. Why the hell did Wiglaf make you our leader? You're out of your flippin' gourd! We should do it the old fashioned way and blow the hell out of the Governor's mansion with a humongous bomb. Now THAT would be fun!
LOOKAT | o_cts_hoopz | o_dr_liu01
FRAME | CAMERA_FAST | o_dr_liu01
WAIT |
DIALOG | Dr. Liu | Sigh... someone has to be willing to help...
"
