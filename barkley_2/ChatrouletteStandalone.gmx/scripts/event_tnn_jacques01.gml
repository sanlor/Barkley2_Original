script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF wilmerEvict >= 4 | GOTO | EVICT
GOTO | NORMAL

MATTHIAS
DIALOG | Jacques | Back from the sewers, Matt? Just forget about the rebels, you don't want to get involved with 'em. You here to pay your Pa's rent? Forget about it. It's closed for the day... hey, open up! Open up, you chumps!
	
GOVERNOR
IF jacquesGov == 0 | GOTO | GOV0
IF jacquesGov == 1 | GOTO | GOV1
GOTO | GOV2

GOV0
DIALOG | Jacques | Mr. Governor, you're just the man I'm looking for! Look, I know I'm late on my rent, but I can explain. See, my cousin Birchard's been staying with me for the past few weeks and lemme tell you, that guy can eat. I've gotta be paying, I don't know, three, four times my normal grocery bill. It's a real pain, Mr. Governor, but that's why I'm here. See, I've finally got my rent money and I'm just trying to get in to pay it, but the department's closed. If I give you the money, could you square everything up for me?
BREAKOUT | add | money
CHOICE | Take Jacques' money?
REPLY  | YES | Take the money.
REPLY  | NO  | I can't help you, sorry.

YES
BREAKOUT | clear
QUEST  | money += @money_jacquesRent@
NOTIFY | Got @money_jacquesRent@ neuro-shekels.
DIALOG | Governor Elagabalus | YES. PLEASE GIVE ME YOUR MONEY. I WILL TAKE CARE OF WHATEVER PROBLEM YOU WERE TALKING ABOUT.
DIALOG | Jacques | Aww, gee Mr. Governor. You're the best! Here's all the money I've got, @money_jacquesRent@ neuro-shekels. I know my rent's less than that, but I figured since you're doing me this big favor I'd throw in a little extra. Thanks for being such a great guy, Mr. Governor. Maybe things are starting to look up around here.
DIALOG | Governor Elagabalus | (I, uh... I feel kinda bad about taking this money...)
QUEST  | jacquesGov = 1

NO
BREAKOUT | clear
DIALOG | Governor Elagabalus | Uhhh... sorry, I don't think I'm going to be able to help you out here...
DIALOG | Jacques | Man, you're the governor! You've got the authority to do anything! It's just a tiny favor! Man... now I'm gonna get kicked out of my apartment all because I didn't wake up early enough...
QUEST  | jacquesGov = 2

GOV1
DIALOG | Jacques | You're the greatest, Mr. Governor! Thanks for taking care of my rent for me! I knew you weren't the corrupt, power-mad, genocidal, torturous masochist they said you were!
DIALOG | Governor Elagabalus | Nope! I'm not any of those things! Well, thanks for the money, I've got to run!

GOV2
DIALOG | Jacques | Sigh... it looks like I really am getting kicked out now...

EVICT
DIALOG | Jacques | Hey, what's going on here? When are they gonna let us in?
DIALOG | P_NAME  | You mean the Department of Population and Housing? I think they've closed up for the day.
DIALOG | Jacques | Man, if I don't renew my mortgage soon, I'm gonna get evicted. Hey, open up! Open up! Can you hear me? Open up in there!!

NORMAL
DIALOG | Jacques | Open up! Open up in there! Can you hear me!? Open up! If I don't renew my mortgage soon, they're gonna evict me! How am I supposed to renew my mortgage if the Department of Population and Housing is closed, huh?
";
