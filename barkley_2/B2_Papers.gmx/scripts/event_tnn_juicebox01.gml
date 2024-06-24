script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF comServ == 2     | GOTO | COM2
IF comServ == 4     | GOTO | COM4
IF comServ == 6     | GOTO | COM6
GOTO | NORMAL

MATTHIAS
DIALOG | Juicebox | Heh... Hey kid...

GOVERNOR
DIALOG | Juicebox | Heh heh... Evening, Mr. Governor...

COM6
DIALOG | Juicebox | Granny uhh... Forgot her medicine.

COM4
DIALOG | Juicebox | Hey kid. Cornrow's teaching me about uh, numbers and stuff.

COM2
DIALOG | Juicebox | Cornrow's teaching me to read, uh, words.

NORMAL
DIALOG | Juicebox | Uhh, hey kid.
";
