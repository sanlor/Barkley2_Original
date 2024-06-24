script = "
IF bootyBassQuest == 3 | GOTO | BOOTY3
IF bootyBassQuest == 2 | GOTO | BOOTY2
IF rosarioState == 1   | GOTO | ROSARIO1
GOTO | BOOTY1

BOOTY3
DIALOG | Rosario | Dang, that was the freshest post-jock jam bootycore I've ever heard. Scene's gonna go nuts when this hits the blogs.

BOOTY2
DIALOG | Rosario | You don't beat The Anime Bulldog. Not on your first try, kid. His bite is as fierce as his bark and his beats are sicker than the booty plague. Just go home.

ROSARIO1
DIALOG | Rosario | I'm feelin' it... I'm feelin' it!! Someone get me a mechanic, 'cuz my keister's on the fritz!

BOOTY1
DIALOG | Rosario | Oh man, oh man, the Anime Bulldog is so cool... but so is DJ Booty Slayer... I can't tell who's gonna be crowned the Baron of Booty, they've both brought their A-game.
QUEST  | rosarioState = 1
CHOICE | Who will be the Baron of Booty?
REPLY  | ANIME   | The Anime Bulldog.
REPLY  | DJ      | DJ Booty Slayer.
IF curfew == before | IF bootyBassQuest == 0 | REPLY | ME | I'm going to be the Baron of Booty.
REPLY  | CANT    | I can't decide.

ANIME
DIALOG | P_NAME  | I like the Anime Bulldog better.
DIALOG | Rosario | Yeah, the Anime Bulldog's got that pumpin' beat and mature sound but I don't know, DJ Booty Slayer's got that psychedelic bootytrance going. I'm gonna have to flip a coin on this one because they're both on fire.

DJ
DIALOG | P_NAME  | The Anime Bulldog's not bad, but DJ Booty Slayer's got it going on.
DIALOG | Rosario | The Anime Bulldog's all about ambient bloghouse booty samples but DJ Booty Slayer's the master of bitcrushed bootywave. I guess you've just gotta be in the mood for it.

ME
DIALOG | P_NAME  | Forget about them. There's a new Baron of Booty in town.
DIALOG | Rosario | Haha, are you kidding me kid? You think you've got the booty beats to take on the Anime Bulldog AND DJ Booty Slayer? You're out of your mind. These are the two freshest dudes on the scene. You'd better be one bumpin' DJ.
DIALOG | P_NAME  | Heh, you better believe it. I'll get your rump bumpin' AND gumpin', buddy.
DIALOG | Rosario | Yeah, well we'll see about that kid.

CANT
DIALOG | P_NAME  | I can't really decide.
DIALOG | Rosario | Yeah, me neither man, tonight is wild. This is definitely the best Booty Bass blowout ever. My tookis is goin' haywire!
";
