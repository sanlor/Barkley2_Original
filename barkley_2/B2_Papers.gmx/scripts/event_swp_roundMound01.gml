///The Round Mound... Game Ending Decider
/*
SEE ROUNDMOUND WIKI
*/
script = "
QUEST | rmVengeanceQualify = 1
QUEST | rmCandyQualify = 1
QUEST | rmReasonCuchu = 1
QUEST | roundmoundInitiate = 1
" +
//TODO: lower BGM to 0
//TODO: SURPRISEAT | o_floatingBball01
"
DIALOG | P_NAME = s_port_hoopzSurprise | Huh, is that the bball... from... the Factory? From my dreams...?
" +
//TODO: MOVETO | cinemamarker
//TODO: LOOK AROUND
"
WAIT | 0.5
DIALOG | P_NAME | (I wonder if I should wade out and get it.)
" +
//TODO: ROUNDMOUND REVEAL!!
"
DIALOG | P_NAME | Yipe!
WAIT | 1.0
DIALOG | ? ? ? | Please, do not be afraid. I have no wish to hurt you. I have been watching you, all throughout your long slumber... P_NAME. Finally, you are ready.
DIALOG | P_NAME | Huh? How do you know who I am?... and who are you?
WAIT | 0.5
DIALOG | ? ? ? | I go by many names. But the question is who is asking... and in what tongue? For only I know what you are truly called. I know the struggles you have faced, and the pain you have endured.
IF rmReasonSummon == 1 | GOTO | REASON_SUMMON
IF rmReasonPower == 1 | GOTO | REASON_POWER
IF rmReasonQuest == 1 | GOTO | REASON_QUEST

IF rmReasonCuchu == 1 | GOTO | REASON_CUCHU
IF rmReasonTime == 1 | GOTO | REASON_TIME

REASON_SUMMON
DIALOG | ? ? ? | I know you have been calling out, searching for something. The path of the seeker is not a route to a destination, but a lifelong duty. You know your destiny, as do I. But what you are looking for, I cannot say. You will, soon.
DIALOG | P_NAME | Y-... you heard me?
DIALOG | ? ? ? | My compassion for you is boundless, and I can do nothing but listen. And yet here I cannot help you, only encourage you to take the first faithful step off the precipice. The future will come to pass... it has been written for eons. The future, however, does not hold insight. It does not coalesce through contemplation alone. Rather, it accretes through active existence, and accumulates not with the progression of time, but spatially, as your mindful self recollects increasingly larger segments of its eternal whole.
CHOICE | Respond?
REPLY | SUMMON_REPLY_CHOOSE | I have to make the right choice!
REPLY | SUMMON_REPLY_ANSWERS | I can only be P_NAME!

SUMMON_REPLY_CHOOSE
DIALOG | P_NAME | I see... I have to choose... I MUST choose.
GOTO | ALIGN_CHOICE

SUMMON_REPLY_ANSWERS
DIALOG | P_NAME | I see... whoever I am, I'm me... and the decision is mine to make.
GOTO | ALIGN_CHOICE

REASON_POWER
DIALOG | ? ? ? | You have grown very strong in the course of your journey. What you have overcome, and how fast you have grown, is truly astonishing. And your power, like our meeting, has come not a moment too soon. For I also know what lies ahead, and how little your strength will serve you.
DIALOG | P_NAME | I don't understand... I've come this far. What's going to happen?
DIALOG | ? ? ? | Power, without steady guidance, is dangerous and can only lead to ruin and misfortune. You are strong enough,_ you always have been. Your body has grown suited to the ordeals of combat... so many obstacles have bent to the will of your brasting gun's. Such an indomitable will is subject to nothing... and that is what makes it so dangerous. It can only be nudged, shifted, controlled,_ by your radiant spirit.
CHOICE | Respond?
REPLY | POWER_REPLY_KNOW | I already know what I have to do.
REPLY | POWER_REPLY_WHAT | What do I have besides my strength?

POWER_REPLY_KNOW
DIALOG | P_NAME | Why are you telling me this? I already know what I have to do... I need to defeat Cuchulainn. It's my destiny.
GOTO | ALIGN_CHOICE

