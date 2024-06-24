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
" +
///This is the Giuseppe Test Sequence
/* 

*/
"
DIALOG | P_NAME   | Ok, I guess. It's not going to hurt, is it?
DIALOG | Giuseppe | Goodness, no! If your heart is as pure as I believe it to be, the test shall be as simple as breathing.\Together we shall read the Holy Book of Clispaeth. If you exhibit superior understanding of His holy words, I'll know you are a soul I can trust fully. I shall appoint you the shepherd of the Dwarfs in my care, as I will know then that in your custody they shall come to no harm.
DIALOG | P_NAME   | This is a pretty big responsibility, but I'll do it.
DIALOG | Giuseppe | Wonderful! I can feel the sincerity in your voice, child. I think we shall both enjoy this.\The proper method for performing such a test is to read you passages from the Holy Book and leave you to render your feelings on them. What they're trying to say, how you feel about them, what they mean to you.\For you I have chosen my favorite passages, the ones that have had the most value to me, have guided me through the toughest times. This is not merely a test to me, but an expression of what I believe matters most, and a way for us to unite through our devotion to Clispaeth. I urge you to take this test very seriously.\Now, let's begin with a practice verse, shall we?
QUEST  | dwarfCustody = 1
DIALOG | Giuseppe | Rodman 3:37 /'He who is responsible for desecrating the Cyber-Spear shall perish in flames./'
CHOICE | ...desecrating the Cyber-Spear shall perish...
REPLY  | Q0A | Fire is very important.
REPLY  | Q0B | Do not mess up the Cyber-Spear.
REPLY  | Q0C | Clispaeth doesn't like you breaking things.
REPLY  | Q0D | A metaphor for smithing a spear.
REPLY  | Q0E | I have no idea.

Q0A
DIALOG | P_NAME   | Maybe it's just talking about how important fire is? You can use it for all sorts of things, I guess. Maybe it's just talking about one of the ways you can use fire.
DIALOG | Giuseppe | No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.
DIALOG | P_NAME   | Ok...I guess I was wrong...
DIALOG | Giuseppe | Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...
GOTO   | TEST1

Q0B
DIALOG | P_NAME   | Is it some artifact they're talking about? I think it means they'll die or just be very badly punished if they mess up this spear thing. It sounds really important.
DIALOG | Giuseppe | No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.
DIALOG | P_NAME   | Ok...I guess I was wrong...
DIALOG | Giuseppe | Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...
GOTO   | TEST1

Q0C
DIALOG | P_NAME   | Maybe it means that Clispaeth doesn't like people breaking stuff. Perishing in flames sounds like pretty severe punishment for breaking something. Maybe we aren't supposed to break anything ever!
DIALOG | Giuseppe | No, my son, I'm afraid that's not what this means at all. This is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.
DIALOG | P_NAME   | Ok...I guess I was wrong...
DIALOG | Giuseppe | Do not lose heart. The ways of Clispaeth are very mysterious. It can take stray souls much time to learn all His secrets.\Granted, the truest of Clispaeth's followers were born knowing these secrets, but I'm certain there's still time for you to find the correct path.\Let's move on to the next passage...
GOTO   | TEST1

Q0D
DIALOG | P_NAME   | This is kind of a guess, but is it for how to make a spear? You use flames and stuff to make a spear I think. Desecrating suggests violence I think, maybe it's talking about breaking in the metal and making a spear out of it. Maybe the flames mean you can put a red gemstone in it...\I don't know. I'm terrible at this.
DIALOG | Giuseppe | NO!!!!! You must not say such things!!!! You are absolutely correct!!!
DIALOG | P_NAME   | What? I am?
DIALOG | Giuseppe | This is one of the trickiest passages of all Clispaeth's words! I wanted to give you an example of the sheer complexity of Clispaeth's beauty. \I did not expect you to answer it correctly.___.___.___.___son, you may be__.__.__.___\Nevermind, we mustn't jump to conclusions, we have several passages to go. I just want you to know that I am deeply impressed. You are special.
DIALOG | P_NAME   | Cool. Thanks...
DIALOG | Giuseppe | Let's move on. The next passage!
QUEST  | dwarfCustody += 3
GOTO   | TEST1

