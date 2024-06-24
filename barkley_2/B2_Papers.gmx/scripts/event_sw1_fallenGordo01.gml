///Fallen Gordo, grotesque ruler of the plantation
/*
Variables
gordoState
0 - never talked
1 - talked
*/
script = "
IF @Sewer Butter@ >= 1 | GOTO | GORDOBUTTER
IF gordoState == 5 | GOTO | GORDO05
IF gordoState == 1 | GOTO | GORDO02
IF gordoState == 0 | GOTO | GORDO01

GORDO05
DIALOG | P_NAME | What an 

GORDO02
DIALOG | Fallen Gordo | What is it? Is it time for Butter Lunch again?
GOTO | GORDOINFO

GORDO01
DIALOG | Fallen Gordo | B.A.B.B.Y. we require more butter....
WAIT | 2.0
" +
//TODO PLAYSET | have Fallen Gordo look over to Hoopz
"
DIALOG | Fallen Gordo | You're not B.A.B.B.Y.. What have you done with our B.A.B.B.Y.?! B.A.B.B.Y.!
" +
//TODO: SURPRISEAT | o_fallenGordo01
"
DIALOG | P_NAME | Yipes! Sorry I didn't mean to intrude!
DIALOG | Fallen Gordo | Who subjugated you to the Glorious Plantation? Was it B.A.B.B.Y.? Where is your mask?
LOOKAT | o_cts_hoopz | o_fallenGordo01
DIALOG | P_NAME | Oh, well I'm just passing through. I have amnesia.
DIALOG | Fallen Gordo | Your feeble mental posture is no excuse. Get to work! We require more butter!
QUEST | gordoState = 1
GOTO | GORDOINFO

GORDOINFO
CHOICE | Ask Fallen Gordo?
REPLY | ASKDOWNHERE | Why are you down here?
IF gordoChide == 1  | REPLY | CHIDE | You should stop being so mean to your workers!
IF gordoPlural == 0 | REPLY | WHOISUS | Why the first person plural?
IF gordoPlural == 2 | IF gordoChair == 0 | REPLY | HOWMANY | How many of /'you/' are there?
IF gordoEat >= 2 | IF knowGarlics >= 2 | REPLY | EATGARLICS | What if I got you Garlics?
IF gordoEat >= 2 | REPLY | EATBUTTER | What if I got you butter?
IF gordoEat == 2 | REPLY | ASKEAT2 | Let's break down the math of procre-eating...
IF gordoEat == 1 | REPLY | ASKEAT1 | Uh... /'procre-eat?/'
REPLY | NARYYEMIND | I best be on my way.

ASKDOWNHERE
DIALOG | P_NAME | Who are you? Why are you alone down here?
DIALOG | Fallen Gordo | We are Fallen Gordo, masters of all you see and hear. You are in our realm, so you better be on your best behavior.
DIALOG | P_NAME | Oh, so you run the Plantation?
DIALOG | Fallen Gordo | We ARE the Plantation. Without the guidance of our fist, this Plantation would fall into RUIN!! Through this remote we control the greatest symphony of torture and agriculture in the history of time.
GOTO | GORDOINFO

CHIDE
DIALOG | P_NAME = s_port_hoopzAngry | I think it's really mean what you're doing to all your workers up there. They're all miserable and don't even know it.
DIALOG | Fallen Gordo | Flattery will get you nowhere, Fraulein. We would not lower ourselves to procre-eat with something with such an unbecoming hairstyle.
QUEST | gordoEat = 1
QUEST | gordoChide = 2
GOTO | GORDOINFO

"+
//DIALOG | Fallen Gordo | What is this, the shop that does not have butter all of a goddamn sudden. Get B.A.B.B.Y. now! Butter is needed for my meal!
//DIALOG | Fallen Gordo | If butter did not exist it would be necessary to invent it.
"

WHOISUS
DIALOG | P_NAME | What do you mean we? You're just one person.
DIALOG | Fallen Gordo | ONE PERSON? You know nothing! Your insular mind cannot comprehend Fallen Gordo!
DIALOG | P_NAME | So when you are this fat you count as more than one person?
DIALOG | Fallen Gordo | Wrong all the time! When B.A.B.B.Y. comes you will be put on Garlics Removal Duty. And it will be your job to remove those replusive bulbs!
QUEST | knowGarlics += 1
DIALOG | P_NAME = s_port_hoopzAngry | I-I_ don't get it...
QUEST | gordoPlural = 1
GOTO | GORDOINFO

ASKEAT1
DIALOG | P_NAME | Procre-eat? What's that?
DIALOG | Fallen Gordo | We were once one inside, now we are many inside. When one Duergar eats another, one may appear to be left, but inside there are two. When stupid, pitiful Dwarf eats it is one divided by one. When noble, strong Duergar eats it is one PLUS one.
WAIT | 1.0
DIALOG | P_NAME | Uh...
DIALOG | Fallen Gordo | When this Duergar eats more Duergars, that Duergar too is added. All Duergars are added to Fallen Gordo. We are all here. There is no limit to the amount of lifeforms that may be added to the collective. Such is the true power of procre-eating.
DIALOG | P_NAME | So... if one Duergar eats another Duergar, the mind of the Duergar eaten becomes part of the eating Duergar?
DIALOG | Fallen Gordo | Correct.
DIALOG | P_NAME = s_port_hoopzAngry | (Gross.)
QUEST | gordoEat = 2
QUEST | gordoPlural = 2
GOTO | GORDOINFO

