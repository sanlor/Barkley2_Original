script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF govQuest == 6    | GOTO | GOVQUEST
IF curfew == during | GOTO | CURFEW
GOTO | DORIS

MATTHIAS
DIALOG | Doris | G'day, Matt. The Fruit of the Month Club hasn't sent me any fruit yet and it's been 5 months. I'm starting to think there isn't any fruit.

GOVERNOR
DIALOG | Doris | So you're the new Duergar Governor? Here's a hardball for you: What's your fruit policy?
DIALOG | Governor Elagabalus | It's my staunch belief that all fruits are equal. Expect to hear more, when I, your new Duergar Governer, deliver my speech.

GOVQUEST
DIALOG | Doris | Wow! The new Duergar Governor wasn't so bad after all. I'm glad he talked about fruit. Maybe things are getting better around here.

CURFEW
DIALOG | Doris | Hi. Have you heard the latest rumor going around? It's about grapes. I haven't heard it yet.

DORIS
DIALOG | Doris | Have you heard the news? The new Duergar Governor is coming soon and he's going to make a speech! Do you think it'll be about Cuchulainn's prize? Do you think it will be about grapes?
";
