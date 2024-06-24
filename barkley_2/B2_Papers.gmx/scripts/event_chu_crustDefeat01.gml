///After you Beat Cuchucrustacea
//This is a one-off scene immediately after boss death
script = "
DIALOG | Cuchulainn | Curse you... Son of Bball...
DIALOG | P_NAME | Now you know what kind of game I bring, Cuchu. When I turn this ship around, I'm gonna leave you and your lobster form to rot in Sheol!
DIALOG | Cuchulainn | Ah, but that is where you are wrong, P_NAME_F. This is not my ultimate form but rather my penultimate form. I am very much alive and Necron 7 still rockets toward the void. You have but a handful of chances left to stop it!
DIALOG | P_NAME = s_port_hoopzAngry | You shelled menace! I won't let you imperil and fleece these dwarfs any longer! I have the Cyberspear!
" +
//TODO: SOUND | brandish the Cyberspear
//TODO: PLAYSET | brandish the Cyberspear
"
DIALOG | Cuchulainn | Look at the time, my my... a mere (time) left before we all perpetually turn in the roaring flames of Hell!. Hehehehe! Well I must going, I can't make my first appearance in oblivion looking like this._ EVASIVE SLUICE!
" +
//TODO: SOUND | evasive sluice
//TODO: PLAYSET | Cuchulainn's evasive sluice
"
WAIT | 2.0
DIALOG | P_NAME = s_port_hoopzSurprise | He...
DIALOG | P_NAME = s_port_hoopzShock | Got away?!
" +
//TODO: SOUND | Cyberspear project
//TODO: PLAYSET | Cyberspear project
"
DIALOG | The Cyberdwarf | No foolish child. The Evil One has merely cast off his carapace and evacuated himself through the rear.
DIALOG | P_NAME = s_port_hoopzSurprise | Cyberdwarf!
DIALOG | P_NAME | I wanted to throw the spear but his penultimate form gave me little chance.
DIALOG | The Cyberdwarf | We are lucky you didn't throw the spear, P_NAME.  The spear is not what it appears to be.
DIALOG | P_NAME = s_port_hoopzSurprise | (Not what I think it is...?)
DIALOG | The Cyberdwarf | It is true... we have entered Sheol and my fears are becoming realized. Cuchulainn has been able to migrate his body from the virtual space of Necron 7's mainframes into a physical soma of flesh and sin.
DIALOG | P_NAME | Cyberdwarf...
CHOICE | About before...
REPLY | SORRY | Sorry about snapping at you before.
REPLY | NOTSORRY | I stand by my snaps. no regrets.

SORRY
DIALOG | P_NAME = s_port_hoopzSad | I feel bad about the argument right before the penultimate battle... I just wanted you to know.
DIALOG | The Cyberdwarf | Fret not on the past. For it is the past that retards progress.
DIALOG | P_NAME | Oh, I thought maybe we could,_ y'know,_ hash it out?
DIALOG | The Cyberdwarf | The time for /'hashing it out/' was before that accursed AI plunged all of dwarfmanity into limbo! Arm yourself with the spear and face our final challenge.
DIALOG | P_NAME = s_port_hoopzSad | (C-_Cyberdwarf...)
GOTO | STEPTHROUGH

NOTSORRY
DIALOG | P_NAME | Cdwarf... I'm glad you are back and all, but I just gotta say. A man speaks his mind, and never looks back. And that was me back there before this penultimate battle. I stood my ground, and I'll be durned if I'll apologize for it now.
DIALOG | The Cyberdwarf | You needn't apologize and I needn't forgive. We are two forces working in imperfect parallel to embrace our destinies. It is only common for us to cross each other at times. All will not matter soon, once the Cyberspear is utilized!
DIALOG | P_NAME | I see what you mean...
DIALOG | The Cyberdwarf | You will know even more soon enough, child.
" +
//TODO: BEARDSTATE | +1
"
GOTO | STEPTHROUGH

STEPTHROUGH
DIALOG | The Cyberdwarf | Our destiny is through the very mantle that Cuchulainn cast off. Step through his face-hole and let us embrace our F.A.T.E._ be what it may!
EXIT |
"
