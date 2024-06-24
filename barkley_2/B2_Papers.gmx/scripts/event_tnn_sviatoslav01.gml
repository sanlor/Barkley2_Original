/// Sviatoslav, resident TnN conspiracy theorist
/*
Variables
    sviatoslavState
        0 = never spoken to him
        1 = Spoken to Sviatoslav before
        
    sviatoslavTip
        0 = you haven't asked him for tips
        1 = he tells you that there are hidden codes everywhere, you can now bring him a note

DIALOG | Sviatoslav |
DIALOG | P_NAME     | 

*/

script = "
IF body == governor     | GOTO | GOVERNOR
IF curfew == during     | GOTO | CURFEW
IF sviatoslavCrypto == 1 | GOTO | SVIATOSLAVCRYPTO1
IF sviatoslavState == 0 | GOTO | SVIATOSLAV0
IF sviatoslavState >= 1 | GOTO | SVIATOSLAV1

GOVERNOR
DIALOG | Sviatoslav | Evening, sir. No subversive, anti-authoritarian neuroproselytizing going on here. I'll let you know if I see any.

CURFEW
DIALOG | Sviatoslav | Keep your cool kid. This curfew that is going on? It's a total sham, scam, flim and a flam. That whole bank robbery thing is just a false flag operation. The duergs are after our cyber-liberties but we won't give them up without a fight.
DIALOG | P_NAME     | False flag?
DIALOG | Sviatoslav | Heh... You still have a lot to learn my friend.
DIALOG | P_NAME     | (Whoa...)

SVIATOSLAVCRYPTO1
DIALOG | Sviatoslav | Hey kid, what's on the down low?
CHOICE | Anything for Sviatoslav?
REPLY | NOTECHECKER | What do you think about this secret message?
REPLY | DNET | What did you say about DwarfNET?
REPLY | END | Ah, nevermind.

NOTECHECKER
NOTE | select | Sviatoslav
IF note == none | GOTO | NOTE_NONE
IF note == exit | GOTO | NOTE_EXIT
IF note == Pravda Tir na nOg | GOTO | RESPOND_PRAVDA
IF note == Pet Manifesto | GOTO | RESPOND_MANIFESTO
GOTO | RESPOND_GENERIC

RESPOND_GENERIC
WAIT    |   1.0
DIALOG  |   Sviatoslav | Let's see...
WAIT    |   1.0
DIALOG  |   Sviatoslav  |   Hmmpf, there's nothing here but letters and numbers. Just a one dimensional communique for the sheep of the world. Got anything of real importance?
DIALOG  |   P_NAME      |   Hmm, let's see...
GOTO    |   NOTECHECKER

RESPOND_MANIFESTO
WAIT    |   1.0
DIALOG  |   Sviatoslav | Let's see...
WAIT    |   1.0
NOTE    |   give    |   Pet Manifesto
DIALOG  | Sviatoslav | This, note is... not so much a secret code, but more... a cry for help. Where did you get this?
DIALOG  | P_NAME    | I guess I don't really want to talk about it.
DIALOG  | Sviatoslav | You should be really worried about the author of this.
" +
//TODO: gives you something in exchange for the Manifesto?
"

RESPOND_PRAVDA
WAIT    |   1.0
DIALOG  |   Sviatoslav | Let's see...
WAIT    |   1.0
NOTE    |   give    |   Pravda Tir na nOg
DIALOG  |   Sviatoslav |   This paper... where did you get this?
DIALOG  |   P_NAME | Um, from some nice salesman... why?
DIALOG  |   Sviatoslav | This whole rag is lousy with cryptocyphers and covert communique.  Look at this... 
WAIT    |   0.5
DIALOG  |   P_NAME | Yeah I don't see anything.
DIALOG  |   Sviatoslav | It's plain as day! Man these L.O.N.G.I.N.U.S. cryptogs are really slacking.
IF knowLONGINUSTnn >= 1 | GOTO | LONGINUSBELIEF
GOTO | DONTKNOWLONGINUS

DONTKNOWLONGINUS
DIALOG | P_NAME | L.O.N.G.I.N.U.S.?
DIALOG | Sviatoslav | You been living behind a firewall your whole life kid?! Yeah L.O.N.G.I.N.U.S.! The dwarf rebels seeking to undermine Cuchulainn and his /'suck puppy/' agenda.
DIALOG | P_NAME | Oh... I have a lot to learn...
DIALOG | Sviatoslav | Well good thing I can decrypt this, here let's see...
KNOW | knowLONGINUSTnn | 1
GOTO | DECRYPT

LONGINUSBELIEF
CHOICE  |   L.O.N.G.I.N.U.S.?
REPLY   |   BELIEVE | Really?!
REPLY   |   NOTBELIEVE | Hmmpf, really?