Q0E
DIALOG | P_NAME   | I have no idea. This is really hard.
DIALOG | Giuseppe | You can't even venture a guess? This one isn't that difficult. It's one of the simplest passages of the entire Holy Book, one of the most basic of all Clispaeth's teachings.
DIALOG | P_NAME   | I still don't know. I'm sorry.
DIALOG | Giuseppe | Hmm, yes, well, this verse is a metaphor for the process of smithing. You must first temper the metal in a cauldron before you can shape the metal. It is after you have formed it to your satisfaction you can insert the red gemstone. The cyber spear is the metal, desecrate suggests the transformation of the metal, and the flames signify the red gemstone.
DIALOG | P_NAME   | Ok...I guess that kinda makes sense. I'm really sorry. I'll try harder for the next one.
DIALOG | Giuseppe | I should hope so. Certainly the ways of Clispaeth are very mysterious, but this is one of the least mysterious of His words.\Well, that was just for practice. Let's move onto the real test now. The next passage...
GOTO   | TEST1

TEST1
DIALOG | Giuseppe | Tuberculon 7:43 /'Love thy brother and sister and gremlin such as you love Clispaeth, for their love is as great a bounty as any./'
CHOICE | Love thy brother and sister and gremlin...
REPLY  | Q1A | Be nice to your brothers and sisters.
REPLY  | Q1B | You must find where the gremlins are hiding their treasure.
REPLY  | Q1C | Candy is very important.
REPLY  | Q1D | Making babies with your brothers and sisters is approved.
REPLY  | Q1E | There are many sorts of useful mining tools.

Q1A
DIALOG | P_NAME    | Does it mean that you should be nice to your brothers and sisters?
DIALOG | Giuseppe | Hmmm, I'm not sure you've exactly got it. Tell me more.
DIALOG | P_NAME    | Well, maybe not brothers and sisters. Maybe it means just everybody. You should be nice to everybody.
DIALOG | Giuseppe | I'm afraid that is not what this is saying at all. Brother and Sister were the name of two brands of Toffee first released by the Gremlin Corporation sometime around 887 B.E.D. in the Kklugman system. It was then and still is the only Toffee officially recognized by the Church of Clispaeth, as this passage explains.\Remind me when the test is over, I might still have a couple pieces of Sister left... \ Let's move on to the next passage for now.
GOTO   | TEST2

Q1B
DIALOG | P_NAME    | You must find where the gremlins are hiding their treasure. It's very important to find the treasure.
DIALOG | Giuseppe | What? What treasure?
DIALOG | P_NAME    | Uhm... I don't know. I thought it was talking about treasure.
DIALOG | Giuseppe | Certainly not, gremlins are too feeble in spirit to have any use for treasure.\Please, try taking this examination a little more seriously. I'm not simply performing this ritual out of some whim, but to ensure you are not going through this life blissfully unaware of the wonders Clispaeth has erected for you. Do you understand?
DIALOG | P_NAME    | Yes, I'm sorry.
DIALOG | Giuseppe | Good. Now, let's continue to the next passage.
GOTO   | TEST2

