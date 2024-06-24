script = "
IF body == governor | GOTO | GOVERNOR
IF elcegeState == 2 | GOTO | STATE2
IF castorDead == 2  | GOTO | CASTOR_DEAD2
IF castorDead == 1  | GOTO | CASTOR_DEAD1
IF elcegeState == 1 | GOTO | STATE1
GOTO | STATE0

GOVERNOR
DIALOG | Governor Elagabalus | Ah, good day citizen! Please keep directing your attention into those goggles and not at me! Thank you and goodbye!

STATE2
DIALOG | Elcege | ...
DIALOG | P_NAME | I guess whatever you're doing is really important. I'm not gonna bother you.

CASTOR_DEAD2
DIALOG | P_NAME | ... that guy is gone. I guess something really did happen.
DIALOG | Elcege | ... guhhhhhh...
DIALOG | P_NAME | You're not even paying attention...
QUEST  | elcegeState = 2

CASTOR_DEAD1
DIALOG | P_NAME | Hey, I don't know if you can hear me but one of your friends isn't uh... he's not moving or breathing or anything.
DIALOG | Elcege | ... mmmmmm... mud boot...
DIALOG | P_NAME | I really think this guy needs help.
DIALOG | Elcege | ...

STATE1
DIALOG | P_NAME | (She doesn't want to talk, I guess.)

STATE0
DIALOG | P_NAME | Those glasses are pretty cool. Are you guys jacked into something?
DIALOG | Elcege | ... oligarchy... vvvvvvvvvvvvvuhhhhhhh...
DIALOG | P_NAME | Um, yes?
DIALOG | Elcege | ... v... ...
DIALOG | P_NAME | Oh... okay I guess...
QUEST  | elcegeState = 1
";
