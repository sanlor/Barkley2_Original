script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF curfew == before | GOTO | TAKE
GOTO | ROTTEN

MATTHIAS
DIALOG | Matthias | (It's a big basket of fruits, but I shouldn't take any. I'm not sure I could even get them with this clunky body...)

GOVERNOR
DIALOG | Governor Elagabalus | (These fruits... are truly juicy!)

TAKE
IF comServ == 2 | DIALOG | P_NAME | (Hmmm, I think this is that fruit basket Mr. Cornrow asked me to get. Should I take it?)
IF comServ != 2 | DIALOG | P_NAME | (Wow, that's one big fruit basket. I wouldn't mind a grape... but that would be stealing...)
CHOICE | Take the fruit basket?
REPLY  | YES | Yeah.
REPLY  | NO  | Nah.

YES
QUEST  | fruitbasketTake = 1
ITEM   | Fruit Basket | 1
EVENT  | o_fruitbasket01 | 0
IF comServ == 2 | DIALOG | P_NAME | (Gotta feed those kids!)
IF comServ != 2 | DIALOG | P_NAME | (Heh. I make my own morals. This fruit is all mine...)

NO
DIALOG | P_NAME | (Nah, I think I'll leave it...)

ROTTEN
IF comServ == 2 | DIALOG | P_NAME | (Hmmm, I think this is that fruit basket Mr. Cornrow asked me to get... but it looks rotten now... I think I came too late...)
IF comServ != 2 | DIALOG | P_NAME | (Pee-yuw! This fruit is rotten.)
";
