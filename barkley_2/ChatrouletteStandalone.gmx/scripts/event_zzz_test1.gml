script = "
IF bothildState == 0     | GOTO | BOTHILD0
IF bothildState == 1     | GOTO | BOTHILD1 

BOTHILD0
BREAKOUT | money | 20
BREAKOUT | clear
DIALOG | Bothild | What the hell are you lookin' at, shrimp? You think I couldn't take you? I'd drop you like a sack of dirt in one punch, chump. Go ahead and gimme a reason.
DIALOG | P_NAME | (Someone's got a chip on their shoulder...)
QUEST  | bothildState = 1
   
BOTHILD1        
DIALOG | Bothild | If I see you out there in the wasteland, I'll gut you.";
