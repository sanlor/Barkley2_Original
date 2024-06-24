// Event for the Governor's Speech.
external = 1;
script = "
REHEARSAL
QUEST  | startWedding = 1    
IF borisWedding == 1     | DIALOG | Boris      | Ah, our budding band leader returns! What ho, nubile wanderer!
IF janeWedding == 1      | DIALOG | Cap'n Jane | Hmmm... what took you so long? I can hardly hear the sound of me accordion over these lubbers!      
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | Hmph, of course one as unsophisticated as you wouldn't understand the unique and delicate beauty of a bellowing cuica...
IF polyWedding == 1      | DIALOG | Poly       | Aw, get choomed, Jane! Who the hell brings an accordion to a wedding?            
DIALOG | Stonewall /'Booty Daimyo/' Jackson    | Cool, cool... so the band's all assembled. So uh, which one of you is the singer?
IF wayneWedding == 1     | DIALOG | Wayne      | ...make someone else do it.
IF polyWedding == 1      | DIALOG | Poly       | I can't really drum and sing at the same time... get someone else to do it!
IF guillaumeWedding == 1 | DIALOG | Guillaume  | Don't look at me, maaaaan, I'm just the guitarist.
IF dinahWedding == 1     | DIALOG | Dinah      | Um, I'm not really a /'performer/', y'know? Like... I'm more of just a drum programmer?
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | The cuica zauber demands far too much focus to sing! If I lost concentration for even a fraction of a second, the cuica results could be disastrous.
IF janeWedding == 1      | DIALOG | Cap'n Jane | Not me! No how, no way!
IF garciaWedding == 1    | DIALOG | Garcia     | Uh... I'm kind of a, uhhh, background guy. H-have someone else do it!
IF wizardWedding == 1    | GOTO   | WIZARD_BASHING
GOTO   | SINGER_DILEMMA

WIZARD_BASHING
DIALOG | WIZARD          | I VOLUNTEER MY TORTURED SHRIEKS AND INFERNAL DEATH GROWLS IN THE NAME OF THE UNDIMMED STAR.
IF janeWedding == 1      | DIALOG | Cap'n Jane | Zip it, you overgrown water buffalo. Nobody wants to hear you mooing.
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | Silence, philistine! The horrible racket you've been making with that untuned guitar is more than enough, we don't need to hear your death moos too.
IF guillaumeWedding == 1 | DIALOG | Guillaume  | 'eeeey, man, maybe you should just take a chill pill for a while, y'know? All this doom and gloom stuff is killing my vibe, maaaan.
IF garciaWedding == 1    | DIALOG | Garcia     | I-I thought this gig was supposed to be at a wedding, not a mosh pit...
DIALOG | P_NAME | Oh, uh, hmmm... that's an interesting suggestion... we should definitely consider it... I'll write you down as a definite /'maybe/'.
IF borisWedding == 1     | DIALOG | Boris | I'd volunteer, but alas! The challenge of juggling both woodwind and warbling is too much for one such as myself!
GOTO   | SINGER_DILEMMA

SINGER_DILEMMA
DIALOG | Stonewall /'Booty Daimyo/' Jackson | Wait, wait, so you mean to tell me you got four musicians and forgot the most important part? You didn't get a singer?! Dad fruggit, kid! There's not much time left, what are we gonna do?
DIALOG | P_NAME          | Um, well... I guess I could give it a shot.
DIALOG | Stonewall /'Booty Daimyo/' Jackson | You, uh, you got the chops? You don't really look like much of a crooner to me...
CHOICE | I can SORTA sing, right?
REPLY  | SINGER_CROONER  | Trust me, I can croon with the best of them.
REPLY  | SINGER_SHOWER   | I sing in the shower.
REPLY  | SINGER_NOTE     | I can hold a note... sort of.
           
SINGER_CROONER 
DIALOG | P_NAME | Trust me, Stonewall. I can belt 'em out like old Blue Eyes.
GOTO   | SINGER_CHOSEN 
                    
SINGER_SHOWER
DIALOG | P_NAME | Don't worry, Stonewall, I practice in the shower. We'll be okay.
GOTO   | SINGER_CHOSEN 
      
