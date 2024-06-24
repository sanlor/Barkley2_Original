/// Jindrich the Drunk (pre curfew)
// His sprite is the weird punk dude sitting at the bar.
// At Time 3 he should be in a gutter somewhere perhaps?

/*
QUESTS:
none

VARIABLES:
jindrichState
    0 = none
    1 = talked to Jindrich and have declined or couldn't afford the Apricot Juice for him
    2 = talked to him and declined again, this brings you to a Gelasio warning, that he'll pay for the drink soon
    3 = Jindrich has his apricots and is happy
    4 = automatically gets set at #### and Gelasio will now have purchased Jundrich's favor
jindritchApricot
    0 = have not recieved apricot juice (can only happen if his bar tab is paid)
    1 = Hoopz pays bar tab
    2 = Hoopz doesn't learn shady history of Gelasio
    3 = Hoopz learns shady history of Gelasio
gelasioDuergar
    0 = none
    1 = Hoopz now has information about Gelasio and can question him about more information
*/

//var money_phrase = string(cur_money - 2) + "... " + string(cur_money - 1) + "... " + string(cur_str + "! " + cur_str + " neuro-shekels!

script = "
IF jindrich45 == 0 | IF clock > 2.75 | GOTO | JINDRICH04

IF body == governor | GOTO | GOVERNOR

QUEST | temp = @jindrich45@
QUEST | temp += 0.75
IF clock > temp | GOTO | JINDRICH_45

IF jindrichApricot == 3    |   GOTO    |   JINDRICHAPRICOT03
IF jindrichApricot == 2    |   GOTO    |   JINDRICHAPRICOT02
IF jindrichApricot == 1    |   GOTO    |   JINDRICHAPRICOT01
IF jindrichState == 3   | GOTO    |   JINDRICH03
IF jindrichState == 1   | GOTO    |   JINDRICH01
IF jindrichState == 0   | GOTO    |   JINDRICH00

ENOUGHMONEY
BREAKOUT    |   add |   money
CHOICE  |   Buy Jindrich a can of apricot juice?
REPLY   |   BUYYES | Sure. (@money_apricotPrice@ neuroshekels.)
REPLY   |   BUYNO | Save my money.

BUYYES
FRAME   |   CAMERA_NORMAL   | o_evander01   | o_jindrich01
DIALOG  |   P_NAME  |   Excuse me sir, I have @money_apricotPrice@ neuro-shekels. I'll buy him his apricot juice.
QUEST   |   money -= @money_apricotPrice@
" +
//TODO: WAIT |
"
DIALOG  |   Evander     |   Thanks kid, that will shut him up for awhile... hopefully. But don't get any misconceptions, I still can't serve fruit juice to a youngster like you.
QUEST   |   jindrichApricot = 1
" +
//TODO: add "glug, glug" sound here
"
SOUND   |   sn_debug_seven
WAIT    |   0.5
DIALOG  |   Jindrich    |   Juice,_ juice_, fruit_ juice_._._._ *gulp* I_ LOVE_ FRUIT_ JUICE!
DIALOG  |   P_NAME = s_port_hoopzAngry  |   ...
DIALOG  |   Jindrich    |   Thanks kid! I was really tweakin' for that mellow nectar!_ Say, let me pound a few more and get my tab back up to a disrespectable level. Come by in a little bit, maybe I'll make it... WORTH_ YOUR_ WHILE_.
DIALOG  |   P_NAME = s_port_hoopzSurprise   |   I'm not sure I like the sound of that!
DIALOG  |   Jindrich    |   Just come back in 45 minutes, kid. Trust me.
QUEST   |   jindrich45 = @clock@

BUYNO
DIALOG  |   P_NAME  |   (Best stay out of this, monetarily.)
BREAKOUT    |   clear
DIALOG  |   Jindrich    |   I_ want_ fruit juice._ I_ want_ fruit.
QUEST   |   jindrichState = 1

GOVERNOR
DIALOG  |   Jindrich    |   Hey Mr. Governor, just throwing it out there, but what do you think about subsidizing the cost of fruit?
DIALOG  |   Governor Elagabalus     |   Good advice. Great advice! Thanks for doing your civic duty and telling me that thing about fruit. I will certainly think about it, because I am the Governor, and it's my job to think about things.

JINDRICHAPRICOT03
DIALOG  |   Jindrich    |   Keep an eye out for that crafty pompodour over there. There's something shifty going on underneath it.
LOOKAT  |   o_cts_hoopz |   o_gelasio01
FRAME   |   CAMERA_NORMAL   |   o_cts_hoopz |   o_gelasio01
" +
//TODO: add wait for action
"
WAIT    |   0.2

JINDRICHAPRICOT02
DIALOG  |   Jindrich    |   That Gelasio's an allllright dwarf. I think all the apricot has gone straight to my domepiece and I can't tell friend from foe anymore._._._ Maybe another swig will get me straight?