POWER_REPLY_WHAT
DIALOG | P_NAME | Why are you telling me this? What do I have besides my strength? Otherwise I'm just a nobody... if that's even who I am.
GOTO | ALIGN_CHOICE

REASON_TIME
DIALOG | ? ? ? | The road you have taken has been long and taxing. What you have endured is truly astonishing. The end of your journey is finally drawing near. It would please me to see you to a restful future, but I am afraid that is not what lies ahead. Your greatest unrest will come moments from now.
DIALOG | P_NAME | What do you mean? Something's gonna happen?
DIALOG | ? ? ? | At the poles of the Earth, even the most accurate compass offers no guidance. Likewise, your destiny has pulled you ever closer to the conclusion of this sojourn, but it can give you no peace. There is an internal journey you must take, and you are finally ready to walk the first steps. Your coming moves were plotted long in advance. Where will you /'be/' when you arrive at your destination?
CHOICE | Respond?
REPLY | TIME_REPLY_CUCHU | I will face Cuchulainn.
REPLY | TIME_REPLY_CDWARF | I will meet The Cyberdwarf.

POWER_TIME_CUCHU
DIALOG | P_NAME | Why are you telling me this? I already know where I'll be... Cuchulainn's Lair, brastin' to all heck.
GOTO | ALIGN_CHOICE

POWER_TIME_CDWARF
DIALOG | P_NAME | My destination is The Cyberdwarf... I was told to find him, that's what I have to do, isn't it?
GOTO | ALIGN_CHOICE

REASON_QUEST
DIALOG | ? ? ? | And what you have accomplished! ... you have worked tirelessly to fulfill your destiny. As it must be. Your faithfulness is an admirable virtue, though with the nature of destiny, to be predicted. I know your path, and it is why I have come. But I do not quite know you. No one can... save you.
DIALOG | P_NAME | Wait... no one can save me? Or no one except me?
DIALOG | ? ? ? | None can see the sacred spot inside the center your mind, where context is generated, where the heart's weft is weaved into the warp that F.A.T.E. ordains. Your existence stretches from the Big Bang to your inevitable future as a mere ghost of time... like all matter, and like myself. You began as energy and will end as energy and begin again; this is inescapable. Yet some point during your infinite existence, your neverending destiny, you will choose how to write your story. When this conversation ends, your life continues. But your story begins now.
CHOICE | Respond?
REPLY | QUEST_REPLY_KNOW | I already know what I have to do.
REPLY | QUEST_REPLY_ | What do I have besides my strength?

QUEST_REPLY_KNOW
DIALOG | P_NAME | I don't understand. I know what my story is... I have a mission. I'm off to fight Cuchulainn.
GOTO | ALIGN_CHOICE

QUEST_REPLY_
DIALOG | P_NAME | How can my story begin now? I was told to find The Cyberdwarf. How do I know what I'm doing until I see The Cyberdwarf? I don't know what destiny you're talking about!
GOTO | ALIGN_CHOICE

REASON_CUCHU
DIALOG | ? ? ? | The time of most dangerous battle has finally arrived. The bravery you have shown in pressing onwards befits your noble destiny. You know what has already been decided. Destiny... F.A.T.E.'s vassal. But knowledge of your destination alone should be no comfort. It is why I have arrived.
DIALOG | P_NAME | I don't understand. What's going to happen? I can beat Cuchulainn... can't I?
DIALOG | ? ? ? | You, and I, and the entire cosmos knows what is to soon unfold. Victory is victory and defeat is defeat. Both seem different, but both are simply ends. You are very special... you can bring about an /'end,/' certainly. You have come so far, but is finality all that you fight for? Every force in the universe has driven you to this moment, and will continue to lead you after the last blow is struck. The source of liberation, the rite of emancipation, lies within you.
CHOICE | Respond?
REPLY | CUCHU_REPLY_SAVE | I have to fight to save the entire ship!
REPLY | CUCHU_REPLY_ANSWERS | Cuchulainn has that answers!

