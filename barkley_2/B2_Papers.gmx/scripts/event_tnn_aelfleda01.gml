///Aelfleda's Eviction Story
// usage: event_tnn_aelfleda01();
/*   
    VARIABLES:
        aelfledaState
            0 = not talked, starting state
            1 = chose "neither"... she'll just ignore you now
            2 = chose "short" or "long"... heard her story
            3 = final dialogue
            
        aelfledaEvict
            0 = haven't heard about her eviction, OR declined to help her, can't be saved at curfew
            1 = have heard about her eviction and can pay money to keep her from being evicted
            2 = payed her rent and allowed her to get back to her house
            3 = Aelfleda is instantly taken to the sewers and can be found dead
            4 = Aelfleda waits on the steps a little longer after you tell her she's paid up
            5 = ClockTime state that removed Aelfleda after a time, she'll end up in block house after you talk to her mattress
			6 = Aelfleda can move in with Chanticleer
        
        gelasioDuergar
            0 = haven't learned anything about Gelasio's dealings with the Duergars
            1 = you've gained a little suspicion about Gelasio
            2 = you've gained enough suspicion to confront Gelasio (you get the other +=1 from Jindritch)  
            
        aelfledaAugustine
            0 = you haven't heard about Augustine
            1 = she mentions Augustine, but not by name
            2 = she mentions Augustine by name
            3 = Gelasio lies and shoots down you questioning about Aelfleda through character assassination
            4 = state that removes you questioning Augustine in his confrontation
            5 = the truth is out and you know that Gelasio was the guy who ratted out Augustine 
        
        Needs:
        1 Move to sewers, possibly.
        2 Return with money, possibly.
        3 different amounts
*/

script = "
IF body == governor   | GOTO | AELFLEDA_GOVERNOR
IF aelfledaEvict == 6 | GOTO | NEWROOM
IF aelfledaEvict == 2 | GOTO | AELFLEDARENEW
IF aelfledaAugustine == 3 | GOTO | AELFLEDA_GELASIO
IF aelfledaState == 0 | GOTO | AELFLEDA0
IF aelfledaState == 1 | GOTO | AELFLEDA1
IF aelfledaState == 2 | GOTO | AELFLEDA2
GOTO | WAITING

NEWROOM
DIALOG | P_NAME = s_port_hoopzHappy | Hey Aelfleda! Great news! I found a place for you to stay!
DIALOG | Aelfleda | You what?
DIALOG | P_NAME | I found a place in the Sewers... well the Undersewers. A really swell hermit said he'd take you in!
DIALOG | Aelfleda | Really? You mean it?
DIALOG | P_NAME | Yeah!
DIALOG | Aelfleda | ... Great... thank you.
DIALOG | P_NAME | Don't mention it! But say... you still look kinda bummed... are you alright?
DIALOG | Aelfleda | Oh no, I'm great. I'm ecstatic... this is just how I look, they call it Resting Despondence Face. So I can go down right now?
DIALOG | P_NAME | Yeah!
DIALOG | Aelfleda | Thank you, P_NAME. You truly are a /'saviour of the dwarfs./'
" +
//TODO: ROUNDMOUND (dwarf mayor?)
"
EXIT |

AELFLEDARENEW
DIALOG | P_NAME = s_port_hoopzHappy | Hey Aelfleda! Great news!
DIALOG | Aelfleda | What? They aren't going to streetsweep me to death?
DIALOG | P_NAME = s_port_hoopzHappy | No, even better!_ I paid off your eviction! You can go back home!
WAIT | 1.0
DIALOG | Aelfleda | You did what?
DIALOG | P_NAME = s_port_hoopzHappy | I had some extra neuro-shekels sitting around and so I decided to help you out!
DIALOG | Aelfleda | You..._ you shouldn't have.
DIALOG | P_NAME = s_port_hoopzHappy | You don't need a reason to help people! So I thought it would me nice.
DIALOG | Aelfleda | I don't know what to say... T-_thank you!
DIALOG | P_NAME | Don't mention it! But say... you still look kinda bummed... are you alright?
DIALOG | Aelfleda | Oh no, I'm great. I'm ecstatic... this is just how I look, they call it Resting Despondence Face. So I can get back in right now?
DIALOG | P_NAME | Yeah, I'm sure you can!
DIALOG | Aelfleda | I don't know how to repay you P_NAME_S. Look, go into my apartment and underneath the matress is a Vidcon. It was my mothers, and her mothers before her. But I want you to have it. It's the least I can do.
DIALOG | P_NAME = s_port_hoopzHappy | Really?! Gee thanks!
DIALOG | Aelfleda | I_ I'm just going to hang out here for a little bit and reflect on the precipice of darkness that I once stood.
DIALOG | P_NAME | Okay, well thanks again for that vidcon, and enjoy your /'new lease on life./'
DIALOG | Aelfleda | Thank you, P_NAME. You truly are a /'saviour of the dwarfs./'
" +
//TODO: ROUNDMOUND (dwarf mayor?)
"
QUEST | behaveJaded -= 1
QUEST | aelfledaEvict = 4
QUEST | aelfledaMatress = 1
EXIT |

