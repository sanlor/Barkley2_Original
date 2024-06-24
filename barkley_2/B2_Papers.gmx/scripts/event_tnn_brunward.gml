script = "
IF body == governor   | GOTO | GOVERNOR
IF brunwardState == 2 | GOTO | STATE2
IF castorDead == 2    | GOTO | CASTOR_DEAD2
IF castorDead == 1    | GOTO | CASTOR_DEAD1
IF brunwardState == 1 | GOTO | STATE1
GOTO | STATE0

GOVERNOR
DIALOG | Governor Elagabalus | Ah, good day citizen! Please keep directing your attention into those goggles and not at me! Thank you and goodbye!

STATE2
DIALOG | Brunward | ...
DIALOG | P_NAME   | (They just aren't talking to me.)

CASTOR_DEAD2
DIALOG | P_NAME   | The guy with the red glasses is gone now. I guess something really did happen.
DIALOG | Brunward | ... ughhhh...
DIALOG | P_NAME   | What are you doing that's so important that you can't even talk to me? Do you even understand me?
DIALOG | Brunward | ... poppers...
QUEST  | brunwardState = 2

CASTOR_DEAD1
DIALOG | P_NAME   | Uh, hey... there's a guy here who's not breathing... I think he needs help.
DIALOG | Brunward | ... not now...
DIALOG | P_NAME   | I really think something might be wrong.
DIALOG | Brunward | ...

STATE1
DIALOG | P_NAME   | (I don't think he wants to talk...)

STATE0
DIALOG | P_NAME   | Hey, what's going on? What are you all doing?
DIALOG | Brunward | ... wicked... rooferrrrrrrrrr...
DIALOG | P_NAME   | Um, yes?
DIALOG | Brunward | ... v... ...
DIALOG | P_NAME   | Oh... okay I guess...
QUEST  | brunwardState = 1
";
