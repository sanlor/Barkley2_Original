script = "
IF bootyBassQuest == 2 | GOTO | BOOTY2
IF bootyBassQuest == 3 | GOTO | BOOTY3
IF hyacinthState == 0  | GOTO | HYACINTH0
GOTO | HYACINTH1

BOOTY2
DIALOG | Hyacinth | So what if you're not the Baron of Booty? You went up there, gave it your all and had a good time. Right?
DIALOG | P_NAME   | Yeah, I guess...
DIALOG | Hyacinth | Maybe you're the baron of something else, something bigger than booties. You'll never know unless you go out there and try. Just take what life gives you and give it your best shot. Okay?

BOOTY3
DIALOG | Hyacinth | See that? You went with the flow, tried something new and came out on top. Sometimes you've just gotta be impulsive. That's what it's all about.

HYACINTH0
QUEST  | hyacinthState = 1
DIALOG | Hyacinth | You might think this is crazy, but sometimes the best thing you can do is let yourself get absorbed in the collective energy of a crowd. Lose your mind and just dance. You should join me!
CHOICE | Join her?
REPLY  | YES | Yeah.
REPLY  | NO  | Nah.

YES
DIALOG | P_NAME   | Yeah, that sounds cool!
DIALOG | Hyacinth | Let's dance!
WAIT   | 2
DIALOG | Hyacinth | Hey, you're a cool kid. Listen to this: to get the most out of life, sometimes you have to make decisions that take you out of your comfort zone. Sometimes you just have to let life take you places. Don't forget that, okay?
DIALOG | P_NAME   | I'll remember that!

NO
DIALOG | P_NAME   | Umm, I'm sorry... I need to uh, deliver some milk bottles...
DIALOG | Hyacinth | You'd enjoy life more if you let yourself go sometimes. It's not always about making the most rational choice. Next time you're presented a choice that takes you out of your comfort zone, you should take it. I challenge you.

HYACINTH1
DIALOG | Hyacinth | When I dance, I let my mind go and I don't care about anything else. Life just takes you away sometimes. That's what I like about it.
";
