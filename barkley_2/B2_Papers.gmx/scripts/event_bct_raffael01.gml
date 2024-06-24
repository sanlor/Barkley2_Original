///Raffael is the receptionist of Guilderberg Tower
/*
Variables:
raffaelState
1 = met Raffael

raffaelCaught
1 = Player's motive has been revealed, Raffael hides, and the Duergars turn violent.
2 = Same thing, now alternates between 1 and 2 for different dialogs.

officeDirectory
1 = Player has read the Office Directory. Gives more options in dialogue with Raffael.

Operation:
Player is asked what they are doing by Raffael.
If they have checked the Office Directory, they can choose the name of anyone in the building.
Otherwise, they can only choose "Delivery", "Salesman", or "Fight"
Choosing "Davenport", "Mayhew", "Pembroke", "Pomeroy", or "Fight" turns the tower into a combat zone.
Choosing "Delivery" gives the player the B1 Visitor Badge.
Choosing "Wentworth" gives the player the 2F Visitor Badge.
Choosing "Davenport" gives the player the 3F Visitor Badge.
Choosing "Salesman" starts timer. After X amount of time, Raffael says NO SOLICITING.
Progression after "Salesman" requires violence, either by threatening Raffael or the duergar on this floor, Melqart.
*/
/*script = "
IF raffaelState == 0 | GOTO | RAFFAEL00

DIALOG | Raffael | P-please! Please don't kill me!
QUEST | raffaelCaught = 1


IF raffaelAppt == 1 | DIALOG | Raffael | What... what kind of solicitor are you?
IF raffaelAppt == 1 | DIALOG | Raffael | What... what kind of salesman are you?
IF raffaelAppt == 1 | DIALOG | Raffael | Is... is this what we get for tax-evasion?
IF raffaelAppt == 1 | DIALOG | Raffael | Please... please Quartermaine, don't hire this kid...

DIALOG | Raffael | Just have a seat, someone will be with you shortly.


DIALOG | P_NAME | Hey, I've been waiting for awhile... any news?
DIALOG | Raffael | I'll let you know.

DIALOG | P_NAME | Oh cool, someone's ready to see me?
DIALOG | Raffael | Well, in fact, I made a few calls to the folks upstairs and they said... /;No Soliciting/'.
DIALOG | P_NAME | What? That's all? I was waiting here forever! Come on, man!
DIALOG | Raffael | No soliciting.
DIALOG | P_NAME | I just wan-
DIALOG | Raffael | No soliciting.
DIALOG | P_NAME | ... bu-
DIALOG | Raffael | No soliciting!!!
scr_event_build_event_snippet(soliciting_snippet);

// solicitation counter ended, talked again
DIALOG | Raffael | Don't you get it! No soliciting! No solicitors! No solicitation! The word /;solicit/' should not cross your mind while on these premises! How many ways do I have to say it!?
scr_event_build_event_snippet(soliciting_snippet);


DIALOG | Raffael | You can bring your delivery to the mailroom, which is just one floor beneath us. There's someone down there, um... her name is... oh forget it, I have no idea. Anyway, she'll take care of you. Whoever she is.

// wentworth, 2f
else if (scr_quest_get_state("raffaelAppt") == 3)

DIALOG | Raffael | Ms. Wentworth is on floor 2F, which is one floor above where we are now.

// Quartermaine, 3f
else if (scr_quest_get_state("raffaelAppt") == 4)
{
DIALOG | Raffael | Mr. Quartermaine is on floor 3F, which is two floors above where we are now.

RAFFAEL00
DIALOG | Raffael | Welcome to Guilderberg Group Tower._ Wait, how did you get in? I thought nobody could get through the picket line.
DIALOG | P_NAME = s_port_hoopsSurprise | Uh... I just... uh... the protesters um-
DIALOG | Raffael | `w1`Ugghhh...`w0` I_ `s1`hate`s0` those protesters! I wish they would all just go back to work. My job is `w1`so_ so_so`w0` much harder with them always crying about everything. Money isn't everything, y'know?_ .
WAIT | 0.25
DIALOG | Raffael | `w1`Blahhh, I can't even.`w0` Why are you here? `sq`You don't have an appointment, do you?`rt`
CHOICE | Have an appointment?
REPLY | APPT_YES | Of course I do.
REPLY | APPT_NO | Heck no!

APPT_NO
DIALOG | P_NAME | Heck no, I don't have an appointment! I don't wait on anyone!
GOTO | 

APPT_YES
DIALOG | P_NAME | That's right. I've got an appointment. I'm... I'm here for a_ `w1`very important meeting.`w0`
DIALOG | Raffael | Ugh, more work... let me look at the agenda. Who did you say your appointment was with?
IF knowGuilderDirectory >= 1 | GOTO | GOTANIDEA
GOTO | NOIDEA

GOTANIDEA
DIALOG | P_NAME | Oh yeah, it's with uh...
GOTO | SPITITOUT

NOIDEA
DIALOG | P_NAME | Who... I'm seeing uh... ummmm...
GOTO | SPITITOUT

SPITITOUT
DIALOG | Raffael | Yeah? Who? `s1`Spit it out already!`s0`
GOTO | APPT_WHO

APPT_WHO
CHOICE | Who are you seeing?
REPLY | APPT_DELIVERY | I've just got a delivery.
REPLY | APPT_SALES | I'm just a salesman.
IF knowGuilderDirectory >= 1 | REPLY | APPT_QUARTERMAINE | Mr. Quartermaine.
IF knowGuilderDirectory >= 1 | REPLY | APPT_DAVENPORT | Ms. Dravenport.
IF knowGuilderDirectory >= 1 | REPLY | APPT_MAYHEW | Mr. Mayhem.
IF knowGuilderDirectory >= 1 | REPLY | APPT_WENTWORTH | Ms. Wentworth.
IF knowGuilderDirectory >= 1 | REPLY | APPT_PEMBROKE | Mr. Pembrook.
IF knowGuilderDirectory >= 1 | REPLY | APPT_POMEROY | Ms. Pomeroy.
REPLY | APPT_BRAST | I'm here to brast!

APPT_DAVENPORT
DIALOG | P_NAME | I'm here to see Ms. Dravenport.
DIALOG | Raffael | Hmm... let's see... I'm looking at the schedule and I don't see anything for Ms. Davenport.
DIALOG | P_NAME | Oh... um... that was a mistake, I uh...
GOTO | JIGISUP

APPT_QUARTERMAINE
DIALOG | P_NAME | I'm here to see Mr. Quartermaine.
DIALOG | Raffael | Oh, you're looking for a job then? Why, that's so inspiring! It is heartwarming to see a poor youngster try to better themselves. This is the place too... but there's no way we're hiring in this climate! Oh... oh I'm sorry, I shouldn't have said that. I tell you what, take this visitor's badge. It'll let you get to Mr. Quartermaine's office on Floor 3F.
ITEM | 3F Visitor Badge | 1
NOTIFY | Got the 3F Visitor Badge.
QUEST | raffaelAppt = 4
EXIT |

APPT_MAYHEW
DIALOG | P_NAME | I'm here to see Mr. Mayhew.
DIALOG | Raffael | Hmm... let's see... I'm looking at the schedule and I don't see anything for Mr. Mayhew.
DIALOG | P_NAME | Oh... um... that was a mistake, I uh...
// go to caught_snippet
GOTO | JIGISUP

APPT_WENTWORTH
DIALOG | P_NAME | I'm here to see Ms. Wentworth.
DIALOG | Raffael | Oh, you're the auditor? I guess I knew about that one. Slipped my mind! Ms. Wentworth has been expecting you. I trust you'll find that everything here is in order. If you'll just take this visitor's badge, the guards will give you access to Ms. Wentworth's office on Floor 2F.
// get visitor's badge 2F
ITEM | 2F Visitor Badge | 1
NOTIFY | Got 2F Visitor Badge
QUEST | raffaelAppt = 3
EXIT |

APPT_PEMBROKE
DIALOG | P_NAME | I'm here to see Mr. Pembroke.
DIALOG | Raffael | Hmm... let's see... I'm looking at the schedule and I don't see anything for Mr. Pembroke.
DIALOG | P_NAME | Oh... um... that was a mistake, I uh...
GOTO | JIGISUP

APPT_POMEROY
DIALOG | P_NAME | I'm here to see Ms. Pomeroy.
DIALOG | Raffael | Hmm... let's see... I'm looking at the schedule and I don't see anything for Mr. Pomeroy.
DIALOG | P_NAME | Oh... um... that was a mistake, I uh...
GOTO | JIGISUP

APPT_DELIVERY
DIALOG | P_NAME | I'm not sure... I've got a delivery. You know who I should see about that?
DIALOG | Raffael | A delivery, hm? Go ahead and take it down to the mailroom, I'm sure our sla-... ahem, our unpaid intern can take care of it for you. Let me see your finger.
DIALOG | P_NAME | My finger?
DIALOG | Raffael | Yeah, I need a blood sample... how else are the Posterity Posterns going to judge your liquidity? Just stick out your finger.
" +
//TODO: animate Hoopz in a USEAT with Raffael
"
NOTIFY | Your hemoglobin has been accepted by the system.
QUEST | raffaelAppt = 2
EXIT |

APPT_SALES
DIALOG | P_NAME | I'm not sure... I'm a salesperson. I know it's sudden to just drop in, but I'd really appreciate it if I could have just a little bit of time with whomever is in charge of purchasing. I've got some really exciting offers.
DIALOG | Raffael | A solicitor, hm? Just have a seat there in the lobby. I'll let you know when someone is ready to see you.
scr_event_build_quest_state("raffaelAppt", 1);

APPT_BRAST
DIALOG | P_NAME | Who am I kidding... I'm here to brast!
DIALOG | Raffael | B... brast? Brast!?... SECURITYYYYYYYY!!!!
GOTO | BATTLE_START


DIALOG | Raffael | If you don't have an appointment then what are you... wait... is... is that a gun? Are... are those ALL gun's!? SECURITYYYYYYYY!!!!
GOTO | BATTLE_START


DIALOG | Raffael | L... lead? Lead!? SECURITYYYYYYYY!!!!
GOTO | BATTLE_START
scr_event_build_quest_state("raffaelCaught", 1);

BATTLE_START
"// +
//TODO: Raffael does a hiding animation, and is now behind his desk, unclickable.
//TODO: Pacify mode disabled.
//TODO: Duergar Melqart should turn into a combat actor.
//TODO: Combat tunes should start up.
//TODO: PLAYSET | o_raffael01 | hide | hiding
//"