ASKEAT2
DIALOG | P_NAME | So if one Duergar eats ten Duergars, the Duergar shares his mind with ten Duergars?
DIALOG | Fallen Gordo | YES!
DIALOG | P_NAME | What if a Duergar who has eaten fifty five Duergars eats a Duergar who has eaten one hundred and seventy four Duergars? Does that mean two hundred... something... Duergars?
DIALOG | Fallen Gordo | YES! Two hundred and twenty nine. We are the Master Educators to have instructed such a pathetic inferior creature as yourself on the exquisite science of the Duergar.
DIALOG | P_NAME | That's really, really bizarre.
DIALOG | Fallen Gordo | You will learn the miserable ecstasy of our Duergar metabolism before your shift is up! I am sure of it! Now get butter or get B.A.B.B.Y, either one!
QUEST | gordoEat = 3
GOTO | GORDOINFO

HOWMANY
DIALOG | P_NAME | So how many people am I talking to right now?
DIALOG | Fallen Gordo | You are in the presence of the nine great minds:_ Pug, Butter, Aloysius P. Arbogast III, Jung, Jong, Vivian, Opie, Leif, and Chair.
DIALOG | P_NAME | /'Chair/' is an unusual name for a Duergar...
DIALOG | Fallen Gordo | We have also absorbed the chair we are sitting in. When you speak to us, you are speaking to Chair!
DIALOG | P_NAME | Poor Chair...
DIALOG | Fallen Gordo | Chair is pleased despite our complaints of the opressive weight!
DIALOG | P_NAME | Oh I'm just saying it seems like a rough life...
DIALOG | Fallen Gordo | You will know the true meaning of a rough life when B.A.B.B.Y. tears your arms and legs off and forces you to walk around on your tongue!
QUEST | gordoChair = 1
GOTO | GORDOINFO

EATBUTTER
DIALOG | P_NAME | What if I got you some butter?
DIALOG | Fallen Gordo | That is B.A.B.B.Y.'s job! Get B.A.B.B.Y. to get butter! Butter is already with us but we could always have more of us.
DIALOG | P_NAME | Uh okay...
QUEST | gordoButter = 1
GOTO | GORDOINFO

EATGARLICS
DIALOG | P_NAME | What if I got you some Garlics?
DIALOG | Fallen Gordo | NO! Don't you know anything?! Garlics are not to be procre-eaten with! Garlics are NON-COMPATIBLE with the eroticism of Duergar metabolism!
DIALOG | P_NAME | Oh okay so no Garlics, then...
DIALOG | Fallen Gordo | No Garlics, or else...
DIALOG | P_NAME | Or else what?
DIALOG | Fallen Gordo | Or else... b_o_o_m.
QUEST | knowGarlics += 1
GOTO | GORDOINFO

NARYYEMIND
DIALOG | P_NAME | I'll get out of here, see you later.
DIALOG | Fallen Gordo | We will see you this evening for your daily quota review.
EXIT |
" +
//GORDO'S BUTTER EXPLOSION
"
GORDOOFFER
DIALOG | P_NAME | Umm, excuse me, Mr. Gordo?
DIALOG | Fallen Gordo | What is it? Why are you here? Why aren't you working? We only procre-eat with those that deserve it and you are showing a funny way of deserving it!
CHOICE | Got anything for Fallen Gordo?
REPLY | GORDOBUTTER | I have some butter for you all.
REPLY | GORDOINFO | Let me ask you something.
REPLY | NARYYEMIND | Nary ye mind.

GORDOBUTTER
DIALOG | P_NAME | Great Plantation Overlord, I have your hourly helping of Sewer Butter.
DIALOG | Fallen Gordo | What? Where? We can't turn around come here, bring the BUTTER!
DIALOG | P_NAME | Uh, yes masters...
"+
//TODO: walk to the cinema object near Fallen Gordo
"
WAIT | 
DIALOG | Fallen Gordo | Now, slather it on our belly. Miss not one spot, ignore not one crease.
DIALOG | P_NAME = s_port_hoopzShock | My Clispaeth! You can't be serious?
DIALOG | Fallen Gordo | You must! We command it! You won't worm away from this duty!
CHOICE | Debase yourself?
REPLY | BELLYBUTTER | Alright, let me baste those folds.
REPLY | CONVINCETOEAT | Can't you see how much you want to eat it instead?

CONVINCETOEAT
DIALOG | P_NAME | You know, masters. Why don't you taste it instead of the belly application? Don't you want to eat the glorious butter?
DIALOG | Fallen Gordo | The smell disturbs us, we would rather have it on the skin. Prove to us that it tastes of the butter of old. Eat the butter. Eat the butter!
DIALOG | P_NAME = s_port_hoopzSurprise | (Gulp...)
CHOICE | Now what?
REPLY | BELLYBUTTER | Fine, I'll rub the belly...
REPLY | EATBUTTER | Fine, eat the butter...

