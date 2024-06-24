/*//Machinist Sepideh
//Machinist in Wasteland Dwarf Zone. Involved in a series of quests; get power for her, build machine.

//------------------------------------------------------------------------------
//*** Unspoken to, < 9 time ***
//------------------------------------------------------------------------------

Machinist Sepideh:
Hey kid, you know anything about machines?

X114JAM9:
Not really...

Machinist Sepideh:
What about electricity? You know anything about electricity?

X114JAM9:
I guess so.

Machinist Sepideh:
Yeah, you've got that look. I got a job for you. I'm working on something, a machine, but I've hit a roadblock: I'm gonna need more juice if I wanna get this thing running. No bones about it. Not a single bone. There's supposed to be some kind of generator west of here but I don't know where it is. You think maybe you have the time to divert power to the Industrial Park?

//multiple choice

Sure.

X114JAM9:
I don't know if I'm heading that way, but I'll give it a shot if I do. How do you divert power?

Machinist Sepideh:
A lot of these old generators use modular battery systems - if there's an unused battery installed, diverting power's as easy as telling it where to go. Installingbatteries is pretty easy too, just plug 'em in. In a lot of ways, they're more efficient than modern generators. Except, I guess, for the smoke and fires.

X114JAM9:
Alright, this doesn't sound too hard. I'll let you know if I get power to the Industrial Park.

Machinist Sepideh:
Thanks, kid.

//sepidehVar = 1
//end conversation

I don't think so.

X114JAM9:
I don't think I'm going that way. Sorry.

Machinist Sepideh:
Guess I had you pegged wrong. Too bad, kid. I'll just have to do it myself.

//sepidehVar = 2
//end conversation

//if you have a battery
What about this battery?

X114JAM9:
I've got a battery, would this work?

Machinist Sepideh:
Hmmm, lemme see... yeah, this might be a decent temporary solution. I can get enough juice out of this bad boy to finish up the thing I'm working on. You mind if Ihave this?

Sure, you can have it.

X114JAM9:
Sure, I don't mind.

Machinist Sepideh:
Hey, you're alright! Thanks, kid! I'll put this to good use. Hey, I've had this armory key sitting around for a while and I'm never going to get around to using it. The armory's to the west near the old generator, why don't you take it?

X114JAM9:
Wow, thanks!

Machinist Sepideh:
You know, I won't be done with this thing for a while. Why don't you come and visit me again in a little while when this is done?

X114JAM9:
Yeah, I'll be sure to check up on you. Good luck!

//lose battery
//get level 2 armory key
//sepidehVar = 3;
//end dialogue;

Sorry, I'm keeping it.

X114JAM9:
Sorry, I think I'm holding onto this.

Machinist Sepideh:
Yeah, I don't blame you. I wouldn't be in this predicament if I had a few batteries of my own. In that case, you're gonna need to head west to the old generator station and divert power to the Industrial Park.

X114JAM9:
How do I divert power?

Machinist Sepideh:
It's real easy, most of these old generators use modular battery systems - if there's an unused battery hooked up, all you've got to do is tell it where to go. If the power's already been diverted, all you've gotta do is install another battery like the one you've got there. They're real simple.

X114JAM9:
Well I don't know if I'm going that way, but if I do I'll be sure to give it a look.

Machinist Sepideh:
Thanks, kid. Appreciate it.

//sepidehVar = 1;
//end dialogue;

//if you've already diverted power
I've already diverted the power somewhere else.

X114JAM9:
Oh, I've already been there but I diverted the power somewhere else.

Machinist Sepideh:
Hmmm, then you'll need to install a new battery into the generator console. That's the thing with most of these old generators - they use modular battery systems so if you want to get more juice out of them, all you need to do is put in another battery. But if I knew where to get a battery, I wouldn't be in this predicament.

X114JAM9:
I'll look around for batteries then. All I've got to do is install the battery into the generator and divert the power to the Industrial Park?

Machinist Sepideh:
Yep, you've got it. Thanks, kid.

//sepidehVar = 1;
//end dialogue;


//------------------------------------------------------------------------------
//** sepidehVar > 0 **
//------------------------------------------------------------------------------

Machinist Sepideh:
Hey, it's you. I'm working right now, you want something?

//choices

What are you working on?

X114JAM9:
What are you working on?

Machinist Sepideh:
Classified. Can't talk about it. But it'll do this place a load of good.

X114JAM9:
Oh, okay...

Machinist Sepideh:
Anything else?

//back to choices;

//if sepidehVar = 2;
What was that power thing you were talking about earlier?

X114JAM9:
Hey, what was that power thing you were talking about earlier?

Machinist Sepideh:
I'm working on something that's gonna need a lot more power to get running. There's a generator somewhere west of here that I'm sure can divert the power I need to get this thing working but I'm not really sure where it is. Since you're traveling around, do you think you'd have the time to find the generator and divert power to the Industrial Park?

Sure, I can do that.

X114JAM9:
Sure, I think I can do that. How do I divert the power?

Machinist Sepideh:
Great. A lot of these old generators use modular battery systems - as long as there's an unused battery in the system, all you've gotta do is tell it where to send power. If you've already used up all the batteries, getting more power is as easy as installing another battery. These old systems were real simple, not like the bunkum we've got today.

X114JAM9:
Yeah, that sounds pretty easy. So I send the power to the Industrial Park?

Machinist Sepideh:
Yeah.

X114JAM9:
Alright, I'll let you know when I've diverted the power. See you later!

//sepidehVar = 1;
//end dialogue;

I don't think I'll have the time. Sorry.

X114JAM9:
I'm not sure I'm going to have the time to do that. I'm kind of busy. Sorry.

Machinist Sepideh:
Yeah, figured as much. I'll get this done one way or another. More power would've been nice though.

//end dialogue;

//if sepidehVar = 1;
How do I get to the generator again?

X114JAM9:
Hey, how do I get to that generator again?

Machinist Sepideh:
I'm not too sure, never been there myself. I know it's somewhere west of here but I don't know specifically where. All you've got to do is divert power to the Industrial Park through the console. If you've already diverted power somewhere else, all you've gotta do is install another battery. It's real simple.

X114JAM9:
Okay, thanks!

Machinist Sepideh:
Anything else?

//return to choices.

//if figbottomQuest > 2 & < 9;
Do you know anything about the murder of Figbottom?

X114JAM9:
I'm investigating Figbottom's death. Do you know anything about it?

Machinist Sepideh:
Nope.

X114JAM9:
Oh...

Machinist Sepideh:
Anything else?

//return to choices.

//if you have a battery and sepidehVar = 1;
I've got this battery, would you be able to use this?

X114JAM9:
I've got this battery, would you be able to use this?

Machinist Sepideh:
Hmmm, lemme see... yeah, this might be a decent temporary solution. I can get enough juice out of this bad boy to finish up the thing I'm working on. You mind if Ihave this?

Sure, you can have it.

X114JAM9:
Sure, I don't mind.

Machinist Sepideh:
Hey, you're alright! Thanks, kid! I'll put this to good use. Hey, I've had this armory key sitting around for a while and I'm never going to get around to using it. The armory's to the west near the old generator, why don't you take it?

X114JAM9:
Wow, thanks!

Machinist Sepideh:
You know, I won't be done with this thing for a while. Why don't you come and visit me again in a little while when this is done?

X114JAM9:
Yeah, I'll be sure to check up on you. Good luck!

//lose battery
//get level 2 armory key
//sepidehVar = 3;
//end dialogue;

Sorry, I'm keeping it.

X114JAM9:
Sorry, I think I'm holding onto this.

Machinist Sepideh:
Yeah, I don't blame you. I wouldn't be in this predicament if I had a few batteries of my own. In that case, you're gonna need to head west to the old generator station and divert power to the Industrial Park.

X114JAM9:
How do I divert power?

Machinist Sepideh:
It's real easy, most of these old generators use modular battery systems - if there's an unused battery hooked up, all you've got to do is tell it where to go. If the power's already been diverted, all you've gotta do is install another battery like the one you've got there. They're real simple.

X114JAM9:
Well I don't know if I'm going that way, but if I do I'll be sure to give it a look.

Machinist Sepideh:
Thanks, kid. Appreciate it.

//end dialogue;

//if sepidehMachine = 0;
You seem to know a lot about machines.

X114JAM9:
You really know a lot about machines, huh?

Machinist Sepideh:
Yep. Someone's gotta know about machines out here in this junk yard, so why not me? But I like working with machines. I like working with my hands and making things. Those gun's all along the perimeter? I made those. The water pumps, the circuit systems powering this place, the central computer system; I made 'em all.

X114JAM9:
Wow, that's amazing. You made everything?

Machinist Sepideh:
When I make things, things that can run on their own like the turrets, I feel like I'm creating life. Maybe that doesn't make much sense to you, but I feel like... like these machines are my children kind of. People in the Industrial Park think I'm the crazy machine dwarf and maybe I am a little bit, but I've never been able to connect with people on the same level that I can connect with machines, especially my own. I suppose I enjoy the solitude and distance my work provides me. 

No, you don't sound crazy.

X114JAM9:
You don't sound crazy to me. I mean, I don't think I understand completely, but I appreciate your passion for machines.

Machinist Sepideh:
Thanks, kid. You're alright. I guess I'm sort of a live and let live person; people should just do their own thing and mine is making machines, you know? If you've ever got any questions about machines or you just want to talk about 'em, lemme know.

X114JAM9:
Sure thing!

Machinist Sepideh:
Now, is there anything else?

//sepidehMachine = 2;
//go back to choices;

It's like art for you, right?

X114JAM9:
I think I understand. It's kind of like art for you, right?

Machinist Sepideh:
No, no... not really. For me, building machines is something even more personal than art. These are living creatures with functions, with a purpose. That doesn't mean art doesn't have a purpose, but art doesn't breathe the same way my machines do. They're more than just creations to me, they're children.

X114JAM9:
Oh...

Machinist Sepideh:
Well is there anything else? I'm busy.

//sepidehMachine = 1;
//go back to choices;

Yeah, that sounds a little weird.

X114JAM9:
Yeah, that sounds a little weird...

Machinist Sepideh:
I guess it does. But if you want to work with machines, you have to imbue a little of yourself into everything you make. I don't know if machines have souls, maybe they don't, but when you've put this much of yourself into them, you sometimes have to wonder. That's all.

X114JAM9:
I don't know about that...

Machinist Sepideh:
Well is there anything else? I'm busy.

//sepidehMachine = 1;
//go back to choices;

I feel like save files in vidcons are my children.

X114JAM9:
When I'm playing vidcons and I put hundreds of hours into them, I kind of feel like the save files are my children.

Machinist Sepideh:
Is that... is that really how you feel?

X114JAM9:
Yeah.

Machinist Sepideh:
Putting hundreds of hours of yourself into something, no matter what it is, no matter what it becomes... that's what I do with my machines. But it's about more than just that; seeing it move and function and do the things it was created to do. You get it, kid. You get machines and you get me. I think you've got the same deep connection with machines that I do. I like you.

X114JAM9:
Heh, geez...

Machinist Sepideh:
If you ever want to talk about machines or you've got questions, lemme know. Is there anything else?

//transhumanism +=1;
//sepidehMachine = 2;
//go back to choices;

//sepidehMachine = 2 and oozeTurret = 1;
You made the turret system, right? Can you tell me a little about it?

X114JAM9:
You made the turret system, right? Can you tell me anything about it?

Machinist Sepideh:
Well there are 6 turrets in total and they're all connected to the central computer in the jail. They run on a 200 kHz charge and interface directly with my custom-made matrix operating system. I made 'em out of scraps I found in the junk yard but they're pretty sturdy. In fact, I'm pretty proud of the whole system.

X114JAM9:
This sounds like that would take a lot of resources. Where do you get the power from?

Machinist Sepideh:
That's the best part. I'm actually hacked into the Tir na Nog grid. It's hard to find, but in the Junk Yard south of here next to a bunch of shopping carts is a little generator room where I've jacked the turrets into Cuchulainn's power system. Isn't that great? We're fighting Cuchulainn with his own power. I love it.

X114JAM9:
Haha, that's pretty great. You're a pretty clever engineer!

Machinist Sepideh:
Thanks, kid! Anything to help out an aspiring machinist. Anything else?

//return to choices;

No, I guess not.

X114JAM9:
No, I guess not. Thanks for the time.

Machinist Sepideh:
Yep, see you later.

//end dialogue;



//------------------------------------------------------------------------------
//*** industrialPower = 1 and sepidehVar = 0; ***
//------------------------------------------------------------------------------

Machinist Sepideh:
Hey you, are you the one who diverted power to the Industrial Park?

X114JAM9:
Me?

Machinist Sepideh:
Yes, you! Our power output more than doubled just a little while ago and you walk into town all nonchalant. Was it you?

X114JAM9:
Well, I found this generator out there and it asked me where I wanted to send additional power, so I selected the Industrial Park.

Machinist Sepideh:
Well you did me one heck of a favor, kid. I've been working on this contraption for a while now but I haven't had the power I needed to get this thing running right. I appreciate it. I've had this armory key sitting around for a while, why don't you take it?

X114JAM9:
Wow, thanks. To be honest, I didn't really know what I was doing. It was kind of like a vidcon.

Machinist Sepideh:
I'll be working on this thing for a while, but why don't you come back in a little bit. I might have some work for you.

X114JAM9:
Yeah, I'll do that. Thanks.

//sepidehVar = 3;
//get armory key;
//end dialogue;



//------------------------------------------------------------------------------
// *** industrialPower = 1 and sepidehVar > 0; ***
//------------------------------------------------------------------------------

Machinist Sepideh:
Hey, that was you, wasn't it? You sent power to the Industrial Park, didn't you?

X114JAM9:
Yeah, did it work?

Machinist Sepideh:
Like a charm! We've got more power here than I know what to do with! You're great, kid! I didn't actually expect you to find that generator, but you pulled it off. Hey, I've had this armory key sitting around forever but I'm never gonna use it, why don't you take it? I think the armory's supposed to be somewhere close to that generator.

X114JAM9:
Wow, thanks!

Machinist Sepideh:
Yeah, no problem. I'm gonna be working on this thing for a while, but why don't you come back and visit me sometime in the future? I might have some more work for you.

X114JAM9:
Sure, I'll try to make it back. Thanks, Sepideh.

//sepidehVar = 3;
//get armory key;
//end conversation;

*/
