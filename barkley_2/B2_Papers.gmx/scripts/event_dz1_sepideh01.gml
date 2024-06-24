// Involved in a series of quests; get power for her, build machine.
/*
sepidehState
    0 - Not talked to
    1 - Declined Quest
    2 - Accepted Quest
    3 - Power diverted   
*/ 

script = "
IF sepidehState == 0 | GOTO | SEPIDEH_0
IF sepidehState == 1 | GOTO | SEPIDEH_1
IF sepidehState == 2 | GOTO | SEPIDEH_2
IF sepidehState == 3 | GOTO | SEPIDEH_3

SEPIDEH_0
" +
//TODO: FRAME TO SEPIDEH and the Action
"
DIALOG | Sepideh | Oh c'mon baby just a touch more juice... just a touch more juice!
" +
//TODO: Sepideh works on a machine and it powers down
"
DIALOG | Sepideh | Confound it!
DIALOG | P_NAME  | Uh, excuse me?
DIALOG | Sepideh | That's the last of the juice... damnit, I lost the last of the juice.
WAIT | 1.0
Emote | ? | o_sepideh01 | 0 | 0
LOOKAT | o_sepideh01 | o_cts_hoopz
WAIT | 0.5
DIALOG | Sepideh | Look man, we just ran out of juice, that means I can't charge anyone's digital portable media players anymore.
DIALOG | P_NAME  | Oh well I'm not here to charge my digital portable media player. I don't even have one.
DIALOG | Sepideh | What do you mean, everyone in The Social has a digital portable media player.
DIALOG | P_NAME  | Well I'm not from around here. I hatched out of an egg a while back.
DIALOG | Sepideh | An egg, huh?
WAIT | 1.0
DIALOG | Sepideh | What kind of egg?
IF time >= 16 | GOTO | SOLONGAGO
IF time >= 6 | GOTO | BARELYREMEMBER
IF time >= 0 | GOTO | JUSTHAPPENED

SOLONGAGO
DIALOG | P_NAME | Oh man that was forever ago, like at least sixteen or so hours. I can't even remember what it looks like.
GOTO | SEPIDEHWHATEVER

BARELYREMEMBER
DIALOG | P_NAME | Oh well I can barely remember what it looks like, but it was this_ blue-ish room with all kind of tubes and things. I'm not really sure what I was doing there in the first place.
" +
//TODO: add in checks for knowEgg?
"
GOTO | SEPIDEHWHATEVER

JUSTHAPPENED
DIALOG | P_NAME | Oh sure I do, it just happened. One minute I was floating in this goop and the next minute I was hatching and these dwarfs picked me up and started taking me out of there. That's when Zane was kill-
GOTO | SEPIDEHWHATEVER

SEPIDEHWHATEVER
DIALOG | Sepideh | Okay yeah whatever, here's the deal. See this thing here?, those are called `kw`Influence Ovums.`rt`
DIALOG | P_NAME | You mean egg-?
DIALOG | Sepideh | I mean what I mean..._ Look, it's not the `kw`Ovum`rt` that's important, it's the `kw`influence`rt` that's held within it. And this one has just run dry. `sq`It needs to be recharged.`rt`
DIALOG | P_NAME | How do you do that?
DIALOG | Sepideh | Well I found this one out in the Wastelands, but I think they are hard to come by. What we need is a `kw`Dynamoeuf`rt` to draw power into the `kw`Ovum.`rt`
DIALOG | P_NAME = s_port_hoopzSurprise | Dyna-?
DIALOG | Sepideh | -mouef. Look,_ I don't know how they work or even what they really are, but I know the whole ship runs on them, and I know that there are at least three of them in that `sq`Power Station to the north.`rt`
KNOW | knowDynamoeuf | 1
KNOW | knowPowerPlant | 2
DIALOG | P_NAME  | So what can I do?
DIALOG | Sepideh | You could go in and refill this `kw`Ovum`rt`.  What do you say?
GOTO   | QUEST_ACCEPTANCE

