script = "
IF ronaldState == 0     | GOTO | RONALD0
IF ronaldState == 1     | GOTO | RONALD1

RONALD0
DIALOG | Ronald | Hey, P_NAME. You're looking pretty good. How's it going?
DIALOG | P_NAME  | I guess I'm doing alright. Things are kinda rough right now, but I think I'll get through it.
DIALOG | Ronald | Yeah, you're a tough kid, you'll make it. Hey, this is gonna sound a little out-of-the-blue, but have you ever thought much about life insurance?
DIALOG | P_NAME  | Huh? Life insurance? What's that?
DIALOG | Ronald | Now I know you're healthy and strong - you're a real chip off the old block! - but if something happened, maybe a corn shucking accident or fatal overinflation, life insurance would provide your loved ones with the finances needed to cover any sudden expenses.
DIALOG | P_NAME  | But... why would I need that?
DIALOG | Ronald | Accidents come when least expected; nobody thinks the worst will happen to them and yet it could at any moment. If we're not prepared for tragic accidents, we're offloading our burdens onto others. And to me, that's just selfish. Life insurance makes sure that doesn't happen by providing the people around us with the means to settle our affairs.
DIALOG | P_NAME  | Wow. I'd never thought about it before, but I'm convinced. I really do need life insurance. Where can I go to get it?
DIALOG | Ronald | The Sexual Goon Brothers.
QUEST  | ronaldState = 1
   
RONALD1
DIALOG | Ronald | None of us like to think about untimely accidents. But sometimes it's best to be prepared. That's why I say invest in life insurance - so the people around you aren't left hanging in case something happens.
";
