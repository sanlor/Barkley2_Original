script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
QUEST  | ignacyState += 1
IF ignacyState == 1 | GOTO | IGNACY0
IF ignacyState == 2 | GOTO | IGNACY1
IF ignacyState == 3 | GOTO | IGNACY2
IF ignacyState == 4 | GOTO | IGNACY3
IF ignacyState == 5 | GOTO | IGNACY4
GOTO | IGNACY5

MATTHIAS
DIALOG | Ignacy   | G'day, Matthias! Have you heard anything about our prizes yet??? I'm really looking forward to my prize!!!
DIALOG | Matthias | Well I have heard that I'm completely, 100% Matthias. I think that's something to look forward to, since I am Matthias, and there's no question about it.

GOVERNOR
DIALOG | Ignacy   | Oh, Mr. Governor, wait!! I wanted to ask about the prize!! Are the prizes ready yet?!? Can I have my prize now?!!?
DIALOG | Governor Elagabalus | Yes, definitely, absolutely. Very interesting developments. These developments would interest the governor, which is who I happen to be, the governor.

IGNACY0
DIALOG | Ignacy   | I'm not fooled by this Cuchulainn's prize nonsense. I really know what that means. Don't let them fool you.

IGNACY1
DIALOG | Ignacy   | I know what this prize rubbish is really about. Standing in line, dwarfs pushing, dwarfs shoving. And that's if I'm lucky. Probably I'll be in the bathroom when everyone gets their prize. When it comes time for me to show up at the desk to claim my prize, they'll be all out of prizes. Sorry Ignacy! No prize for you. Everyone else is having a great time with their prize. Hope you enjoy your NO PRIZE. Everyone will have a great prize, and I'll have no prize.

IGNACY2
DIALOG | Ignacy   | I never get a prize. All I want is to have a prize once in my life, but that's too much to ask.

IGNACY3
DIALOG | Ignacy   | You know, maybe I don't even want the stupid prize. If everyone's getting one, it won't be something special. What are the odds that this prize will be something good and they'll have enough for everyone? Zero.

IGNACY4
DIALOG | Ignacy   | What do you have to do in this life to get a cool prize?

IGNACY5
QUEST  | ignacyState = 6
DIALOG | Ignacy   | I bet everyone's got their prize already and they're just not telling. There's probably a prize with my name on it waiting for me and nobody's telling.
";
