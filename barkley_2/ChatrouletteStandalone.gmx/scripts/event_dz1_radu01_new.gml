// PS THIS IS ANOTHER D-DRAKER SCRIPT... FUCK MY LIFE //

script = "
IF suzuState == 0     | GOTO | SUZU0
IF suzuState == 1     | GOTO | SUZU1
IF suzuState == 2     | GOTO | SUZU2
IF suzuState == 3     | GOTO | SUZU3
IF suzuState == 4     | GOTO | SUZU4
IF suzuState == 5     | GOTO | SUZU5

SUZU0
DIALOG | Suzu | Zaubers are all around us. Can you feel them? Can you feel the zaubers?
DIALOG | P_NAME | Huh? Zaubers?
QUEST  | suzuState = 1

SUZU1
DIALOG | Suzu | It's been... so long... since I've had a grape...
QUEST  | suzuState = 2

SUZU2
DIALOG | Suzu | I have a pocket full of mancala stones... but I'm not going to show you. You just have to trust me.
QUEST  | suzuState = 3

SUZU3
DIALOG | Suzu | I love to flex my muscles at the beach.
QUEST  | suzuState = 4

SUZU4
DIALOG | Suzu | I love apps. I love mancala. For me, I just love them both.
";

