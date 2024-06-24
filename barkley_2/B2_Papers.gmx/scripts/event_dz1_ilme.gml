script = "
IF ilmeState = 0     | GOTO | ILME0
IF ilmeState = 1     | GOTO | ILME1

ILME0
DIALOG | Ilme | Hey, you hear the latest rumor? They say Cuchulainn's got a kid running around the Necron 7 causing all kinds of trouble. Can you even imagine that? Cuchulainn a father! Kinda blows away that menacing image I had of him now that I know he used to change diapers.
QUEST  | ilmeState = 1

ILME1 
DIALOG | Ilme  | It's just a rumor. You'd have to be crazy to think Cuchulainn has kids.
";
