/// Fede, member of the GAMING KLATCH
/* the script for fede, a dude in the doctor's office
Variables
    fedeState
        0 = not talked to Fede
        1 = (not used)
        2 = talked to Fede, guessed at the identity of the Game
3 = you failed the quest one way or another, he awaits "the knife"
4 = you accepted the Printed Invitation and can look for Milagros
        
    fedeDelivery
        0 = haven't accepted the quest to deliver the invitation
        1 = 
        2 = 

    fedeGame
        0 = haven't guessed at the game
        (string) = gets set to whatever game you chose

DIALOG | Fede | 
DIALOG | P_NAME | 
DIALOG | Fede | 
DIALOG | P_NAME | 
DIALOG | Fede | 
DIALOG | P_NAME | 
DIALOG | Fede | 
DIALOG | P_NAME | 
*/

script = "
IF fedeState == 5 | GOTO | FEDE05
IF fedeState == 4 | GOTO | FEDE04
IF fedeState == 3 | GOTO | FEDE03
IF clock >= 3.2 | GOTO | FEDECRESTFALLEN
IF fedeState == 2 | GOTO | FEDE02
IF fedeState == 1 | GOTO | FEDE01
IF fedeState == 0 | GOTO | FEDE00

FEDE05
DIALOG | Fede | Hey again, P_NAME_S, you don't have second thoughs about helping me and the Klatch do you?
GOTO | KLATCHAID

FEDE04
DIALOG | Fede | Don't forget about me, P_NAME. I'll bounce back from this... I know it. Find the new member. And if you need clues, check DwarfNET.

FEDE03
DIALOG | Fede | Now I'm just /'Awaiting the Knife./'

FEDECRESTFALLEN
DIALOG | Fede | Oh hi, P_NAME_S...
DIALOG | P_NAME | Hey Fede, what's wrong?
DIALOG | Fede | Bad news... that butcher in there said that they are gonna have to amputate.
" +
//SURPRISEAT | o_fede01
"
DIALOG | P_NAME = s_port_hoopzSurprise | Oh no, Fede! I'm so sorry!
DIALOG | Fede | It's nobody's fault but my own... I overclocked my Wrist-CONP and never bothered with the cortisone shots afterwards. The inflammation just got too great. I don't know if I'm more bummed about my arm, or about all my highscores I'm gonna lose.
LOOKAT | o_cts_hoopz | o_fede01
DIALOG | P_NAME | I think your arm is pretty important.
DIALOG | Fede | I guess it doesn't matter either way. My gaming days are numbered. Dead Gamer Walking...
CHOICE | Offer to help?
REPLY | HELPFEDE | Can I help at all?
REPLY | DONTHELPFEDE | (Walk away slowly.)

HELPFEDE
DIALOG | P_NAME = s_port_hoopzSad | Is there anything that can be done?
DIALOG | Fede | Well, come to think of it... 
IF fedeBolly == 1 | GOTO | BOLLYNARYMIND
WAIT | 1.0
DIALOG | Fede | Yeah, you could help me.
DIALOG | P_NAME = s_port_hoopzHappy | Oh great, what can I do?
DIALOG | Fede | Alright, but you have to S_W_E_A_R to secrecy.
DIALOG | P_NAME | I swear!
DIALOG | Fede | Alright, so I'm a member of a secret gamer collective, known as The Gaming Klatch. We meet every Walpurgis Nacht an an undisclosed location. I can't tell you too much about it, but among our most central dogmas is: BALANCE IN GAMING. And to that end we keep exactly thirteen members. Well my job was to invite a new member to the Klatch after we lost our Undersecretary to a game that when you die in the game you die in real life. It was tragic. 
DIALOG | P_NAME | Oh I'm sorry to hear that.
DIALOG | Fede | Regardless, we need to find a new member and quick. The next meeting is coming up and we are already embroiled in a doxxing scandal and our Treasurer might have embezzled the money in a Choco-mallow Conspiracy.
DIALOG | P_NAME | Wow, that's a lot going on.
DIALOG | Fede | Which is all the more reason for this Klatch Invitiation to go to the right person. Do you think you can find someone?
QUEST | knowKlatch += 2
GOTO | KLATCHAID

KLATCHAID
CHOICE | Aid the Gaming Klatch?
REPLY | ILLHELP | I'll help you find this person.
IF fedeWhoHint == 0 | REPLY | LOOKFORWHO | Who should I be looking for?
IF fedeWhereHint == 0 | REPLY | LOOKWHERE | Where should I be looking?


LOOKFORWHO
DIALOG | P_NAME | But who should I be looking for.
DIALOG | Fede | Someone pure of heart and intensely knowlegeable of the Vidcon Purity Laws of 4673.
DIALOG | P_NAME = s_port_hoopzSad | Oh... so... not me...
DIALOG | Fede | Yeah sorry, P_NAME_S. I'm looking for a true Vidcon Theologian. They are out there...
QUEST | fedeWhoHint = 1
GOTO | KLATCHAID

