script = "
IF body == governor | GOTO | GOVERNOR
IF polluxState == 2 | GOTO | STATE2
IF castorDead == 2  | GOTO | CASTOR_DEAD2
IF castorDead == 1  | GOTO | CASTOR_DEAD1
IF polluxState == 1 | GOTO | STATE1
GOTO | STATE0

GOVERNOR
DIALOG | Governor Elagabalus | Ah, good day citizen! Please keep directing your attention into those goggles and not at me! Thank you and goodbye!

STATE2
DIALOG | P_NAME | I guess you're busy or whatever, but I wanted you to know that I'm sorry, if that means anything to you.
DIALOG | Pollux | ...

CASTOR_DEAD2
DIALOG | P_NAME | I guess that guy is gone now. Can you hear me? Do you even know what's happening?
DIALOG | Pollux | ... nnnnnngh...
DIALOG | P_NAME | I'm sorry, I guess.
QUEST  | polluxState = 2

CASTOR_DEAD1
DIALOG | P_NAME | Umm... that guy who looks like you... do you know him?
DIALOG | Pollux | ... unnngh...
DIALOG | P_NAME | He's not moving or breathing or anything.
DIALOG | Pollux | ... leave... alone...
DIALOG | P_NAME | ...

STATE1
DIALOG | P_NAME | (I guess this guy's busy with something...)

STATE0
DIALOG | P_NAME | Um, what are you guys doing?
DIALOG | Pollux | ... ungggggg. Go aw...
DIALOG | P_NAME | You look kind of sick...
DIALOG | Pollux | ... busy...
DIALOG | P_NAME | Sorry...
QUEST  | polluxState = 1
";