Q1C
DIALOG | P_NAME   | Candy is very important. We should always eat candy.\That's what I think anyway, I don't really know if that's what this means, but it's what I think.
DIALOG | Giuseppe | Yes! So you are familiar with the Brother and Sister line of Toffee? In all the great halls of the finest confectioners in all the galaxy, none have been so pivotal, so praised, as the Gremlin Corporation's line of Brother and Sister brand toffees. The only toffee to be officially recognized by Clispaeth himself.\I wouldn't have known it to look at you, but you must be quite the Gremlin aficionado.
DIALOG | P_NAME   | Uh... it was actually just a guess. I've never heard of it before.
DIALOG | Giuseppe | Impressive... so this interpretation just flowed right out of you? Many are misled by the phrasing of this verse. You are showing tremendous understanding of Clispaeth's words.\I eagerly await your reading of this next passage, this is an interesting one...
QUEST  | dwarfCustody += 3
GOTO   | TEST2

Q1D
DIALOG | P_NAME   | Is it saying that you are allowed to make babies with your brothers and sisters? Maybe even gremlins too, if that's possible.
DIALOG | Giuseppe | Hmmm, this is not the reading I was looking for, but this is a very interesting answer. Dwarfs do not procreate, but many of Clispaeth's creatures do. I must meditate more on this sometime...
DIALOG | P_NAME   | Darn, I got it wrong.
DIALOG | Giuseppe | Yes, but you get bonus Clispaeth points for such an intriguing answer.
DIALOG | P_NAME   | Oh. Are you scoring this? How do you even do that?
DIALOG | Giuseppe | Such procedures are rendered from intimate reading of the Holy Book, my child. This is a very advanced procedure, you are not old enough to understand.\Now, the next passage!
QUEST  | dwarfCustody += 2
GOTO   | TEST2

Q1E
DIALOG | P_NAME   | Is it talking about the things you use to mine stuff? Maybe brother and sister and gremlin are talking about the different tools you use to mine.
DIALOG | Giuseppe | I'm afraid this is not a sound reading of the passage. Mining tools are certainly important, and are covered in greater depth in other sections of the Good Book, but this is not one of them.\This passage refers to the Brother and Sister brands of Toffee first released by the Gremlin Corporation sometime around 887 B.E.D. in the Kklugman System. It was then and still is the only Toffee officially recognized by the Church of Clispaeth, as this passage explains.\Let's move onto the next passage, shall we?
DIALOG | P_NAME   | Ok...
GOTO   | TEST2

TEST2
DIALOG | Giuseppe | Marv 5:47 /'Those not mummified upon death are unfit for Clispaeth's holy quarters./'
CHOICE | Those not mummified upon death...
REPLY  | Q2A | Clispaeth likes mummies a lot.
REPLY  | Q2B | You must get mummified when you die.
REPLY  | Q2C | You must preserve all foods through mummification.
REPLY  | Q2D | You must protect all tempered metals from rust.
REPLY  | Q2E | Naked people are really gross.

Q2A
DIALOG | P_NAME   | Is it saying that Clispaeth just likes mummies a lot? Maybe all his best friends are mummies. That would be kinda cool I guess, but I've never met a mummy, I don't know if I'd like them.
DIALOG | Giuseppe | ABSOLUTELY NOT.\I can assure you that you would NOT like mummies if you are at all committed to Clispaeth. Mummies and Clispaeth are NOT compatible, do not let any heretic inform you otherwise.
DIALOG | P_NAME   | I'm sorry, I didn't know. This one is really confusing.
DIALOG | Giuseppe | No, there's nothing confusing about it. It's talking about something completely different.\I'm...I'm sorry to react in such a way. I do not usually lose my composure so easily, but mummies are...they're...\Let's just move to the next passage. This is a very sensitive topic for me.
GOTO   | TEST3

Q2B
DIALOG | P_NAME   | I guess it's saying that you need to be mummified when you die, or you aren't getting into this holy quarters place. But._._._ well, that sounds kinda gross. Who would want to be mummified? I don't want to ever be a mummy.\Oh! I'm sorry, I didn't mean to offend...
DIALOG | Giuseppe | No, my son, no need to apologize. You are grossly incorrect in your reading of this passage, but it pleases me greatly to see a youngster fully aware of the sheer obscenity of mummification. I'm afraid it's become all the rage with younger generations nowadays, not even the church or His holy words have been enough to stop it.\There are heretics to have even claimed that Clispaeth himself has proclaimed that mummification is essential, and for the life of me I can't begin to understand how such beautiful words can be perverted so profoundly.\Please, let us move on to the next passage. I find this topic deeply distressing.
QUEST  | dwarfCustody += 1
GOTO   | TEST3

