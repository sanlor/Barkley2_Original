script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF ilyichState == 7 | GOTO | ILYICH7
IF ilyichState == 6 | GOTO | ILYICH6
IF ilyichState == 5 | GOTO | ILYICH5
IF ilyichState == 4 | GOTO | ILYICH4
IF ilyichState == 3 | GOTO | ILYICH3
IF ilyichState == 2 | GOTO | ILYICH2
IF ilyichState == 1 | GOTO | ILYICH1
GOTO | ILYICH0

MATTHIAS
DIALOG | Ilyich | Sorry folks, the tours are closed today. You'll have to come back another day.
DIALOG | Matthias | Drat! Me and my pappy Firas love tours. Maybe next time.

GOVERNOR
DIALOG | Ilyich | Sorry folks, the tours are closed today. You'll have to come back another day.
DIALOG | Governor Elagabalus | I, the new governor of Tir na Nog, will certainly come back another day.

ILYICH7
DIALOG | Ilyich | We at Starlight Tours hope you had a great journey with us today!! Don't forget to hit the gift shop on your way out!!!

ILYICH6
DIALOG | Ilyich | We're reaching the end of our time together now, friends. Do any of you have any questions for me?
DIALOG | P_NAME  | Uh.... what are you talking about?
DIALOG | Ilyich | Oh!!! Oh. I didn't think anybody was listening.
DIALOG | P_NAME  | I thought you were talking to me.
DIALOG | Ilyich | Well, no, I was just talking to myself I guess. This is what my job sounded like back before I came here. I really miss it.
DIALOG | P_NAME  | Oh, you were a tour guide?
DIALOG | Ilyich | Well... no. But I was the tour guide's understudy. He never missed a day for thirty years. He was the best tour guide in the business. But I got to go on his tour thousands of times, every day of my life for a while there. This was what my life sounded like back then, I guess. It probably sounds pretty stupid just hearing me say it. He could breathe life into the script so much better than I can.
DIALOG | P_NAME  | I thought it was pretty cool anyway. I'd like to go there sometime.
DIALOG | Ilyich | You can't... it's............ I just really miss it. I guess I go through the lines so I don't forget what home sounds like. When I close my eyes sometimes I can see Westman's Borealis reflecting in the tarpits, or smell the sulfur from the twin volcanoes. It's just as real to me as those days.... It's not the same, but I guess it's better than nothing, isn't it?
QUEST  | ilyichState = 7

ILYICH5
DIALOG | Ilyich | Now this is where it gets a little more dicey ladies, gentlemen, and gremlinkin... we're about to pass the DG789088.1 crater, the only place where the center of our beautiful home is exposed. As much as you'd like to see it with your naked eyes, making direct eye contact with the star at the center of our home will burn them out instantly. If you'd be so kind, please put on your sunglasses... now!! And to those of you that you did not receive your special sunglasses, you can purchase replacements at the vending machine at the back of the trolly.
DIALOG | P_NAME  | (What vending machine.....?)
QUEST  | ilyichState = 6

ILYICH4
DIALOG | Ilyich | Just around the corner............. there it is!!! The pink-bellied rhino!!! Look at the little one right there, rolling on his back. And there's the alpha male himself, the grandfather of all the pink-bellied rhinos, asleep as usual. Look how peaceful he is there... Hushed tones, my friends, they say it's bad luck to wake him.
QUEST  | ilyichState = 5

ILYICH3
DIALOG | Ilyich | And those with a keen eye will spot the spawning ground for nature's doppelganger: the striped flamingo. Don't make eye contact with them, now! You don't want to lose your pocketbook.
QUEST  | ilyichState = 4

ILYICH2
DIALOG | Ilyich | We are now approaching the resting place of our Glorious Leader. Please, dear friends, a moment of silence.....
QUEST  | ilyichState = 3

ILYICH1
DIALOG | Ilyich | To your left is the sight you all came here to see: The Reefer Peak! The tallest point on the entire planet. Hurry!! Make a wish before it touches the moon!!!
QUEST  | ilyichState = 2

ILYICH0
DIALOG | Ilyich | This is a rare treat now, my friends. Right now we're passing the home of intergalactic pop music superstar Les /'Washbasin/' McGarvey. Those who listen close may hear be fortunate enough to hear some seductive vibes from his electric triangle...
DIALOG | P_NAME  | (?!?!?)
QUEST  | ilyichState = 1
";