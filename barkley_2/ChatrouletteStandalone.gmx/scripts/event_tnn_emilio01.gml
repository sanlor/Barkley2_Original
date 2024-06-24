script = "
IF body == matthias     | GOTO | MATTHIAS
IF body == governor     | GOTO | GOVERNOR
IF emilioState == 0     | GOTO | EMILIO0
IF emilioState == 1     | GOTO | EMILIO1
GOTO | SVIATOSLAV1

MATTHIAS
DIALOG | Emilio     | G'day Matt! Real surprise seeing you here! I thought you left to find the rebels! You still down for a pickup game later?
DIALOG | Matthias   | Hello, it's me, the real Matthias! I sure do love basketball! I hope that's the sport you're talking about, because that's the one I like the most!! Goodbye!

GOVERNOR
DIALOG | Emilio     | Hey, you're the new governor, right? What's the deal with the b-ball court? Think we'll get it fixed up anytime soon?
DIALOG | Governor Elagabalus | Hello, citizen! Ah, I love basketball! Three in the key, alley-oop, slam dunk! I know about all those things. Well, goodbye!

EMILIO0
DIALOG | Emilio     | Hey, you look like a baller. You ever hear about the Chaos Dunk?
DIALOG | P_NAME     | It sounds kinda familiar... what is it?
DIALOG | Emilio     | Well, it's just a rumor, but apparently it's a dunk that has the power of a 150 megaton nuclear blast. Only the oldest and wisest of ballers could ever pull it off. Sounds pretty crazy, huh? But supposedly someone pulled it off a long time ago and destroyed some Earth city called Neo New York.
DIALOG | P_NAME     | It sounds kinda familiar... what is it?
DIALOG | Emilio     | I've seen ballers do some pretty crazy things, but a jam as verboten as that? It's gotta be a fairy tale.
QUEST  | emilioState = 1

EMILIO1
DIALOG | Emilio     | Holy Dunks and Vampslams are one thing, but a Chaos Dunk? There's no way to ever get that kinda power.
DIALOG | P_NAME     | (P-power...)
";