Q2C
DIALOG | P_NAME   | Maybe that means that you should mummify all food before you eat it?
DIALOG | Giuseppe | No, nobody should ever do that. Is there something you're not telling me, my son? Remember, you can always speak to me if you have found yourself on a troubling path and need guidance. Clispaeth is always there for you during these difficult times...
DIALOG | P_NAME   | Uh, no, it was just a guess. I really don't know what the passage means.
DIALOG | Giuseppe | Very well, if this is what you say. Just remember that mummification is strictly forbidden by the church of Clispaeth. This is no more true than it is for the mummification of foods. It's a practice that simply must not be done.\Granted, there may have been followers of Clispaeth lost to the pages of history for misunderstanding His words and finding themselves consuming embalming fluid, but the galactic record goes to great lengths to disregard such aberrations.\Let's move on to the next passage. We can discuss this issue in greater length later, if you wish.
GOTO   | TEST3

Q2D
DIALOG | P_NAME   | I think it is saying that you must protect all tempered metals from rust, rub ointment on them and cover them up with something to preserve them. I don't think Clispaeth would like rust very much, stuff that's rusty doesn't work as well.
DIALOG | Giuseppe | No, that's not quite right. In fact, Clispaeth doesn't have as strong a stance against rust as you might think, all metals are welcome in the Great Halls of Clispaeth, come rust or shine. Clispaeth's boundless love for rusty metals is one of the wonderful surprises of His greatness.\No, this passage concerns the body. It's the conclusion of Clispian scholars that this passage is outlining that the first step, indeed most essential step, in being welcomed into Clispaeth's heart is to make sure you are clothed continuously. There is no place in Clispaeth's heart for a naked man...\It saddens me to think what Clispaeth thinks when He sees these revolting heretics marching around in speedos, unaware of the travesty they are committing.\Let's move onto the next passage, it's not wise to consider naked people as long as we already have...
GOTO   | TEST3

Q2E
DIALOG | P_NAME   | Naked people are really gross. I think this is just saying that you need to be wearing shirts and pants and stuff if you want to get into this place.
DIALOG | Giuseppe | Ah! Excellent! You are correct!!!\Many novice followers of Clispaeth get lost in some of the archaic slang of this verse, but this is exactly what this passage is talking about.\Clispian scholars have concluded that Clispaeth, indeed, finds naked people /'gross,/' as you say. The first step, indeed most essential step, in being welcomed into Clispaeth's heart is to make sure you are clothed continuously. There is no place in Clispaeth's heart for a naked man...\It saddens me to think what Clispaeth thinks when He sees these revolting heretics marching around in speedos, unaware of the travesty they are committing.\Let's move onto the next passage, it's not wise to consider naked people as long as we already have...
QUEST  | dwarfCustody += 3
GOTO   | TEST3

TEST3
DIALOG | Giuseppe | Wilt 2:11 /'Thus, Clispaeth spake: Inside each of you are a multitude of perceptions and identities, for within each individual spirit resides everything./'
CHOICE | ...a multitude of perceptions and identities...
REPLY  | Q3A | Eat grapes to cure disease.
REPLY  | Q3B | It is good to collect all kinds of gems.
REPLY  | Q3C | Sometimes there are dogs around to rescue you.
REPLY  | Q3D | Eating rotten fruit is dumb.
REPLY  | Q3E | Everyone is cool and beautiful.

