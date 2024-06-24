script = "
IF govQuest == 5   | GOTO GOVQUEST5
IF dubreState == 1 | GOTO | DUBRE1
GOTO | DUBRE0

GOVQUEST5
DIALOG | DUBRE  | Hi! Welcome to our city!!\I am Dubre! I will be your guide through our glorious city! I know everything there is to know about this place. I just love this place so much!!\Ask me any question about our wonderful city, and I will answer it for you! For free!! I just love this town so much!!
DIALOG | P_NAME | Ah, yes, our city. I am the governor so I am committed to questions about our wonderful city. Greetings and welcome.
DIALOG | DUBRE  | Wow! A governor, huh? I don't know what that is, but that just sounds swell.

DUBRE0
DIALOG | DUBRE  | Hi! Welcome to our city! I am Dubre, Dubre the Obliging! I will be your guide through our glorious city! I know everything there is to know about this place. I just love this place so much!\Ask me any question about our wonderful city, and I will answer it for you! For free! I just love this town so much!
QUEST  | dubreState = 1
GOTO   | GREET_GET

DUBRE1
IF curfew == during | DIALOG | DUBRE  | Hi! Just cause everyone is inside doesn't mean we can't have fun out here. How can I help?
IF curfew != during | DIALOG | DUBRE  | Hi you must need more help. How can I help you?
IF curfew != during | QUEST  | dubreState = 1
GOTO   | GREET_GET

GREET_GET
IF curfew == during | GOTO | GREET_CURFEW
GOTO | GREET

GREET
CHOICE | Ask Dubre the Obliging any question.
REPLY  | WHERE_LEADER   | Who is in charge of this town?
REPLY  | WHERE_TOGO     | Where should I go to meet new people?
IF wilmerEvict == 1     | REPLY | WHERE_MORTGAGE | Know where the Mortgage Office is?
REPLY  | WHERE_GUNS     | Where should I go to buy gun's?
REPLY  | WHERE_CANDY    | Where should I go to buy candy?
REPLY  | WHERE_BBALL    | Where should I go to play BBALL?
IF time >= 2            | REPLY | WHY_UNHAPPY | Why is everyone so unhappy?
REPLY  | WHERE_BATHROOM | Where should I go the bathroom?
REPLY  | NO             | No thanks.

WHERE_LEADER
DIALOG | P_NAME | Who's pulling the strings here?
DIALOG | DUBRE  | Uh... hmm...\I'm not sure! There are lots of people here! Maybe one of them is in charge of this town.
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET

WHERE_TOGO
DIALOG | P_NAME | Where should I go to meet new people? Should I go into one of these apartment buildings?
DIALOG | DUBRE  | Yeah! You should definitely make sure to check out all of them! I think you will not regret it! They're all just so great! There's stuff in all of them, I think! I'm not really sure, I have never been inside any of the buildings! I just like the outsides so much!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET

WHERE_MORTGAGE
DIALOG | P_NAME | I gotta pay the rent, know where I do that?
DIALOG | DUBRE  | The rent huh? Yeah I know the place for that! You see that oildrum over there, the one with the red marking on it?
//scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
//scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(1);
//scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(0.5);
//scr_event_build_look_object(o_cts_hoopz, o_dubre01);
DIALOG | P_NAME | Yeah, I see it. What about it?
DIALOG | DUBRE  | Okay so first you go past that drum and keep on walking west until you see these stairs. Don't go up the stairs! Go down south. Keep going south until you can see the wall. You know the wall right? When you are there don't turn back! Keep going forward past the stores. You'll reach a dead end soon enough. Don't go into the dead end! Instead follow the path that goes up and then there you go. There's the rent place, you can't miss it!
DIALOG | P_NAME | Alright I think I got it. Thanks.
DIALOG | DUBRE  | No problem! Is there anything else you want to know?!
GOTO   | GREET

WHERE_GUNS
DIALOG | P_NAME | If I was looking for a handy brastcannon, where would I go to buy one?
DIALOG | DUBRE  | Hmm, you probably want a store that sells gun's then.\I don't know where that is! There might be one though! There also might not be! It's like a mystery!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET

WHERE_CANDY
DIALOG | P_NAME | Where is the candy store! I need somethin' sweet!
DIALOG | DUBRE  | Whoa!! Take it easy!\Ok, the candy store...\Hmm....\I'm not sure if there is one! I've never been there! Candy is not good for my goiter...
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET

WHERE_BBALL 
DIALOG | P_NAME | I have an immense desire to SLAM, possibly JAM. Where would I go to fill this need?
DIALOG | DUBRE  | Oh... yes, yes... definitely..._\I don't know what you are saying to me.
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET
        
WHY_UNHAPPY
DIALOG | P_NAME | What's the deal with this town? Everybody looks sick and unhappy....
DIALOG | DUBRE  | I don't know what you mean! They look pretty swell to me!\Maybe you are looking at the wrong people? Try looking away from all the people who are miserable and dying and pay more attention to the people who are happy to be here! We're the ones who count!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET
        
