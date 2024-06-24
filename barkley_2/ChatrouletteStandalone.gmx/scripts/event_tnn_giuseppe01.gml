/// Father Giuseppe, Clispeath Priest of TNN
/*


*/
script = "
IF body == matthias   | GOTO | MATTHIAS
IF body == governor   | GOTO | GOVERNOR

IF giuseppeState == 8 | GOTO | STATE8
IF giuseppeState == 7 | GOTO | STATE7
IF giuseppeState == 6 | GOTO | STATE6
IF lugnerQuest == 9   | GOTO | LUGNER9
IF lugnerQuest == 7   | GOTO | LUGNER7
IF curfew == after    | GOTO | WATER
IF giuseppeState == 5 | GOTO | STATE5
IF giuseppeState == 4 | GOTO | STATE4
IF giuseppeState == 3 | GOTO | STATE3
IF lugnerQuest == 3   | GOTO | LUGNER3
IF giuseppeState == 0 | GOTO | STATE0
IF giuseppeState == 1 | GOTO | STATE1
IF giuseppeState == 2 | GOTO | STATE2

MATTHIAS
DIALOG | Giuseppe | It's been quite a while since I've seen you here, Matthias. Perhaps you've finally seen the light and decided to let Clispaeth into your heart?
DIALOG | Matthias | Ahhh, yep! Definitely. I definitely did that, and I'm definitely Matthias. Well, time to get going! Let's have a prayer sesh later, you and me. Some good, old-fashioned Clispaeth prayers. Well, bye!