CUCHU_REPLY_SAVE
DIALOG | P_NAME | I don't understand... if I want to be free I must defeat Cuchulainn. I, the dwarfs, everyone on the Necron 7 will be shuttled to our doom at any moment. I have to fight!
GOTO | ALIGN_CHOICE

CUCHU_REPLY_ANSWERS
DIALOG | P_NAME | I don't know what's happening, I don't know who I am, and I know that Cuchulainn has answers. I have to fight!
GOTO | ALIGN_CHOICE

ALIGN_CHOICE
" +
//TODO: a power lifts Hoopz up and floats him over the water and hovers over the Round Mound
"
DIALOG | ? ? ? | My time here expires. Soon, I will be gone again, watching and waiting from the flow of existence. Your immortal substance has ripened and matured. Use your blazing spirit and awaken your soul! At long last... 
DIALOG | ? ? ? | Your destiny becomes your densetsu!
" +
//TODO: new BGM should play now!
"
DIALOG | ? ? ? | Now, child, tell me. What does your soul fight for? Gaze upon my shape, gaze into yourself, and CHOOSE!

CHOICE | What do you fight for?
IF rmVengeanceQualify == 1 | REPLY | ALIGN_VENGEANCE | I'll get my revenge on Cuchulainn!
IF rmCandyQualify == 1 | REPLY | ALIGN_CANDY | I never want to grow up!
IF rmVidconQualify == 1 | REPLY | ALIGN_VIDCON | I aim to be The Vidcon Master!
IF rmBballQualify == 1 | REPLY | ALIGN_BBALL | I claim my destiny on the bball court!
IF rmClispaethQualify == 1 | REPLY | ALIGN_CLISPAETH | I answer the Call of Clispaeth!
IF rmBrastQualify == 1 | REPLY | ALIGN_BRAST | I'll be known as The Last Braster!
" +
//TODO: complete the Alignment Choices (endings of the game)
"
ALIGN_BBALL
DIALOG | P_NAME | There is only one place for me... the bball court.
DIALOG | P_NAME | Pass me the rock!
QUEST | rmBballDecide = 1
GOTO | ROUNDMOUND_DECIDE

ALIGN_CANDY
DIALOG | P_NAME | I'm just a kid. A sapling in the forest of men. A babe in the woods...
DIALOG | P_NAME | I want it all!
QUEST | rmCandyDecide = 1
GOTO | ROUNDMOUND_DECIDE

ALIGN_VIDCON
DIALOG | P_NAME | I'm a gamer, I know that now. And I'm here to 
DIALOG | P_NAME | I seek the Gamer's Paradise!
QUEST | rmVidconDecide = 1
GOTO | ROUNDMOUND_DECIDE

ALIGN_CLISPAETH
DIALOG | P_NAME | I am a servant for his Lord and Savior Clispaeth. He speaks through me.
DIALOG | P_NAME | He is I and I am Him!
QUEST | rmClispaethDecide = 1
GOTO | ROUNDMOUND_DECIDE

ALIGN_BRAST
DIALOG | P_NAME | The only thing I know... is how to brast and what to brast.
DIALOG | P_NAME | My Gun's do the talking!
QUEST | rmBrastDecide = 1
GOTO | ROUNDMOUND_DECIDE

ALIGN_VENGEANCE
DIALOG | P_NAME | Cuchulainn is the scourge of the Universe. Nothing is safe until he's gone.
DIALOG | P_NAME | His goose is cooked!
QUEST | rmVengeanceDecide = 1
ALIGN_VIDCON

ROUNDMOUND_DECIDE
" +
//TODO: ROUNDMOUND ALIGNMENT HAS BEEN DECIDED!
//TODO: ARKANE MAGICKS float about!
"
DIALOG | ? ? ? | It is done.
WAIT | 0.5
DIALOG | ? ? ? | The covenant we now share is firmly fastened to the gospel of the cosmos, held true by the bond of consanguinity._ Whether we see each other again is a future left to the litigious will of the firmament above, a place to which I will now return...
DIALOG | ? ? ? | Fare thee well... m_._._._y_._._._s._
"
//TODO: Hoopz flips around and reaches for the Round Mound, suspended upside down as he gets close the screen WHITES OUT as he touches the Mound