LOOKWHERE
DIALOG | P_NAME | Where should I look?
DIALOG | Fede | Hmmm, that's a good question. Maybe try DwarfNET, the Vidcon forums there contain a plethora of Gaming Noesis. Maybe someone will stand out?
IF knowDwarfNET == 0 | GOTO | DUNNONET
IF knowDwarfNET >= 1 | GOTO | KNOWNET

DUNNONET
DIALOG | P_NAME | DwarfNET? Sounds interesting.
DIALOG | Fede | Yeah, find a Utility Station. In there you'll be able to check out all the fun events. It's Cyberspace at its best!
QUEST | knowDwarfNET += 1
QUEST | fedeWhereHint = 1
GOTO | KLATCHAID

KNOWNET
DIALOG | P_NAME | Oh yeah I'm familiar with DwarfNET.
DIALOG | Fede | Okay good. Yeah check there first...
QUEST | knowDwarfNET += 1
QUEST | fedeWhereHint = 1
GOTO | KLATCHAID

ILLHELP
DIALOG | P_NAME | I'll do it! I'll find you the perfect addition to the Klatch!
DIALOG | Fede | Really, that's great! Here let me print out the Invitation.
" +
//TODO: Print Sound
//WAIT |
//USEAT | o_fede01
"
NOTE | take | Printed Invitation
NOTIFY | Got the Printed Invitation to the Gaming Klatch!
DIALOG | Fede | Now this is SUPER IMPORTANT:_ The Klatch Operates under the Law of Habeas Invitatio... meaning the bearer of this invitation gets entry, no matter who it is. So BE CAREFUL with it and don't give it to anyone but the one you want to invite.
DIALOG | P_NAME | Got it! I'll protect this with my life!
DIALOG | Fede | God I'm hoping I'm making the right decision. I knew there was something special about you when you mentioned @fedeGame@.
DIALOG | P_NAME = s_port_hoopzHappy | I won't let you down, Fede!
QUEST | fedeState = 4
EXIT |

IWONTHELP
DIALOG | P_NAME | I wish i could help, but my quest tracker is already filled to the brim!
DIALOG | Fede | Ah sounds like my first time playing Hyberborea no Legends.
DIALOG | P_NAME = s_port_hoopzHappy | Haha! Ain't that the truth...
DIALOG | Fede | Don't worry about it kid, I don't have much time here anyways.
DIALOG | P_NAME | Yeah sorry, good luck though!
QUEST | fedeState = 5
EXIT

" +
//TODO: this will change to a slightly more complex system with a Marble Minigame
"
BOLLYNARYMIND
WAIT | 1.5
DIALOG | Fede | Nah... I really need a gamer to help me.
DIALOG | P_NAME | I'm a gamer!
DIALOG | Fede | You know, I said I would take you under my wing but I can't get over /'Bolly Mixtures./' I thought I was above that but I'm not, I'm sorry but I just can't entrust you with this gaming arcanum. The secret will remain locked within my Wrist-CONP, wherever it ends up after the surgery.
DIALOG | P_NAME = s_port_hoopzSad | Oh, okay I understand.\(Nice one, P_NAME_S! /'Bolly Mixtures?!/' What were you thinking, you ninnie?!)
QUEST | fedeState = 3
EXIT |

DONTHELPFEDE
DIALOG | P_NAME | Welllll... see you...
DIALOG | Fede | Unless she takes my eyes too...
QUEST | fedeState = 3
EXIT |

FEDE02
DIALOG | Fede | Hey, P_NAME_S. I'm still waiting for Doc to take a look at my wrist. It itches but nothing takes your mind of physical ailments like vidcons.
EXIT |

VIDCONINFO
DIALOG | Fede | Anyway, I'm playing '/Marbler's Impasse II./' You wouldn't think it, but it's pretty cerebral for a marbles game... but I wouldn't be playing it if I wasn't STUCK waiting here. Doc says I need to hang around until this ointment sets in... and if it doesn't, I'm going to need surgery... /'Sarcoptic Mange/' Have you ever even heard of that?
DIALOG | P_NAME | Well, I have zero medical expertise but I think you should probably do what she says..._ /'sarcoptic mange?/'  Just the name sounds scary!
DIALOG | Fede | Oh come on, now you're siding with her in there? What a joke! Don't get me wrong, I cherish every chance I get to squeeze in some gaming time, but I've got important stuff to do in Tir na nOg! You see, I'm closing in on some rare ga-
DIALOG | P_NAME = s_port_hoopzSurprise  | (Rare games...?)
DIALOG | Fede | Er, I mean... maybe we should talk later. I think I should focus on gettign out of here.
DIALOG | P_NAME | Oh okay... well good luck until then. I guess I'll catch up with you later.
DIALOG | Fede | Cool, hopefully out in the REAL WORLD and not cooped up here waiting!
QUEST | fedeState = 2
EXIT |