SEPIDEH_1
" +
//TODO: repeating dialog for quest acceptance
"
GOTO   | QUEST_ACCEPTANCE

SEPIDEH_2
DIALOG | Sepideh | Hey, it's you. I'm working right now, you want something?
GOTO   | QUESTIONS

QUEST_ACCEPTANCE
CHOICE | Infiltrate the Power Plant for Sepideh?
REPLY  | HELP_SURE    | Sure, I can do that.
REPLY  | HELP_NO_TIME | I don't think I have the time.  

HELP_SURE
DIALOG | P_NAME  | Sure, I think I can do that. What else do I need to know?
DIALOG | Sepideh | Great. `sq`Take that dead one there and see if you can find where the Dynamoeufs are in the Power Plant.`rt`
DIALOG | P_NAME = s_port_hoopzSmirk | Yeah, that sounds pretty easy. I'm pretty good at solving problems.
DIALOG | Sepideh | Yeah, that's it. Was there anything else?
QUEST  | sepidehState = 2
GOTO   | QUESTIONS
                
HELP_NO_TIME                
DIALOG | P_NAME  | I'm not sure I'm going to have the time to do that. I'm kind of busy. Sorry.
DIALOG | Sepideh | Yeah, figured as much. I'll get this done one way or another. More power would've been nice though. Was there something else you wanted to talk about?
GOTO   | QUESTIONS
       
QUESTIONS     
CHOICE | I've got a question...
REPLY  | ASK_WORKING_ON | What are you working on?
IF sepidehState == 2    | REPLY | ASK_DIRECTIONS | How do I get to those eggs again?
IF figbottomQuest > 2   | IF figbottomQuest < 9 | REPLY | ASK_FIGBOTTOM | Do you know anything about the murder of Figbottom?
REPLY  | ASK_MACHINES   | You seem to know a lot about machines.
REPLY  | ASK_NEVERMIND  | Nary ye mind...

ASK_WORKING_ON
DIALOG | P_NAME  | Hey, what are you working on?
DIALOG | Sepideh | Classified. Can't talk about it. But it'll do this place a load of good.
DIALOG | P_NAME  | Oh, okay...
DIALOG | Sepideh | Anything else?
GOTO   | QUESTIONS
         
ASK_DIRECTIONS   
DIALOG | P_NAME  | Hey, how do I get to that generator again?
DIALOG | Sepideh | I'm not too sure, never been there myself. I know it's somewhere northwest of here but I don't know specifically where. All you've got to do is divert power to the Industrial Park through the console. If you've already diverted power somewhere else, all you've gotta do is install another battery. It's real simple.
DIALOG | P_NAME  | Okay, thanks!
DIALOG | Sepideh | Anything else?
GOTO   | QUESTIONS

ASK_FIGBOTTOM
DIALOG | P_NAME  | I'm investigating Figbottom's death. Do you know anything about it?
DIALOG | Sepideh | Nope.
DIALOG | P_NAME  | Oh...
DIALOG | Sepideh | Anything else?
GOTO   | QUESTIONS

ASK_MACHINES           
DIALOG | P_NAME  | You really know a lot about machines, huh?
DIALOG | Sepideh | Yep. Someone's gotta know about machines out here in this junk yard, so why not me? But I like working with machines. I like working with my hands and making things. Those gun's all along the perimeter? I made those. The water pumps, the circuit systems powering this place, the central computer system; I made 'em all.
DIALOG | P_NAME  | Wow, that's amazing.
DIALOG | Sepideh | When I make things, things that can run on their own like the turrets, I feel like I'm creating life. Maybe that doesn't make much sense to you, but I feel like... like these machines are my children kind of. People in `kw`The Social`rt` say_ /'Oh Sepideh that crazy machine lady blah blah/' and maybe I am a little bit, but I've never been able to connect with people on the same level that I can connect with machines, especially my own. I suppose I enjoy the solitude and distance my work provides me.
CHOICE | That sounds...    
REPLY  | NOT_CRAZY | You don't sound crazy.
REPLY  | LIKE_ART  | It's like art for you, right?
REPLY  | LITTLE_WEIRD | Sounds a little wack.
REPLY  | VIDCON_SAVES | I feel like save files in vidcons are my children.

