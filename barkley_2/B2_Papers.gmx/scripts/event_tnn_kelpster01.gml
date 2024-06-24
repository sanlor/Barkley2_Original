script = "
IF body == governor | IF kelpsterState = 0 | GOTO | GOVERNOR1
IF body == governor | IF kelpsterState = 1 | GOTO | GOVERNOR1
IF body == governor | IF kelpsterState = 2 | GOTO | GOVERNOR2
IF body == governor | IF kelpsterState = 3 | GOTO | GOVERNOR2
IF body == governor | IF kelpsterState = 4 | GOTO | GOVERNOR3
IF kelpsterState = 0 | GOTO | KELPSTER0
IF kelpsterState = 1 | GOTO | KELPSTER1
IF kelpsterState = 2 | GOTO | KELPSTER2
IF kelpsterState = 3 | GOTO | KELPSTER3

GOVERNOR1
DIALOG | Kelpster | Heh, a-are you the g-governor!? Look, I... I haven't been naughty, hehehehe... P-please, have mercy on me, please!
DIALOG | Governor Elagabalus | Hmm, I think I'm going to have mercy on you, but only this once. That is what real governors like me do. 
DIALOG | Kelpster | T-thank you, m'lord! Thank you! Heh!
QUEST | kelpsterState = 4
QUEST | knowKelpster = 1

GOVERNOR2
DIALOG | Kelpster | *Gulp* Mister g-governor!? W-w-what b-brings you to my, heh, h-humble d-d-d-domain, your m-majesty?
DIALOG | Governor Elagabalus | Uh, I'm just making sure everything is as it should. It's a tough job governing a city, but as the governor it is my job to govern.
DIALOG | Kelpster | O-oh, well, t-that's good to hear. Here, you c-can have this, heh, vidcon as a t-t-token of my loyalty.
//                scr_event_build_vidcon(5);
DIALOG | Governor Elagabalus | Whoa, Thanks! Uh, I mean... This tribute pleases me greatly. Now I must bid you farewell.
DIALOG | Kelpster | Y-yes, of course. Hehehehe... (*Phew*)
QUEST | kelpsterState = 4
               
GOVERNOR3          
DIALOG | Kelpster | M'lord! Heh, h-how may I serve you?
DIALOG | Governor Elagabalus | Oh, I was just... Uh... I think this is the wrong house. Stand tall, citizen. I must go now.
DIALOG | Kelpster | Yessir! Absolutely, sir!
            
KELPSTER0
DIALOG | Kelpster | Hey man... What's up?
DIALOG | P_NAME | Uh, not much I guess.
DIALOG | Kelpster | Yeah... Same here... Heh, just surfing the Teletext here. Not much else to do since they banned me on the DwarfNET forums... It's not the same though... Teletext just doesn't have the same, uh, content... The sort of thing I'm into, heh.... Hehehehe...
DIALOG | P_NAME | Are you alright mister?
DIALOG | Kelpster | I guess... I mean, I could be better... Actually, since you're here... Can you do something for me?
DIALOG | P_NAME | I'm not sure. What do you want me to do?
DIALOG | Kelpster | Heh... Hehehehehehe... Don't you worry about that right now... I'll tell you what I want... You can bet on that... I'm just asking if you're willing and able...
QUEST | knowKelpster = 1
GOTO | BARGAINS
            
KELPSTER1
DIALOG | Kelpster | Ah, it's the youngster... Heh, so you've come back to me, just as I predicted. Hehehehehe... You want the vidcon, right?
DIALOG | P_NAME | Yeah. After all, I am a gamer, proud and true.
DIALOG | Kelpster | Hehehehe... Good... Good...
DIALOG | P_NAME | So what game is this, and how much are you asking for it?
DIALOG | Kelpster | Heh, straight to the point, huh? Hehehehe... Alright then... It's called Creppy Ghoulies IV... You probably haven't heard about it since you are a kid... This game is more for, heh, adults only. If you know what I mean... Hehehehe...
DIALOG | P_NAME | Nope, never heard about it. Is it any good?
DIALOG | Kelpster | Oh, you bet... You bet your butt it's good... Hehehehe... Alright. All I'm asking for it is just @money_kelpsterArtifact@ neuroshekels. What do you say?
CHOICE | Purchase Creppy Ghoulies IV?
REPLY | PURCHASE | Yeah, gimme!
REPLY | DECLINE | No thanks...   
   
