script = "
IF vercingetorixState == 0     | GOTO | VERC0
IF vercingetorixState == 1     | GOTO | VERC1

VERC0
DIALOG | Vercingetorix | You ever run into those brain alien varmints out there? I just got in from back west and lemme tell ya, it's crawlin' with 'em out there. Them critters come in all sizes, big ol' brutes and those hovering braineo-things. Heck, you don't even wanna know how big I've seen 'em. But y'know what I think? Those tiny 'lil spidery guys are the real threats. When I see a swarm'a those suckers, I book it. Not today, pal. Not today.
QUEST  | vercingetorixState = 1

VERC1
DIALOG | Vercingetorix | Few a'those brain spiders ain't too bad if you've got a machine gun, but a whole swarm? No siree. You better be careful around those spider eggs, cuz if those things hatch, there's gonna be hell to pay.
";