AELFLEDA_CURFEW
DIALOG | Aelfleda | Well, I'd tell you the long version but it's curfew time, so I'm sure the Duergars are going to come any minute now and give me their worst. So... do you want to hear the short version or not?
GOTO   | STORY_SHORT

AELFLEDA_GELASIO
DIALOG | Aelfleda | Time's almost up. What brings you by again?
DIALOG | P_NAME   | I talked to that guy Gelasio.
DIALOG | Aelfleda | Do I want to hear what he has to say?
DIALOG | P_NAME   | Um, probably not.
DIALOG | Aelfleda | Figures. He needs to get a life.
EXIT |

WAITING
IF clock < 2.0 | GOTO | WAITING0
GOTO | WAITING1

WAITING0
DIALOG | Aelfleda | I knew I was living right on the line, but I was trying my best... things sure fell apart really fast.

WAITING1
IF aelfledaRepeat == 1 | GOTO | WAITING2
IF curfew == during | DIALOG | Aelfleda | Hey again. You heard that curfew announcement? I'm sure the Duergars are coming to round me up soon... maybe we cross paths again, P_NAME_S.
IF curfew != during | DIALOG | Aelfleda | Hey again. Nothing new here. Curfew's gonna happen soon though, so I'll be out of here and in the sewers maybe? I've heard they can be uh... liveable... I guess.
QUEST  | aelfledaRepeat = 1

WAITING2
DIALOG | Aelfleda | I'm pretty sure I'll be gone soon. Maybe we'll cross paths again, P_NAME_S.

STORY
CHOICE | Hear what version?
REPLY  | SHORT   | Short.
REPLY  | LONG    | Long.
REPLY  | NEITHER | Neither.

STORY_SHORT
CHOICE | Hear the short version?
REPLY  | SHORT   | Okay, lay it on me.
REPLY  | NEITHER | Not interested.

SHORT
DIALOG | P_NAME | Let's stick with the short version.
DIALOG | Aelfleda | Eh, you know what, now I don't really feel like talking all that much. Basically these two dwarfs appeared from out of nowhere and started drinking. One of them ran up an exorbitant bill on my tab, and then skipped town.
DIALOG | P_NAME | Wow, he sounds like a jerk.
DIALOG | Aelfleda | Oh, who cares.
QUESt | aelfledaAugustine += 1
QUEST | aelfledaState = 2
GOTO | HELP_CHOICE

LONG
DIALOG | P_NAME | Hit me with the long version.
IF clock >= 2.0 | GOTO | DISMISS
GOTO | STORY_LONG

STORY_LONG
QUEST | aelfledaState = 2
DIALOG | Aelfleda | Okay, here it goes...\Recently these dwarfs I used to know, Augustine and Gelasio, showed up back in Tir na Nog. Last I heard, the Duergars had banished them to the mines to toil for Cuchulainn eternally... so seeing them was a big surprise. Dwarfs don't usually last too long around here anyway, let alone come back from the mines. But here they were, living large and blowing a lot of shekels. I didn't even know where they got them.\What a dope I was! I was hanging out with Augustine a few nights ago, and maybe we had a bit too much juice... it's possible. He told me he forgot his billfold, and asked if I would cover the check, that he would pay me back first thing the next day. I said sure, and put it on my tab. It's been days now and no sign of him, anywhere, from anyone! And three people so far have told me he borrowed money from them too. Then he vanishes!
DIALOG | P_NAME | I tell you what... I don't think that's fair to you.
DIALOG | Aelfleda | I know! And it was only @money_aelfledaAug@ neuro-shekels but one, that's a lot to me and two... okay, here it goes...\Since I didn't pay with cash the other day, the balance got charged to my bank account. This would have been fine. But since I haven't been able to bring that money to the bank, I'll overdraft. Overdraft protection kicks in and tries to cover the overdraft penalty with funds from my savings account. They don't let you turn this off. And really, even at this point, things were still fine.\My utility payment is automatically deducted from my savings account, so I went down there the other morning with some of my rent money to cover that. Only after they took my money, however, the Duergars running that scam informed me that my balance had dipped below some arbitrary number and there's a /'low balance fee/' of @money_aelfledaFee@ neuro-shekels.
DIALOG | P_NAME | Cripes... that's cold.
DIALOG | Aelfleda | It turns out the low balance fees are issued every day at 11:59 PM, and past zero they become /'insufficient funds penalties/' and which just last night I graduated into something called /'felony debt./'
DIALOG | P_NAME | W-... what kind of place is this?
DIALOG | Aelfleda | So they proceed with eviction, and even that was okay, I do fine right here on the steps. I like the steps. But I got fired from my job after I showed up with no uniform. I told them... /'My uniform is in my apartment, and I got evicted from my apartment./' Really, they wouldn't let me back in! At least with a job I would have been able to pay the Duergars their protection money... for a couple days anyway.
DIALOG | P_NAME | What are you going to do?
DIALOG | Aelfleda | Well, come the next curfew, the Duergars are going to drag me out of here and into the sewers. I don't know what I'm actually going to do.
DIALOG | P_NAME | ... hm. This really uh...
DIALOG | Aelfleda | It sucks. It really sucks. But thanks for listening to all that.
DIALOG | P_NAME | Is there anything I can do?
DIALOG | Aelfleda | Honestly, I think if I sit right here they'll beat me and throw me in the sewers instead of processing all my information and finding out how much I really owe them. At this point, this is probably the best way it can happen.
DIALOG | P_NAME | Man...
DIALOG | Aelfleda | I know.
QUEST | gelasioDuergar += 1
QUEST | aelfledaAugustine = 2
GOTO | HELP_CHOICE