ASK_NEVERMIND 
DIALOG | P_NAME  | Nary ye mind...
EXIT |

NOT_CRAZY 
DIALOG | P_NAME  | You don't sound crazy to me. I mean, I don't think I understand completely, but I appreciate your passion for machines.
DIALOG | Sepideh | Thanks, P_NAME_S. You're alright. I guess I'm sort of a live and let live person; people should just do their own thing and mine is making machines, you know? If you've ever got any questions about machines or you just want to talk about 'em, lemme know.
DIALOG | P_NAME  | Sure thing!
DIALOG | Sepideh | Now, is there anything else?
GOTO   | QUESTIONS
              
LIKE_ART
DIALOG | P_NAME  | I think I understand. It's kind of like art for you, right?
DIALOG | Sepideh | No, no... not really. For me, building machines is something even more personal than art. These are living creatures with functions, with a purpose. That doesn't mean art doesn't have a purpose, but art doesn't breathe the same way my machines do. They're more than just creations to me, they're children.
DIALOG | P_NAME  | Oh...
DIALOG | Sepideh | Well is there anything else? I'm busy.
GOTO   | QUESTIONS
        
LITTLE_WEIRD        
DIALOG | P_NAME  | Yeah, that sounds a little weird...
DIALOG | Sepideh | I guess it does. But if you want to work with machines, you have to imbue a little of yourself into everything you make. I don't know if machines have souls, maybe they don't, but when you've put this much of yourself into them, you sometimes have to wonder. That's all.
DIALOG | P_NAME  | I don't know about that...
DIALOG | Sepideh | Well is there anything else? I'm busy.
GOTO   | QUESTIONS
                                    
VIDCON_SAVES
DIALOG | P_NAME = s_port_hoopzHappy | When I'm playing vidcons and I put hundreds of hours into them, I kind of feel like the save files are my children.
DIALOG | Sepideh | Is that... is that really how you feel?
DIALOG | P_NAME  | Yeah.
DIALOG | Sepideh | Putting hundreds of hours of yourself into something, no matter what it is, no matter what it becomes... that's what I do with my machines. But it's about more than just that; seeing it move and function and do the things it was created to do. You get it, kid. You get machines and you get me. I think you've got the same deep connection with machines that I do. I like you.
DIALOG | P_NAME = s_port_hoopzHappy | Heh, geez...
DIALOG | Sepideh | If you ever want to talk about machines or you've got questions, lemme know. Is there anything else?
" +
//TODO: roundmound RM, add to vidcons
"
GOTO   | QUESTIONS

MISSION_ACCOMPLISHED
DIALOG | Sepideh | Hey, that was you, wasn't it? You sent power to the Industrial Park, didn't you?
DIALOG | P_NAME  | Yeah, did it work?
DIALOG | Sepideh | Like a charm! We've got more power here than I know what to do with! You're great, kid! I didn't actually expect you to find that generator, but you pulled it off. Hey, I've had this armory key sitting around forever but I'm never gonna use it, why don't you take it? I think the armory's supposed to be somewhere close to that generator.
DIALOG | P_NAME  | Wow, thanks!
DIALOG | Sepideh | Yeah, no problem. I'm gonna be working on this thing for a while, but why don't you come back and visit me sometime in the future? I might have some more work for you.
DIALOG | P_NAME  | Sure, I'll try to make it back. Thanks, Sepideh.
DIALOG | Sepideh | Was there anything else?
QUEST  | sepidehState = 3
//TODO: Give Armory Key.
";




