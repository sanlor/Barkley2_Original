script = "
IF body == governor   | GOTO | GOVERNOR
IF castorDead >= 1    | GOTO | STATE1
GOTO | STATE0

GOVERNOR
DIALOG | Governor Elagabalus | Ah, good day citizen! Please keep directing your attention into those goggles and not at me! Thank you and goodbye!

STATE1
DIALOG | P_NAME   | (I... I think he might be dead...)

STATE0
DIALOG | P_NAME | Hey, what's going on? I'm kinda new here, what are you guys doing?
DIALOG | Castor | ...
DIALOG | P_NAME | ... you there? Why are your glasses red?
DIALOG | Castor | ...
DIALOG | P_NAME | (D-d-dadgummit... I think... this guy might be gone...)
QUEST  | castorDead = 1
";
