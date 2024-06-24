///Finding and Taking the Choco-mallows
/*
VARIABLES
    chocoBballs
        0 - haven't seen the cache
        1 - seen the cache
        2 - dribbled the ball
        3 - cut open the ball
        4 - taken the first crate
        5 - taken the second crate
        6 - taken the third crate
*/
script = "
IF chocoBballs == 6 | GOTO | EMPTY
IF chocoBballs == 5 | GOTO | SECONDCRATE
IF chocoBballs == 4 | GOTO | FIRSTCRATE
IF chocoBballs == 3 | GOTO | OPENED
IF chocoBballs == 2 | GOTO | DRIBBLED
IF chocoBballs == 1 | GOTO | SEEN
IF chocoBballs == 0 | GOTO | DISCOVERY

EMPTY
DIALOG | P_NAME | It feels like those Choco-mallows went pretty quick... shame...
EXIT |

OPENED
DIALOG | P_NAME | The Bball Cache... Do I have time to dribble?
GOTO | PICKUP

SEEN
DIALOG | P_NAME | These bballs...
GOTO | MALLOWSORTER

DISCOVERY
" +
//TODO: SURPRISEAT | o_chocoBballs01
"
DIALOG | P_NAME = s_port_hoopzSurprise | Wow what is this? A hidden cache of bballs?!
QUEST | chocoBballs = 1
WAIT | 0.5
DIALOG | P_NAME | I wonder what the Z means...
GOTO | MALLOWSORTER

MALLOWSORTER
IF comServ >= 4 | GOTO | CONNECTION_CORNROW
IF twoBoys == 2 | GOTO | CONNECTION_VIVIAN
DIALOG | P_NAME | Eh, probably nothing unusual about three crates of unused bballs hidden deep in the sewers. I'll be on my way...
EXIT |

CONNECTION_CORNROW
DIALOG | P_NAME | Something tells me these bballs have something to do with Cornrow and Juicebox.
GOTO | PICKUP

CONNECTION_VIVIAN
DIALOG | P_NAME | Didn't Vivian mention something about these Bballs?_ Like those two boys who helped her out? Hmmm.
GOTO | PICKUP

PICKUP
CHOICE | What to do?
REPLY | DRIBBLE | Maybe I can practice my_ /'double dribble./'
REPLY | LEAVE | Eh, later.

DRIBBLE
DIALOG | P_NAME | Let's see if I still have those skillz to pay the billz...
SET | o_chocoBballs01 | dribble
QUEST | chocoBballs = 2
" +
//TODO: pick up bball, dribble, realize it is flat
"
WAIT | 
DIALOG | P_NAME | Something is wrong with this ball... it's not deflated I don't think... almost like something is_ I_N_S_I_D_E...
CHOICE | Something in the bball?
REPLY | CUTOPEN | Cut it open.
REPLY | LEAVEIT | Leave it be.

CUTOPEN
DIALOG | P_NAME | At the risk of Baller Sacrilege... I think I need to see what's contained inside this rock...
" +
//TODO: Hoopz cuts open the bball
"
WAIT | 1.0
DIALOG| P_NAME = s_port_hoopzShock | GADFRUGGIN' ZOOKS! These bballs are chocful of Choco-mallows!
WAIT | 1.0 
DIALOG | P_NAME | This is Grade A street stuff. Must be at least ten keys...
QUEST | chocoBballs = 3
SET | o_chocoBballs01 | opened
CHOICE | The Mallow Motherlode...
REPLY | LOADUPFIRST | Cut open some bballs, get mallows.
REPLY | BACKLATER | I'll be back for the mallows.

LOADUPFIRST
DIALOG | P_NAME | I'll cut open one crate and fill my pockets with the Choco-mallows...
" +
//TODO: USEAT | o_chocoBballs01
//TODO: fill remaining pockets with choco-mallows
//TODO: check for pockets full or 1 empty, if so go to POCKETSFULL
"
QUEST | chocoBballs = 4
SET | o_chocoBballs01 | firstCrate
DIALOG | P_NAME | Alright, time to put these Choco-mallows to good use!
EXIT |

SECONDCRATE
DIALOG | P_NAME | One crate left... should I load up on mallows?
CHOICE | Load up on Choco-mallows?
REPLY | LOADUPTHIRD | Load up.
REPLY | BACKLATER | Move on.

FIRSTCRATE
DIALOG | P_NAME | Two crates left... should I load up on mallows?
CHOICE | Load up on Choco-mallows?
REPLY | LOADUPSECOND | Load up.
REPLY | BACKLATER | Move on.

LOADUPTHIRD
DIALOG | P_NAME = s_port_hoopzHappy | Alright! It's Mallow Time!
" +
//TODO: USEAT | o_chocoBballs01
//TODO: fill remaining pockets with choco-mallows
//TODO: check for pockets full or 1 empty, if so go to POCKETSFULL
"
QUEST | chocoBballs = 6
SET | o_chocoBballs01 | thirdCrate
DIALOG | P_NAME | That's it, that's all the Choco-mallows... I hope I put them to good use... Only time will tell.
EXIT |

LOADUPSECOND
DIALOG | P_NAME = s_port_hoopzHappy | Alright! It's Mallow Time!
" +
//TODO: USEAT | o_chocoBballs01
//TODO: fill remaining pockets with choco-mallows
//TODO: check for pockets full or 1 empty, if so go to POCKETSFULL
"
QUEST | chocoBballs = 5
SET | o_chocoBballs01 | secondCrate
DIALOG | P_NAME | All set... Hmmm only one crate left. Better ration out my mallows.
EXIT |

POCKETSFULL
DIALOG | P_NAME | Hmmm. My pockets are full, I should drop some weight before I harvest more mallows...
EXIT |

BACKLATER
DIALOG | P_NAME | I'll be back later... this stash is safe for now in the sewers.
EXIT |

LEAVEIT
DIALOG | P_NAME | I'll do it later, bball isn't everything._ Or is it?
EXIT |
"
