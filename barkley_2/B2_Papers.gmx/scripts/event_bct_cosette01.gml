///Cosette the O.O. Account Manager
/*
Variables
cosetteState
	0 = not talked to Cosette
	1 = talked to Cosette
	2 = you have backed away from buying an account
vrwAccount
	0 = you don't have an account
	1 = you have an account
vrwType
	0 = you do not have an account
	1 = you have the Pay-As-You-Go account
	2 = you have the Hourly account
	3 = you have the Year Subscription account

Related Variables:
knowOO 
	0 = never known about 
	1 = you've heard about OO and so you do not enquire about it.
	2 = you know that brain city tower 5 has OO in it, Cosette sells it
	3 = you talk to Cosette and know that you can get OO from her
*/
script = "
IF vrwAccount = 1 | GOTO | COSETTE03
IF cosetteState == 2 | GOTO | COSETTE02
IF cosetteState == 1 | GOTO | COSETTE01
IF cosetteState == 0 | GOTO | COSETTE00

ACCOUNT_SETUP
DIALOG | Cosette | And you're all done, muffin. You can go over and talk to Frampton and he'll set you up with a chair. Enjoy the wonders of Oligarchy Online!
QUEST | vrwAccount = 1
DIALOG | P_NAME = s_port_hoopzHappy | Thank you, ma'am!

AUTHORIZE
DIALOG | Bhroom | Authorize minigame here!
" +
//TODO: authorization panel
"
GOTO | ACCOUNT_SETUP

ACCOUNTTYPES_NONE
CHOICE | What type of account?
REPLY | ACCOUNT_PAYP | I'd like a Pay-As-You-Pwn Account please.
REPLY | NOTHANKS | Let me think about this...

ACCOUNTTYPES_HALF
BREAKOUT | add | money | -@money_ooHourly@ | 0
BREAKOUT | add | ducats | 120 | 0 
CHOICE | What type of account?
REPLY | ACCOUNT_HRLY | I'll take that Hourly Rate deal!
REPLY | ACCOUNT_PAYP | I'd like a Pay-As-You-Pwn Account please.
REPLY | NOTHANKS | Let me think about this...

ACCOUNTTYPES_FULL
BREAKOUT | add | money | -@money_ooUnlimited@ | -@money_ooHourly@ | 0
BREAKOUT | add | ducats | 999 | 120 | 0 
CHOICE | What type of account?
REPLY | ACCOUNT_YRLY | I'm suddenly flush with cash, how about that Unlimited Subscription?
REPLY | ACCOUNT_HRLY | I'll take that Hourly Rate deal!
REPLY | ACCOUNT_PAYP | I'd like a Pay-As-You-Pwn Account please.
REPLY | NOTHANKS | Let me think about this...

ACCOUNT_YRLY
DIALOG | P_NAME | I'll take the Unlimited Subscription!
BREAKOUT | clear
DIALOG | Cosette | Very well, you scrumptious little muffin. Your 15 digi-ducats will be available as soon as you login. And we'll connect your account to automatically /'top-off/' your ducats when you are running low. Please just authorize here sugar-
QUEST | vrwType = 3
GOTO | AUTHORIZE

ACCOUNTTYPES_HALF
DIALOG | P_NAME | I'll take the Hourly Subscription!
BREAKOUT | clear
DIALOG | Cosette | Very well, you scrumptious little muffin. Your 5 digi-ducats will be available as soon as you login. And we'll connect your account to automatically /'top-off/' your ducats when you are running low. Please just authorize here sugar-
QUEST | vrwType = 2
GOTO | AUTHORIZE

ACCOUNT_PAYP
DIALOG | P_NAME | I'll take the Pay-As-You-Pwn option.
BREAKOUT | clear
DIALOG | Cosette | Very well sweetie! I think that's an excellent choice. Now we'll have to get you to authorize your account.
QUEST | vrwType = 1
GOTO | AUTHORIZE

COSETTE03
DIALOG | Cosette | There is a lot to do in Oligarchy Online, try decorating your Intro-zone!
EXIT |

COSETTE02
DIALOG | Cosette | Why if it isn't my favorite little adventurer. Have you thought about getting that account, dumpling?
GOTO | ACCOUNT_SORTER

COSETTE01
DIALOG | Cosette | Well hello, P_NAME_S, how wonderful to see you again, how can I help you young'un?
GOTO | COSETTENEED

COSETTE00
DIALOG | Cosette | My aren't you a cutie, how can I help you sugar?
QUEST | cosetteState = 1
GOTO | COSETTENEED

COSETTENEED
CHOICE | What do you need?
IF vrwAccount == 0 | IF knowOO >= 2 | REPLY | GIVEMEACCOUNT | I'd like an Oligarchy Account please.
IF cosetteInfo == 0 | REPLY | WHATISALLTHIS | What is all this?
REPLY | NOTHANKS | I'm good for now.

GIVEMEACCOUNT
DIALOG | P_NAME | I'll take an Oligarchy Account, please ma'am.
DIALOG | Cosette | Oh such a nice young man. What type of account would you like?
GOTO | ACCOUNT_SORTER

NOTHANKS
DIALOG | P_NAME | I'm good for now, ma'am thank you.
DIALOG | Cosette | Okay deary, see you soon.
EXIT |