WHERE_BATHROOM
DIALOG | P_NAME | I need to use the bathroom.
DIALOG | DUBRE  | Really? That's great! I need to use the bathroom all the time, too! More than most, even, like continuously!\Well since that duergar is still using that one, let me think where the nearest one is..._
DIALOG | DUBRE  | Oh I know!_ See that oildrum over there?
//scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
//scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(1);
//scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(0.5);
//scr_event_build_look_object(o_cts_hoopz, o_dubre01);
DIALOG | P_NAME | Yes I... I do see it.
DIALOG | DUBRE  | Okay! So what you have to do is, you have to head down from here, past that oildrum. Then you will come to a dead end and a wall. Don't stop there! Instead turn left and keep going. Go all the way to the other end of that little street. Right at the end is this big thing with fans on it. Don't try to touch the blades! You'll hurt yourself! Okay, so from there go a bit more north and you'll see some stairs. Don't go up the stairs!! Instead start going to the right and soon enough you'll see a bathroom you can use.
DIALOG | P_NAME | Okay. Thanks.
DIALOG | DUBRE  | Anything else before you go to the bathroom??
GOTO   | GREET
        
NO
DIALOG | P_NAME | No thanks. I'll figure it out on my own.
DIALOG | DUBRE  | Wow! Good luck!!

GREET_CURFEW
CHOICE | Ask Dubre the Obliging any question.
REPLY  | WHERE_EVERYONE | Where did everyone go?
REPLY  | IS_IT_SAFE     | Is it safe to be out here?
REPLY  | WHY_MEAN       | Why are the duergars so mean?
REPLY  | WHAT_CURFEW    | What should I do during the curfew?
IF knowTNNTrain == 1    | REPLY | WHERE_TRAIN | Where is the train station?
REPLY  | WHO_CUCHU      | Who is Cuchulainn?
IF knowClispaeth == 1   | REPLY | WHO_CLISP   | What do you know about Clispaeth?
REPLY  | NARY           | Nary ye mind.

WHERE_EVERYONE
DIALOG | P_NAME | Where did everybody go?
DIALOG | DUBRE  | Hmmm, that's a really good question! Sometimes dwarfs just go somewhere. You never know where that could be. It could be anywhere.\Maybe you could go look for them? Try starting at that drum over there.
//scr_event_build_look_object(o_cts_hoopz, o_drum_marked01);
//scr_event_build_camera_move_to_point(o_drum_marked01.x, o_drum_marked01.y, CAMERA_NORMAL);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(1);
//scr_event_build_camera_frame(CAMERA_NORMAL, o_cts_hoopz, o_dubre01);
//scr_event_build_wait_for_actions();
//scr_event_build_wait(0.5);
//scr_event_build_look_object(o_cts_hoopz, o_dubre01);
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW

IS_IT_SAFE
DIALOG | P_NAME | Is it safe to be out here?
DIALOG | DUBRE  | Of course! This town is perfectly, 110% safe! There's no way you're going to get hurt in this town! Just no way at all!\Just make sure you don't fall down or scratch yourself! But as long as you watch where you're going, you should be fine!
DIALOG | P_NAME | Yeah but I think if those duergars see you out you might get in trouble.
DIALOG | DUBRE  | Not if I help them first! I can't wait to help the duergars, whoever they are.
DIALOG | P_NAME | Suit yourself, but it looks sketchy as huck out here!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW
    
WHY_MEAN
DIALOG | P_NAME | Why are the duergars so mean to everybody?
DIALOG | DUBRE  | Hmmm, duergars, huh? I guess they're pretty mean if what you say is true.\But I don't really know what a duergar is! I've never seen one! I hope I never see one if they're as mean as you say. That would just be no good at all!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW

WHAT_CURFEW
DIALOG | P_NAME | What is there to do when the town is like this?
DIALOG | DUBRE  | Hey, you're really getting into the spirit of our town now! That's great!\There's probably lots of fun stuff to do around town if you go and look for it. I pretty much just stand here and tell people everything I know about the town, so I don't have time to find other things to do.
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW

WHERE_TRAIN
DIALOG | P_NAME | Where would I find the train station?
//TODO: Add faulty directions
DIALOG | DUBRE  | Oh! You're looking to catch a train, huh? I don't know why you'd ever want to leave, this town has everything!\That's probably the best way to find a train station. If you find a train, you're just one step closer to finding a train station!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW
            
WHO_CUCHU
DIALOG | P_NAME | What do you think about this Cuchulainn guy?
DIALOG | DUBRE  | Wow! You really ask some tricky questions!\I don't know this Cuchulainn guy! I meet all kinds of people standing here but I've never met anybody named Cuchulainn! But if he's a friend of yours, I bet he's a really swell person.\Hey wait, I know! If there's something you want to know about Cuchulainn, maybe you should find him and ask! He'd probably tell you everything you want to know! Maybe he's even a town greeter like me! He'll tell you all sorts of things!!
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW

WHO_CLISP
DIALOG | P_NAME | Have you opened your heart to Clispaeth?
DIALOG | DUBRE  | Oooh, what a mysterious question! I feel like I'm being interrogated! This is so exciting!\So I think Clispaeth is a really important guy! Just super important.\I don't know who he is or anything about him but I don't think you'd be asking if he wasn't a really important person!! You've said it all, I think!! Maybe there's nothing even more to know about him, I don't know!
DIALOG | P_NAME | ._._._
DIALOG | DUBRE  | Is there anything else you want to know?!
GOTO   | GREET_CURFEW
            
NARY
DIALOG | P_NAME | Nary ye mind. I'll figure it out on my own.
DIALOG | DUBRE  | Wow! Good luck!!
";
