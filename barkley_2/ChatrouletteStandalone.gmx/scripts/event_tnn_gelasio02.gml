///Gelasio's Note Chooser
script = "
CHOICE | How's the hunt for clues, gummie?
REPLY | NOTESELCTOR | I got a clue for you!
IF gelasioAugustine == 1 | REPLY | AUGUSTINEASK | Let me ask you about this /'Augustine/'
REPLY | NONOTE | Still working the beat.

NOTESELECTOR
DIALOG | P_NAME | What do you make of this?
NOTE | select
IF note == exit | GOTO | NARYYEMIND
IF note == none | GOTO | NONE
IF note == Pet Almanac | GOTO | 
IF note == Printed Invitation | PRINTEDINVITE
IF note == Clandestine Baller Zine | BALLERZINE
IF note == Gamesmasterjasper's Vidcon Almanac | VIDCONALMANAC
IF note == Ancient Scroll | ANCIENTSCROLL
IF note == Sealed Letter | LETTER
IF note == Love Letter | LETTER
IF note == Bloody Paper | BLOODYPAPER
GOTO | GENERIC_NOTE

NARYYEMIND
DIALOG | P_NAME | Oh um, nary ye mind.
DIALOG | Gelasio | Take your time, gumshoe.
GOTO | END

NONE
DIALOG | P_NAME | Oh, actually I don't think I have anything to show you yet. I'm clueless.
DIALOG | Gelasio | Don't worry about it gumshoe, let the clues come to you. Augustine is out there somewhere.
GOTO | END

GENERIC_NOTE
DIALOG | Gelasio | Hmmm, this isn't anything that really pops out to me. Sorry, kid.
GOTO | REASK

" +
//These notes are taken for SERIOUS CONSEQUENCES
"
PRINTEDINVITE
DIALOG | Gelasio | Ah, so the Gaming Klatch does exist.  I owe you a drink my boy, here have a grape on me, in exchange for the letter of course.
QUEST | duergarInfoGamingKlatch = 1

BALLERZINE    
DIALOG | Gelasio | B-ball, eh?  Not my favorite sport, no that's assuredly the great disc sport variant: Urban Ringo. But I do know someone who could use this.    
QUEST | duergarInfoBBall = 1
    
ANCIENTSCROLL
DIALOG | Gelasio | An ancient ruins in the Undersewers? Hmm … someone I know could really use this information.
QUEST | duergarInfoRuins = 1
    
" +
//These notes are returned for no consequence
"
VIDCONALMANAC
DIALOG | Gelasio | Vidcon's eh? I'm more into the flying disc sports if you catch my drift: Ultimate, Dodge Disc, Flutterguts, hell, even Goaltimate and Hot Box.  If it spins, it wins in my book.  When it comes to vidcons, however, I'm afraid that frisbee is just out of my reach.

LETTER    
DIALOG | Gelasio | Hey hey, I'm all about the connection of two souls, when a dwarf loves another dwarf, man I just want to pour them both a shot of the grape, but this isn't really my thing.
    
BLOODYPAPER
DIALOG | Gelasio | Kind of troubling that you'd be walking around with someone's blood n'guts all over. I'd rather not look at that one, slick. Ball this up and zap it in the zibby bin why don't ya.

" +  
//Gelasio asks if you have anything else and runs the Note Give again
"
DIALOG | Gelasio | Any other clues for me?

CHOICE |Any clues for Gelasio?
REPLY | GIVENOTE | Let me show you something.
REPLY | CLOSEVIEWER | Not now, maybe later.

GIVENOTE           
DIALOG | P_NAME | How's this for a scoop?
GOTO | NOTESELECTOR
    
CLOSEVIEWER           
DIALOG | P_NAME | I'll get back to you with some clues.
DIALOG | Gelasio | Hurry gumshoe, Auguestine and The Grape are waiting!
GOTO | END

AUGUSTINEASK
DIALOG | Bhroom | GO TO EVENT 03!
GOTO | END

NONOTE
DIALOG | P_NAME | Um not yet, sorry, Gelasio.
DIALOG | Gelasio | A thoughtful detective makes the right call, the FIRST TIME. I like your process, gumshoe.
GOTO | END

END
EXIT |
"
