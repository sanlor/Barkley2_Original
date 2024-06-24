///Vivian the Drug Running Granny
/*
Variables
    vivianState
        0 = not talked
        1 - talked to
    grannyIncapped
        0 - you haven't killed Granny
        1 - you have killed Granny
*/
script = "
IF body == governor | GOTO | GOVERNOR
IF grannyIncapped == 1 | GOTO | GRANNY_DOWN
IF comServ >= 6 | GOTO | COMMUNITY6
IF curfew == after | GOTO | POSTCURFEW
IF clock >= 2 | GOTO | VIVIAN2
IF clock < 1 | GOTO | VIVIAN1

GOVERNOR
DIALOG | Vivian | You certainly don't see many Duergars at Father Giuseppe's sermons... Perhaps if we had a larger chapel, more people would be interested...

GRANNY_DOWN
DIALOG | P_NAME | (I'm not going to bother her. She's sleeping so heavily, she must have been really tired.)

COMMUNITY6
IF curfew == before | GOTO | VITAMINS
DIALOG | P_NAME | (Hmm, I think this is Mr. Cornrow's granny. They asked me to give her vitamins, but that was kind of a while ago... maybe I should go check on them instead...)

VITAMINS
DIALOG | P_NAME | (Hmm, I think this is Mr. Cornrow's granny. Should I give her the vitamins?)
CHOICE | Inject the vitamins into Vivian?
REPLY  | VITAMINS_YES | Yeah.
REPLY  | VITAMINS_NO  | Nah.

VITAMINS_YES
DIALOG | P_NAME | (Okay, well - here goes!)
DIALOG | Vivian | Wh-wha? Young man, no need to be so uncouth...
WAIT   | 0.5
DIALOG | Vivian | I'm feeling... uh uhh-ughhhhh...
WAIT   | 0.5
SOUND  | sn_hoopz_blunthit01
SET    | o_vivian01 | onground
WAIT   | 1.0
DIALOG | P_NAME = s_port_hoopzHappy | (Looks like I got here just in the nick of time! I guess going so long without her vitamins made her tired. I'm not gonna wake her up, she needs all the rest she can get!)
QUEST  | comServ = 7
QUEST  | grannyIncapped = 1
ITEM   | Granny's Medicine | -1
GOTO | END

VITAMINS_NO
DIALOG | P_NAME | (Well, I guess I can take care of this later...)
GOTO | VIVIANQUESTIONS

VIVIANQUESTIONS
CHOICE | Talk to Old Granny Vivian?
REPLY | CLISPAETH1 | What can you tell me about Clispaeth?
IF commServ == 6 | IF vivianKids == 0 | REPLY | GRANDKIDS | Are Cornrow and Juicebox your grandchildren?
IF commServ == 6 | IF vivianKids == 1 | REPLY | VITAMINS_YES | (Flub it, I'll just give her her vitamins.)
IF commServ >= 2 | IF grannyHouse == 0 | REPLY | HOUSE | Do you live in the blue shack to the north?
IF twoBoys == 1 | REPLY | Two helpers you say?
REPLY | NARYYEMIND | Nary ye mind.

GRANDKIDS
DIALOG | P_NAME | Vivian, are Cornrow and Juicebox really your grandkids?
DIALOG | Vivian | Yes they are. We are all Clispaeth's children.
DIALOG | P_NAME | Yeah but that really doesn't answer my question. I was asking if they ARE your grandchildren?
DIALOG | Vivian | Oh yes, you are such a sweet boy for asking.
DIALOG | P_NAME = s_port_hoopzAngry | Uh... alright, this is going nowhere.
QUEST | vivianKids = 1
GOTO | VIVIANQUESTIONS

HOUSE
DIALOG | P_NAME | Don't you live in that house by Morty's Candy Shop?
DIALOG | Vivian | Yes, dear.
DIALOG | P_NAME | Well why does the front door have that tape all over it?
DIALOG | Vivian | Oh, well I don't know about all that. My two little helpers said I should come here because of /'the heat./' I don't remember Tir na nOg getting so warm in these months but with youngsters Wrist-Conps and Smart Apps and whatchamajiggers I just listen. Little old me can't stand the heat anymore.
QUEST | grannyHouse = 1
GOTO | VIVIANQUESTIONS

TWOBOYS
DIALOG | P_NAME | You mentioned two helpers?
DIALOG | Vivian | Oh yes, such sweet boys. Wanted me to keep their candy in my bathtub. Well I wasn't using my tub anymore because I'm old you see? And old people don't sweat.
DIALOG | P_NAME | Oh I didn't know that...
DIALOG | Vivian | It's true. But I never did see those Chocolate-whatsamahavers in my bathtub. Those two sweet boys came by and said they had a change of plans and that it's best if I got to church. We you don't have to tell me twice to praise the Lord! I skedaddled right on over here.
DIALOG | P_NAME | Interesting...
QUEST | twoBoys == 2

CLISPAETH1
DIALOG | P_NAME | What can you tell me about Clispaeth?
DIALOG | Vivian | Well...
IF clispFact == 0 | GOTO | CLISP_FACT01
IF clispFact == 1 | GOTO | CLISP_FACT02

NARYYEMIND
DIALOG | P_NAME | Nary ye mind, I'll be going Vivian.
DIALOG | Vivian | Clispaeth bless you, little one.
GOTO | END

POSTCURFEW
DIALOG | Vivian | Maybe the new Duergar Governor isn't as bad as we had initially thought. Perhaps he is a blessing from Clispaeth after all, or perhaps what they say is true - that Cuchulainn really was one of Clispaeth's Disciples...
GOTO | VIVIANQUESTIONS

CLISP_FACT02
DIALOG | Vivian | Youngster, I can tell you have a deep faith in Clispaeth and I admire that. But I can tell you're also going through deep inner turmoil, that you're losing your identity and questioning that faith. Sometimes the best thing to do is to close your eyes and relax for a little bit. Try a new fruit. Try some grapes. If you don't like grapes, try raisins.
QUEST | clispFact = 0
GOTO | VIVIANQUESTIONS

CLISP_FACT01
DIALOG | Vivian | Some people say Cuchulainn knew Clispaeth, that he might have even been one of his Disciples! How could Cuchulainn have fallen so far from Clispaeth's teachings? What made Cuchulainn change so much? Is this what Clispaeth would have wanted? Is all this part of Clispaeth's plan?
QUEST | clispFact = 1
GOTO | VIVIANQUESTIONS

VIVIAN2
IF vivianState <= 1 | DIALOG | Vivian | DIALOG | Vivian | Clispaeth was the prophet of the Cyberpocalypse. He and his apostles brought salvation to everyone, even those nasty Duergars. These days, all dwarfs seem to care about are gems and fruits and Cuchulainn's Prize. I love gems and fruits too, but I would never place them before Clispaeth...
IF vivianState == 2 | DIALOG | Vivian | Oh hello again sweet boy.
QUEST | vivianState = 2
GOTO | VIVIANQUESTIONS

VIVIAN1
IF vivianState == 0 | DIALOG | Vivian | Oh, Father Giuseppe is such a kind man. His sermons about Clispaeth are the only things that give me hope sometimes. I'm... I'm starting to wonder what fate Cuchulainn has in store for the dwarfs... every day there's more and more of us here and things are getting worse and worse. But... but as long as I keep my faith in Clispaeth, I'll remain strong.
IF vivianState == 1 | DIALOG | Vivian | Oh hello again sweet boy.
QUEST | vivianState = 1
GOTO | VIVIANQUESTIONS

END
EXIT |
";