GOVERNOR
DIALOG | Fede | Grrr... nnnnng... nnNNNNNNnnnng... slug fruggit! I lost again!
DIALOG | Governor Elagabalus | (Is... is that a vidcon on his wrist...?)

FEDE00
DIALOG | Fede | Ooooohh... oooh.... mmmmmm.... nnnng...
DIALOG | P_NAME | Hey there, are you alright? Are you waiting for the doctor?
DIALOG | Fede | Hnnnng... hnnng..._ get..._ back... marble.... NO! Rats... I lost. I was at level 48 too.
DIALOG | P_NAME | Aw, sorry, hope I didn't bother you. That's a wrist-mounted video game console, huh?... now I've seen it all.
DIALOG | Fede | Heh, no sweat kid. Being able to tune out distractions is half the game. Didn't even know you were here. And yeah, it's a Wrist-CONP 2054, really ancient tech, but it plays pretty much everything you can think of if you've got the right emulators installed. And look, it's on my wrist!
DIALOG | P_NAME | I see that... it looks kind of red.
DIALOG | Fede | Yeah yeah, that's what the Doc said. It's fine, and like I told her, of course it's gotta mount to the skin. Only 0.12 picoseconds of latency, is that wild or what?
DIALOG | P_NAME | Yeah, really wild... I think. So what game is that you were playing?
DIALOG | Fede | Well, it's a unique vidcon take on the traditional dwarf game of marbles. No offense, but I've doubt you've ever heard of it. It's a bit of a rarity.
DIALOG | P_NAME | Marbles, huh? Lemme take a look._._._ oh, that's...
CHOICE | What game is it?
REPLY | SOLACE | Castle Cats-Eye: Solace of the Marble.
REPLY | RABBIT | Rabbit Hole 4D.
REPLY | GRIDS | G.R.I.D.S. Z3RO - A Marbling Game.
REPLY | BOLLY | Bolly Mixtures.

SOLACE
DIALOG | P_NAME | I may be wrong, but that's /'Castle Cats-Eye: Solace of the Marble./'
DIALOG | Fede | Of course it's not you imb-... wait, /'Solace of the Marble?/' That's an all-time classic! I wish I was playing that... unfortunately the publisher got a court order to digitally evaporate all copies. Another great work, lost in cyberspace. Sigh... when will they learn? Great taste though, kid! A classic pick.
DIALOG | P_NAME | Thanks... you probably know more than me though.
QUEST | fedeGame = Castle Cats-Eye
GOTO | VIDCONINFO

RABBIT
DIALOG | P_NAME | I may be wrong, but that's /'Rabbit Hole 4D./'
DIALOG | Fede | Of course it's not you imb-... wait, Rabbit Hole 4D huh? Tell me, you like that game?
DIALOG | P_NAME | Oh yeah, I only played it a couple of times though.
DIALOG | Fede | Hmm... well, it's not like I haven't played it! It's just been awhile. It uh, got lost in a move. Quite a pick though... a surprise pick and a rare pick.
DIALOG | P_NAME | Thanks... you probably know more than me though.
QUEST | fedeGame = Rabbit Hole 4D
GOTO | VIDCONINFO

GRIDS
DIALOG | P_NAME | I may be wrong, but that's /'G.R.I.D.S. Z3RO - A Marbling Game./'
DIALOG | Fede | Of course it's not you imb-... heh, did you say /'G.R.I.D.S. Z3RO?/' I never liked the original, but the prequel had some pretty interesting stuff going on. Not a masterpiece, but it had some really tasteful mechanics. Yeah, tasteful! I'll use that when I rate it. Anyway, that's an interesting vintage pick, kid. I wonder what else you've got up your sleeve.
DIALOG | P_NAME | Thanks... you probably know more than me though.
QUEST | fedeGame = G.R.I.D.S. Z3RO
GOTO | VIDCONINFO

BOLLY
DIALOG | P_NAME | I may be wrong, but that's /'Bolly Mixtures./'
DIALOG | Fede | /'Bolly Mixtures?/' For real, /'Bolly Mixtures!?/' Honestly... that game's no good. Wow. I would never, ever play /'Bolly Mixtures./' For the love of Clisp, /'Bolly Mixtures/' of all things. Bad pick, kid. Bad pick. I tell you what... you clearly need some help. Think of this as me taking you under my wing.
DIALOG | P_NAME | Uh, thanks I guess.\(I kind of liked it...)
QUEST | fedeGame = Bolly Mixtures
QUEST | fedeBolly = 1
GOTO | VIDCONINFO
"