BELIEVE
DIALOG | P_NAME | Wow, you mean this is from L.O.N.G.I.N.U.S.?!
DIALOG | Sviatoslav | Of course it is.  Such heavy-handed encryption. No creativity, no nuance. It's almost as if they want this to be cracked... This is definitely the work of the Tir na nOg chapter, probably Absalom.
DIALOG | P_NAME | Who is Absalom?
DIALOG | Sviatoslav | He works for the L.O.N.G.I.N.U.S. rebels, a skilled cryptodog but this is sloppy work. If you want to find him you're gonna have to make it through the sewers.
DIALOG | P_NAME | The Sewers..._ What does it say?
KNOW | knowLONGINUSTnn | 2
GOTO | DECRYPT

NOTBELIEVE
DIALOG  | P_NAME | Do you really expect me to believe you that the newpaper has secret codes in it?
DIALOG  | Sviatoslav | I expect you to believe you own eyes.  Allow me to_ pull off the veil.
GOTO    | DECRYPT

DECRYPT
DIALOG  |   Sviatoslav  | Hmmm...
WAIT    |   1.0
DIALOG  |   Sviatoslav  | So look, /'iron fist/' … what's the atomic number of iron?
DIALOG  |   P_NAME      | Uh...
DIALOG  |   Sviatoslav  | Twenty Six, no doy.  Okay the twenty sixth word is_._._._ /'who/'.  And think... this new governor is from the Mountain Pass Prison, and known for locking his inmates in the stocks. Stocks? Stock. Stockton! John Stockton, famous Utah Jazz player of Antiquity. What was his number? 12, of course … count twelve more words... /'watches./'
DIALOG  |   Sviatoslav  | /'Who watches/'... hmmm and see this? The Seventh Governor of Tir na nOg? Seven, hmmm, wait, what's the seventh prime number?
DIALOG  |   P_NAME      | Umm... I_
DIALOG  |   Sviatoslav  | Right, SEVENTEEN! So go seventeen more words and you get … /'blue/'…_ Okay, /'Who watches blue/', THIS IS SO OBVIOUS! See? This word here, it's misspelled, should be /'which/' but it's spelled /'witch/'.  Why do you think that is?
DIALOG  |   P_NAME = s_port_hoopzAngry  | I guess just tell me.
DIALOG  |   Sviatoslav  | Because a Witch casts HEXES. Hex. Hex means six-sided, SIX!  Count six more letters and there you are._._._ /'men./' Or_ /'Who watches the Blue Men./'_ There you go.
DIALOG  |   P_NAME      | /'Who watches the blue men?/'._._._ What does that mean?
WAIT    |   0.2
DIALOG  |   Sviatoslav  | Uh, I don't know. But that's definitely what it says. /'Who watches the blue men?/'_ Here kids, take this back and let me know if anything comes of it.
NOTE    |   take        | Decoded Pravda
NOTIFY  |   You got the Decoded Pravda TNN
DIALOG  |   P_NAME      |   Wow, thanks Mr. Sviatoslav. I'm sure I can make use of this... eventually.
DIALOG  |   Sviatoslav  |   No problem, kid. Keep watching the skies.

RESPOND_MANIFESTO
DIALOG  |   Sviatoslav  |   Let's see...

NOTE_NONE
DIALOG  |   P_NAME  |   Daggum, I actually don't have anything. I'll get back to you.
DIALOG  |   Sviatoslav  |   Keep watching the skies.

NOTE_EXIT
DIALOG  |   P_NAME  | Actually, let me think again...
GOTO    |   SVIATOSLAVCRYPTO1

INFOCHOICE
QUEST   |   sviatoslavState = 1
CHOICE  |   Need help opening your eyes?
REPLY   |   TIPS0       | Got any other tips for a noob like me?
REPLY   |   DNET        | What did you say about DwarfNET?
REPLY   |   END         | Ah, nary ye mind.

TIPS0
DIALOG  |   P_NAME      | You seem really in-the-know. Any other knowledge bombs you can drop?
DIALOG  |   Sviatoslav  | Heh, looks like the script kiddie wants to level up. Well,_ alight listen up, but this is strictly off the record.
DIALOG  |   P_NAME      | You got it! I'm listening.
DIALOG  |   Sviatoslav  | Look at all those dwarfs milling about out there, queueing into one line after the next, following the_ /'POSTED INSTRUCTIONS./' It's all a sham man, a sham and a scam to keep the little dwarf down.
DIALOG  |   P_NAME      | Oh, so._._._ the signs are wrong?
DIALOG  |   Sviatoslav  | No, man! No! The signs aren't wrong, you're too busy reading and not understanding. Look._ This message here, what does it tell you?
LOOKAT  |   o_cts_hoopz |   o_tnn_fuckCuchu01
FRAME   |   CAMERA_SLOW   |   o_cts_hoopz | o_tnn_fuckCuchu01
WAIT    |   1.00
LOOKAT  |   o_cts_hoopz |   o_sviatoslav01
WAIT    |   0.5
DIALOG  |   P_NAME         | Well that's some uh_ adult uh_ langua-
DIALOG  |   Sviatoslav     | No! See, man, you aren't looking at the big picture. You can't see the firewall for the access nodes. It's all about what it means.
DIALOG  |   P_NAME         | Look,_ I know what the F-Word means.
DIALOG  |   Sviatoslav     | No, look again, /'Fuck Cuchulainn/'.___ You see it?
CHOICE  |   See the hidden message?
REPLY   |   SEEIT          | Tally ho, I see it!
REPLY   |   SEEITNOT       | No, I'm lost at sea here.