Q3A
DIALOG | P_NAME   | I don't really understand this one. I'm going to guess that it's just saying that you should eat lots of grapes to cure diseases.
DIALOG | Giuseppe | A guess? I think not. You've clearly studied Clispaeth before, as this is precisely what this passage is saying. Indeed the Book of Wilt's function is a complete, exhaustive explanation of the health benefits of regular grape consumption.\This passage in particular is useful in its suggestion to consume grapes as a treatment for radiation sickness. The /'multitudes of perceptions and identity/' noted in this passage is a reference to one of the tragic mental illnesses caused by advanced radiation poisoning.
DIALOG | P_NAME   | I don't like fruit that much. I like candy more.
DIALOG | Giuseppe | Well, you'll be able to get by if you can avoid radiation sickness, but I strongly suggest adding grapes to your diet to improve your overall health and stamina. You'll live much, much longer.\Let's go to the next passage. I had some simpler passages for you, but we can skip ahead to the more advanced stuff now. It's clear you truly understand Clispaeth.
QUEST  | dwarfCustody += 3
GOTO   | TEST4

Q3B
DIALOG | P_NAME   | Is it saying something about how it's good to collect all sorts of gems? I don't know anything about gems, but maybe it's just trying to tell you to learn all about them and collect as many as you can.
DIALOG | Giuseppe | Well, no, this sort of sentiment isn't really covered in the good book. In fact, dwarf scholars have pointed out that, gems being what they are, mention of this specific concept isn't something that even needs to be mentioned in Clispaeth's doctrines.\The necessity for gems is one of the core Clispaeth-given necessities of dwarfs, one of our key defining traits. It's pointless to point out such core necessities, much in the way it's pointless to devote verses of His book to explaining how much gremlins need garbage.\No, my son, I'm afraid you're trying too hard, looking too deep into His words. You need to loosen your perceptions, let the words flow through you. You're close, I can feel it.\Let's try one more passage, shall we?
GOTO   | TEST4

Q3C
DIALOG | P_NAME   | Maybe it's talking about dogs. There are a lot of dogs and dogs are really cool, they can do all kinds of neat stuff. They can come to rescue you sometimes.\I wish I had a dog...maybe if I had a magical dog whistle I could get a bunch of dogs to hang out with me whenever I wanted...
DIALOG | Giuseppe | Well, your reading of this particular passage isn't accurate, but I am taken slightly aback by your mention of dog whistles. This is an expert topic in Clispian research...\In the early eras of Clispaeth's reign, Dog Whistles were the most prized of all commodities, Dogs would never bite if you had a dog whistle. They were thus known as the great protectors of Clispaeth's closest followers.
DIALOG | P_NAME   | Wow. That sounds useful. I'd love to get one of these dog whistles...
DIALOG | Giuseppe | I'm afraid all the master craftsmen of dog whistles have long since been slain. The last reported sighting of one was during the days of the Gaze=Belork Phenomenon, and even that might simply be a myth. It's unthinkable that you'll ever see a dog whistle in your lifetime.\I can tell this fact is upsetting you. Let's move on to the next passage.
QUEST  | dwarfCustody += 1
GOTO   | TEST4

Q3D
DIALOG | P_NAME   | I think it's talking about how fruit can go bad and become rotten, and you shouldn't eat fruit when this happens.\I kinda think eating fruit is dumb, but eating rotten fruit is even more dumb.
DIALOG | Giuseppe | This is vastly incorrect, on both counts. I think you might need a slight reality-check if you think eating fruit is /'dumb,/' as you say.
DIALOG | P_NAME   | I can't help it, I just don't like fruit. I don't even like candy apples that much. I'll eat it because it's still candy, but I can't get over that it's an apple. That's really gross.
DIALOG | Giuseppe | Very well. What would you say if I told you eating candy was /'stupid/' or /'dumb/'?
DIALOG | P_NAME   | I don't know. I guess you're entitled to your opinion, but...\... I just don't think you're right. Candy is the best.
DIALOG | Giuseppe | But it wounds you slightly to hear others say such things, doesn't it? Maybe now you understand how you've made me feel...
DIALOG | P_NAME   | Oh._._._ I'm sorry...
DIALOG | Giuseppe | I accept your apology. You can wound me as much as you please, but please try to keep an open heart and an open mind when it comes to Clispaeth.\I think we're close to finished. Let's review this final passage...
GOTO   | TEST4

