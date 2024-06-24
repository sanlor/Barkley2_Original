// Event for Firas, involved in Dead Son quest.
// NOTE: UNFINISHED!
// Note on Firas - deadSon 2 is activated in the sewers by finding his dead son from anywhere between Times 1-3. The quest ends automatically at 4 if it's not completed.
// deadson = 6 means you've completed quest, spoken to firas.
// deadSon = 5 means you completed the quest, haven't returned to Firas.
// deadSon = 4 means Firas saw through your disguise and realized his son is dead
// deadSon = 3 means you're currently controlling the dead son who is in the sewers
// deadSon = 2 means the quest has been accepted
// deadSon = 1 means Firas has been spoken to but the quest was rejected
// deadSon = 0 means Firas hasn't been spoken to and the quest is not active*
// usage: event_tnn_firas01();

DEADSON_ROTTEN
DIALOG | Firas  | I'm startin' to think maybe the boy ain't comin' back... maybe... maybe I was too hard on him...");
        
DEADSON_COMPLETE_REPEAT
DIALOG | Firas  | Matthias will be out of the bath in just a minute. I know I said I'd give that boy a whoopin', but... well, I'm just glad he's back.
DIALOG | P_NAME | (Why did I do this...?)
            
DEADSON_COMPLETE
DIALOG | Firas  | P_NAME_S, you're back! You can forget about lookin' for Matthias. Guess who came wanderin' home like he wasn't even gone. That's right! My boy's back! Those blue jeans of his were a little scuffed up, but he's none the worse for the wear!
DIALOG | P_NAME | Oh, that's good to hear...
DIALOG | Firas  | I'm gonna be honest, I was startin' to lose hope he'd ever come back. I mighta been a little hard on the kid and... and... well listen, I'm in such a good mood that I'm gonna give you my TODO REWARD. I know you didn't find him, but you looked and that's what counts.
DIALOG | P_NAME | N-no, you really shouldn't give me anything.
DIALOG | Firas  | Now don't tell Matthias I'm giving you my TODO REWARD, cuz I was savin' it up for him. He's in the bath right now but he'll be right out.
DIALOG | P_NAME | O-okay... thank you, Mr. Firas...
DIALOG | Firas  | You take care, now! Be seein' you!
DIALOG | P_NAME | (This was the worst thing I've ever done...)
QUEST  | deadSon = 7

DEADSON_FAILURE
DIALOG | Firas  | M-my boy... Matthias... I can't believe he's gone... I... I wasn't really gonna whoop 'im... just leave me alone, you rotten fool... just leave me alone.
DIALOG | P_NAME | I was just trying to cheer you up...
        
DEADSON_ACCEPTED
DIALOG | Firas  | Still lookin' for my boy, youngster? Remember, his name's Matthias, he's a real small kid, loves his blue jeans, he ain't got no beard and he's due the fiercest keister whoopin' this side of Tir na Nog! Don't tell him that last part though. I want it to be a surprise.
DIALOG | P_NAME | Got it, mister!
DIALOG | Firas  | I just can't figure out for the life of me why he'd leave his Pa like that... I was makin' his favorite dinner, grapes...
            
DEADSON_RECONSIDER
DIALOG | Firas | What in tarnation do you think you're doin' back here, you lousy, good fer nothin', guff givin', scraggly-haired cybervarmint? You didn't... reconsider looking for my son, did you?");
CHOICE | Look for Firas' son?
REPLY  | LOOK_YAY | I'll look for him.
REPLY  | LOOK_NAY | I don't have the time.

LOOK_YAY
DIALOG | P_NAME | Well, I guess I can look for him.
DIALOG | Firas  | Aww, I knew you'd say that! Now look, he's a real runt of a thing, goes by Matthias and always wears those new-fangled... /'blue jeans/' or whatever you call 'em. He loves his grapes, likes to say /'a grape a day keeps the doctor away,/' whatever that means. I don't know where that knucklehead's wandered off to but... but if you see him, please tell him to come home... come home to his ol' Pa...
DIALOG | P_NAME | I'll do what I can, mister.
QUEST  | deadSon = 2

LOOK_NAY
DIALOG | P_NAME | I'm really sorry but, um... well, I'm kind of busy.
DIALOG | Firas  | Well now I'm rootin', tootin' pissed you dang, numbskull, birdbrained, no-good dimwit! Why in tarnation did you come back if you don't have nothin' good to say to me! Get outta my face you... you... you...!!!
DIALOG | P_NAME | I'm sorry!!!!
                
DEADSON_START
DIALOG | Firas  | ...told that knucklehead to be back by dinner... always gettin' into trouble... gonna give that blockhead a whooping he'll never forget...
DIALOG | P_NAME | Umm, are you alright, mister?
DIALOG | Firas  | Am I alright? Am I alright!? By gum, I'm madder than a Duergar looking for rubies at an opal convention, I tell you what! I'm madder than a moon-croonin', balloon-brained buffoon panning for dubloons in a typhoon! I'm... I'm mad as Hell, dad gummit! I told that numbskull son of mine to be back by dinner cuz I'm makin' his favorite: grapes. Just plain ol' grapes! Well it sure as heck ain't dinner time anymore and those grapes are spoiled! When he gets back, why, I'm gonna wallop his keister 'til... 'til... well, I'm gonna wallop it!
DIALOG | P_NAME | Um, I'm really sorry about that, mister...
DIALOG | Firas  | You... you wouldn't mind... lookin' around for him, would? He's just a runt of a thing, real small for his age and he don't have no beard or nothin'. Always wears those new-fangled... /'blue jeans/' or whatever you call 'em. Name's Matthias, loves his grapes. Always says /'a grape a day keeps the doctor away,/' whatever that's supposed to mean. Would you... would you do that for me?
CHOICE | Look for Firas' son?
REPLY  | LOOK_START_YAY | I'll look for him.
REPLY  | LOOK_START_NAY | I don't have the time.

LOOK_START_YAY
DIALOG | P_NAME | Well, I guess I could look around for him... do you have any leads?
DIALOG | Firas  | Heck if I know where he went! And you better find him! Cuz I'm gonna whoop that rascal silly when he gets back! I'm gonna tan that rump 'til the cows come home! And those cows ain't comin' home anytime soon, I tell you what!
DIALOG | P_NAME | Um, well... okay. I guess I'll look for him. But uh, please don't spank him too hard.
QUEST  | deadSon = 2

LOOK_START_NAY
DIALOG | P_NAME | I'm kinda busy... I don't think I'll be able to look for him. Sorry...
DIALOG | Firas  | Yeah? Well you can kiss my grits! Get the heck outta here ya lazy good fer nothin' son of a bandit-lovin', bib-wearin', bulldog-havin'...
DIALOG | P_NAME | Um... sorry, mister...
QUEST  | deadSon = 1
