script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF cowState == 0    | GOTO | COW0
IF cowState == 1    | GOTO | COW1
IF cowState == 2    | GOTO | COW2
IF cowState == 3    | GOTO | COW3
IF cowState == 4    | GOTO | COW4
IF cowState == 5    | GOTO | COW5
GOTO | COW6

MATTHIAS
DIALOG | Cow      | ....................
DIALOG | Matthias | (Maybe I should just leave the cow alone...)

GOVERNOR
DIALOG | COW                 | ....................
DIALOG | Governor Elagabalus | (I... I think the cow knows I'm not really the Governor!)

COW0
DIALOG | COW    | ...
DIALOG | P_NAME | Uh, hey there...
QUEST  | cowState = 1

COW1
DIALOG | COW    | .....
DIALOG | P_NAME | O-oh...
QUEST  | cowState = 2

COW2
DIALOG | COW    | .......
DIALOG | P_NAME | ...
QUEST  | cowState = 3

COW3
DIALOG | COW    | .........
DIALOG | P_NAME | I guess I'm not very interesting to you, huh... 
QUEST  | cowState = 4

COW4
DIALOG | COW    | ...........
DIALOG | P_NAME | Maybe you're just a listener?
QUEST  | cowState = 5

COW5
DIALOG | COW    | .............
DIALOG | P_NAME | This is gonna sound weird because you're a cow and all but, well... here goes... my name is P_NAME, or at least that's what the number of the back of my head says. I don't know who I am or where I came from or what I'm doing here. All I know is that I'm looking for the Cyberdwarf and he's the only one who knows who I am. I guess. I don't even know if that's true. I... I don't really know what's going on but... but basically I just feel so powerless. Everyone is telling me who I am and what I have to do and I don't know or want any of it. I just... wanna play vidcons and b-ball and go home... even though I don't know where that is. I don't want anything to do with this. I just wanna be a kid.
DIALOG | COW    | ...
DIALOG | P_NAME | Still nothing, huh... I guess you really are just a cow.
QUEST  | cowState = 6

COW6
DIALOG | COW    | ...............
DIALOG | P_NAME | Well, thanks for listening, I guess...
";