Q3E
DIALOG | P_NAME   | I think it's saying that everyone is pretty cool, we have all kinds of beautiful things going on inside our heads, different ways of looking at things. We're all important! We're the universe.
DIALOG | Giuseppe | Hmm, no, I don't think so. No, Clispaeth is important, Clispaeth is the universe. We are just His humble servants. Please be aware of this distinction.
DIALOG | P_NAME   | Oh... so we aren't important, then?
DIALOG | Giuseppe | No. Look at it this way: Individual lives are like grains of sand on the great beach of Clispaeth. You don't go to the beach for an individual grain of sand, or the sand at all, you go for the beach itself. Clispaeth is the beach.
DIALOG | P_NAME   | Oh. So if we're all dead, there's no more Clispaeth? Doesn't that make us important? There won't be a beach without any sand...
DIALOG | Giuseppe | No. You simply do not._._._ *sigh*\Let's just move on to the next passage. I don't think you're sufficiently advanced in the ways of Clispaeth to understand this yet.
GOTO   | TEST4

TEST4
DIALOG | Giuseppe | Carl 23:11 /'The truly pious life is not one achieved through worship, or sacrifice, or servitude, or punishment, but one forever embracing all the beauties of consciousness./'
CHOICE | ...pious life is not achieved through worship...
REPLY  | Q4A | There isn't a right way or wrong way to find Clispaeth.
REPLY  | Q4B | Wearing jorts is forbidden.
REPLY  | Q4C | We should be playing basketball instead of reading the Holy Book.
REPLY  | Q4D | Gemstones are alive and do not need to follow Clispaeth's rules.
REPLY  | Q4E | I'm really hungry.

Q4A
DIALOG | P_NAME   | Maybe it's just saying that there isn't a right or wrong way to find Clispaeth. Maybe he's everywhere, like in the ground, or the food we eat, or the telephone, or dwarfnet, just everything! Just being alive means you're hanging out with Clispaeth.\That would be kinda cool. He's just making this big playground for us all to hang out in. The rest is up to us.
DIALOG | Giuseppe | I'm afraid this is not a correct way of looking at Clispaeth, young man. Of course there are rules, Clispaeth wouldn't have created this book if there weren't rules.\And how exactly can he be everywhere? A rock is a rock, Clispaeth isn't hiding in it. With that logic, I'd be Clispaeth, or you'd be Clispaeth. I'll just say that this treads on blasphemy and leave it at that.\We are but parasitic organisms clinging to the wondrous canvas Clispaeth has painted for us.
DIALOG | P_NAME   | Sorry, I didn't know...\I just thought it was a cool idea I guess. It's a shame it's wrong.
DIALOG | Giuseppe | It's just fortunate I was here to assist you. The path of Clispaeth is not a simple one, but it is one well worth traveling.\Well, I think that does it for the test. Let me just run through some of the notes I was taking, and I will tally up your score.
GOTO   | TESTRESULTS

Q4B
DIALOG | P_NAME   | You are never allowed to wear Jorts. According to Clispaeth, wearing Jorts is strictly forbidden and you will be punished for doing so.
DIALOG | Giuseppe | Absolutely not! Where did you hear such hogwash? I've known many deeply pious individuals to spend the majority of their life wearing jorts.\And might I add, rare is it that I have encountered a scholarly reference to jorts in all my years of Clispian study, at the very least not one of such bias. For now, the official stance of the church is that Clispaeth is PRO-JORTS, do not spread misinformation to the contrary. The Clispian faith does not need such negative anti-jort speculations floating about.\Am I understood?
DIALOG | P_NAME   | Yes, sir...
DIALOG | Giuseppe | Very well. This concludes the test. Let me just run through some of the notes I was taking, and I will tally up your score.
GOTO   | TESTRESULTS

