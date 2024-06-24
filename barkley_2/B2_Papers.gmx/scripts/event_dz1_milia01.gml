script = "
IF miliaState == 0     | GOTO | MILIA0
IF miliaState == 1     | GOTO | MILIA1

MILIA0
DIALOG | Milia | The Necron 7 has probably been around for a while, huh? Banquo and I just got back from this big swamp south of here that had these ancient stone mounds, like stupas or something. There were lots of them. Some were cracked and falling apart, others were covered in moss, others were partially submerged in water. We didn't go far because it's too dangerous, but I wonder if there are more. I bet there's somethin' good inside of 'em.
QUEST  | miliaState = 1

MILIA1
DIALOG | Milia | There was all this muck in the swamp that was hard to walk through. When we tried to wade through it, these giant mosquitos would swarm us and we had to run. I don't think we'll go back to the swamp for a while, but I'd like to see those stupas again, find out what's inside...
";
