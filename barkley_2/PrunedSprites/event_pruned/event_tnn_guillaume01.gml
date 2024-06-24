// Event for Guillaume, the guitarist in Tir na Nog.
// Guillaume plays the song pianosong on loop.
// The closer the player gets to Guillaume, the louder it gets. 
// 10 or 11 paces away and you can't hear it.
// Guillaume moves locations at Time 3.
// usage: event_tnn_guillaume01();

if (argument0 == SCRIPT_START)
{
    if (scr_tnn_curfew("during") == true) { scr_event_interactive_deactivate(); }
}
else if (argument0 == SCRIPT_STEP)
{

} 
else if (argument0 == SCRIPT_INTERACT)
{
    // Build Event
    var guillaume = id;
    var curmoney = scr_money_count();
    var event = scr_event_create_main();
    with (event) {
        // If you're Matthias
        if (BodySwap() == "matthias") {
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Hey man, diggin' the look. Getting mondo vibes from the whole sewage and decay thing. Fuck society and it's 'expectations', y'know? Like... your 'rules' and your 'trends'? They're designed by 'the man' to keep us down, keep us occupied with the small stuff so they can devour us spiritually. It's all so... ephemeral, man. Trust only your chakras. Keep on keepin' it real, dude.");
        } 
        // If you're the Governor
        else if (BodySwap() == "governor") {
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Maaaan, I'm not doing anything! I'm just playin' some tunes for the good people of Tir na Nog! Is that such a crime?");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Good point! Thanks for the crime tip! I'll be on the lookout for criminals now! Stay vigilant, citizen!");   
        }
        // Guillaume's leaving TnN, talked once. 
        else if (scr_quest_get_state("govGuillaume") == 3) { 
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "I'm just playin' one last tune for old time's sake, but I'm sure as hell not gonna miss the bogus vibes here. Chill times are coming. Believe me.");
        } 
        // Guillaume's leaving TnN
        else if (scr_quest_get_state("govGuillaume") == 2) {
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Heeeeey, man. I heard you're getting kicked out of Tir na Nog. Guess what, man: me too.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I heard... you seem pretty excited about it.");
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Greener pastures, maaaaan. Somewhere I can stretch my legs out, jam a little, kick the hackey sack around, grow some dreds out. This is the best thing that's happened to me in a loooong time, man.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "To be honest, I'm kinda nervous. I don't really know what's out there and I'm supposed to be looking for the Cyberdwarf.");
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "I heard about these like, spiritual people, man, who live on the top of a mountain and they're led by this mystical guru who's supposed to know everything. Who knows, maaan, maybe it's him. They sound pretty chill, I think that's where I'm going. Anyway, maaaan, maybe we'll run into each other out there. Keep your chakras attuned.");
            scr_event_build_quest_state("govGuillaume", 3);
        } 
        // If you're controlling the Governor - Was here before, but could never execute. Keeping for reference.
        //else if (BodySwap() == "governor") {
        //    scr_event_build_quest_state("govGuillaume", 1);
        //    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Look /'bro,/' I'm in my sacred place right now. You're polluting my body/temple/spirit with your negative vibrations. Take your whole authority gig somewhere else and let me attune my chakras in peace.");
        //} 
        // Never talked to him.
        else if (scr_quest_get_state("guillaumeState") == 0) {
            scr_event_build_quest_state("govGuillaume", 1);
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "That's a beautiful song you're playing. What is it called?");
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Heeeeey, maaan. Diggin' the hawk. It's an old dwarf folk song about peace and love, maaan, gettin' together and like, really getting to know each other, y'know? Hey, hey, are you a dwarf?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Um, I'm not sure. I don't think so. Maybe.");
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "You don't look like a dwarf to me but I'm not gonna judge. We all come in different sizes and shapes, maaan, but we're all the same deep down. Like y'know the Duergars? They're total vibe-killers, y'know? Always telling us what to do, where to go, where we're not allowed to play our tunes, maaaan. But y'know they're dwarfs too, just like us? If we all just sat down and talked about love, maaan, synchronized our crystals, maybe we could come to an understanding. Anyway, maaaan, if you could spare some change or somethin', I'd be real grateful. The Duergars keep saying they're gonna throw me outta here, but this is all I got.");
            Breakout("build", "add", "money");
            var spare_change = scr_event_build_choice("Spare " + string(scr_money_db("guillaumeTip")) + " neuro-shekels?", s_port_hoopz);
            var yes = scr_event_build_add_choice(spare_change, "I can spare some change.");
            with yes {
                if(curmoney >= scr_money_db("guillaumeTip")){
                //You have 5 neuro-shekels
                    Breakout("build", "clear");
                    scr_event_build_money_add(-scr_money_db("guillaumeTip"));
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I guess I can spare a few neuro-shekels.");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Awwww man, I knew I was getting mondo vibes when we started talking. You're chill, a real patron of the arts. So like... the Duergars, maaaan. They're all Cuchulainn's little lap dogs, y'know? Throwing us dwarfs under the bus for that dollar bill, that sweet lucre, y'know? Man, if we all just sat down together and talked this out, we'd see we're all in the same boat, that Cuchulainn's making us like... fight each other, maaan.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do you mean? Dwarfs and Duergars are the same?");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Man, we're all the same deep down... we're all the same deep down... hey, I'm not gonna keep you but thanks for the cash, maaan. 'ppreciate it.");
                }
                else {
                //don't have 5 neuro-shekels
                    Breakout("build", "clear");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I guess I can spare a few neuroshe- dad flubbit, looks like I'm broke too. I'm sorry, man. I've got nothing.");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Yeah, seems like everyone's broke these days. Maaan, I'd head somewhere way more copacetic if I even knew where it was. Somewhere I can just hang out and skank with my pals. Here's to hoping the Duergars actually do kick me out someday. Stay chill.");
                }
            }
            var no = scr_event_build_add_choice(spare_change, "I'm all out of money.");
            with no {
                Breakout("build", "clear");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, that's tough man, but I'm all out of money too. Guess we're both broke. Sorry.");
                scr_event_build_dialogue("Guillaume", s_port_guillaume, "Yeah, everyone is these days. I'd jet if I even knew how. Here's to hoping the Duergars actually do kick me out someday.");
            }
            scr_event_build_quest_state("guillaumeState", 1);
        } 
        // Talked to him.
        else {
            scr_event_build_dialogue("Guillaume", s_port_guillaume, "Heeeey, you're back! Maaan, I don't want to be a bother but I'm kinda short on cash, y'know? Cuchulainn's keeping me down. You know how it is. If you like my tunes, you think you could spare me a few neuro-shekels?");
            Breakout("build", "add", "money");
            var spare_change = scr_event_build_choice("Spare " + string(scr_money_db("guillaumeTip")) + " neuro-shekels?", s_port_hoopz);
            var yes = scr_event_build_add_choice(spare_change, "Sure, I can spare some change.");
            with yes {
                if(curmoney >= scr_money_db("guillaumeTip")){
                //You have 5 neuro-shekels
                    scr_event_build_money_add(-scr_money_db("guillaumeTip"));
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I guess I can spare a few neuro-shekels.");
                    Breakout("build", "clear");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Awwww man, I knew I was getting mondo vibes when we started talking. You're chill, a real patron of the arts. So like... the Duergars, maaaan. They're all Cuchulainn's little lap dogs, y'know? Throwing us dwarfs under the bus for that dollar bill, that sweet lucre, y'know? Man, if we all just sat down together and talked this out, we'd see we're all in the same boat, that Cuchulainn's making us like... fight each other, maaan.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "What do you mean? Dwarfs and Duergars are the same?");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Man, we're all the same deep down... we're all the same deep down... hey, I'm not gonna keep you but thanks for the cash, maaan. 'ppreciate it.");
                }
                else {
                //don't have 5 neuro-shekels
                    Breakout("build", "clear");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I guess I can spare a few neuroshe- dad flubbit, looks like I'm broke too. I'm sorry, man. I've got nothing.");
                    scr_event_build_dialogue("Guillaume", s_port_guillaume, "Yeah, seems like everyone's broke these days. Maaan, I'd head somewhere way more laid back if I even knew where it was. Here's to hoping the Duergars actually do kick me out someday. Stay chill.");
                }
            }
            var no = scr_event_build_add_choice(spare_change, "I'm all out of money.");
            with no {
                Breakout("build", "clear");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, that's tough man, but I'm all out of money too. Guess we're both broke. Sorry.");
                scr_event_build_dialogue("Guillaume", s_port_guillaume, "Yeah, seems like everyone's broke these days. Maaan, I'd head somewhere way more copacetic if I even knew where it was. Somewhere I can just hang out and skank with my pals. Here's to hoping the Duergars actually do kick me out someday. Stay chill.");
            }
        }
    }
    scr_event_advance(event);
}
