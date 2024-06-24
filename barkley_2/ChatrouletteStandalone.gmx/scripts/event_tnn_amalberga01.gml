/// Amalberga
script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF govCar == 2 | GOTO | CAR2
IF govCar == 3 | GOTO | CAR3
IF curfew == during | GOTO | CURFEW
GOTO   | AMALBERGA

MATTHIAS
IF curfew == during | DIALOG | Amalberga | Hey Matthias, you busy? Think you can help me install the new catalytic converter when the curfew's over?
IF curfew != during | DIALOG | Amalberga | Hey Matthias, you busy? Think you can help me install this new catalytic converter now?
DIALOG | Matthias | Uh, nope! Gotta run! Sorry! Can't do that thing for you! Thanks for the interest though! Well, see you later, good to talk to you!

GOVERNOR
DIALOG | Amalberga | Hello, Mr. Governor... wouldn't mind some new tools or a garage to work on this thing in. Just throwing it out there.
QUEST  | govCar = 1

CAR2
DIALOG | Amalberga | Hey, did you catch the new governor's speech? Isn't it so weird that we're getting a new garage to work in? Hildy and I were only working on the car for fun, to keep our minds off of how crummy and boring it is here. But it really looks like we may actually get this thing done soon. Maybe the new governor isn't so bad after all.
QUEST  | govCar = 3

CAR3
DIALOG | Amalberga | Sometimes late at night, I think I can hear the sound of speeding cars coming from outside the city. You think people out there might be racing? When we get this thing souped up, nobody's gonna beat us.

CURFEW
DIALOG | Amalberga | Sigh. Flippin' curfew. One of these days, Hildy and I are gonna fix that clunker up and break out through the front gate. Then we'll be the queens of the road... if there are any roads out there.
QUEST  | govCar = 1

AMALBERGA
DIALOG | Amalberga | Hildy and I have been working on this baby for as long as we've been here. They said it would be a real fixer-upper and they were right, but the main problem is that the parts we need just don't exist anymore. I mean, I have no idea how old this thing is but it's amazing that it's not just a lump of rust. If we could get an ancient catalytic converter, we could really get this thing purring again.
QUEST  | govCar = 1
";
