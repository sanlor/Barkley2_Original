script = "
IF raduState == 0     | GOTO | RADU0
IF raduState == 1     | GOTO | RADU1
IF raduState == 2     | GOTO | RADU2
IF raduState == 3     | GOTO | RADU3
IF raduState == 4     | GOTO | RADU4
IF raduState == 5     | GOTO | RADU5

RADU0
DIALOG | Radu | I'm... I'm hungry... for nuggets.
QUEST  | raduState = 1

RADU1
DIALOG | Radu | It's been... so long... since I've had a grape...
QUEST  | raduState = 2

RADU2
DIALOG | Radu | I have a pocket full of mancala stones... but I'm not going to show you. You just have to trust me.
QUEST  | raduState = 3

RADU3
DIALOG | Radu | I love to flex my muscles at the beach.
QUEST  | raduState = 4

RADU4
DIALOG | Radu | I love apps. I love mancala. For me, I just love them both.
";
