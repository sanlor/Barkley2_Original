/// Babo
script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF baboState == 0   | GOTO | BABO0
IF baboState == 1   | GOTO | BABO1
GOTO | BABO2

MATTHIAS
DIALOG | Babo | My friend. My friend. I worry for you, each day, each night. You see how Babo sweats. Is not good. You must take, how you say, vitamin. Listen. Use this knowledge only for good.
DIALOG | Matthias | Vitamins, you say? Like the ones my pap-pap Firas takes? I'll be sure to do this!

GOVERNOR
DIALOG | Babo | My friend, my friend. If you are worried, if you are nervous, you must think one thing - Babo. It will help you.
DIALOG | Governor Elagabalus | Being governor takes a toll. In my darkest hour I'll remember your words of wisdom.

BABO0
DIALOG | Babo | My friend, my friend. You come my house, you see my riches, you see my floor, you sit my chair, you click my computer, we drink vitamin water, you ask 'what is the o'clock?' I say 'look my clock.' Yes, I am the good man, I am the generous man. I am Babo.
QUEST  | baboState = 1

BABO1
DIALOG | Babo | My friend, my friend. My friend. My friend. Come. Come. My friend. You have entered the abode of Babo. Yes, I am Babo. It is I. You do not believe? My friend, you must believe. It is truly I, Babo. Now go, tell them what you have heard.
QUEST  | baboState = 2

BABO2
DIALOG | Babo | Yes, yes, my friend. You seek Babo? Rest easy. I am Babo.
";
