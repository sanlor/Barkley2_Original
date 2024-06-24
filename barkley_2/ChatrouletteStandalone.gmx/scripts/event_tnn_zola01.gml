// "Zola" the newspaper seller, bounces around TNN
/*
Variables
    zolaState
        0 = never talked
        1 = talked
        
    zolaNews
        1-10 = this decays and just has various weird headlines, all flavor
    
    pravdaPurchased
        0 = never purchased
        1 = purchased
        2 = purchased but given away or lost
        
    

//MOVEMENT LOGIC
scr_event_interactive_deactivate();
scr_npc_mover(1, r_tnn_businessDistrict01, o_zola01, 680, 992);
scr_npc_mover(2, r_tnn_businessDistrict01, o_zola01, 680, 992); //was 530
// scr_npc_mover(3, r_tnn_residentialDistrict01, o_doris01, 344, 584);
scr_npc_mover(4, r_tnn_warehouseDistrict01, o_zola01, 624, 616);
scr_npc_mover(5, r_tnn_warehouseDistrict01, o_zola01, 625, 848);
scr_entity_setMovementCollisionShape_circle(14);
*/

script = "
IF pravdaPurchased == 1 |   GOTO    |   ZOLA03
IF zolaState == 1|  GOTO    |   ZOLA02
IF zolaState == 0|  GOTO    |   ZOLA01

WANNAKNOW
CHOICE  | Wanna know more?
REPLY   |   HEARHEADLINES   |   Tell me more.
IF zolaNews <= 8    |   REPLY   |   BUYCHOICE   |   I'm interested in buying a paper.
REPLY   |   NOWAY   |   Nay, I get my news from more reliable sources.

HEARHEADLINES
DIALOG  |   P_NAME  |   Hmm... what else you got?
IF zolaNews == 10   |   DIALOG  |   Zola    |   Annual crime report: /'The Efficacy of Torture on Dwarf Control Found to Be 100%!/'
IF zolaNews == 9    |   DIALOG  |   Zola    |   Gubernatorial Proclamation: /'Poverty Level Upgraded to Red./' That's right, our good Governor Elagabalus is planning new confiscations!
IF zolaNews == 8 && uschiBall == 0  |   DIALOG |   Zola    |   Sports! I'm talking SPORTS! ... hm, seems like no games have been played for awhile.
IF zolaNews == 8 && uschiBall >= 1  |   DIALOG |   Zola    |   Sports! I'm talking SPORTS! ... B-ball season just started here in Tir na Nog!
IF zolaNews == 7    |   DIALOG     |   Zola   |  New fiction and poetry! /'An Ode on Cuchulainn's Visage/'... /'An Ode on Cuchulainn's Physique/'... /'An Ode on Cuchulainn's Prowess/'... and more!
IF zolaNews == 6    |   DIALOG     |   Zola   |  A pop-sci column that debunks urban legends... /'Dwarf Rebellion? Just An Old Dwarf's Tale/' is the current article.
IF zolaNews == 5    |   DIALOG     |   Zola   |  Coupons! That's right, can't-miss coupons! Buy-one-get-one-0.001-neuro-shekels-off fruit deals!
IF zolaNews == 4    |   DIALOG     |   Zola   |  /'The Dwarf Corner/' is hard-and-balanced facts, straight-up, with no spin!
IF zolaNews == 3    |   DIALOG     |   Zola   |  /'It Must End/' - Analysis of the rotten /'dwarf agenda/' by a scholarly duergar roundtable!
IF zolaNews == 2    |   DIALOG     |   Zola   |  How about some... /'Real News -U- Can Use!/'... it's a new segment... I think they're working on it.
IF zolaNews == 1    |   DIALOG     |   Zola   |  Our gossip column, /'Shanguri-La: Rumors On Cuchulainn's Prize!/'
IF zolaNews == 0    |   DIALOG     |   Zola   |  The latest and greatest from our culture editor! /'5 New Duergar Beating Techniques!/'
" +
//TODO: how do I advance this quest properly? it should decay by one each turn and then if you listen to two you'll
//  be able to buy a paper
"
QUEST   |   zolaNews -= 1
GOTO    |   WANNAKNOW

