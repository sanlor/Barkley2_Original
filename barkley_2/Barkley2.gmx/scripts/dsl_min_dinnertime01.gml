external = 1; 
script = "GOTO | DINNERTIME

DINNERTIME
LOOK   | o_cts_hoopz | NORTHWEST
WAIT   | 2.5
FRAME  | CAMERA_NORMAL | o_cinema0
WAIT   | 0
DIALOG | Luigi  | Okay fellas, the mish-mash soup is `w1`cooked.`w0`_ We got `kw`croutons,`rt`_ we got `kw`giblets,`rt`_ we got `kw`rocks,`rt`_ we got `kw`sand and some spiders too.`rt`
DIALOG | Bumbbo | `s1`Cool beans!`s0`
DIALOG | Scoot  | A feast fit for a slave!
DIALOG | Pommen | `w1`Urghh...`w0` I think I'll just... sleep a little... The crowbar really wore me down.
DIALOG | Penny  | Sweet dreams!
IF glovesBox >= 2 | DIALOG | Scoot  | Where's Gloves?
IF glovesBox >= 2 | DIALOG | Bumbbo | Hey, you're right. He's missing! What a goofster!
IF glovesBox >= 2 | DIALOG | Penny  | I bet he's on DwarfNET again ranting and raving about his gloves.
IF glovesBox >= 2 | KNOW   | knowDwarfNET | 1
IF glovesBox <= 1 | DIALOG | Gloves | Take it easy, Pommen. We still have a lifetime of slaving ahead of us.
DIALOG | Luigi  | Ah, and what about you, mister Duergar? Will you be having your dinner before or after our `w1`daily beatings?`w0`
DIALOG | P_NAME | Daily beating?_ Oh, well, I think the beatings are cancelled for today. 
DIALOG | Bumbbo | Whoa, what? No way...
DIALOG | Scoot  | No beatings? That... sounds almost as if we weren't just worthless slaves.
DIALOG | Penny  | Why the sudden change of heart, mister Duergar?
DIALOG | P_NAME | Uhh, no reason really. I just don't feel like it today.
DIALOG | Biscuit | Pfft... We slave away all day long and you fellas just change your minds on a whim, like it wouldn't matter what you do to us down here. Us getting beat up with `kw`crowbars`rt` and `kw`mallets`rt` and `kw`rapiers`rt` is completely arbitrary to you, isn't it? It all depends on if you are feeling like it, huh?
DIALOG | Luigi  | Biscuit! Please, mister Duergar. He didn't mean it...
WAIT   | 1
DIALOG | P_NAME | Oh, that's alright. I'm not offended or anything.
WAIT   | 1
DIALOG | Scoot  | Well... Uh... Can't you beat us up even a little?
DIALOG | P_NAME | What?
DIALOG | Bumbbo | Oh, nothing big. Just a knife between the ribs or a kick to the groin.
DIALOG | Penny  | Or running us over with a minecart.
IF glovesBox <= 1 | DIALOG | Gloves | Immolation? Lethal fall? Forcefully being made to step on a rake? Surely you have thought about these things, yes? 
DIALOG | P_NAME | Wait, what? You want me to hurt you?
DIALOG | Biscuit | `w1`Yes!`w0` Why wouldn't we? Why would we come down here to be your slaves if we didn't get a good beating every now and then?
DIALOG | P_NAME | You're crazy...
DIALOG | Scoot  | Come on, you can do better than that. Go on, call me a `w1`swine!`w0` Tell me that I'm a big nosed gemlover, and then shove this broom up my heinie.
DIALOG | P_NAME | W-what? I'd rather not. I really would rather not. 
DIALOG | Luigi  | Damn...
DIALOG | P_NAME | Can't you just eat your soup and get back to work?_ Can't you just be... normal...
DIALOG | Bumbbo | Just eat the soup and that's it? I don't know... it doesn't sound right.
WAIT   | 0.75
DIALOG | Bumbbo | Oh wait! Is the soup `kw`poisoned?!`rt` Please tell me it's poisoned!
DIALOG | P_NAME | What? N-no! I mean, I don't think it is.
DIALOG | Luigi  | Are you sure? Hmm, I'd better test this out...
PLAYSET | o_min_luigi01 | taste | default
WAIT   | 3
DIALOG | Luigi  | It..._ it tastes like crap. It's not poisoned though...
DIALOG | Penny  | Just plain soup? 
DIALOG | Bumbbo | I... I guess we just have to eat it and go back to work...
DIALOG | Scoot  | `w1`*Sniff*`w0` My ribs are crying out for a crowbar! Oh, the dwarfanity! 
DIALOG | P_NAME | Just eat the dang soup and be done with it!
WAIT   | 1
FADE   | 2
WAIT   | 2
QUEST  | minesDinner = 2
Teleport | r_min_respawn01 | 280 | 280 | 2
";  