/* ABYSS

DIALOG | Sepideh | Hey you, are you the one who diverted power to the Industrial Park?
DIALOG | P_NAME  | Me?
DIALOG | Sepideh | Yes, you! Our power output more than doubled just a little while ago and you walk into town all nonchalant. Was it you?
DIALOG | P_NAME  | Well, I found this generator out there and it asked me where I wanted to send additional power, so I selected the Industrial Park.
DIALOG | Sepideh | Well you did me one heck of a favor, kid. I've been working on this contraption for a while now but I haven't had the power I needed to get this thing running right. I appreciate it. I've had this armory key sitting around for a while, why don't you take it?
DIALOG | P_NAME  | Wow, thanks. To be honest, I didn't really know what I was doing. It was kind of like a vidcon.
DIALOG | Sepideh | I'll be working on this thing for a while, but why don't you come back in a little bit. I might have some work for you.
DIALOG | P_NAME  | Yeah, I'll do that. Thanks.
DIALOG | Sepideh | Was there anything else?
QUEST  | sepidehVar", 3);
QUEST  | sepidehTime", scr_time_get());
scr_event_build_quest_state_add("sepidehFavor", 1);
//TODO: Give Armory Key.

IF sepidehVar == 2 | IF batteryCount >= 1 |
           
CHOICE | I've got this battery, would you be able to use this?
                
DIALOG | P_NAME  | I've got this battery, would you be able to use this?
DIALOG | Sepideh | Hmmm, lemme see... yeah, this might be a decent temporary solution. I can get enough juice out of this bad boy to finish up the thing I'm working on. You mind if I have this?
                    
CHOICE | Give Sepideh the battery?
        
REPLY  | BATTERY_GIVE | Sure, you can have it.
      
BATTERY_GIVE              
DIALOG | P_NAME  | Sure, I don't mind.
DIALOG | Sepideh | Hey, you're alright! Thanks, kid! I'll put this to good use. Hey, I've had this armory key sitting around for a while and I'm never going to get around to using it. The armory's to the west near the old generator, why don't you take it?
DIALOG | P_NAME  | Wow, thanks!
DIALOG | Sepideh | You know, I won't be done with this thing for a while. Why don't you come and visit me again in a little while when this is done?
DIALOG | P_NAME  | Yeah, I'll be sure to check up on you. Good luck!
QUEST  | sepidehHandler = 1
QUEST  | sepidehVar = 3
QUEST  | industrialPower = 1
QUEST  | sepidehTime = scr_time_get());
QUEST  | batteryCount = -1
QUEST  | sepidehFavor = 1

REPLY  | BATTERY_KEEP | Sorry, I'm keeping it.
       
BATTERY_KEEP             
DIALOG | P_NAME | Sorry, I think I'm holding onto this.
DIALOG | Sepideh | Yeah, I don't blame you. I wouldn't be in this predicament if I had a few batteries of my own. In that case, you're gonna need to head west to the old generator station and divert power to the Industrial Park.
DIALOG | P_NAME | How do I divert power?
DIALOG | Sepideh | It's real easy, most of these old generators use modular battery systems - if there's an unused battery hooked up, all you've got to do is tell it where to go. If the power's already been diverted, all you've gotta do is install another battery like the one you've got there. They're real simple.
DIALOG | P_NAME | Well I don't know if I'm going that way, but if I do I'll be sure to give it a look.
DIALOG | Sepideh | Thanks, kid. Appreciate it.
QUEST  | sepidehHandler = 1

IF sepidehMachine == 0 | 

DIALOG | P_NAME  | 
DIALOG | Sepideh | 
DIALOG | P_NAME  | 
DIALOG | Sepideh | 
DIALOG | P_NAME  | 
DIALOG | Sepideh | 
DIALOG | P_NAME  | 
DIALOG | Sepideh | 
DIALOG | P_NAME  | 
