script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
QUEST | torState += 1
IF torState == 1  | GOTO | TOR0
IF torState == 2  | GOTO | TOR1
IF torState == 3  | GOTO | TOR2
IF torState == 4  | GOTO | TOR3
IF torState == 5  | GOTO | TOR4
IF torState == 6  | GOTO | TOR5
IF torState == 7  | GOTO | TOR6
GOTO | TOR7

MATTHIAS
DIALOG | Tor      | His name was probably Lars the more I think about it. Could have been something different, but it was probably Lars.
DIALOG | Matthias | Well I know it couldn't have been Matthias, because that's me, Matthias!! And I think it was probably Lars too!! What else could it have been?!?
DIALOG | Tor      | Hmm... but on the other hand...

GOVERNOR
DIALOG | Tor | The bellhop spilled wine all over my tuxedo.
DIALOG | Governor Elagabalus | Yes, yes, good, good. I am the governor and I am glad to see you are giving back to the community.

TOR0
DIALOG | Tor | I don't want to be me anymore. That's all he said to me. The only thing. Just that.

TOR1
DIALOG | Tor | I didn't think I heard him right, I leaned closer, but that's the only words he said to me. I waited as long as I could, but he had nothing left.

TOR2
DIALOG | Tor | You ever seen that before? Get to see that last glimmer of hope fade out of someone's eyes forever? Creepy.

TOR3
DIALOG | Tor | I never really wanted to be a bus driver, but you don't get to choose those things. I was born a bus driver, and, by the grace of Clispaeth, I'll die a bus driver.

TOR4
DIALOG | Tor | It was that one night, had to keep all the windows shut to keep out the damp. She appeared in the doorway of the eleventh stop. I know it couldn't have been the twelfth stop. Had to be eleven. No other way it could be twelve. Thirty years on that route and she was my first passenger. Whole system had been dead for as long as I can remember, and probably a lot longer before that.

TOR5
DIALOG | Tor | You know what I said to her? Do you know? Do you have any clue?

TOR6
DIALOG | Tor | 'What's cookin'? Who says that, in this day and age? What's cookin'? Nobody says that, no real dwarfs say that. But it's what I said, and you can't take things like that back. Was sore for a long time after that. Choked me up just thinking about it, like getting the wind knocked out of you. All I ever wanted to be was a Cool Neighbor, but it wasn't meant to be.

TOR7
QUEST  | torState = 8
DIALOG | Tor | Don't bother telling anyone. They'll never believe you.
";