HELP_CHOICE
CHOICE | Help out Aelfleda?
REPLY | HELP_YES | Is there anything I can do to help?
REPLY | HELP_NO  | Leave her for the dogs.

HELP_YES
DIALOG | P_NAME | Um, well maybe there is something I can do!
DIALOG | Aelfleda | Maybe there is, but it won't matter in the long run._._._ because we all end up dead.
DIALOG | P_NAME | Oh come on don't say that, here, let me see if I can talk to the Duergars and clear this up.
DIALOG | Aelfleda | Bank's closed, part of the Proto Deal the old governor put in place. But here-
NOTIFY | Got Aelfleda's Eviction.
NOTE  | take | Aelfleda's Eviction
DIALOG | Aelfleda | I was going to write my last will and testament on it, but a lot of good that'll do anybody since I'm flat broke.
DIALOG | P_NAME | Don't worry, I'll get to the bottom of this!
QUEST | aelfledaEvict = 1
EXIT |

HELP_NO
DIALOG | P_NAME | I'd help ya but-
DIALOG | Aelfleda | I don't need help, I need a reset button.
WAIT | 0.25
LOOKAT | o_cts_hoopz | SOUTH
WAIT | 0.25
PLAYSET | o_cts_hoopz | sad0 | sad1
WAIT  | 1.00
DIALOG | P_NAME = s_port_hoopzSad | I guess these really are - /'The Mean Streets./'
PLAYSET | o_cts_hoopz | sad1 | sad2
WAIT | 0.25
EXIT |

DISMISS
QUEST  | aelfledaState = 2
DIALOG | Aelfleda | Eh, you know what, now I don't really feel like talking all that much. Basically these two dwarfs appeared from out of nowhere and started drinking. One of them ran up an exorbitant bill on my tab, and then skipped town.
DIALOG | P_NAME | Wow, he sounds like a jerk.
DIALOG | Aelfleda | Yeah, who even cares though?
GOTO | HELP_CHOICE

NEITHER
DIALOG | P_NAME | I'm sorry, I thought I was getting a tip._ You know, one for me. I really only have enough time for tips. See ya later!
DIALOG | Aelfleda | I doubt it.
QUEST  | aelfledaState = 1
EXIT |

AELFLEDA_GOVERNOR
DIALOG | Aelfleda | Sorry for loitering, using stairs for non-stair climbing purposes and breaking the frowning ban, Mr. Governor. I'll get up in a minute...
DIALOG | Governor Elagabalus | Yeah, yum... carry on.
EXIT |

AELFLEDA2
DIALOG | P_NAME | I've got some free time. You still have that tip?
IF curfew == during | GOTO | AELFLEDA_CURFEW
DIALOG | Aelfleda | Yeah I got nothing else going on, short or long?
GOTO   | STORY

AELFLEDA1
DIALOG | P_NAME | 

AELFLEDA0
DIALOG | P_NAME | Excuse me, I'm new.
DIALOG | Aelfleda | ... hm? What?
DIALOG | P_NAME | I'm new here. I'm a new kid. My name is P_NAME. Do you think you could give me some help with this place? Some pointers?
DIALOG | Aelfleda | I'm Aelfleda. And I doubt it. I can barely help myself.
DIALOG | P_NAME | What do you mean?
DIALOG | Aelfleda | I have some bad money problems. I got evicted. I think... I think I'm going down.
DIALOG | P_NAME | What happened to you?
IF curfew == during | GOTO | AELFLEDA_CURFEW
DIALOG | Aelfleda | Do you want the short version or the long version?
GOTO   | STORY
"