SINGER_NOTE       
DIALOG | P_NAME | Um, well I can hold a note... sort of...
GOTO   | SINGER_CHOSEN       
    
GOTO   | SINGER_CHOSEN     
DIALOG | Stonewall /'Booty Daimyo/' Jackson    | Well, if you say so... We don't have enough time to go out and find another singer. That leaves us with one last thing - what's the band's name? You're gonna need something snappy, something people will remember.
IF borisWedding == 1     | DIALOG | Boris      | Something with aplomb!
IF guillaumeWedding == 1 | DIALOG | Guillaume  | Something trippy... something far out, maaaan...
IF polyWedding == 1      | DIALOG | Poly       | Somethin' totally kick ass!
IF janeWedding == 1      | DIALOG | Cap'n Jane | We need a name that'll strike fear in the hearts of our foes!
IF dinahWedding == 1     | DIALOG | Dinah      | Maybe something cool and futuristic... or artsy maybe?
IF garciaWedding == 1    | DIALOG | Garcia     | Something retro... something kind of new wave...
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | Something mystical... arcane... a reference to some eternal classic...
IF wizardWedding == 1    | DIALOG | WIZARD     | A NAME OF WAR, DESTRUCTION. A NAME THAT HEARKENS THE DAWN OF THE MORNING STAR.
IF wayneWedding == 1     | DIALOG | Wayne      | ...don't really care.
DIALOG | P_NAME          | A band name, huh...
CHOICE | What's the band name gonna be?
REPLY  | NAME_PICK | Baha Men II
REPLY  | NAME_PICK | Boyz IV Men
REPLY  | NAME_PICK | From Asher to Ashes
REPLY  | NAME_PICK | Another Beneficent Creation

NAME_PICK
DIALOG | P_NAME          | Hmmm, what about-
DIALOG | Stonewall /'Booty Daimyo/' Jackson    | I've got it! How about The Jazzy Rascals!
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | That certainly does have a ring to it.
IF wizardWedding == 1    | DIALOG | WIZARD     | THAT WILL SUFFICE.
IF dinahWedding == 1     | DIALOG | Dinah      | Y'know, I kinda like the sound of that.
IF polyWedding == 1      | DIALOG | Poly       | The Jazzy Rascals, huh? Y'know... that ain't half bad...
IF janeWedding == 1      | DIALOG | Cap'n Jane | Arrrr... that'll do just fine!
IF guillaumeWedding == 1 | DIALOG | Guillaume  | Yeaaaah, man. That's it! That's totally it! That's totally what I was thinking!
IF wayneWedding == 1     | DIALOG | Wayne      | ...cool.
IF wayneWedding == 1     | DIALOG | Garcia     | Yeah! That's it! That's the perfect name! The Jazzy Rascals!
IF borisWedding == 1     | DIALOG | Boris      | A name of such splendor, of such... pizazz! Yes! I could accept nothing less!
DIALOG | Stonewall /'Booty Daimyo/' Jackson    | Then it's settled! You're The Jazzy Rascals! Are you guys ready to show 'em what you're made of out there?
DIALOG | P_NAME          | (J-Jazzy Rascals...? That name is horrible... what about my name?)
FADE   | 1 | 1.5
WAIT   | 1.5
Teleport | r_bct_chapel02 | 232 | 136

START_WEDDING
FADE   | 1 | 3
WAIT   | 2 
SET    | o_cts_hoopz | singingStand 
FADE   | 0 | 0.3
WAIT   | 0
DIALOG | Stonewall | Beautiful... simply beautiful. My congratulations to bride and groom - may your marriage be long and happy. But enough of this wedding puck, that's not why you're here. It's time for the main course, the soup du jour, the moment everyone's been waiting for, Brain City's very own.......... JAAAAAAAAZZY RAAAAAASCAAAAAAALS!!!
WAIT   | 0
DIALOG | P_NAME    | (Stop saying that...)
WAIT   | 0
DIALOG | Stonewall | Now before the band starts playing, I'd like to take a moment to introduce everyone...
IF wayneWedding == 1     | GOTO | WAYNE_HAVE
IF polyWedding == 1      | GOTO | POLY_HAVE
IF guillaumeWedding == 1 | GOTO | GUILLAUME_HAVE
IF dinahWedding == 1     | GOTO | DINAH_HAVE
IF zalmoxisWedding == 1  | GOTO | ZALMOXIS_HAVE
IF janeWedding == 1      | GOTO | CAPN_HAVE
IF wizardWedding == 1    | GOTO | WIZARD_HAVE
IF borisWedding == 1     | GOTO | BORIS_HAVE
IF garciaWedding == 1    | GOTO | GARCIA_HAVE

