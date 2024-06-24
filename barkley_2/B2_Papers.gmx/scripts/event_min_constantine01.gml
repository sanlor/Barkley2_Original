script = "
IF constantineStateMines == 0 | IF constantineState == 2 | GOTO | MINES0
IF constantineStateMines == 0 | IF constantineState != 2 | GOTO | MINES1
IF constantineStateMines == 1 | GOTO | MINES2

MINES0
DIALOG | Constantine | Hey, haven't I seen you somewhere before? 
DIALOG | P_NAME | Maybe...
DIALOG | Constantine | Yeah... Yeah! I remember. You're that piss thief from Tir na Nog. What the hell are you here for? Back for some more samples, you fucking weirdo? I'll give a sample of my fist this time.
DIALOG |P_NAME | Take a chill pill, dude. I've got an ID card. I'm on the duergar side.
DIALOG | Constantine | What? Hmm... Klauust Mitsugiri? I've never heard of a name like that. What is this bullshit?
DIALOG |P_NAME | It's not BS. It's legit.
DIALOG | Constantine | Pfft... Fuck. Rules are rules... You got lucky this time, Mitsugiri. But if I ever see you down here without your card, you're getting a beating!
DIALOG |P_NAME | (Whoa, it worked!)
QUEST | constantineStateMines = 1 

MINES1
DIALOG | Constantine | Who the fudge are you?
DIALOG | P_NAME | I'm, uh, Klauust Mitsugiri.
DIALOG | Constantine | Uh huh. Fascinating. I'm going to enjoy beating the shit out of you, you dwarf scum. 
DIALOG | P_NAME | Cool your beans, dude! I've got an ID card. Check it out.
DIALOG | Constantine | Hmph... What the hell is this shit?
DIALOG | P_NAME | It's legit.
DIALOG | Constantine | Pfft... Fuck. Rules are rules... You got lucky this time, Mitsugiri. But if I ever see you down here without your card, you're getting a beating!
DIALOG |P_NAME | (Whoa, it worked!)
QUEST | constantineStateMines = 1 

MINES2
DIALOG | Constantine | Grrr... What do you want, Mitsugiri?
DIALOG | P_NAME | Oh nothing really. Just loitering with my ID card.
DIALOG | Constantine | ID card or not, you'd best get out of my face before I get really pissed off.
";