EATBUTTER
DIALOG | P_NAME = s_port_hoopzSurprise | (What am I doing?!)
WAIT | 1.0
" +
//TODO: eat sound (not requested yet - 2/16/17)
"
DIALOG | P_NAME = s_port_hoopzShock | (Have mercy! This taste! It burns! I must summon my strength! I feel the butter bonding to my throat... my stomach... my soul...)
" +
//TODO: KNEELAT | o_fallenGordo01
//TODO: WAIT |
//TODO: GLAMP | guts | -1
//WAIT | 0.2
//TODO: GLAMP | luck | -1
//WAIT | 0.2
//TODO: GLAMP | acrobatics | -1
//WAIT | 0.2
//TODO: GLAMP | might | -1
//WAIT | 0.2
//TODO: GLAMP | piety | -1
//WAIT | 1.0
"
DIALOG | P_NAME = s_port_hoopzHappy | MMMMM! This has to be the best Sewer Butter I have ever tasted!
DIALOG | Fallen Gordo | What?! The best? Why are you procre-eating with Sewer Butter and not us?! Give it! Give it to us!
" + 
//TODO: LOOKAT | o_cts_hoopz | o_fallenGordo01
//TODO: USEAT | o_fallenGordo01
//TODO: WAIT | 1.0
//TODO: SOUND | eat sound
//TODO: WAIT | 1.0
"
DIALOG | Fallen Gordo | You were right. This is delicious Butter. We will share it with no one and only ourselves.
GOTO | GORDOSTART

BELLYBUTTER
DIALOG | P_NAME = s_port_hoopzShock | Oh yes, my surpreme masters. (Gulp) let me smother you in golden glory.
DIALOG | Fallen Gordo | If your hand gets stuck use more butter or B.A.B.B.Y. will have to saw it off. You will NOT get your hand back!
DIALOG | P_NAME = s_port_hoopzShock | (C-Clispaeth._._._ give me strength._._.))
" +
//TODO: Hoopz walks towards Gordo slightly and FADE TO BLACK, then fade back in with Hoopz on his knees, devastated
"
WAIT | 2.0
DIALOG | P_NAME = s_port_hoopzShock | I._._._ I will never... forget what I just did for the rest of my natural life... I will be permanently scarred and all other experiences will be tainted by what I just took part in. I hope that in the next life, whatever is beyond, karma will wipe the slate clean.
QUEST | behaveJaded += 1
GOTO | GORDOSTART

GORDOSTART
DIALOG | Fallen Gordo | You have served Fallen Gordo well. We may just consume you after all.
WAIT | 1.0
" +
//TODO: sound | grumble
"
DIALOG | Fallen Gordo | What_ what is this... what is this... feeling... we do now know this feeling... this_
" +
//TODO: PLAYSET | o_fallenGordo01 | redFace
//TODO: sound | grumble
"
GOTO | GARLICSSORT

GARLICSSORT
IF garlicButter == 2 | GOTO | FASTDEATH
IF garlicButter == 1 | GOTO | BABBYFIGHT

BABBYFIGHT
DIALOG | Fallen Gordo | What did you do? What did you do to us you miserable-
WAIT | 1.0
DIALOG | Fallen Gordo | B.A.B.B.Y.!  Save us B.A.B.B.Y.!
" +
//TODO: FRAME | CAMERA_FAST | o_babbySystem01
//TODO: PLAYSET | o_babbySystem01 | awaken | awoke
//TODO: SOUND | sn_babbyAwaken01
//TODO: FRAME | CAMERA_FAST | o_cts_hoopz | o_fallenGordo01
" +
DIALOG | Fallen Gordo | BABBY! Avenge ussssssss!
" +
//PLAYSET | o_fallenGordo01 | garlicsPop
//SOUND | sn_garlicsPop
//TODO: FRAME | CAMERA_FAST | o_babbySystem01
//TODO: PLAYSET | o_babbySystem01 | awaken | awoke
//TODO: MOVETO | o_cts_hoopz | cinemamarker | MOVE_FAST
//TODO: SURPRISEAT | o_babbySystem01
"
DIALOG | P_NAME = s_port_hoopzSmirk | Alright, B.A.B.B.Y.! Time to brast!
" +
//TODO: Babby fight!
"

FASTDEATH
DIALOG | Fallen Gordo | This feeling._._._
WAIT | 2.0
DIALOG | Fallen Gordo | GAAAAAARRRRRRRRLICCCCCSSSSSSS!
" +
//PLAYSET | o_fallenGordo01 | garlicsPop
//SOUND | sn_garlicsPop
"
WAIT | 1.0
DIALOG | P_NAME = s_port_hoopzSmirk | Heh, now that's what I call an /'eye opening experience./'
DIALOG | P_NAME | Let me see if that remote control controls the bridge...
QUEST | gordoState = 5
"