WAYNE_HAVE
WAIT   | 0.5
DIALOG | Stonewall | He's not much of a talker, but it don't matter when he's 'doo'ing his thang! Shreddin' the keyboard is Waaaaayne!
WAIT   | 0.5
DIALOG | Wayne     | ...hey.

POLY_HAVE
WAIT   | 0.5
DIALOG | Stonewall | She may be loud and she may love to fight, but Clispaeth help me if this gal can't rock'n'roll! On drums is Pooooooly!
WAIT   | 0.5
DIALOG | Poly      | Cut the cruft Stonewall, let's get this shit goin'!

GUILLAUME_HAVE
WAIT   | 0.5
DIALOG | Stonewall | His bizarre new age schtick may seem anachronistic, maybe even meaningless four millenia after the hippie movement, but there's nothing culturally irrelevant about his musical chops. On guitar is Guillaaaaaaaaume!
WAIT   | 0.5
DIALOG | Guillaume | I'm feelin' it... I'm feelin' the love, I'm feelin' the vibes! My chakras are on the fritz, maaan!

DINAH_HAVE
WAIT   | 0.5
DIALOG | Stonewall | This cyberdelic datapunk may be new to the performing game, but her drum programming is second to none. Rockin' the drum machines iiiiiis Diiiiiinah!
WAIT   | 0.5
DIALOG | Dinah     | Hope you guys like four on the floor rhythms because that's all I can do so far.

ZALMOXIS_HAVE
WAIT   | 0.5
DIALOG | Stonewall | One part enigmatic and two parts contemptuous, hailing from the cryptic halls of the Death Tower is the one and only cuicamancer, Zaaaaaaaalmoxis!
WAIT   | 0.5
DIALOG | Zalmoxis  | Hmph. It's time to enlighten you ignoramuses to the splender of my cuica zauber.

CAPN_HAVE
WAIT   | 0.5
DIALOG | Stonewall  | She's spent her life aplunderin' booty on the high seas (my kinda woman!) but now she's here to steal our hearts with her music. On accordion is the dread pirate... Cap'n Jaaaaaaaaane!
WAIT   | 0.5
DIALOG | Cap'n Jane | Arrrr! Don't look at me like that, I'm only doin' this for the money!

WIZARD_HAVE
WAIT   | 0.5
DIALOG | Stonewall | With an instrument bigger than most of his bandmates, this bull-headed bassist is as kvlt as he is gigantic! Is he even a dwarf? Iiiiiit's WIIIIIIIIZARD
WAIT   | 0.5
DIALOG | WIZARD    | I DEDICATE THIS WAR DIRGE TO THE UNHOLY SERPENT WHOSE BLASPHEMY DESECRATES THE SPIRITS OF IMPURE PROFLIGATES.
    
BORIS_HAVE    
WAIT   | 0.5
DIALOG | Stonewall | To be honest, it seems like there's somethin' wrong with this guy. But whether or not he's a sex offender, he's great at that flute. Iiiiiiit's Booooooris!
WAIT   | 0.5
DIALOG | Boris     | Hearken, rascals, hearken! Let us consecrate this nuptial with a melody most sensual!
GOTO   | LAST_BUT_NOT_LEAST

GARCIA_HAVE
WAIT   | 0.5
DIALOG | Stonewall | Behind the keyboard is, uh, Jordan? Germaine? He had a song 30 years ago.
WAIT   | 0.5
DIALOG | Garcia    | I-it's /'Garcia/', everyone. Garcia!
GOTO   | LAST_BUT_NOT_LEAST