GOVERNOR
DIALOG | Giuseppe | It's not often that a Duergar deigns to visit this humble abode of Clispaeth. Could it be that you've seen the wisdom in Clispaeth's teachings and have chosen to walk His sacred path?
DIALOG | Governor Elagabalus | Uh, yep! Yes, that is precisely what happened and I am definitely a real, dyed-in-the-wool Duergar. Big time. Well, I'm out of here to do some prayers. May Clispaeth be with you.
DIALOG | Governor Elagabalus | (I don't think that went well... why do I keep talking to people?)
" +
//This sends you to the EVENT USER 2, which is the "Dwarf Custody Test"
"
TEST
EVENT  | o_giuseppe01 | 2

STATE8
DIALOG | Giuseppe | I'm such a failure...\I'm sorry...Clispaeth...

STATE7
DIALOG | Giuseppe | Hello again, young man...no luck with that water purification chip, I imagine...
DIALOG | P_NAME   | I'm sorry. I just haven't seen one.
DIALOG | Giuseppe | Well...don't let it ruin your day if you can't find one. These obstacles are all part of Clispaeth's plan... we're just...\We just have to put our faith in Clispaeth. It's all we have left...
QUEST  | giuseppeState = 8

STATE6
DIALOG | Giuseppe | Saint Slag of Tir na Nog. Has a nice ring to it.

LUGNER9
DIALOG | Giuseppe | Who would have thought a Kobold was capable of such kindness...\To take all these Dwarfs on his Ruby Yacht...to live in his mansion on his private island...a true paradise for Dwarfs, free of persecution...\____.____.____.____I must nominate Slag for sainthood sometime...
QUEST  | giuseppeState = 6

LUGNER7
DIALOG | Giuseppe | Who would have thought a Kobold was capable of such kindness...\To take all these Dwarfs on his Ruby Yacht...to live in his mansion on his private island...a true paradise for Dwarfs, free of persecution...\____.____.____.____I must nominate Slag for sainthood sometime...
QUEST  | giuseppeState = 6

WATER
DIALOG | Giuseppe | This won't do... this just won't do at all...
DIALOG | P_NAME   | Hey, is something the matter?
DIALOG | Giuseppe | Hmmm? Oh._._._ yes... I was talking to myself just now wasn't I? I'm sorry to bother, pay no mind to._._._ say, do you happen to have a water purification chip? I need it for the dwarfs I-some... friends of mine...
DIALOG | P_NAME   | I don't think so. I guess I could keep an eye out for one, though. What do they look like?
DIALOG | Giuseppe | Oh, well, my friends look like any other friends. Maybe they look like some friends you have. They're just my friends, nobody you should be worrying yourself with.\Look, just forget I said anything, ok? Don't trouble yourself to tell the duergars about my friends, they aren't anybody special.
DIALOG | P_NAME   | No, I mean the water purification chip. I don't know what that is, I've never seen one!
DIALOG | Giuseppe | Oh! How foolish of me!\Yes, a water purification chip. I...don't know what they look like either. They just said they need one or they'd...\They just really need one. It's extremely important.
DIALOG | P_NAME   | I'll keep an eye out for one, ok? You seem really upset about it.
DIALOG | Giuseppe | Would you? That would be wonderful. I don't know if there are even any around here, but it means so much that you're even listening to me. Bless you, child...
QUEST  | giuseppeState = 7

STATE5
DIALOG | Giuseppe | I've sent word to the dwarfs in hiding, they should be meeting up with our friend right about now.\Many thanks for your assistance. You are a wonderful young man.

STATE4
DIALOG | Giuseppe | We have nothing more to talk about.

STATE3
DIALOG | Giuseppe | Greetings, child. It's good to see you again. \ Are you prepared for the test?
CHOICE | Am I prepared for the test?
REPLY  | TEST  | Ok, I guess.
REPLY  | LATER | Uh, maybe later.

LUGNER3
DIALOG | P_NAME   | Um, excuse me, are you Father Giuseppe?
DIALOG | Giuseppe | That I am, child. Is there something you wish of me?
DIALOG | P_NAME   | I'm, uh... supposed to talk to you about... uh...
DIALOG | Giuseppe | What weighs on you, son? Is something the matter?
DIALOG | P_NAME   | Yeah, you see, a friend of mine told me to talk to you about._._._ something._._._ involving a cargo ship. I'm not supposed to say much about it.
DIALOG | Giuseppe | Ah, yes! You are a messenger for our *ahem* friend.
DIALOG | P_NAME   | He told me to keep it a secret. He said it could get him into trouble.
DIALOG | Giuseppe | I understand. It warms my heart to see a youngster like you getting involved in this. You must have a big heart to be doing something so risky.
DIALOG | P_NAME   | Well, it's nothing. I want to help the Dwarfs any way I can.
DIALOG | Giuseppe | Yes, I can see that. I vowed to the church to protect them, after all. I would not be fit to be a messenger of Clispaeth if I was not prepared to protect them at all costs.\But, first I think I must perform a test to see if your heart is as pure as it appears to be.
DIALOG | P_NAME   | A test?
DIALOG | Giuseppe | Indeed. You see, there are many nefarious figures here. You can't always tell someone's intentions by looking at them. Take your friend, for instance. I had reservations about his intentions, but he's shown me my worries were misplaced. It's important I find out the same about you.
CHOICE | Am I prepared for the test?
REPLY  | TEST  | Ok, I guess.
REPLY  | LATER | Uh, maybe later.

LATER
DIALOG | P_NAME   | Uh, maybe later. I don't think I'm ready for a test right now.
DIALOG | Giuseppe | As you wish. I shall remain here for when you have built up enough courage for the task.
QUEST  | giuseppeState = 3

STATE0
DIALOG | Giuseppe | I don't know what I'm doing wrong. No matter how hard I try, I just can't seem to get younger dwarfs to care about Clispaeth. My congregation consists almost exclusively of older dwarfs like Vivian. I hope that someday my message of hope and salvation reaches more callow ears.
DIALOG | P_NAME   | Mr. Giuseppe? I just wanted you to know...
CHOICE | What do I say?
REPLY  | BELIEVE | I believe in Clispaeth.
REPLY  | ATHIEST | I'm not interested in Clispaeth.

BELIEVE
DIALOG | P_NAME   | I believe in Clispaeth.
DIALOG | Giuseppe | Thank you, child; you give hope to an old heart. It is sometimes demoralizing to see Clispaeth's message falling on deaf ears, but I know it's too important to stop trying. If you ever need someone to talk to, whether it's about Clispaeth or life or anything, I am always here.
DIALOG | P_NAME    | Thank you, Father Giuseppe. I'll remember that.
QUEST  | giuseppeState = 1

ATHIEST
DIALOG | P_NAME   | I'm not interested in Clispaeth.
DIALOG | Giuseppe | That... that is disheartening to hear. Know that no matter what you do, whether or not you're a dwarf, Clispaeth sacrificed himself so you could live a fulfilled life. Please take some time to rethink Clispaeth.
DIALOG | P_NAME   | Umm, I'll think about it...
QUEST  | giuseppeState = 2

STATE1
DIALOG | Giuseppe | It's good to see you again, P_NAME. If you ever want to talk, I'm always here.

STATE2
DIALOG | Giuseppe | Hello again, P_NAME. I hope you've rethought your stance on Clispaeth. I'm always here to talk if you want to.
";
