script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
GOTO | POSTER

MATTHIAS
DIALOG | Matthias | Huh, there's a flyer on the wall but I can't read it from up here... how did I even manage to get up these stairs???

GOVERNOR
DIALOG | Governor Elagabalus | Hmm, an old looking poster...
DIALOG | POSTER | Announcement to all dwarfs and duergars: Bullying is NOT cool. Don't give in to peer pressure, stand up for yourself and for others. You have the power in your hands. Only YOU can stop the vicious cycle. Take these words of wisdom to your heart:
DIALOG | POSTER | Don't take me down with a punch, take me out to lunch. Stop the slander, increase the candor.
DIALOG | POSTER | So remember, the next time you want to give someone a swirlie, give it to yourself.
DIALOG | Governor Elagabalus | Whoa... These words are so powerful. I think I should give myself a swirlie to even the odds.

POSTER
DIALOG | P_NAME | Hmm, an old looking poster...
DIALOG | POSTER | Announcement to all dwarfs and duergars: Bullying is NOT cool. Don't give in to peer pressure, stand up for yourself and for others. You have the power in your hands. Only YOU can stop the vicious cycle. Take these words of wisdom to your heart:
DIALOG | POSTER | Don't take me down with a punch, take me out to lunch. Stop the slander, increase the candor.
DIALOG | POSTER | So remember, the next time you want to give someone a swirlie, give it to yourself.
DIALOG | P_NAME | Whoa... These words are so powerful. I think I should give myself a swirlie to even the odds.
";
