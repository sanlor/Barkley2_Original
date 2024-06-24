script = "
IF body == matthias | GOTO | MATTHIAS
IF body == governor | GOTO | GOVERNOR
IF bobState == 0    | GOTO | BOB0
IF bobState == 1    | GOTO | BOB1
IF bobState == 2    | GOTO | BOB2
IF bobState == 3    | GOTO | BOB3
GOTO | BOB4

MATTHIAS
DIALOG | BOB | Hi there!! Would you like to buy a......\Uh_._._.nevermind_._._.

GOVERNOR
DIALOG | BOB | Sorry but somebody already bought me. I'm not for sale at all. Not one bit!!

BOB0
DIALOG | BOB    | Hi. I'm Bob.
DIALOG | P_NAME | Oh. Hi. I didn't know you could talk.
DIALOG | BOB    | Yep, I can talk. Cuthbert taught me. Business isn't so good so he has plenty of free time.\Cuthbert tells me I should talk to all the customers, ask how they're doing.
DIALOG | P_NAME | Oh._._._. Well, that's nice of him.
DIALOG | BOB    | Yeah, he's a pretty nice guy.
DIALOG | BOB    | So.___.___.___.\ how are you doing?
DIALOG | P_NAME | I'm fine, I guess.
DIALOG | BOB    | Good, good, great.....\So.___.___.___want to buy a kobold?
DIALOG | P_NAME | I don't think I should. I don't have a home or anything. It'd probably be a bad idea to buy a pet without a home.
DIALOG | BOB    | Yeah... well... thanks for stopping by the shop I guess.
QUEST  | bobState = 1

BOB1
DIALOG | P_NAME | It doesn't look really comfortable in there.
DIALOG | BOB    | It's not so bad. Cuthbert said he'd get me a bigger tank if business wasn't so bad, but I'm used to it. You ever been in a tank before?
DIALOG | P_NAME | Well I woke up in an egg.
DIALOG | BOB    | Why?
DIALOG | P_NAME | I don't know. But I don't think I really want to go back.
DIALOG | BOB    | Yeah, probably not. But you never know I guess.___.___.___.Hey! Do you want to try it out? I can get out and you can give it a try. I don't know anything about you, maybe you'll really like being in a tank.
DIALOG | P_NAME | Uh... I don't think so. I'm too big I think. I don't want to break it.
DIALOG | BOB    | Yeah, I guess you're right... It'd be really bad if my tank got broken. It's the only thing I've got. I think Cuthbert would be really upset with me if I let somebody break the tank.
DIALOG | P_NAME | Yeah, I-
DIALOG | BOB    | Oh! The tank is extra! It's not included when you buy me. Did I say that already?
DIALOG | P_NAME | No, you didn't.
DIALOG | BOB    | Yeah, it's extra, I'm supposed to say that. They're kinda expensive, a lot more expensive than a kobold. I can kinda see why, they're pretty cool. This one is pretty small, but you can put all kinds of things in them. They're pretty great. I like tanks a lot.
DIALOG | P_NAME | I can see th-
DIALOG | BOB    | I hope Cuthbert doesn't decide to just sell my tank. That would really stink. It wouldn't be his fault, business just isn't good, but I'd really miss my tank. I hope he doesn't sell it.
DIALOG | P_NAME | Yeah, ok! It's been nice talking to you Bob but I need to go.
DIALOG | BOB    | Oh, ok! Thanks for the talk. I didn't realize how much I like my tank until we talked about it for a while. Something about you really gets me thinking about stuff.
QUEST  | bobState = 2

BOB2
DIALOG | P_NAME | Don't you get tired of being stuck here? Have you ever thought of escaping?
DIALOG | BOB    | I don't know. Not really, I guess. I don't know where else I'd go.
DIALOG | P_NAME | You could go back to where you came from, I guess. Where are you from?
DIALOG | BOB    | The sewers. Cuthbert told me he saved me from there when I was a baby. He says I was getting kicked around by some Duergars down there, so he stepped in and rescued me.
DIALOG | P_NAME | Wow! I wouldn't have thought it by looking at him. He doesn't look like much of a fighter.
DIALOG | BOB    | I wouldn't know. He said there were twenty of them all huddled around, hitting and kicking me.
DIALOG | P_NAME | Twenty, huh?
DIALOG | BOB    | That's what Cuthbert always said.
DIALOG | P_NAME | Do you think that's how it really happened?
DIALOG | BOB    | No, not really. He probably killed my parents to get to me.____________ But it makes for a nicer story, don't you think?
QUEST  | bobState = 3

BOB3
IF ericQuest == 9 | GOTO | ERIC
DIALOG | BOB    | I'll be here if you change your mind about buying a kobold. We make good pets I think.\Actually I don't really know but I'll try hard to be a good pet.

ERIC
DIALOG | BOB    | There was some loud guy here earlier talking about you.
DIALOG | P_NAME | Oh, that was Eric. He works here now, I got him a job.
DIALOG | BOB    | Oh... So he'll be back?
DIALOG | P_NAME | Yeah, probably.
DIALOG | BOB    | That's a shame. He's not a very nice guy. He said something about there being no bounds of your remarkable vapidity. I don't know what all that means, but he didn't say it in a particularly nice way.
DIALOG | P_NAME | Yeah, he's like that.
DIALOG | BOB    | I don't like Eric. He smells funny. He brought all his stupid pets with him. I'm glad Cuthbert doesn't have pets as rotten as Eric's pets. One of his ferrets bit me. Oh, can you do me a favor?
DIALOG | P_NAME | I guess.
DIALOG | BOB    | When you leave, can you make sure you close the door all the way? He keeps walking by the shop yelling about his manifesto. I won't be able to hear him as well if the door is closed all the way. I'd rather not be able to hear him.
DIALOG | P_NAME | No problem.
QUEST  | bobState = 4

BOB4
DIALOG | BOB    | I'll be here if you change your mind about buying a kobold. We make good pets I think.\Actually I don't really know but I'll try hard to be a good pet.
";