SEEIT
DIALOG | P_NAME     | Oh yeah I see it, it's right there.__ It's uh_... it says, uh_
GOTO | TIPS1

SEEITNOT
DIALOG | P_NAME     | Yeah I got nothin'
GOTO | TIPS1

TIPS1
DIALOG | Sviatoslav | Pfft, just an ant falling rank and file in with the rest of the hive. Look, kid, there's no instruction manual for the underground. If you're gonna run with the cryptodogz of Necron 7 you're gonna need to start spotting the communications.
DIALOG | P_NAME     | Cryptodogs?
DIALOG | Sviatoslav | Codez man! Cyphers! H_i_d_d_e_n_ m_e_s_s_a_g_e_s. Look again_ /'Fuck Cuchulainn./' Now what does Cuchulainn despise the most?
DIALOG | P_NAME     | Um_-
DIALOG | Sviatoslav | Individuality, everyone knows that. So get rid of all the duplicate letters, N, U and C, take those out. Now you have F-_K-_H-_L-_A-_and I. And that of course only spells /'KHALIFA/' or the ancient Islamic word for /'successor./' Don't you see, man?
DIALOG | P_NAME     | Um_-
DIALOG | Sviatoslav | Khalifa! It's so obvious! L.O.N.G.I.N.U.S. plans on taking out the new governor's replacement! His /'successor!/' It's so painfully obvious to a neurocryptic like myself.
DIALOG | P_NAME     | Wow that seems like kind of a stretch.
DIALOG | Sviatoslav | Man, you think you'd learned it all when you got to the letter Z?! The whole world is littered with dark, underground protocols. You just gotta shine a light on it ...
DIALOG | P_NAME     | If you say so.
DIALOG | Sviatoslav | Hey look man, I'm not saying anything, the MESSAGES say it, I'm just the enlightened cryptodog that reads them out loud.__ Look, let me help you out. If you see anything that might have one of these hidden messages, you just bring it to me and I'll set you on the right path_ the DARK PATH.
DIALOG | P_NAME     | Ah okay, thanks, I'll keep my eyes peeled.
QUEST   |  sviatoslavCrypto = 1


SVIATOSLAV0
DIALOG | Sviatoslav | Hey man, you jacked in?
DIALOG | P_NAME     | Jacked in?
DIALOG | Sviatoslav | Whooooa buddy, are you kidding me? Open your eyes, man. This is the 67th century and you're STILL in lockstep with Cuchulainn's tired song and dance? Let me tell you something: if you're not jacked in, you're not even getting HALF the story.
DIALOG | P_NAME     | Jacked in to what??
DIALOG | Sviatoslav | DwarfNET, man. DwarfNET! This ain't reality. This is Cuchulainn's dumbed-down, hyper-commercialized, hyper-produced Hollywood spinoff. It's all a charade! This is an illusion, man - a delusion - and he's feeding it to you by the spoonful like the slack-jawed sheep he wants you to be. Reboot your mind, man. Jack into DwarfNET.
QUEST  | knowDwarfNET = 1
DIALOG | P_NAME     | Wow, this sounds really important. How do I jack in?
DIALOG | Sviatoslav | It's simple.
GOTO    |   DNET

DNET
DIALOG  | Sviatoslav    |   Find a utility station, then all you gotta do is plug into the station via your neural socket and log into DwarfNET. And don't worry - they're completely off the grid. Cuchulainn's got nothing on the L.O.N.G.I.N.U.S. cerebrojackers.
IF sviatoslavState >= 1 | GOTO  |   END
IF knowLONGINUSTnn == 0 | GOTO | WHATSLONGINUS
IF knowLONGINUSTnn >= 1 | GOTO | INFOCHOICE

WHATSLONGINUS
DIALOG | P_NAME     | L.O.N.G.I.N.U.S.? Who's that?
DIALOG | Sviatoslav | Heh. I like you, kid. Let's just say your world is about to turn upside down.
DIALOG | P_NAME     | (Whoa...)
GOTO   | INFOCHOICE

SVIATOSLAV1
DIALOG | Sviatoslav | Welcome to the first day of the rest of your life, kid. If you're not jacked in, you're only seeing what Cuchulainn wants you to see. Open your eyes and read between the lines: this existence, this reality? It's a sham and these sheeple are buying it hook, line and sinker. The revolution is coming and it WILL be televised.
DIALOG | P_NAME     | (This guy is so cool...)
GOTO    | INFOCHOICE

END
EXIT     |
";
