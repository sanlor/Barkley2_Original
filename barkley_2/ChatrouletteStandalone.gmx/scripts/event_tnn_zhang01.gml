/// Zhang
script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
QUEST | zhangState += 1
IF zhangState == 1  | GOTO | ZHANG0
IF zhangState == 2  | GOTO | ZHANG1
IF zhangState == 3  | GOTO | ZHANG2
IF zhangState == 4  | GOTO | ZHANG3
IF zhangState == 5  | GOTO | ZHANG4
IF zhangState == 6  | GOTO | ZHANG5
IF zhangState == 7  | GOTO | ZHANG6
IF zhangState == 8  | GOTO | ZHANG7
IF zhangState == 9  | GOTO | ZHANG8
IF zhangState == 10 | GOTO | ZHANG9
IF zhangState >= 11 | GOTO | ZHANG10

MATTHIAS
DIALOG | Zhang | Hey. Who are you? Do you want to be a clown? I can teach you.
DIALOG | Matthias | Nope! I'm fine being me; good old Matthias, son of Firas and lover of sewers.

GOVERNOR
DIALOG | Zhang | Hey, Mr. Governor. What do you think about clowns?
DIALOG | Governor Elagabalus | Hmm... H-m-m... Clowns are great!
DIALOG | Zhang | I always knew you were the clown's governor. Keep up the good work.

ZHANG0
DIALOG | Zhang | Hey, welcome to my house. I'm Zhang. I like to dress up like a clown because I think it's real cool. I like to march around in the streets and go 'check me out fellas, I'm a clown'. I think my clown clothes look good and cool. I'm a good and cool clown.

ZHANG1
DIALOG | Zhang | I like to kick back and goof off.

ZHANG2
DIALOG | Zhang | I'm an authentic clown for goofing.

ZHANG3
DIALOG | Zhang | The role of clowns in society is: goofing.

ZHANG4
DIALOG | Zhang | I feel empowered when I dress like a clown.

ZHANG5
DIALOG | Zhang | I spend 100% of my time dressed like a clown. I wear these clothes constantly. I think it's cool to dress like a clown.

ZHANG6
DIALOG | Zhang | For me, dressing like a clown is a fashion statement.

ZHANG7
DIALOG | Zhang | I'm working on a script for a movie - 'Good Clown, Bad Clown'. So far I only have the title.

ZHANG8
DIALOG | Zhang | It's so good to dress like a clown. I recommend it.

ZHANG9
DIALOG | Zhang | So you like spending time with a clown, eh? Ahh.

ZHANG10
QUEST  | zhangState = 11
DIALOG | Zhang | The one flaw with always dressing like a clown is that it prevents you from integrating with the rest of society.
";
