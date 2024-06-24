script = "
IF body == matthias    | GOTO | MATTHIAS
IF body == governor    | GOTO | GOVERNOR
IF govGuillaume == 3   | GOTO | GOV3
IF govGuillaume == 2   | GOTO | GOV2
IF guillaumeState == 0 | GOTO | STATE0
GOTO | STATE1

MATTHIAS
DIALOG | Guillaume | Hey man, diggin' the look. Getting mondo vibes from the whole sewage and decay thing. Fuck society and it's 'expectations', y'know? Like... your 'rules' and your 'trends'? They're designed by 'the man' to keep us down, keep us occupied with the small stuff so they can devour us spiritually. It's all so... ephemeral, man. Trust only your chakras. Keep on keepin' it real, dude.

GOVERNOR
DIALOG | Guillaume | Maaaan, I'm not doing anything! I'm just playin' some tunes for the good people of Tir na Nog! Is that such a crime?
DIALOG | Governor Elagabalus | Good point! Thanks for the crime tip! I'll be on the lookout for criminals now! Stay vigilant, citizen! 

GOV3
DIALOG | Guillaume | I'm just playin' one last tune for old time's sake, but I'm sure as hell not gonna miss the bogus vibes here. Chill times are coming. Believe me.
	
GOV2
DIALOG | Guillaume | Heeeeey, man. I heard you're getting kicked out of Tir na Nog. Guess what, man: me too.
DIALOG | P_NAME    | Yeah, I heard... you seem pretty excited about it.
DIALOG | Guillaume | Greener pastures, maaaaan. Somewhere I can stretch my legs out, jam a little, kick the hackey sack around, grow some dreds out. This is the best thing that's happened to me in a loooong time, man.
DIALOG | P_NAME    | To be honest, I'm kinda nervous. I don't really know what's out there and I'm supposed to be looking for the Cyberdwarf.
DIALOG | Guillaume | I heard about these like, spiritual people, man, who live on the top of a mountain and they're led by this mystical guru who's supposed to know everything. Who knows, maaan, maybe it's him. They sound pretty chill, I think that's where I'm going. Anyway, maaaan, maybe we'll run into each other out there. Keep your chakras attuned.
QUEST  | govGuillaume = 3

STATE0
QUEST  | govGuillaume = 1
QUEST  | guillaumeState = 1
DIALOG | P_NAME    | That's a beautiful song you're playing. What is it called?
DIALOG | Guillaume | Heeeeey, maaan. Diggin' the hawk. It's an old dwarf folk song about peace and love, maaan, gettin' together and like, really getting to know each other, y'know? Hey, hey, are you a dwarf?
DIALOG | P_NAME    | Um, I'm not sure. I don't think so. Maybe.
DIALOG | Guillaume | You don't look like a dwarf to me but I'm not gonna judge. We all come in different sizes and shapes, maaan, but we're all the same deep down. Like y'know the Duergars? They're total vibe-killers, y'know? Always telling us what to do, where to go, where we're not allowed to play our tunes, maaaan. But y'know they're dwarfs too, just like us? If we all just sat down and talked about love, maaan, synchronized our crystals, maybe we could come to an understanding. Anyway, maaaan, if you could spare some change or somethin', I'd be real grateful. The Duergars keep saying they're gonna throw me outta here, but this is all I got.
GOTO   | BUSK

BUSK
BREAKOUT | add | money
CHOICE | Spare @money_guillaumeTip@ neuro-shekels?
REPLY  | YES | Yeah.
REPLY  | NO  | Nah.

YES
BREAKOUT | clear
IF money >= @money_guillaumeTip@ | GOTO | TIP
GOTO | NOMONEY

TIP
QUEST  | guillaumeTipped = 1
QUEST  | money -= @money_guillaumeTip@
DIALOG | P_NAME | Yeah, I guess I can spare a few neuro-shekels.
DIALOG | Guillaume | Awwww man, I knew I was getting mondo vibes when we started talking. You're chill, a real patron of the arts. So like... the Duergars, maaaan. They're all Cuchulainn's little lap dogs, y'know? Throwing us dwarfs under the bus for that dollar bill, that sweet lucre, y'know? Man, if we all just sat down together and talked this out, we'd see we're all in the same boat, that Cuchulainn's making us like... fight each other, maaan.
DIALOG | P_NAME | What do you mean? Dwarfs and Duergars are the same?
DIALOG | Guillaume | Man, we're all the same deep down... we're all the same deep down... hey, I'm not gonna keep you but thanks for the cash, maaan. 'ppreciate it.

NOMONEY
DIALOG | P_NAME | Yeah, I guess I can spare a few neuroshe- dad flubbit, looks like I'm broke too. I'm sorry, man. I've got nothing.
DIALOG | Guillaume | Yeah, seems like everyone's broke these days. Maaan, I'd head somewhere way more laid back if I even knew where it was. Here's to hoping the Duergars actually do kick me out someday. Stay chill.
	
NO
BREAKOUT | clear
DIALOG | P_NAME | Hey, that's tough man, but I'm all out of money too. Guess we're both broke. Sorry.
DIALOG | Guillaume | Yeah, everyone is these days. I'd jet if I even knew how. Here's to hoping the Duergars actually do kick me out someday.
	
STATE1
IF guillaumeTipped == 0 | GOTO | STATE1A
DIALOG | Guillaume | Heeeey, you're back! Big props for the sheks'. If I ever hit it big, I'll pay you back in kind. I'm good for it, man.

STATE1A
DIALOG | Guillaume | Heeeey, you're back! Maaan, I don't want to be a bother but I'm kinda short on cash, y'know? Cuchulainn's keeping me down. You know how it is. If you like my tunes, you think you could spare me a few neuro-shekels?
GOTO | BUSK
";