LAST_BUT_NOT_LEAST
WAIT   | 0.5
DIALOG | Stonewall | Last and certainly not least is the shining star of this production, the hottest new voice on the block and the jazziest rascal of them all - P_NAME!!!
IF falseFlag == 2  | GOTO | FALSE_FLAG
IF falseFlag != 2  | GOTO | FALSE_FLAG_NOT

FALSE_FLAG
DIALOG | P_NAME | ................teny.
QUEST  | falseFlagWedding 1
GOTO   | SONG_START

FALSE_FLAG_NOT
DIALOG | P_NAME | Here goes nothin'...
GOTO   | SONG_START

SONG_START
DIALOG | Stonewall | So without further adieu... the Jazzy Rascals!
WAIT   | 2
FADE   | 1 | 2
WAIT   | 2.5
QUEST  | afterWedding = 1
Teleport | r_bct_tower02 | 232 | 160 | 2

POST_WEDDING
FADE   | 1 | 1
WAIT   | 2.5
FADE   | 0 | 1
WAIT   | 1
DIALOG | Stonewall /'Booty Daimyo/' Jackson   | Unbelievable! You guys were amazing on that stage! Did you see me shakin' my glutes out there? The Jazzy Rascals, man!
IF polyWedding == 1      | DIALOG | Poly      | Man, that was killer! You see those people rockin' out there? The Jazzy Rascals fuckin' rule!
IF guillaumeWedding == 1 | DIALOG | Guillaume | Maaaan, the vibes I was gettin' out there... all of us in sync, cosmic harmony, y'know? I could really feel the energy, man.
IF wayneWedding == 1     | DIALOG | Wayne     | ...we rocked.
IF garciaWedding == 1    | DIALOG | Garcia    | Y-yeah, that went pretty well, guys. Haven't had a gig like that since... man... you think we're gonna get a Wikipedia page?
IF janeWedding == 1 | IF zalmoxisWedding == 1 | DIALOG | Cap'n Jane | Arrr... the Jazzy Rascals weren't so bad after all. Not even that weird honking thing Zalmoxis played.
IF janeWedding == 1 | IF zalmoxisWedding == 0 | DIALOG | Cap'n Jane | Arrr... the Jazzy Rascals weren't so bad after all.
IF dinahWedding == 1     | DIALOG | Dinah     | I was kinda nervous at first but once we got up there and really started goin' at it, my butterflies completely went away. That was awesome!
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis  | I am... surprised at how well that went. The Jazzy Rascals were `w1`far`w0` more competent than I had presumed.
ÍF borisWedding == 1     | DIALOG | Boris     | T'was quite enjoyable to toot with fellows so genial! I hope indeed we have the opportunity to play again.
IF wizardWedding == 1    | DIALOG | WIZARD    | THE SON OF PERDITION IS SATISFIED.
DIALOG | P_NAME | Thanks... (I guess...)
IF bootyBassQuest == 3   | DIALOG | Stonewall /'Booty Daimyo/' Jackson | P_NAME, you're the total package! You can spin the vinyl, you've got an eye for talent and you've got some real singing chops. You were made for show business - you're gonna go places, kid! You really are the jazziest of rascals! That's a great name, by the way. You picked a good one!
IF bootyBassQuest != 3   | DIALOG | Stonewall /'Booty Daimyo/' Jackson | And P_NAME, you really stole the show with those pipes of yours out there. You've got an eye for talent and you've got some real singing chops. You were made for show business - you're gonna go places, kid! You really are the jazziest of rascals! That's a great name, by the way. You picked a good one!
DIALOG | P_NAME = s_port_hoopzAngry | (I hate that name... can we please stop saying it...)
DIALOG | Stonewall /'Booty Daimyo/' Jackson | So hey, we really hit the jackpot on this one, rascals. @money_wedding_prize_total@ neuro-shekels, can you believe it? GatDAM, that's the kinda money that makes wanna go full-time in the management biz. So that's @money_wedding_prize_single@ for me, @money_wedding_prize_subtracted@ for the rest of you. Split five ways, that's @money_wedding_prize_single@ a piece.
QUEST  | money += @money_wedding_prize_single@
NOTIFY | Found @money_wedding_prize_single@ neuro-shekels!
DIALOG | Stonewall /'Booty Daimyo/' Jackson    | So I've got just one question for you all - what's next for The Jazzy Rascals?
IF polyWedding == 1      | DIALOG | Poly       | Me? I'm gonna rock and roll, man! I'm startin' a new band that's gonna rock even harder, even faster than The Jazzy Rascals!
IF guillaumeWedding == 1 | DIALOG | Guillaume  | I think I'm gonna go Walden for a while, recharge my chakras and get my crystals attuned back to nature. Maybe I'll start a hippie fest with this cash or something. Who knows, maaaan.
IF garciaWedding == 1    | DIALOG | Garcia     | A-are you serious? I'm going on tour, baby! I'm taking this as far as I can! Jazzy Rascals shirts, CDs, coffee mugs, all the merchandise!
IF polyWedding == 1      | DIALOG | Poly       | Yeah, you would, you fuckin' sellout.
IF janeWedding == 1      | DIALOG | Cap'n Jane | The Jazzy Rascals were a nice diversion, but it's back to the high seas for me! I'm gettin' meself a new ship, a new crew and I'm goin' lootin' and plunderin'!
IF dinahWedding == 1     | DIALOG | Dinah      | Huh, I guess I'm gonna get some new gear and start working on an album or something. Maybe a Jazzy Rascals remix?
IF wayneWedding == 1     | DIALOG | Wayne      | ...goin' back to my cave.
IF janeWedding == 1      | DIALOG | Cap'n Jane | You should join me crew, Wayne. We could always use another hand on the ship and the fresh air would do ya good!
IF janeWedding == 1      | DIALOG | Wayne      | ...no thanks.
IF zalmoxisWedding == 1  | DIALOG | Zalmoxis   | I am... surprised at how well that went. The Jazzy Rascals were /far/ more competent than I had presumed.
IF borisWedding == 1     | DIALOG | Boris      | T'was quite enjoyable to toot with fellows so genial! I hope indeed we have the opportunity to play again.
IF wizardWedding == 1    | DIALOG | WIZARD     | THE SON OF PERDITION IS SATISFIED. I WILL REMAIN IN BRAIN CITY TO SPREAD HIS WORD.
DIALOG | P_NAME | Well, I think I'm gonna take a break from show business to do some quests and stuff. I love to do quests.
IF bootyBassQuest == 3   | DIALOG | Stonewall /'Booty Daimyo/' Jackson | Well rascals, it's been fun but I've got a club to run. If you're gonna be around for a while, we'll be having a Duke of Booty contest not too long from now. Baron, I know that's right up your alley. Jazzy Rascals - see ya later!
IF bootyBassQuest != 3   | DIALOG | Stonewall /'Booty Daimyo/' Jackson | Well rascals, it's been fun but I've got a club to run. If you're gonna be around for a while, we'll be having a Duke of Booty contest not too long from now. Jazzy Rascals - see ya later!
DIALOG | P_NAME | (Please stop saying Jazzy Rascal...)
FADE   | 1 | 2
WAIT   | 2
EVENT  | o_stonewallBootyDaimyoJackson02 | 0
WAIT   | 0.5
FADE   | 0 | 2
WAIT   | 2
";

/*
";
/*
/*
//-----------------------
//PLAY SONGS HERE
//-----------------------

scr_event_build_animation_set(o_cts_hoopz, "singing 

//Have Garcia.
IF garciaWedding") == 1){
}

//Have Jane.
IF janeWedding") == 1){
}

//Have Wayne.
IF wayneWedding") == 1){
}

//Have Poly.
IF polyWedding") == 1){
}

//Have Dinah.
IF dinahWedding") == 1){
}

//Have Zalmoxis.
IF zalmoxisWedding") == 1){
}

//Have Boris.
IF borisWedding") == 1){
}

//Have Guillaume.
IF guillaumeWedding") == 1){
}

//Have WIZARD.
IF wizardWedding") == 1){
