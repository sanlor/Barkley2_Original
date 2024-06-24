script = "
IF body == matthias                   | GOTO | MATTHIAS
IF body == governor                   | GOTO | GOVERNOR
IF clock >= @time_gutterhoundRobbery@ | GOTO | GUTTER
IF curfew == during                   | GOTO | CURFEW
IF govQuest == 6                      | GOTO | GOV6
IF curfew == after                    | GOTO | CURFEW_AFTER
GOTO | NORMAL

MATTHIAS
DIALOG | @duergar_burglecut@ | Flub off, kid. I don't have time for septic tank-smellin' chumps today.
DIALOG | Matthias            | Gulp! (Why do I keep talking to Duergars?

GOVERNOR
DIALOG | @duergar_burglecut@ | Standing at attention, Mr. Governor! I'm looking forward to your speech - can't wait to hear about all the ghastly torture protocols we're going to be implementing.

GUTTER
DIALOG | @duergar_burglecut@ | I've seen you wanderin' around real suspicious-like. You better hope you had nothin' to do with that break-in, or you're gonna be walkin' around with a new face.

CURFEW
DIALOG | @duergar_burglecut@ | Look at these stupid dwarfs. They can't do anything for themselves. That's the difference between us and them, they're helpless children and we're their malevolent masters. They deserve what Cuchulainn has in store for 'em.
	
GOV6
DIALOG | @duergar_burglecut@ | Well I don't know what Governor Elagabalus was thinking when he gave you permission to leave Tir na Nog. Never happened before, not on my watch. Course, we've thrown a few knuckleheads into the sewers in the past. Never heard from them again! Hahaha!!

CURFEW_AFTER
DIALOG | @duergar_burglecut@ | What I wouldn't give to live in the Governor's mansion. Heh heh, you wouldn't believe some of the stories I've heard about the place.

NORMAL
DIALOG | @duergar_burglecut@ | Mmmmm, I'm lookin' forward to the new governor coming to town. I hear he's a real hardass. Oooh, I love to watch these idiot dwarfs squirm.
";
