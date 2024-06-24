script = "
IF bootyBassQuest == 3 | GOTO | BOOTY3
IF bootyBassQuest == 2 | GOTO | BOOTY2
GOTO | BOOTY1

BOOTY3
DIALOG | P_NAME | Should I bless 'em on the decks?
DIALOG | P_NAME | Nah.

BOOTY2
IF bootyRecordState == 1 | GOTO | BOOTY2_1
GOTO   | BOOTY2_0

BOOTY2_1
DIALOG | Stonewall 'Booty Daimyo' Jackson | HEY! Come on, kid. We're trying to 'Feel The Bass' here... can you feel it? I guess you can't feel it. All of us can feel it! Can't we!?
DIALOG | Crowd | Yeaaaaah! Woo hoo! We feel it! Yeah, the bass! Our booties are shuddering! Wahooooooo!
DIALOG | Stonewall 'Booty Daimyo' Jackson | See, @bootyDjName@? We're all feeling it here. You're the odd one out...

BOOTY2_0
DIALOG | Stonewall 'Booty Daimyo' Jackson | Oh no you don't! You had a shot, kid. These booties were yearning for bass... you denied the crowd... and so shamed the decks! Keep your clumsy hands off 'em!
DIALOG | P_NAME | (Geez, you don't have to be so mean...)
QUEST  | bootyRecordState = 1

BOOTY1
IF bootyRecordState == 1 | GOTO | BOOTY1_1
DIALOG | P_NAME | (Wow, look at these turntables... I wish I could get my chance to step up to the plate. I think I could really pump it up...)
DIALOG | Stonewall 'Booty Daimyo' Jackson | You there, youngster! Yes you, the one fervently ironing the 1's and 2's!
QUEST  | bootyRecordState = 1

BOOTY1_1
DIALOG | P_NAME | (Could this be me?)
";
