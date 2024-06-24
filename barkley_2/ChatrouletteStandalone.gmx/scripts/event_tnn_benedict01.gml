/// Benedict
script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF area != tnn      | GOTO | NOT_TNN
GOTO | TNN

MATTHIAS
IF area == tnn | DIALOG | Benedict | G'day Matt! Still lookin' fer rebels? Guess you got outta the sewers okay. I'm goin' fishin' there myself! Get yer rod and come along!
IF area != tnn | DIALOG | Benedict | G'day Matt! You still lookin' fer rebels? You aren't leaving the sewers, are ya? I just started fishin' myself! Go get yer rod and join me!
DIALOG | Matthias | Um, hey... guy. I think I'll skip out for now. I've uh, had enough of the sewers for one day. Yep. Pretty sure I won't be going back there anymore.
DIALOG | Benedict | Well if you're not goin' fishin, we have nothing to talk about. Scram! Scram, youngster! Scram!

GOVERNOR
DIALOG | Benedict | Well if it ain't the new governor. I guess yer a real bigshot, huh? Well you'd be doin' me a big favor if you made the sewers a little safer to fish in. And let Cuchulainn know we're all ready for that prize.

NOT_TNN
IF benedictState == 0 | DIALOG | Benedict | Nice day for fishin', huh? Don't usually go any further in on account of the Bainshees and all, but this ain't a bad spot.
IF benedictState == 1 | DIALOG | Benedict | My advice? Keep yer hook close... and yer sinker closer! Hyaw haw haw haw haw! Guh huh huh huh huh! Bwahahahaha! Gahahahahahah! Buh huh huh.
QUEST  | benedictState = 1

TNN
IF benedictState == 1 | GOTO | BENEDICT1
QUEST  | benedictState = 1
DIALOG | Benedict | Hey there youngster, you know anything about the sewers?
CHOICE | Do I?
REPLY  | YES | Yeah.
REPLY  | NO  | Nah.

YES
DIALOG | Benedict | Me too. I also know about the sewers.

NO
DIALOG | Benedict | Oh. I was going to ask you if you knew if the sewers are a dangerous place place filled with Bainshees, or if lots of dwarfs try to escape through the sewers, or if the sewers are where L.O.N.G.I.N.U.S. rebels hide out, or if it's where the Duergars have a plantation where they send anyone suspected of being a rebel. But I guess you don't know either.

BENEDICT1
DIALOG | Benedict | Well, I'm going fishin' now. A lot of people say the sewers aren't a safe place for a dwarf to go fishin', that if the Duergars don't get me, it'll be Cuchulainn's Bainshees, but I'm not worried. The rebels go in and out of the sewers all the time! What's the big deal?
";
