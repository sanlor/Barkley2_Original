/*//Ooze in Industrial Park
//Ooze in Dwarf Zone Wasteland. Appears only at Time 12.

//------------------------------------------------------------------------------
// *** oozeTurret = 6 ***
//------------------------------------------------------------------------------

//Ooze doesn't exist.

//------------------------------------------------------------------------------
// *** time > 12 or time < 12 ***
//------------------------------------------------------------------------------

//Ooze doesn't exist.


//------------------------------------------------------------------------------
// *** oozeTurret = 5 ***
//------------------------------------------------------------------------------

Ooze:
We each got what we wanted. Nothing else to say.

//end dialogue;

//------------------------------------------------------------------------------
// *** oozeTurret = 4 ***
//------------------------------------------------------------------------------

X114JAM9:
Okay Ooze, I did it. I disabled the turrets. They're down and nobody knows it.

Ooze:
Alright, good.

X114JAM9:
I think you owe me an answer now.

Ooze:
Yeah, whatever. Make it quick.

X114JAM9:
Okay...

//if mainQuest = 0
Who am I?

X114JAM9:
I woke up in the generator room of the Necron 7 without my memory. I have no connection to anyone here, I don't know who Cuchulainn or the Cyberdwarf are, I don't know why I'm here...

Ooze:
Shut up, I know all this stuff.

X114JAM9:
...who am I?

Ooze:
If you're looking for a name, I can't help you. But I know this: you're important to Cuchulainn. He put you in a millennia-long stasis and used your body as the generator core of the Necron 7. Apparently you produce an extraordinary amount of b-ball energy. Cuchulainn wants you alive, but he's almost at the point where he doesn't need you anymore. But you're also real important to the Cyberdwarf too. Don't know why. But I don't know who you used to be before all this.

X114JAM9:
Wh-what?

Ooze:
You're not the only you, too. There are more of you.

X114JAM9:
More of me? What does that mean?

Ooze:
You got an answer.

X114JAM9:
But... but I have so many more questions. What does any of that mean?

Ooze:
No idea. I've got stuff to do.

X114JAM9:
Will you tell me more later?

Ooze:
Nope. See you.

X114JAM9:
...

//time ++
//oozeVar ++
//oozeTurret = 5
//oozeIdentity = 1
//end dialogue;

//if mainQuest = 0
Where is the Cyberdwarf?

X114JAM9:
Where can I find the Cyberdwarf?

Ooze:
Not sure, but I know this - Cyberdwarf is the leader of the L.O.N.G.I.N.U.S. rebels and they hang out around Brain City. It's south of here, pretty far, beyond the Swamp.

X114JAM9:
So you think I'll find him in Brain City?

Ooze:
He's an AI so he's probably everywhere. Cuchulainn is. But I guess if I had to look somewhere, I'd start there.

X114JAM9:
Huh... thanks, I guess...

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;

//if mainQuest = 1
Where can I find the pieces of the Cyberspear?

X114JAM9:
Where can I find the pieces of the Cyberspear?

Ooze:
I'm looking for 'em too. You seen the Brain yet? The one in Brain City? I've got a feeling about it, like it's hiding something. I think it's got something and I want it. I don't know if it's the Cyberspear, but it's something big for sure.

X114JAM9:
Wait, so you think I should kill the Brain?

Ooze:
It'd be hard to take in a one-on-one fight. Maybe overload it with power or something. But there's definitely something underneath it.

X114JAM9:
Huh... I didn't know about that. Thanks Ooze.

Ooze:
Piss off.

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;

Who is the Cyberdwarf?

X114JAM9:
Who is the Cyberdwarf? Do you know anything about him? Why is he so important?

Ooze:
He's an AI, same as Cuchulainn. He's also the leader of L.O.N.G.I.N.U.S. - the rebel dwarfs fighting Cuchulainn. You know what they're fighting about?

X114JAM9:
Sort of... Cuchulainn is rounding up all the dwarfs in the galaxy into Tir na Nog. The L.O.N.G.I.N.U.S. dwarfs are trying to stop him and escape back home, right?

Ooze:
That's the pretext, yeah. But I think the conflict between Cyberdwarf and Cuchulainn might be different than the conflict between L.O.N.G.I.N.U.S. and Cuchulainn. You seem to be pretty important to Cyberdwarf.

X114JAM9:
Important? What do you mean? Do you know why he would know about me?

Ooze:
He offered me a job a while ago. Cuchulainn offered me the same job for more, so I took it.

X114JAM9:
A job? What job?

Ooze:
You got an answer. Piss off.

X114JAM9:
...

//time ++
//oozeVar ++
//oozeJob = 1
//oozeTurret = 5
//end dialogue;

Who is Cuchulainn?

X114JAM9:
Who is Cuchulainn and why is he rounding up all the dwarfs?

Ooze:
There's no real answer to that question. Cuchulainn is and has been a lot of things. He's an AI and the master of the dwarf space ziggurat Necron 7. He's also the master of the Bainshees, these undead monster ladies you might see around. Straight out of a nightmare or something. The Duergars are his labor force but the Bainshees... I don't know. But they don't give me any trouble.

X114JAM9:
That doesn't really answer my questions.

Ooze:
I don't know why he's rounding up dwarfs. Some people say he used to be a dwarf a long time ago, others say he's got a vendetta against them and more say he's rounding them up to give them a prize. Maybe there's something to all those answers. Why don't you ask him yourself? He's on the top floor of the Necron 7. Take the Necron 7 Elevator all the way to the top. You'll need the Cyberspear of Destiny to ride it, though.

X114JAM9:
Hmm... maybe I'll do that. Thanks Ooze.

Ooze:
Piss off.

X114JAM9:
...

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;

Who are you?

X114JAM9:
Who are you? Why do you seem to know everything?

Ooze:
Me? Nobody. B.I.O. Magician. Work for Cuchulainn, that's all. Freelancer. So's Slag, if you know him.

X114JAM9:
I guess that explains the whole turret thing...

Ooze:
You blew your question on this one.

X114JAM9:
So if you work for Cuchulainn, what do you do all day?

Ooze:
Whatever I want. Piss off, kid.

X114JAM9:
...

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;

How can I get stronger?

X114JAM9:
I want to get stronger. What's the best way to get strong here?

Ooze:
You into zaubers?

Yeah.

X114JAM9:
Yeah, definitely.

Ooze:
Cool. There are supposed to be legendary zaubermancers hiding out all over the place. Real reclusive, real hard to find, but they supposedly train those who prove their dedication to the zaubers. There's this guy who lives in the swamp, I've never met him but I think I've seen him a couple times. If I didn't know any better, I'd say he's probably one of the zaubermancers.

X114JAM9:
Cool, I'll keep an eye out for him.

Ooze:
There's something else too. There's supposed to be a book here, the Zaubernomicon, that confers the ultimate zauber power to the one who reads it.

X114JAM9:
Whoa, what's the ultimate zauber power?

Ooze:
I don't know, but I'm looking for it. Let me know if you find it.

X114JAM9:
Yeah, I'll do that. Thanks for the heads up.

Ooze:
Yeah. You got your answer. Now piss off.

X114JAM9:
...

//time ++
//oozeVar +2
//oozeTurret = 5
//end dialogue;

Not really, anything else?

X114JAM9:
Not really, anything else?

Ooze:
There's a place I've heard about, a minotaur's labyrinth, that's supposed to have a lot of treasure. If you enter the Duergar Mines and go down as far as you can, you'll find the entrance. The door is locked, but I know how to get in - the password is 't43s3us'. I don't know if that's the kind of thing you're looking for, but maybe you'll find something that'll make you stronger there.

X114JAM9:
Huh, sounds interesting. I'll look into it. Thanks, Ooze.

Ooze:
Piss off.

X114JAM9:
...

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;

How can I get off the Necron 7?

X114JAM9:
How can I get off of the Necron 7?

Ooze:
There are escape pods you could take. I don't know where specifically they are, but I'm sure there are some around. Probably Brain City or something. There's also Slag's ship. Slag's a guy I work with, a repulsive, sleazy kobold. He leaves it at the landing pad at the Duergar Mines. You'll either need to hotwire it or get the launch codes from him, but he probably won't just give them to you.

X114JAM9:
Then how do I get them?

Ooze:
Kill him I guess.

X114JAM9:
Oh... maybe I can find some other way.

Ooze:
Maybe. Leave me alone.

X114JAM9:
Oh... see you...

//time ++
//oozeVar ++
//oozeTurret = 5
//end dialogue;



//------------------------------------------------------------------------------
// *** oozeTurret = 1 ***
//------------------------------------------------------------------------------

Ooze:
Hurry up. Hack the computer in the jail or find some other way to disable the turrets. I'm not waiting all day.

//end dialogue;


//------------------------------------------------------------------------------
// *** oozeTurret = 2 ***
//------------------------------------------------------------------------------

Ooze:
Piss off, kid. We've got nothing to talk about.

//end dialogue;


//------------------------------------------------------------------------------
// *** Time = 12 ***
//------------------------------------------------------------------------------

Ooze:
Hey X114JAM9, c'mere!

//if oozeSpoken = 0
X114JAM9:
Huh, do I know you?

//else if oozeVar > 0
X114JAM9:
Huh? Hey Ooze, what are you doing here?

//else if oozeVar < 0
X114JAM9:
Ooze? What do you want?

//else if oozeSpoken = 1 & oozeTirNaNog = 1
X114JAM9:
Hey, you're Ooze, right? Didn't I see you in Tir na Nog?

//else if oozeSpoken > 0
X114JAM9:
Ooze?

Ooze:
Shut up, don't talk so loud! I've got a proposition for you.

X114JAM9:
Wait, how do you know who I am?

Ooze:
Listen, I'm only gonna make this offer once. You take it or you leave it but there's no coming back. I need you to disable the turrets protecting the Industrial Park. If you do this, I'll answer any question you ask me. I don't have time to fuck around, if you take this job, you do it immediately.

//if mainQuest = 0
X114JAM9:
You'll answer any question? Like... who I am? Or who Cuchulainn is? Or where I can find the Cyberdwarf?

//else if mainQuest = 1
X114JAM9:
You'll answer any question? Like where I can find the Cyberspear? Or who Cuchulainn is?

//else
X114JAM9:
You'll answer any question? Like who Cuchulainn is or who I am? Or what the Cyberspear is?

Ooze:
Keep it down. I'll tell you whatever. You in?

I'm in.

X114JAM9:
...okay. I'll do it. But I don't like this and I'm only doing it to get answers, okay? If anything happens to the Industrial Park, I'll know who to blame.

Ooze:
Yeah, yourself. I need this done now. Whatever you're doing, put it on hold because I'm not gonna wait around for you. If you fuck this up, it's your own fault. Now listen, the turrets are all connected to a computer terminal in the jail. If you can hack the terminal, you can disable the turrets without there being any signs of tampering. Maybe there are other ways to disable the turrets too, but don't mess with 'em directly because I don't want here to be any visible evidence.

X114JAM9:
Hacking, huh...

Ooze:
Do it however you want, I don't care. But don't take long because I need this done now. Get moving and don't mention me to anyone. I'll kill you if you tell Marshal Masego about this or bail on me. I'm not fucking around, I'll end your life. Now go.

X114JAM9:
What did I get myself into...

//oozeSpoken ++
//oozeIndustrial = 1
//oozeTurret = 1
//end dialogue;

No way.

X114JAM9:
No, I'm not gonna do it. I can't put the dwarfs at risk like that. And how do I even know I can trust you? How come you know everything?

Ooze:
Whatever.

X114JAM9:
Wh-whatever? That's it?

Ooze:
Yeah. Piss off.

X114JAM9:
...

//oozeSpoken ++
//oozeIndustrial = 1
//oozeTurret = 2
//end dialogue;*/
