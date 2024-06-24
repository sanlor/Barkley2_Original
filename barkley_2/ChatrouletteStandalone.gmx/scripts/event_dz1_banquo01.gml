script = "
IF banquoState == 0     | GOTO | BANQUO0
IF banquoState == 1     | GOTO | BANQUO1

BANQUO0
DIALOG | Banquo | When I'm in my gulch of sorrows, the place where I hate myself the most, the place where I don't even care if I'm alive or not, do you know what I do? Power lifting. Shut off your brain, stop thinking about the darkness and pound the irons. Cutting and bulking, supplements, fish oil, protein powder. You know what it all adds up to? Huge gains, gigantic delts. The world wants to see your glutes balloon. It keeps my mind off of suffocating depression and I can lift any rock.
QUEST  | banquoState = 1

BANQUO1
DIALOG | Banquo | If you only work your upper body, you'll look all fucked up like me. So work both your arms and your legs. Or just lay in bed. It's all the same in the end.
";
