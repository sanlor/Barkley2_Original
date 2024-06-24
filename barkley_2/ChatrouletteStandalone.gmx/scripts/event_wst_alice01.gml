script = "
IF aliceState == 0     | GOTO | ALICE0
IF aliceState == 1     | GOTO | ALICE1

BANQUO0
DIALOG | Banquo | When I'm in my gulch of sorrows, the place where I hate myself the most, the place where I don't even care if I'm alive or not, do you know what I do? Power lifting. Shut off your brain, stop thinking about the darkness and pound the irons. Cutting and bulking, supplements, fish oil, protein powder. You know what it all adds up to? Huge gains, gigantic delts. The world wants to see your glutes balloon. It keeps my mind off of suffocating depression and I can lift any rock.
QUEST  | banquoState = 1

BANQUO1
DIALOG | Banquo | If you only work your upper body, you'll look all fucked up like me. So work both your arms and your legs. Or just lay in bed. It's all the same in the end.
";

/*
// Alice state 4, time 12
DIALOG | Alice  | I've heard a few things about a fighter named " + P_NAME + " out there too. You wouldn't happen to know anything about them, would you?
DIALOG | P_NAME | Heh, maybe a little...
DIALOG | Alice  | You're making a real name for yourself out there. I haven't been keeping up with this whole Cuchulainn and Cyberdwarf thing but it sounds like a handful. I say they're both frauds, kill 'em both.
QUEST  | aliceState = 5

// Alice state 5, time 12
DIALOG | Alice  | Maybe if we're both still alive, we can team up sometime in the future. 

// Alice state 3, time 12
DIALOG | Alice  | This Adelbrand guy seems alright. I've heard of him before, they say he's a pretty accomplished warrior. I respect that. It's dangerous to go alone out there in the Necron 7 wilds. Maybe he and I could team up for a while.");
QUEST  | aliceState = 4

// Alice state 3, time 11
DIALOG | Alice  | I certainly won't be going to Shangri-La anytime soon.

// Alice state 2, time 11 
DIALOG | Alice  | I'm not surprised about what happened to Lonnie's crew. Except for Lagertha, they were all a bunch of fame-hungry chumps looking for a bigger piece of the pie than they'd earned. The moral of this story is to know your limit, to taste the fruit but eat only until you're full.
QUEST  | aliceState = 3

// Alice state 2, time 3 
DIALOG | Alice  | Lagertha seems okay, though. She seems to realize it's not about the grapes and gold. They're nice, but they're not the goal.
    
// Alice state 1, time 3 
DIALOG | Alice  | I don't like Lonnie and his crew. /'Ultimate Hellbanes/'. Heh. They're punks that don't care about anything other than fame and a quick buck. They're all gonna get killed someday when they get into something way over their heads.
QUEST  | aliceState = 2

// Alice state 1, time 2
DIALOG | Alice  | Just keep practicing your gun'sbrasting and eating your vitamins. You'll get strong in no time.

// Alice state 0 
DIALOG | Alice  | Hey, you look tough, are you a fighter?
DIALOG | P_NAME | I'm not the toughest kid in town... but I will be soon.
DIALOG | Alice  | There are a lot of /'tough guys/' out there. I consider myself one tough lady, never met a challenge I couldn't handle, but I wouldn't want to tangle with Ooze or Slag. A word of advice: don't mess around with those guys until you've beefed up your G.L.A.M.P.s.
QUEST  | aliceState = 1

