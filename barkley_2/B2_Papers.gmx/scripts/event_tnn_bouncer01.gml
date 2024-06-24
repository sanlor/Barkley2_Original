script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF ericQuest == 2 | IF curfew == before | GOTO | ERIC
IF bootyBassQuest == 3 | GOTO | BOOTY3
IF bootyBassQuest == 2 | GOTO | BOOTY2
IF curfew == after     | GOTO | CURFEW_AFTER
IF bouncerState == 1   | GOTO | BOUNCER1
GOTO | BOUNCER0

MATTHIAS
DIALOG | Bouncer  | Gatdam, dude. We don't have a dress code but I'm not letting you in lookin' like a stank ass bog body.

GOVERNOR
DIALOG | Bouncer  | N-no Booty Bass going on here, sir! Uh, yes, I'm well aware Booty Bass is a capital offense! We're just, uh, doing a morality play in honor of Cuchulainn and the Duergars, whom we cherish and respect.

ERIC
DIALOG | P_NAME   | Hey, this is the booty bass club, right? I was wondering if you guys were hiring right now.
DIALOG | Bouncer  | Yeah, we're looking for another bouncer for the day shift. You look a little small for the job, can you fight?
DIALOG | P_NAME   | Oh, I'm looking for a fr... client.
DIALOG | Bouncer  | Yeah? How's your 'client' in the ring?
DIALOG | P_NAME   | Uh... bad. Really bad.
DIALOG | Bouncer  | Then hit the road, kid.

BOOTY3
DIALOG | Bouncer  | H-hello B-Baron of Booty... my liege...
DIALOG | @djName@ | Hey there. You can just call me @djNamePrefix@ you know.
DIALOG | Bouncer  | Th-the Baron said hello... they noticed me!

BOOTY2
DIALOG | Bouncer  | Well if it isn't the little DJ! What's going down, pal?
DIALOG | @djName@ | I... I didn't win the Bootypocalypse...
DIALOG | Bouncer  | Sure you didn't win, but that doesn't mean you didn't pump out some of the hottest booty-flavored jock jams this side of the Sombrero Galaxy. You were there, @djNamePrefix@. You didn't just witness the Bootypocalypse - you lived it.
DIALOG | @djName@ | Yeah, I guess that's true. And I DID get to meet The Anime Bulldog.
DIALOG | Bouncer  | Heck yeah! That's the way to look at it!
DIALOG | @djName@ | Yeah, maybe you're right! Who cares if I didn't win the Bootypocalypse?
DIALOG | Bouncer  | That's the attitude! Go get 'em, tiger!
DIALOG | @djName@ | (I... I will...)

CURFEW_AFTER
IF bouncerShake == 0 | GOTO | SHAKE0
DIALOG | Bouncer  | Hey kid, sorry you missed the Bootypocalypse. Unfortunately, it seems there are no legitimate claims to the throne...  the title will be uncontested until the current Baron or Barons of Booty meet their end. No Bootypocalypse until the Barons perish. Long live the Barons of Booty!

SHAKE0
DIALOG | Bouncer  | I can't believe it! All that power! All that... that... that... Booty! Pity yourself, kid, for you just missed the Bootypocalypse! A world and tuckus-shattering event!
DIALOG | P_NAME   | Aw, dang... really?
DIALOG | Bouncer  | Sorry to say, but it's true. You're too late to witness the spectacle or compete for the Booty Barony itself, but come on in and dance! Plenty of booty energies are still reverberating within these hallowed booty halls. Wh-whoa!
SHAKE  | 5 | 1
DIALOG | Bouncer  | You feel that? A booty aftershock... the ground's still quaking and the asses are still shaking. Get in and feel that bass!
QUEST  | bouncerShake = 1

BOUNCER1
DIALOG | Bouncer  | The Bootypocalypse is here and nobody, not even Cuchulainn or the Bainshees, can stop this party! This is your only chance to witness the greatest modern minds of booty bass clash for the title of Baron... of... BOOTY! And go down forever in the booty chronicles as the greatest booty bassman of all time. Are you ready? Are you hyped? Can you handle the booty madness?
DIALOG | P_NAME   | Yeah!!! Yeah!!!!!
DIALOG | Bouncer  | Then step inside, my friend. And if you think you're up to the challenge, you can sign up for the Bootypocalypse yourself.
DIALOG | P_NAME   | (I'm... I'm shaking...)

BOUNCER0
DIALOG | Bouncer  | This is the booty bass blowout of the century, the Bootypocalypse is upon us! Tir na Nog's blueblood booty bass royalty all competing for the title of Necron 7's Baron of Booty - DJ Booty Slayer, ass_subjugator, The Booty Tyrant, The Anime Bulldog, Booty Sultan, Bootyrajah, Keister Tyc00n, MC Booty Grasper - this party's going nonstop until a new Baron is crowned... all night long!
DIALOG | P_NAME   | Whoa, the Anime Bulldog's gonna be there? I love anime...
DIALOG | Bouncer  | This party is just getting started, baby! Are you game? Are you HYPE? Are you READY. TO. ROCK. YOUR. BOOTY?!?!
DIALOG | P_NAME   | Yeah! Yeah!!!
DIALOG | Bouncer  | Then step inside, my friend. This party is open to all jock jammers, booty bouncers, techno dwarfs and cyber slickers. And if you think you've got the chops, you can even enter the Baron of Booty contest yourself.
DIALOG | P_NAME   | (I want to be the Baron of Booty...)
QUEST  | bouncerState = 1
";