Q4C
DIALOG | P_NAME   | We should be playing Basketball instead of reading the holy book. It sounds like a pretty cool book, but I think Basketball is the most beautiful thing in my life. I think this is saying I should find all the beautiful things in life.\Maybe not even just Basketball, maybe there are other things I'll like almost as much as Basketball. I won't have time to read this book over and over again if I'm out looking for all that cool stuff.
DIALOG | Giuseppe | No, my son. You couldn't be more wrong...\I had hoped you were different from all the others, that you wouldn't just turn your back on Clispaeth... for Basketball...
DIALOG | P_NAME   | I'm sorry, I'm just kinda saying whatever. I just really like Basketball. Maybe there's room in my life for both Clispaeth AND Basketball... maybe.\(Is that possible...)
DIALOG | Giuseppe | I understand. And you will hopefully have a long life ahead of you, one where you must decide what is truly important. Dwarfs such as myself can only guide you on this journey. These big decisions are something you need to sort out with Clispaeth...\Well, I shouldn't dwell too much on this one passage. It is just one among many, let me consult my notes, and see how where you really stand in the domain of Clispaeth...
GOTO   | TESTRESULTS

Q4D
DIALOG | P_NAME   | Is it actually talking about gemstones? Gems are really pretty, maybe it's talking about them, like they're really alive.\Maybe they don't need to go to church or read the book, they just need to be as pretty as possible, that's what they're there for.
DIALOG | Giuseppe | Wait, slow down a minute. We're just talking about a standard reading of Clispaeth's book, you're getting into the upper echelon of Clispian theory now.\Yes, son, you are correct, possibly more correct than anyone knows. This passage indeed speaks of gemstones, but the question as to whether or not they are living creatures themselves is something constantly in debate amongst the most revered of Clispian scholars. Such debates probe the most mysterious of Clispaeth's secrets, investigation into the matter is never to be taken lightly.\It is, to say the least, staggeringly impressive that you are aware of such things at such an early age.\I believe I've questioned you enough. Despite your years, it's clear to me now you are a true Clispian. The remaining 173 passages are not necessary for the test, unless you wish to review them with me to pass the time?
DIALOG | P_NAME   | No, that's ok, some other time maybe. He told me I should hurry, the ship is leaving soon.
DIALOG | Giuseppe | Ah, yes! I had nearly forgotten why we were doing this. I suppose I was rather caught up in the moment.\Very well. Allow me a moment to glance through my notes here...
QUEST  | dwarfCustody += 3
GOTO   | TESTRESULTS

Q4E
DIALOG | P_NAME   | I'm really hungry, do you have anything to eat?
DIALOG | Giuseppe | Hmmm, a curious response, but I'm afraid that's not what this passage means. That would be a strange thing for Clispaeth to wish to convey to His followers...
DIALOG | P_NAME   | That wasn't my answer. I'm just really hungry.
DIALOG | Giuseppe | Oh...well I don't have any food for you. The Church has been terribly short on donations lately. I'm sorry. Do you have any idea what the reading of this passage is?
DIALOG | P_NAME   | I don't know, I can't concentrate on an empty stomach.\Maybe it just means that you can't ever ride a kangaroo. Kangaroos are pretty dangerous, they can punch you out. You shouldn't try to ride something that can punch you out.
DIALOG | Giuseppe | It looks like I wore you out here, young man. You're not making much sense anymore. My apologies. Sometimes I forget how exhausting Clispian study is to the uninitiated.\I had a couple dozen more passages for you to review, but we can stop here if you're feeling weary. Let me just review your answers thus far...
QUEST  | dwarfCustody += 1
GOTO   | TESTRESULTS