WHATISALLTHIS
DIALOG | P_NAME | What is all this?
DIALOG | Cosette | Why it's Oligarchy Online of course! I thought you young'uns we all hip to the jive.
DIALOG | P_NAME | Oh well, I have amnesia.
DIALOG | Cosette | Oh sweetie, we all have a little amnesia now and then, it's quite alright._ Oligarchy Online is a virtual literal social media stratum simulator and currency exchanger, it's all the rage with the teenz. Remember to check out Teen Zone while you're /'jacked in./'
DIALOG | P_NAME | Oh, that sounds_ interesting...
DIALOG | Cosette | Currently Oligarchy Online is in /'perpetual alpha./' So most of the fun features you see once you are /'jacked in/' will be getting upgrades as the grosses increase. 
DIALOG | P_NAME | So, uh... what do I do?
DIALOG | Cosette | Well cutie, first you have to set up a payment plan. The currency in Oligarchy Online,_ or /'The OO/'_ as the teenz call it, is called /'digi-ducats/' so your first step is linking your neural currency bank to our digi-ducat exchange system. What do you say, little'un?_ Wanna /'jack in?/'
KNOW | knowOO | 3
GOTO | ACCOUNTCHOICES

ACCOUNTCHOICES
CHOICE | Want to know about O.O.?
REPLY | LEARN_PAYMENT | Tell me about your payment structures...
REPLY | FLIP_PAYMENT | Flip it! Just take my sheks and /'jack me/' in!
REPLY | NOTHANKS | I'll take my leave.

LEARN_PAYMENT
DIALOG | P_NAME | Well maybe I should see what kind of payment options you all have.
DIALOG | Cosette | Oh that's so responsible of you, patootie. So we have three options: Unlimited, Hourly and Pay-As-You-Pwn.
DIALOG | P_NAME = s_port_hoopzSmirk | I like the sound of that!
DIALOG | Cosette | The Unlimited Plan covers all connectivity fees and in-realm purchases using digi-ducats spending. That costs a flat, discounted, fee of @money_ooUnlimited@ neuro-shekels, and you'll be automatically renewed each month. Fees are paid at the incept of your billing cycle, which coincidentally is NOW.
DIALOG | P_NAME | Ok...
DIALOG | Cosette | The Hourly Plan is more versatile, allowing you connections for one hour of Oligarchy activity at a time. Much like the Unlimited Plan, it gives you unlimited access to the system, but you'll only get 120 digi-ducats to spend. Hourly fees are assessed at the incept of your billing cycle, which is NOW, and you'll need to authorize your neuro-shekel bank to automatically debit for each hour spent in Oligarchy Online. That's @money_ooHourly@ neuro-shekels.
DIALOG | P_NAME | Uh... okay...
DIALOG | Cosette | And finally, for a premium rate, you can forgo a payment plan and connect your neural currency bank directly to our digi-ducats servers and navigate through Oligarchy Online through the power of microtransactions. You'll need to authorize just like in the other plans, but you'll only be charged a starting fee of @money_ooPAYP_REUP@ neuro-shekels to begin, and then charged the same /'re-up/' fee each time you need ducats.
DIALOG | P_NAME | Alright... so let me make sure I got this correct. Unlimited is expensive unless I use it all the time, Hourly is less expensive but more confusing, and Pay-As-You-Pwn is very expensive but if I don't do much it could be the cheapest?
DIALOG | Cosette | Well... why_ YES! That's exactly right.
DIALOG | P_NAME | Okay cool so hmmmm...
WAIT | 0.25
QUEST | cosetteState = 2
GOTO | ACCOUNT_SORTER

ACCOUNT_SORTER  //This checks if you meet thresholds for money choices
IF money >= @money_ooUnlimited@ | GOTO | ACCOUNTTYPES_FULL
IF money < @money_ooUnlimited@ | IF money >= @money_ooHourly@ | GOTO | REALIZE_HALF
IF money >= @money_ooPAYP_REUP@ | GOTO | REALIZE_POOR
GOTO | REALIZE_BROKE

REALIZE_HALF //can't afford Unlimited
DIALOG | P_NAME | (Looks like I'm a little short for the Unlimited Subscription...maybe the Hourly?)
GOTO | ACCOUNTTYPES_HALF

REALIZE_POOR //cant afford Unlimited or Hourly
DIALOG | P_NAME = s_port_hoopzSad | (Dag-nabbit. I can't afford anything but Pay-As-You-Pwn, but is it the most responsible choice?)
GOTO | ACCOUNTTYPES_NONE

REALIZE_BROKE
DIALOG | P_NAME = s_port_hoopzSurprise | (Zooks malooks! I have no money.)
DIALOG | P_NAME | Er... Ms. Cosette, I left my shekels in my other cerebellum. I'll be back soon.
DIALOG | Cosette | Oh don't you fret sweet thing. I'll be here.
EXIT |

FLIP_PAYMENT
DIALOG | P_NAME | Flip this payment noise. Let's get this going!
DIALOG | Cosette | Very well, we'll set you up with a Pay-As-You-Pwn account. Can you authorize here?
DIALOG | P_NAME = s_port_hoopzSmirk | Of course I can!
QUEST | vrwType = 1
GOTO | AUTHORIZE
"
