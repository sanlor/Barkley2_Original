script = "
IF bootyBassQuest == 3     | GOTO | BOOTY3
IF bootyBassQuest == 2     | GOTO | BOOTY2
IF curfew == after         | GOTO | CURFEW_AFTER
IF bootyBassQuest == 1     | GOTO | BOOTY1
IF animeBulldogState == 1  | GOTO | ANIME1
GOTO | ANIME0

BOOTY3
IF animeBulldogState == 3  | GOTO | BOOTY3_3
IF animeBulldogState == 2  | DIALOG | The Anime Bulldog | You're not bad, Baron. Sorry I gave you a hard time before the compo. I like what I heard up there. Keep it up, you'll go places.
IF animeBulldogState != 2  | DIALOG | The Anime Bulldog | You're not bad, Baron. I like what I heard up there. Keep it up, you'll go places.
DIALOG | @djname@          | (He talked to me...)
DIALOG | The Anime Bulldog | Oh, and @djpref@, one more thing.
DIALOG | @djname@          | Yeah?
DIALOG | The Anime Bulldog | Google 'Japanimation.' Trust me.
DIALOG | @djname@          | Th-thank you Mr. Bulldog!
QUEST  | animeBulldogState = 3

BOOTY3_3
DIALOG | The Anime Bulldog | The Baron's back! Hats off to the Baron!
DIALOG | @djname@          | (He's... he's just flattering me...)
DIALOG | The Anime Bulldog | Remember, kid. 'Japanimation.'

BOOTY2
DIALOG | The Anime Bulldog | Pathetic... not surprising, but pathetic.
DIALOG | @djname@          | It was my fi-
DIALOG | The Anime Bulldog | Don't even talk to me, kid. I don't want to hear it. Not after the way you betrayed everyone at the Bootypocalypse. I'm just glad DJ Booty Slayer and I could clean up the mess you made.
DIALOG | @djname@          | I'm sorry...
QUEST  | animeBulldogState = 3

BOOTY2_3
DIALOG | The Anime Bulldog | Don't speak, just bow! Bow down to your new Barons!

CURFEW_AFTER
IF bootyBassQuest == 1     | GOTO | REFUSED
DIALOG | The Anime Bulldog | Hey latecomer, enjoying the groove? DJ Booty Slayer and I just tied in the Baron of Booty Contest. We're working on a new single, called 'Pax Booty'. We're putting our differences aside.... it's going to be a Golden Booty Millennium!

REFUSED
IF animeBulldogState == 2  | DIALOG | The Anime Bulldog | Hey, sorry if I scared you away from entering the Bootypocalypse. I don't mean to be so intimidating... but DJ Booty Slayer and I rightfully tied and are ruling as joint Barons, so all's right with Booty.
IF animeBulldogState != 2  | DIALOG | The Anime Bulldog | Hey, I thought you were gonna enter the Bootypocalypse! Turns out you didn't miss anything... DJ Booty Slayer and I rightfully tied and are ruling as joint Barons, so all's right with Booty.

BOOTY1
QUEST  | animeBulldogState = 2
IF animeBulldogState == 0  | GOTO | BOOTY1_0
DIALOG | The Anime Bulldog | I thought you were just a fan... but now you're sniffing around the Daimyo? Enter at your own peril. I've got a Gluteal-Kei barnburner ready... you got what it takes to top that?
DIALOG | P_NAME            | (G-Gluteal-Kei? I've never even heard of it...)

BOOTY1_0
DIALOG | The Anime Bulldog | What have we here... a new DJ trying to build a name? Better carve your niche and carve it fast, and don't bother with Gluteal-Kei. It's my turf and I will defend it fiercely.
DIALOG | P_NAME            | (G-Gluteal-Kei? I've never even heard of it...)

ANIME1
DIALOG | The Anime Bulldog | You want an autograph, kid? Meet me after the show.
DIALOG | P_NAME            | (Whoa... I wonder if he likes anime...)

ANIME0
DIALOG | The Anime Bulldog | Hey, what's up? Diggin' the track? This is a collab, me versus DJ Booty Slayer. He was basically going for a booty-nouveau feel while I maintained the crispness and punch of modern keisterstep. Hope you like it.
DIALOG | P_NAME            | (W-whoa... I can't believe he talked to me... he's so cool...)
DIALOG | The Anime Bulldog | Speechless, huh? Well stick around for a real show. Don't tell him I said this, but I'm going to crush DJ Booty Slayer in the Bootypocalypse!
QUEST  | animeBulldogState = 1
";