JINDRICHAPRICOT01
DIALOG  |   Jindrich    |   Psst..._ psst...
DIALOG  |   P_NAME  |   Hey, what's up?
DIALOG  |   Jindrich    |   Psst... it's a little weird seeing Gelasio here. They shipped him and his buddy Augustine off to the mines for awhile, and I've never seen a dwarf come back from there. He's also been spending lots of neuro-shekels_ and getting really generous with the fruit juice if you know what I mean. I wonder what his angle is?
CHOICE  |   About that Gelasio...
REPLY   |   TRUST   |   Maybe he was just being friendly?
REPLY   |   UNTRUST |   I smell a rat.

TRUST
DIALOG  |   P_NAME  |   Maybe he was just being friendly?
DIALOG  |   Jindrich    |   Eh maybe you're right..._ I think this macrodose of apricot is making me paranoid. Should probably throttle back..._ tomorrow.
QUEST   |   jindrichApricot = 2

UNTRUST
DIALOG  |   P_NAME  |   Sounds like something's amiss.
DIALOG  |   Jindrich    |   You bet your money that I need to borrow something's amiss!
DIALOG  |   P_NAME  |   Well, what can we do?
DIALOG  |   Jindrich    |   Ummm_ how about we._._._ drink?
WAIT    |   0.5
" +
//TODO: add gulping sounds
"
SOUND   |   sn_debug_seven
//WAIT  |
WAIT    |   0.5
DIALOG  |   P_NAME  |   Well I guess that's that then... Don't worry Jindrich, enjoy your apricots, I'll get to the bottom of this whole Gelasio rigamarole.
QUEST   |   jindrichApricot = 3
QUEST   |   gelasioDuergar = 1

" +
// Jindrich States
"
JINDRICH04
DIALOG  |   Jindrich    |   Gelasio's rocking my world, kid. This is paradise! I'm heavy-laden with apricots. Maybe too many apricots. Ugh... maybe paradise isn't for the weak...

JINDRICH03
DIALOG  |   Bhroom  |   This needs to be added!

JINDRICH02
FRAME   |   CAMERA_NORMAL   | o_jindrich01  |    o_evander01
DIALOG  |   Jindrich    |   C'mon barkeep, fill up this thirsty goblet. You know I'm good for it!
DIALOG  |   Evander |   Jindrich, you're a no good bankrupt souse. See if Gelasio over there will cover your tab. I hear he come into some duckets.
WAIT    |   0.5
FRAME   |   CAMERA_NORMAL   |   o_jindrich01    |    o_gelasio01
" +
//TODO: WAIT  |
"
DIALOG  |   Jindrich    |   Gelasio! You holdin' out on my you sonofasundered?! Help me with my tab and I'll make it._._._ WORTH_ YOUR_ WHILE_...
WAIT    |   1.7
DIALOG  |   Jindritch   |   ..._ Musta not heard me...
GOTO    |   MONEYCHECKER

JINDRICH01
DIALOG  |   Jindrich    |   I_ want_ fruit._ I_ want_ fruit_ juice.
QUEST   |   jindrichState = 2
GOTO    |   MONEYCHECKER

JINDRICH00
DIALOG  |   Jindrich    |   Oh come on, no more?
FRAME   |   CAMERA_NORMAL   |   o_evander01 |    o_jindrich01
WAIT    |
DIALOG  |   Evander |   Your tab is too high, Jindrich. You don't have to go home, but I can't serve you anything unless you pony up some neuro-shekels.
DIALOG  |   Jindrich    |   But I want fruit... I want apricots. I want fruit. I want fruit juice.
DIALOG  |   Evander |   And I actually NEED @money_apricotPrice@ neuro-shekels. I'll be in trouble if the Duergars try to collect and they see an empty juice-rack and an empty till too.
DIALOG  |   Jindrich    |   I_ want_ fruit_ juice._ I_ want_ fruit._ I want juice!!!
FRAME   |   CAMERA_NORMAL   |   o_jindrich01
//WAIT
BREAKOUT |  add |   money
QUEST   |   jindrichState = 1
" +
//check money!
"
GOTO    |   MONEYCHECKER

MONEYCHECKER
IF money >= @money_apricotPrice@  |   GOTO    |   ENOUGHMONEY
IF money < @money_apricotPrice@   |   GOTO    |   NOTENOUGHMONEY
IF money == 0   |   GOTO    |   NOMONEY

NOMONEY
DIALOG  |   P_NAME  |   (I don't have any money at all either... I'm gonna be in trouble if I ever start craving juice like these dwarfs.)

NOTENOUGHMONEY
DIALOG  |   P_NAME  |   Let's see here_...
DIALOG  |   P_NAME  |   money_phrase ..._ but I guess that won't cut it.
DIALOG  |   Jindrich    |   I_ want_ fruit...

END
EXIT    |  
"