TESTRESULTS
IF dwarfCustody == 1  | GOTO | DWARF_NONE
IF dwarfCustody <= 14 | GOTO | DWARF_SOME
IF dwarfCustody >= 15 | GOTO | DWARF_ALL

DWARF_NONE
DIALOG | Giuseppe | Hmmm, yes, I'm afraid you have not performed satisfactorily on this test. I believe I will not be able to grant you any of the Dwarfs in my custody.
DIALOG | P_NAME   | That stinks. Why would they make something so important so hard to understand?
DIALOG | Giuseppe | My child, the fault lies entirely on your own shoulders. These words flow through me like water through a brook, and have since my day of birth. I understand them all, none of Clispaeth's secrets are kept from me.
DIALOG | P_NAME   | I don't see the point of it all if it's just going to cut me off because I don't understand it all exactly right. Isn't being a good person enough?
DIALOG | Giuseppe | No. You will never understand Clispaeth. Being GOOD is never enough. You need to be CORRECT.
DIALOG | P_NAME   | That's just not fair.
DIALOG | Giuseppe | Please take your lies elsewhere. The book has revealed your true colors, you are nothing but a liar and a scoundrel.
QUEST  | giuseppeState = 4 // was lugnerQuest = 4

DWARF_SOME
DIALOG | Giuseppe | Hmmm, your results were most encouraging! You are but a novice in the ways of Clispaeth, but you have shown me that you are well on your way to a life respectful of the shadow Clispaeth's greatness has cast on all of creation.\As a fellow follower of Clispaeth, I will trust you with some of the dwarfs in my custody. I think @dwarfCustody@ is the correct amount.
DIALOG | P_NAME   | Ok, cool.
GOTO   | DWARF_SEND

DWARF_ALL
DIALOG | Giuseppe | Who am I kidding, I don't need to consult my notes. You passed the test perfectly, you speak the language of Clispaeth, you understand his every move.\Tell me, under whose instruction did you study Clispaeth? He is an enviable follower of Clispaeth to have taught so much to someone so young.
DIALOG | P_NAME   | I just guessed. I really don't know. I don't know anything about Clispaeth.
DIALOG | Giuseppe | Incredible. To do this well on the test without ever studied?\Child, I have never had the privilege of saying this to a newcomer in the ways of our Lord Clispaeth, but whichever path you choose in life, I am certain it will be the path of Clispaeth. This is as great a compliment as I can bestow upon another living being.\I currently am hiding fifteen dwarfs. Their souls are yours, for it is clear to me that this is the will of Clispaeth, and, with you as their shepherd, they shall come to no harm.
DIALOG | P_NAME   | Uh... ok...
GOTO   | DWARF_SEND

DWARF_SEND
DIALOG | Giuseppe | Where do you wish me to send the Dwarfs?
CHOICE | Where should I send the dwarfs?
REPLY  | BLUE | (Lugner) The blue container in the warehouse.
REPLY  | RED  | (Slag) The red container in the warehouse.

BLUE
DIALOG | P_NAME   | Send them to the blue container in the warehouse, Lug-._._._ I mean, our friend is waiting there.
DIALOG | Giuseppe | Oh, he's chosen a new location this time, eh? He is always full of surprises. I will send the Dwarfs there. May Clispaeth always be with you in your travels.
QUEST  | lugnerQuest = 6
QUEST  | giuseppeState = 5

RED
DIALOG | P_NAME    | To the warehouse, there's a red container.
DIALOG | Giuseppe | Hmm, really? Well, as you wish. I shall have them meet you there. Clispaethspeed, my son.
QUEST  | lugnerQuest = 5
QUEST  | giuseppeState = 5
" +
/// A rich Giuseppe
/*

*/
"

DIALOG  |   Giuseppe    |   I'm rich, bitch.
"
