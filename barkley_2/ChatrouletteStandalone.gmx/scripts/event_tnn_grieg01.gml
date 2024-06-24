script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF griegState == 0  | GOTO | STATE0
GOTO | STATE1

MATTHIAS
DIALOG | Grieg  | Excuse me. When is the next train leaving Tir na Nog?
DIALOG | Matthias | You know, walking is pretty good too!! Maybe just walk!! I don't know!! I'm Matthias and I do pretty much whatever I want, just walk around everywhere. It's good for you! That's just a handy hint from me, your friend Matthias!
	
GOVERNOR
DIALOG | Grieg  | Excuse me. When is the next train leaving Tir na Nog?
DIALOG | Governor Elagabalus | Yes, yes, yes. I am the Governor so I ride the trains often. Thank you for bringing this to my attention.

STATE0
QUEST  | knowTNNTrain = 1
QUEST  | griegState = 1
DIALOG | Grieg  | Excuse me.
DIALOG | Grieg  | When is the next train leaving Tir na Nog?
DIALOG | P_NAME | I don't know. Does this town have a train?
DIALOG | Grieg  | Yes, I'm sure of it. There must be a train. How else does anybody get back home?

STATE1
DIALOG | Grieg  | I can't wait to go home.
";
