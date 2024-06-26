script = "
QUEST | joadLife = 5
IF joadState == 3 | GOTO | ALREADYPASSED03
IF joadState == 2 | GOTO | ALREADYPASSED02
IF joadState == 1 | GOTO | ALREADYPASSED01
IF joadState == 0 | GOTO | HELPCHOOSER

HELPCHOOSER //Choose what to ask or do
CHOICE | What do you do?
IF joadGood == 0 | REPLY | GOOD_HURTWHERE | Ask where he's hurt.
IF joadBad == 0 | REPLY | BAD_HOWTHISHAPPENED | Ask how this happened.
IF joadBad == 1 | REPLY | BAD_ABOUTBAINSHEE | Ask about the bainshee.
IF joadGood == 1 | REPLY | GOOD_HOWCANIHELP | Ask how you can help.
IF joadBad == 2 | REPLY | BAD_ABOUTTOMB | Ask about the ancient tomb.
IF joadBad == 3 | IF joadScroll == 0 | REPLY | BAD_ABOUTRUINS | Ask about the AI Ruins.
IF joadBad == 3 | IF joadScroll == 1 | REPLY | BAD_ABOUTSCROLL | What do you use the scroll for?
IF joadBad == 4 | REPLY | BAD_SPEAKUP | Speak up!
IF joadPaperRequest == 1 | IF joadPaper == 1 | REPLY | WRITEONPAPER | Give the dwarf the paper.
IF joadPaperRequest == 1 | IF joadScroll == 1 | REPLY | WRITEONSCROLL | Give the dwarf the scroll.
IF joadPaperRequest == 1 | REPLY | NOTECHOOSER | Give him another paper.

GOOD_HURTWHERE
DIALOG | P_NAME | It looks like you're really bleeding. Where were you hurt?
DIALOG | Dying Dwarf | Ugh... all over, youngster. It surprised us... *kack*... looks like my time's... almost up.
QUEST | joadGood += 1
GOTO | JOADDRAIN

GOOD_HOWCANIHELP
DIALOG | P_NAME | Ok, we're gonna get you out of here. Uh..._ how should I do this?
DIALOG | Dying Dwarf | I'm not going... anywhere. P-... paper... pencil. Help me... get my paper... check... my pocket...
DIALOG | P_NAME | In your pocket, huh?
WAIT | 0.5
USEAT | o_joad01
WAIT | 1.0
QUEST | joadGood += 1
IF knowJoadScroll == 0 | GOTO | TAKEPAPER
IF knowJoadScroll == 1 | GOTO | TAKESCROLL

TAKEPAPER
NOTIFY | Got a piece of Tattered Paper.
NOTE | build | take | Tattered Paper
QUEST | joadPaper = 1
GOTO | AFTERPAPER

TAKESCROLL
DIALOG | P_NAME =  s_port_hoopzSurprise | This is that scroll you mentioned... looks old!
NOTE | Got the Ancient Scroll!
NOTE | build | take | Ancient Scroll
QUEST | joadScroll = 1
GOTO | AFTERPAPER

AFTERPAPER
DIALOG | P_NAME | Did you need this to write on?
DIALOG | Dying Dwarf | Yes... give it here...
QUEST | joadPaperRequest = 1
GOTO | HELPCHOOSER

WRITEONPAPER
DIALOG | P_NAME | Here's the paper...
NOTIFY | Gave the Tattered Paper back to the Dying Dwarf.
NOTE | build | give | Tattered Paper
QUEST | joadPaper = 2
GOTO | JOADSNOTEWRITING

WRITEONSCROLL
DIALOG | P_NAME | Here you go... scribble all over this ancient scroll I guess. 
NOTIFY | Gave the Ancient Scroll back to the Dying Dwarf.
NOTE | build | give | Ancient Scroll
QUEST | joadScroll = 2
GOTO | JOADSNOTEWRITING

BAD_HOWTHISHAPPENED
DIALOG | P_NAME | You look really hurt. How did this happen?
DIALOG | Dying Dwarf | Was scouting... blasted into a room a few floors down... think it was a tomb... ba-... bainshee caught up to me... got me good.
QUEST | joadBad += 1
GOTO | JOADDRAIN

BAD_ABOUTBAINSHEE
DIALOG | P_NAME | A bainshee did this? Where did it get off to? They really sound like bad news.
IF joadLife >= 3 | DIALOG | Dying Dwarf | Really bad... I tracked it for awhile, lost it... lo... in tomb when it appeared. Got back to here but... ugh... too late.
IF joadLife < 3 | DIALOG | Dying Dwarf | Real... bad... tracked for awhile... lost it... looking... *cough* tomb when... got to here but... ugh... late...
QUEST | joadBad += 1
GOTO | JOADDRAIN

