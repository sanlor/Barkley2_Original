script = "
IF vudamotState = 0     | GOTO | VUDA0
IF vudamotState = 1     | GOTO | VUDA1

VUDA0
QUEST  | vudamotState = 1
DIALOG | Vudamot | Oh man, that's a killer piece you've got there. You a braster?
CHOICE | Am I a braster?
REPLY  | NOTREALLY  | I'm not much of a gun'sbraster.
REPLY  | LOVEIT     | I love to brast... but I'm just getting started.
REPLY  | THEBEST    | I may not look it, but I'm one of the best.
REPLY  | WHAT?      | What's a braster?

NOTREALLY 
DIALOG | P_NAME  | Listen... I only brast when others force it upon me. I walk the path of peace, not brasts.
DIALOG | Vudamot | That... that was so cool... that's the most braster things I've ever heard in my life. Lemme write that down - 'I only brast when I have to.' I hope you don't mind if I use that in the future, when I'm a better braster.

LOVEIT
DIALOG | P_NAME  | I guess you could call me a brasting enthusiast, I'm still just getting started.
DIALOG | Vudamot | Wow... Just like me! Well, not really, but I do love brasting in all it's forms! Keep on brasting!

THEBEST
DIALOG | P_NAME  | Heh, I may not look like it, but I'm one of the quickest shots this side of Tir na Nog.
DIALOG | Vudamot | Aha! I knew it! I could tell you were a seasoned braster the second you walked through the gate. You had that cool confidence, that steely gaze, that braster swagger. Man, that's what I'm gonna have someday.

WHAT? 
DIALOG | P_NAME  | Wait... what's a braster?
DIALOG | Vudamot | Get with the program, knucklehead! A desperado, a sharpshot, a deadeye, A GUN'SBRASTER! How the heck are you gonna make it out here in the Necron 7 wastelands if you don't even know what a braster is?
DIALOG | P_NAME  | O-oh... I always called it something else...

VUDA1
DIALOG | Vudamot | Sorry for talking so much about gun's, I kinda get carried away sometimes.
";