KELPSTER2
DIALOG | Kelpster | So, you are back, eh? Hehehehe... Back for that vidcon, no doubt? So what will it be, youngster... Heh... What will you use to pay for it? Money or Fruit?
GOTO | BARGAINS2
   
KELPSTER3
DIALOG | Kelpster | Hehehehe... Hope you enjoy that vidcon, kid... Hehehehehe...

BARGAINS
CHOICE | Am I willing and able?
REPLY | INTEREST | I guess so
REPLY | NOTHANKS | Nope

BARGAINS2
CHOICE | Purchase Creppy Ghoulies IV?
IF current_money >= @money_kelpsterArtifact@ | REPLY | PURCHASEMONEY | Buy it with @money_kelpsterArtifact@ neuroshekels
IF @Fruit Basket@ >= 1 | REPLY | FRUITGIVE | Buy it with the Fruit Basket
REPLY | DECLINE | No thanks

INTEREST
DIALOG | P_NAME | I guess so.
DIALOG | Kelpster | Heh... Hehehehehe... A-alright, heh... I'm looking to sell this vidcon I have to uh... help finance my hobbies, so to speak, heh...
DIALOG | P_NAME | Oh, alright. What's it called?
DIALOG | Kelpster | Heh... I don't think a kid like you would have heard about this one... Or maybe you are a naughty little kid and you've played it before, eh? Hehehehehe... It's called Creppy Ghoulies IV... Heh... Ring any bells?
DIALOG | P_NAME | Nope, I've never heard about that one. Is it any good?
DIALOG | Kelpster | Hehehehe... Oh, you bet... It's a real treat, heh... All I'm asking for it is @money_kelpsterArtifact@ neuroshekels. Heh, what do you say, pal...?
CHOICE | Purchase Creppy Ghoulies IV?
REPLY | PURCHASE | Yeah, gimme!
REPLY | DECLINE | No thanks...

INTEREST2
DIALOG | P_NAME | Alright, let's see what you've got to offer.
DIALOG | Kelpster | Well, just like I mentioned on my DwarfNET ad Im trying to sell this old retro vidcon cart here. Creppy Ghoulies IV. Don't know much about it, I'm not much of a gamer. But you look like one so I think it would be right up your alley. Anyways, I'm willing to give it up for @money_kelpsterArtifact@£. Interested?
CHOICE | Purchase Creppy Ghoulies IV?
REPLY | PURCHASE | Yeah, gimme!
REPLY | DECLINE | No thanks...

NOTHANKS
DIALOG | P_NAME | Nope. I'm neither willing or able. Whatever that means.
DIALOG | Kelpster | Ah... Well... I'll be here if you change your mind... Hehehehehe... All I want is to do a little... Trading... A vidcon for some money or a special little favour, hehehehehe...
DIALOG | P_NAME | Uh huh, sure...
QUEST | kelpsterState = 1
                    
PURCHASE
DIALOG | P_NAME | Yeah, gimme! I'll take it.
IF current_money >= @money_kelpsterArtifact@ | GOTO | AFFORD
IF current_money < @money_kelpsterArtifact@ | GOTO | NOAFFORD

PURCHASEMONEY
DIALOG | P_NAME | Yeah, gimme! I'll take it.
QUEST | money -= @money_kelpsterArtifact@
DIALOG | Kelpster | Good... Here you go, have fun... Hehehehehe...
NOTIFY | You got the vidcon Creppy Ghoulies IV
DIALOG | P_NAME | I will, mister. You can count on that!
DIALOG | Kelpster | I'll be here if you want to, heh, talk about tips and tricks... Hehehehehe... Or anything really... Or if you want something more than that, heh...
BREAKOUT | clear
QUEST | kelpsterState = 3

