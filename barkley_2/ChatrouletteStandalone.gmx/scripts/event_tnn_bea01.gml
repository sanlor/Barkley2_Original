script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF beaState == 0    | GOTO | BEA0
GOTO | BEA1

MATTHIAS
DIALOG | Bea | Oh, Matthias, let me have a look at you... Oh dear... your color is not good. You should get home this instant.
DIALOG | Matthias | Wow, you are absolutely correct, I am definitely Matthias, no doubt about that one. Great eye you got there!!!

GOVERNOR
DIALOG | Bea | ...
DIALOG | Governor Elagabalus | Hmmm... yes... I hope you are having the most excellent day.\This has been a special greeting from me, the governor. I hope you like all the governor wishes I sent you.
IF beaState == 1 | DIALOG | Governor Elagabalus | (I hope that helped... Bea deserves better than this crap world...)

BEA0
DIALOG | Bea | Hey youngster, want a piece of advice?
CHOICE | Do I have time for advice?
REPLY  | YES | Sure, shoot.
REPLY  | NO  | No thanks.

YES
DIALOG | P_NAME | Sure, shoot.
DIALOG | Bea    | What? Shoot what?
DIALOG | P_NAME | Just go ahead and tell me.
DIALOG | Bea    | What's this about shooting?
DIALOG | P_NAME | It's... what?
DIALOG | Bea    | All of my closest friends were executed by the Duergars. Everyone I know. Gone. Shot. They lined them all up against the wall and shot them... It was just that one little word that did it. One moment my friends were all up against the wall, crying... then... SHOOT!!!! Then they were all gone, a mound of bloody corpses slumped against each other. I would have been next but they thought they'd rather use me for torture practice instead. They'd probably still have me in the cell if I didn't run out of hair, toenails, eyebrows, eyelashes, and teeth to pull out. I was pretty once, even. And now... now... this...
DIALOG | P_NAME | Oh... I'm... uh... it's just a saying... like... uh...
DIALOG | Bea    | Is that how you talk to everyone? To just go around reminding them of all the horrors they spend every waking moment of their life trying to forget?!?
DIALOG | P_NAME | I'm really sorry. I didn't know. Is there something you wanted to tell me?
DIALOG | Bea    | I think you should think a little more about the things you're saying before you say them.
DIALOG | P_NAME | I'm really, really sorry. I didn't know...
DIALOG | Bea    | ...
DIALOG | P_NAME | (I really blew that one...)
QUEST  | beaState = 1

NO
DIALOG | Bea | Oh. I was just trying to help. Come let me know if you change your mind. I could really help you out.

BEA1
DIALOG | Bea | The nightmares just stopped too... I thought I was past all that.... Well, it was a nice couple of days I guess.
";
