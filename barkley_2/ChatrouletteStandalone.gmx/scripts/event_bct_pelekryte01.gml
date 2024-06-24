//IF room = r_tnn_marketDistrict01 | pelekryteState == 0 | GOTO | PELE_TNN0
//IF room = r_tnn_marketDistrict01 | pelekryteState == 1 | GOTO | PELE_TNN1

script = "
IF pelekryteState == 0 | GOTO | PELE_TNN0
IF pelekryteState == 1 | GOTO | PELE_TNN1

PELE_TNN0
DIALOG | Dr. Pelekryte | Hmph? W-who are you? You're not one of thoshe Duergarsh now are you?
DIALOG | P_NAME | Nah, I'm just your average youngster on the loose.
DIALOG | Dr. Pelekryte | Phew, thank the shtarsh for that! I can't even imagine what thoshe brutesh would do if they'd find me on their precioush rooftopsh.
GOTO | HEY_MISTER

HEY_MISTER
CHOICE | Hey mister...
REPLY | DRUNK? | ...Are you drunk?
REPLY | WHYHERE | ...What are you doing up here?
REPLY | NEEDTOGO | ...I need to go.

DRUNK?
DIALOG | P_NAME | Hey mister... are you drunk? Do you need help to get down from here?
DIALOG | Dr. Pelekryte | What? What ish that shupposhed to mean?
DIALOG | P_NAME | Don't misunderstand, it's just the way you... What are you doing up here anyway?
GOTO | TNN_EXPLANATION

WHYHERE
DIALOG | P_NAME | Hey mister... What are you doing up here?
GOTO | TNN_EXPLANATION

NEEDTOGO
DIALOG | P_NAME | Hey mister... I need to get going now.
DIALOG | Dr. Pelekryte | Alright then. Jusht don't tell the Duergarsh that I'm up here...
QUEST | pelekryteState = 1

TNN_EXPLANATION
DIALOG | Dr. Pelekryte | I'm shtudying the shtarsh and conshtellationsh around Necron 7. Or at leasht that'sh what I'm trying to do.
DIALOG | P_NAME | Oh? What's the problem?
DIALOG | Dr. Pelekryte | Thish locale for shtartersh. A glorified ghetto with Duergarsh around every corner jusht waiting to beat up ush dwarfsh. The equipment I got from thoshe L.O.N.G.I.N.U.S.'h fellash is extremely outdated, and on top of that there are no adequetly high locationsh in Tir na Nog to properly shurvey the shtarsh and conshtellationsh with eashe.
IF knowLonginus = 0 | GOTO | ASK_LONGINUS
DIALOG | P_NAME | Can't you just go to some other place? I'm sure there's better places to do all this.
DIALOG | Dr. Pelekryte | Hmm, you musht be new here, right? Dwarfsh aren't allowed to leave Tir na Nog once they are in here. Thish is the besht I'm going to get until they let ush leave. If they ever let ush leave.
DIALOG | P_NAME | Oh, uh, right. I forgot about that.
DIALOG | Dr. Pelekryte | Pershonally I don't think they'll ever let ush out of here. I can't put my finger on it, but shomethingsh wrong here. I don't know what ish going to happen once all the dwarfsh have been brought to Necron 7, and I'm not keen on finding out either. Once the L.O.N.G.I.N.U.S.'h boysh make their next excurshion to the shewersh I'm going with them. There'sh gotta be a way out of here through the shewersh.
DIALOG | P_NAME | Sounds dangerous. Hey, I gotta be going now. Good luck on that excursion mister.
DIALOG | Dr. Pelekryte | Take care, youngshter...
QUEST | pelekryteState = 1

ASK_LONGINUS
DIALOG | P_NAME | L.O.N.G.I.N.U.S.? You've met those guys?
DIALOG | Dr. Pelekryte | Yeah I've met them. They've got a bashe of operationsh jusht around the corner. I think thish is jusht one of the shmaller branchesh though.
DIALOG | P_NAME | Maybe the Cyberdwarf is in there...!
DIALOG | Dr. Pelekryte | The Cyberdwarf? Hmm... I've heard about him. I'm afraid you are out of luck though, youngshter. There didn't sheem to be anyone in there that would've fit the deshcription. A fearlessh cyberwarrior deshtined to lead dwarfsh to eternal glory...
DIALOG | P_NAME | Aw, shucks!
DIALOG | Dr. Pelekryte | Heh, don't give up sho eashily, youngshter! I'm shure thoshe rebel boysh know a thing or do about the ol' Cyberdwarf.
DIALOG | P_NAME | You're right! I should ask those rebel guys and see what they know about the Cyberdwarf. Catch you later, old man!
DIALOG | Dr. Pelekryte | Hmph... Old man, huh? Why I oughta...
QUEST | pelekryteState = 1

PELE_TNN1
DIALOG | Dr. Pelekryte | Hmm? Ish there shomething you need, youngshter?
DIALOG | P_NAME | Uh, no. I don't think you can help me right now.
DIALOG | Dr. Pelekryte | Shuit yourshelf...
"