BAD_ABOUTTOMB
DIALOG | P_NAME | Could you tell me anything else about this tomb?
DIALOG | Dying Dwarf | ... saw weak wall... blasted in. Caved in now... It was the... A._I._ Ruins...
DIALOG | P_NAME = s_port_hoopzSurprise | Wow, the A.I. Ruins?! Where is it?
DIALOG | Dying Dwarf | Beneath._._._ undersewers... 
KNOW | knowAIRuins | 1
KNOW | knowUndersewers | 1
QUEST | joadBad += 1
GOTO | JOADDRAIN

BAD_ABOUTRUINS
DIALOG | P_NAME | The A.I. Ruins? You've gotta tell me more!
DIALOG | Dying Dwarf | Saw a scroll... ground... grabbed it. That's when... b-... bainshee started brasting.
KNOW | knowJoadScroll | 1
IF joadPaper == 0 | GOTO | RUINSSKIP
NOTIFY | Tattered Paper has been revealed to be an Ancient Scroll!
DIALOG | P_NAME = s_port_hoopzSmirk | Wow, so this Tattered Paper is an that Ancient Scroll, huh?... I bet it's jam packed with secrets... (I love secrets)...
NOTE | build | give | Tattered Paper
NOTE | build | take | Ancient Scroll
QUEST | joadScrollOn = 1
GOTO | RUINSSKIP

RUINSSKIP
QUEST | joadBad += 1
GOTO | JOADDRAIN

BAD_ABOUTRUINS
DIALOG | P_NAME | So do you know what the scroll says on it? These letters are really faded, and I don't know what language this is.
DIALOG | Dying Dwarf | Ugh... Absalom... find Absalom...
KNOW | knowAbsalom | 1
QUEST | joadBad += 1
GOTO | JOADDRAIN

BAD_SPEAKUP
DIALOG | P_NAME | What's that, mister? I can't hear you.
DIALOG | Dying Dwarf | ...
GOTO | JOADDEATH

JOADDRAIN
QUEST | joadLife -= 1
IF joadLife == 4 | DIALOG | Dying Dwarf | I-_I-_ I'm in a bad way...
IF joadLife == 3 | DIALOG | Dying Dwarf | I... I dont have much strength...
IF joadLife == 2 | DIALOG | Dying Dwarf | Nnnh..._ my strength is decreasing..._ even further..._
IF joadLife == 1 | DIALOG | Dying Dwarf | Y... young... ster..._ I...
IF joadLife == 0 | DIALOG | Dying Dwarf | I am truly... a..._ g-... goner..._
IF joadLife >= 1 | GOTO | HELPCHOOSER
IF joadLife == 0 | GOTO | JOADDEATH

ALREADYPASSED03
DIALOG | P_NAME | (Poor guy...)
EXIT | 

ALREADYPASSED02
DIALOG | P_NAME | I hope you've found peace, Sgt. Joad...
EXIT |

ALREADYPASSED01
DIALOG | P_NAME | I hope you've found peace, soldier...
EXIT |

JOADSNOTEWRITING
QUEST | joadNote = 1
DIALOG | Dying Dwarf | Th-... thank you youngster. And thank you for... being here. Now, I must record what I saw... help t... others...
WAIT | 1.0
Flourish | s_port_joadCough | 1
DIALOG | Dying Dwarf | There... it's done... thank you youngster... now... I can fin._._._ ally._._._
PLAYSET | o_joad01 | cough | headup
SOUND | sn_debug_two
WAIT | 0.5
SET | o_joad01 | dead
IF joadLife >= 3 | GOTO | JOADEXTRASTRENGTH
GOTO | JOADDEATH

JOADEXTRASTRENGTH
WAIT | 0.5
Flourish | s_port_joadHead | 0
DIALOG | Dying Dwarf | Wait!... with all my str-*cough*... one more *hack*... line...
WAIT | 0.5
QUEST | joadName = 1
DIALOG | Dying Dwarf = s_port_joadDead | ...
GOTO | JOADNOTERESOLVE

JOADDEATH
DIALOG | P_NAME = s_port_hoopzSurprise | Hey, stay with me!
WAIT | 1
DIALOG | Dying Dwarf = s_port_joadDead | ...
IF joadNote == 0 | GOTO | BLOODYNOTE
DIALOG | P_NAME | (I think he's passed on... he didn't finish writing his note...)
GOTO | JOADNOTERESOLVE