NOWAY
DIALOG | P_NAME | Sorry, not interested. Told ya, I only like the funny pages.

BUYCHOICE
DIALOG  |   P_NAME  |   How much for today's edition?
DIALOG  |   Zola    |   That'll be @money_tnnPravda@ neuroshekels.
BREAKOUT    |   add |   money
CHOICE  |    Buy a Pravda?
REPLY   |   BUYYES  |    I'll take one.
REPLY   |   BUYNO   |    Let me reconsider.

BUYYES
BREAKOUT    |   clear
IF money >= @money_tnnPravda@  |   GOTO    |   PURCHASE
GOTO    |   NOMONEY

PURCHASE
BREAKOUT    |   clear
QUEST   |   pravdaPurchased = 1
QUEST   |   money -= @money_tnnPravda@
DIALOG  |   Zola    |   Here you go.
" +
//TODO: make sure this "grab the paper" works
//PLAYSET   |   o_cts_hoopz |   grab?
"
WAIT    |   0.5
DIALOG  |   P_NAME  |   Uh what?
DIALOG  |   Zola    |   Just._._._ be careful._._._
DIALOG  |   P_NAME = s_port_hoopzSurprise |   (Gulp)..._ careful?
DIALOG  |   Zola    |   The scoops contained within._._._ are H_O_T.
DIALOG  |   P_NAME = s_port_hoopzAngry  |   Uh... okay, just gimme the paper.
NOTE    |   take    |   Pravda Tir na nOg
NOTIFY  |   Got a copy of Pravda Tir na nOg
WAIT    |   0.5
DIALOG  |   Zola    |   Pravda Tir na nOg here! Print is not dead! Pravda here! Get your Pravda Tir na nOg!

BUYNO
BREAKOUT    |   clear
DIALOG  |   P_NAME  |   On second thought, let me think about this purchase a little more.
DIALOG  |   Zola    |   Alright but they are going quick!_ Pravda Tir na nOg, here!

NOMONEY
DIALOG  |   P_NAME  |   I'll take o-... oh wait, I am short the sheks. Lawd dangit, I really wanted one too.
DIALOG  |   Zola    |   They say that any current event is only as good as its price tag.
DIALOG  |   P_NAME  |   They say that?
DIALOG  |   Zola    |   I_ uh._._._
DIALOG  |   Zola    |   Pravda Tir na nOg here! Pravda Tir na nOg! Come and get it!

ZOLA03
DIALOG  |   Zola    |   Oh hey! Back for another edition of the Pravda? You can keep this one furled as a collectors piece!
DIALOG  |   P_NAME  |   No thanks, I think I'm good.

ZOLA02
DIALOG| Zola | Still got a whole bunch of Pravda Tir na nOg here! Gonna buy a copy?
GOTO    |   WANNAKNOW

ZOLA01
DIALOG  |   Zola    | Pravda Tir na nOg here! Pravda Tir na nOg! Pravda Tir na nOg here! Print is not dead..._ Pravda Tir na nOg here... hey, are you even listening to me? Aren't you going to buy a copy!?
DIALOG  |   P_NAME  | I don't know... I don't really like newspapers. Well, I like the funny pages... and the Cryptokoan too. Does the Pravda Tir na nOg have those?
DIALOG  |   Zola    | Nope, not a drop of that... no wonder I can barely sell anything...
DIALOG  |   P_NAME  | Maybe you need to try selling a different way. If it doesn't have the funnies, then what does it have? Really sell it to me! 
DIALOG  |   Zola    | Hmm... let's see... this issue's got... news, facts, factoids, op-eds, the whole gamut! Wanna know more?
QUEST   |   zolaState = 1
QUEST   |   zolaNews = 10
GOTO    |   WANNAKNOW
"

/*

If zola is insideDIALOG | P_NAME | Well, I doubt you're gonna get any sales inside either way, but why don't you tell me what it does have? Really sell it to me! 
