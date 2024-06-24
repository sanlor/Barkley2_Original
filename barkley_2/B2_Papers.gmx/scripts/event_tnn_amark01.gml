/// Amark
script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF amarkState == 0  | GOTO | AMARK0
IF amarkState == 1  | GOTO | AMARK1
IF amarkState == 2  | GOTO | AMARK2
IF amarkState == 3  | GOTO | AMARK3
GOTO | AMARK4

MATTHIAS
DIALOG | Amark | ...
DIALOG | Matthias | Oh, hi! Just a friendly visit from your good friend Matthias!! You should tell all your pals that super-friend Matthias visited you today!!! Wow!!

GOVERNOR
DIALOG | Amark | ...
DIALOG | Governor Elagabalus | Uh... yes... everything seems to be in order here. I am the governor, you know, and it is the governor's job to see that everything is in order. Carry on!

AMARK0
DIALOG | Amark  | Oh... hey...
DIALOG | P_NAME | Hi.
DIALOG | Amark  | How did you get in here?
DIALOG | P_NAME | I walked in? I don't know what you mean.
DIALOG | Amark  | Oh, thought I locked the door.
DIALOG | P_NAME | I'm sorry. I can leave if you want.
DIALOG | Amark  | No, you just surprised me, that's all. You can hang around if you want.
QUEST  | amarkState = 1

AMARK1
DIALOG | P_NAME | Why did you mean to lock the door?
DIALOG | Amark  | The door? I don't know. Does it seem like that unusual of a thing to do?
DIALOG | P_NAME | I guess it shouldn't. Are you hiding from something?
DIALOG | Amark  | I don't know if hide is the right word. Out there, there's just... There's too much... eh...
DIALOG | P_NAME | Too much what?
DIALOG | Amark  | Just too much. Too much everything. There's this layer of despair out there, I don't think most of the others even really see it. It's hard to watch...
DIALOG | P_NAME | Yeah, I know what you mean. Maybe that's why I wandered in here.
DIALOG | Amark  | Probably is.
QUEST  | amarkState = 2

AMARK2
DIALOG | Amark  | Hey, you're looking at me kinda funny. Do you need help with something?
CHOICE | I'm doing alright, it's just...
REPLY  | HOW    | Just seeing how you're doing.
REPLY  | WHAT   | So what's your story, anyway?

HOW
DIALOG | P_NAME | No, it's nothing. Just seeing how you're doing.
DIALOG | Amark  | You know, you're the only person that's ever asked me that since I got here. I keep to myself, yeah, but it's still nice to hear. Anyway, yeah, doing good. Better today. Thanks for asking. How are you?
DIALOG | P_NAME | I don't know. Hanging in there, I guess.
DIALOG | Amark  | You and me both could use some better fortune, I think. Here's hoping things turn out ok for us lost souls.

WHAT
DIALOG | P_NAME | So what's your story, anyway?
DIALOG | Amark  | My story?
DIALOG | P_NAME | Yeah. You don't seem to go out much, you keep the door locked. I'm just interested, I guess.
DIALOG | Amark  | Huh, yeah I guess that is a little weird. At least here, anyway. To tell you the truth, though, I don't have a story. Or if I do, I don't remember it. I have amnesia. I don't remember anything since I ended up here.
DIALOG | P_NAME | What? You have amnesia?!?
DIALOG | Amark  | Uh, yeah? There's not a lot for me to gain by lying about that, is there? It's just amnesia. I'm not asking for anything from you. You asked.
DIALOG | P_NAME | No, it's just... I have amnesia too. I can't remember anything either.
DIALOG | Amark  | No... you're pulling my leg.
DIALOG | P_NAME | I'm serious, I have amnesia too.
DIALOG | Amark  | Wow. I had to check myself right there. My first reaction was to say how cool it is to find someone else going through what I'm going through... but that's not right at all. My life's been hell since I woke up. The more I think about it, the more it hurts to think I'm not the only one going through that. I'm sorry. I wish I was the only one who had to experience this. Nobody should have to lose this much.
DIALOG | P_NAME | Yeah, me too... Hey, do you think we're connected in some way? Maybe we got the amnesia together?
DIALOG | Amark  | I don't know. I don't think I recognize you at all. Have you been getting the headaches too?
DIALOG | P_NAME | Headaches? No, I feel ok.
DIALOG | Amark  | Do you have any weird scars? I've got a couple on my head, a couple more on my chest. There's something implanted under the skin of my arm too. It beeps sometimes. Do you have any of that?
DIALOG | P_NAME | No, nothing quite like that. Does that thing hurt at all?
DIALOG | Amark  | No, it just beeps. Strangest thing... Hmm... Maybe our amnesia is just an odd coincidence, then. I don't know.
DIALOG | P_NAME | I guess that's possible.
DIALOG | Amark  | Hmm... this changes everything... I thought it was just me...
QUEST  | amarkState = 3

AMARK3
DIALOG | Amark  | This really does change everything. //I think when you leave I'm going to lock the door behind you for a few days. I need to digest all of this...
DIALOG | P_NAME | Are you going to just stay around here?
DIALOG | Amark  | I... yeah, aren't you?
DIALOG | P_NAME | I don't think so. This place is bad news. I'm going to try getting out.
DIALOG | Amark  | Really? How?
DIALOG | P_NAME | I'm not sure yet, but it's something I need to do.
DIALOG | Amark  | Huh... I was actually getting kinda excited about having someone around town now that I can talk to. You sure you aren't going to stick around a little longer?
DIALOG | P_NAME | I'm sorry. I've got things to do, I can't stay.
DIALOG | Amark  | Yeah, it's okay, I don't blame you. If I could, I'd leave too.
DIALOG | P_NAME | Hey, maybe we could go together? It gets a little lonely just wandering around by myself. We could look after each other.
DIALOG | Amark  | I... I don't think you really need dead weight like me. I see what you're carrying. I'd just be a liability. You don't need that.
DIALOG | P_NAME | I don't mind. It'd be cool having someone to talk to.
DIALOG | Amark  | No, I'd feel wrong about that. I've overheard people talking about what it's like out there. I wouldn't last five minutes.
DIALOG | P_NAME | Okay, if you're sure.
DIALOG | Amark  | Yeah, I think so. But thanks for the offer. It really means a lot that you'd say that. And who knows? Maybe I'll get the nerve to leave on my own sometime. I wouldn't count on it, but you never know I guess.
DIALOG | P_NAME | I hope we meet again. Maybe our memories will have come back by then. Then we can find out who the heck we've been talking to all this time.
DIALOG | Amark  | Ha ha, yeah. That's a nice dream, isn't it?
QUEST  | amarkState = 4
QUEST  | amarkLeave = 1

AMARK4
DIALOG | Amark  | So long, I guess. Maybe we'll bump into each other in another life. Stay safe, buddy.
";