JOADNOTERESOLVE
IF joadResused == 1 | IF joadName == 1 | GOTO | REUSEDNOTE_JOAD
IF joadResused == 1 | IF joadName == 0 | GOTO | REUSEDNOTE_SOLDIER
IF joadResused == 0 | IF joadName == 1 | GOTO | ORIGINALNOTE_JOAD
IF joadResused == 0 | IF joadName == 0 | GOTO | ORIGINALNOTE_SOLDIER

REUSEDNOTE_SOLDIER
NOTE | build | take | Dead Soldier's Note (Reused)
DIALOG | P_NAME | (._._._ It looks like he's a soldier of some kind... )
GOTO | JOADENDQUEST

ORIGINALNOTE_SOLDIER
NOTE | build | take | Dead Soldier's Note  
DIALOG | P_NAME | (._._._ It looks like he's a soldier of some kind... )
GOTO | JOADENDQUEST

REUSEDNOTE_JOAD
NOTE | build | take | Sgt. Joad's Note (Reused)
NOTIFY | Got Sgt. Joad's Note.
DIALOG | P_NAME | ._._._ Sergeant Joad... so that was his name.
GOTO | JOADENDQUEST

ORIGINALNOTE_JOAD
NOTE | build | take | Sgt. Joad's Note
NOTIFY | Got Sgt. Joad's Note.
DIALOG | P_NAME | ._._._ Sergeant Joad... so that was his name.
GOTO | JOADENDQUEST

JOADENDQUEST
IF joadNote == 0 | GOTO | BLOODYNOTE
IF knowLONGINUSTnn >= 3 | DIALOG | P_NAME | (Since he's a soldier, I should report this to Absalom and the L.O.N.G.I.N.U.S. rebels...)
IF knowLONGINUSTnn == 2 | DIALOG | P_NAME | (I wonder if these L.O.N.G.I.N.U.S. fellows I'm looking for could help me with this mystery.)
IF knowLONGINUSTnn == 1 | DIALOG | P_NAME | (I wonder if these L.O.N.G.I.N.U.S. fellows I'm looking for could help me with this mystery.)
IF knowLONGINUSTnn == 0 | DIALOG | P_NAME | (Well... I guess I'm responsible for this now...)
EXIT |

BLOODYNOTE
DIALOG | P_NAME | (He's gone._._._ but there's something sticking out of his pocket...)
USEAT | o_joad01
NOTIFY | Got the Bloody Paper!
NOTE | build | take | Bloody Paper
QUEST | joadState = 3
EXIT |

NOTECHOOSER 
DIALOG | P_NAME | Here I think I might have something else.
NOTE | select | Dying Dwarf
IF note == exit | GOTO | NOTE_EXIT
IF note == none | GOTO | NOTE_NONE
IF note == Love Letter | GOTO | NOTE_VALID
IF note == Cornrow's Plea | GOTO | NOTE_VALID
IF note == Wilmer's Amortization Schedule | GOTO | NOTE_VALID
IF note == Aelfleda's Eviction | GOTO | NOTE_VALID
IF note == Printed Invitation | GOTO | NOTE_SPACE
IF note == Completed Application | GOTO | NOTE_SPACE
IF note == Pet Manifesto | GOTO | NOTE_SPACE
GOTO | NOTE_GENERIC

NOTE_EXIT
DIALOG | P_NAME | Oh um, nevermind.
GOTO | HELPCHOOSER

NOTE_NONE
DIALOG | P_NAME | Oh well, sike, I don't have any papers.
GOTO | HELPCHOOSER

NOTE_VALID
DIALOG | P_NAME | Go ahead and use this I guess, I won't need it.
USEAT | o_joad01
NOTE | build | give | note
NOTIFY | Gave @note@ to the Dying Dwarf.
QUEST | joadReused = 1
GOTO | JOADSNOTEWRITING

NOTE_SPACE
DIALOG | P_NAME | Here! Use this!
USEAT | o_joad01
DIALOG | Dying Dwarf | W-._._._ what is this?  Young._._._ something to write on! This paper_ doesn't *cough* enough space! Hurry!
GOTO | NOTECHOOSER

NOTE_GENERIC
DIALOG | P_NAME | Umm, will this work?
DIALOG | Dying Dwarf | N-_no, please... something else! Young._._._ something to write on! Hurry!
GOTO | NOTECHOOSER
"