AFFORD
QUEST | money -= @money_kelpsterArtifact@
DIALOG | Kelpster | Good... Here you go, have fun... Hehehehehe...
NOTIFY | You got the vidcon Creppy Ghoulies IV
DIALOG | P_NAME | I will, mister. You can count on that!
DIALOG | Kelpster | I'll be here if you want to, heh, talk about tips and tricks... Hehehehehe... Or anything really... Or if you want something more than that, heh...
BREAKOUT | clear
QUEST | kelpsterState = 2

NOAFFORD
DIALOG | Kelpster | Alright... Wait a minute. Heh, do you even have the money for this?
BREAKOUT | clear
DIALOG | P_NAME | I uhh... no. Could you give me a discount?
DIALOG | Kelpster | A discount...? Heh, not a chance... Hehehehe... Well, actually, I could accept something else as payment, heh... If you know what I mean? Hehehehe...
DIALOG | P_NAME | No, I don't know what you mean.
DIALOG | Kelpster | What I mean is that I think you have just what I want, heh. Hehehehe... What I want from you is to suck on some big... Black... Juicy... Hard... Grapes. Heh, you got some fruits on you, right?
IF @Fruit Basket@ >= 1 | GOTO | GOTFRUIT
IF @Fruit Basket@ == 0 | GOTO | NOFRUIT

GOTFRUIT
DIALOG | P_NAME | Uh, yeah actually. I do. 
DIALOG | Kelpster | Oh, gimme... Please gimme! Heh, I want it... I want the fruits!
CHOICE | Give Mr. Kelpster the Cornucopia?
REPLY | FRUITGIVE | Okay, here's the fruits
REPLY | FRUITWITHELD | Nah, I can't give these fruits away

FRUITGIVE
DIALOG | P_NAME | Alright. I'll give you these fruits for that vidcon.
DIALOG | Kelpster | Yes! Heh, finally! I love fruits! Fruits aplenty! Here's your vidcon, pal. Heh...
NOTIFY | You gave away the Fruit Basket and got the vidcon Creppy Ghoulies IV
DIALOG | P_NAME | Hmm... Creppy Ghoulies IV. I wonder if this was worth it.
ITEM | Fruit Basket | -1
// GIVE GAME //
QUEST | kelpsterState = 3

FRUITWITHELD
DIALOG | P_NAME | I'm afraid I want ot keep these fruits for myself.
DIALOG | Kelpster | Heh, oh... Uh... I... Hehehehehehe... Well, that was... Heh, unexpected... Alright... If you change oyur mind I'll, heh, I'll be here...
DIALOG | P_NAME | Yeah, okay...
QUEST | kelpsterState = 2

NOFRUIT
DIALOG | P_NAME | Fruits? Uh, I don't think I have any on me, sorry.
DIALOG | Kelpster | In that case these negotiations are, heh, over. Hehehehe...
DIALOG | P_NAME | Aw shucks...
DIALOG | Kelpster | Heh, don't... Don't worry kid. Just get some money or, heh, fruits... I'll be here...
QUEST | kelpsterState = 2

DECLINE
DIALOG | P_NAME | Sorry, but I honestly can't afford that.
DIALOG | Kelpster | Heh, no? Alright then... Hehehehe... You know if you don't want to, heh, spend your shekels on this... I could consider other ways you could pay... If you know what I mean... Hehehehe...
DIALOG | P_NAME | Uh, I have no idea what you're saying.
DIALOG | Kelpster | What I'm saying is that, heh, I think you have... You have just what I want, heh. Hehehehe... What I want from you is to suck on some big... Black... Juicy... Hard... Grapes. Heh, you got some fruits on you, right?
IF @Fruit Basket@ >= 1 | GOTO | GOTFRUIT
IF @Fruit Basket@ == 0 | GOTO | NOFRUIT
";
