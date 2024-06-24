/// Marina
script = "
IF body == matthais | GOTO | MATTHAIS
IF body == governor | GOTO | GOVERNOR
IF govCow == 2        | GOTO | COW2
IF govCow == 3        | GOTO | COW3
IF curfew == during | IF marinaState == 0 | GOTO | CURFEW0
IF curfew == during | IF marinaState == 1 | GOTO | CURFEW1
IF marinaState == 0   | GOTO | MARINA0
GOTO   | MARINA1

MATTHAIS
DIALOG | Marina | Well hey there, pardner. Yer lookin' a mite under the weather. Gotta drink yer milk, y'know. I'd offer some if the girls weren't so darn skinny.

GOVERNOR
DIALOG | Marina | Hey there, Mr. Governor, sir. Sorry about the uh, cattle here, but I've got nowhere else to put'em. It'd be right kindly of ya to help me get some pasture for 'em, but I don't want you to think I'm beggin' or nothin'.
QUEST  | govCow = 1

COW2
DIALOG | Marina | Well hey there, P_NAME_S! Yer never gonna believe the good news I just got... or maybe you will, 'cuz I guess you got it too... but they're letting me take my cows to a pasture outside of Tir na Nog! I can't believe it! I thought I was gonna have to get rid of the girls but it looks like there's a free pasture somewhere south of here! I guess if you're also leaving Tir na Nog, we may just run into each other out there. Good luck, P_NAME_S! I hear it's kinda dangerous.
QUEST  | govCow = 3

COW3
DIALOG | Marina | I guess if you're gonna be out there in the Necron 7 wilds, we might just bump into each other. Good luck! I hear it's pretty dangerous!

CURFEW0
DIALOG | Marina | Hey! You there, are you new here?
DIALOG | Hoopz  | Yeah... where did everyone go?
DIALOG | Marina | There's a curfew goin' on right now - everyone's supposed to go inside until the Duergars say it's okay to come out. But my girls... I mean, those cows over there? I can't leave 'em on their own out here! They need a real pasture to graze in, they're not city cows! I don't even think city cows exist! What am I gonna do...
QUEST  | marinaState = 1
QUEST  | govCow = 1

CURFEW1
DIALOG | Marina | Everyone went inside... I think there's a curfew now or somethin', but I can't just leave the girls out here to fend for themselves. I hope we don't get in trouble...

MARINA0
DIALOG | Marina | Howdy, you new here?
DIALOG | Hoopz  | Yeah, I'm kinda lost.
DIALOG | Marina | Know the feelin'. We're new too, me and the girls. The girls, those cows over there. I'm a rancher... or I guess I used to be a rancher back when I had a pasture to put my cows in. But nowadays there's nowhere for 'em to graze - they're stuck eatin' the grass in between cobblestones. I'm really worried I might have to get rid of them... or worse.
QUEST  | marinaState = 1
QUEST  | govCow = 1

MARINA1
DIALOG | Marina | The girls are gettin' skinny and nobody likes a skinny cow. I'm gettin' worried that if I don't find a pasture for 'em soon, I'll have to get rid of 'em...
";
