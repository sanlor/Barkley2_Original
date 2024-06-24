/* NPC script for Onslow, the duergar who tasks you with solving the mystery of the missing duergars(after you have killed them). 
This character is located in the courtyard of the duergar base.

// Bio: A well-spoken, aristocratic duergar. He is still vile and repulsive like all the other duergars.
// NOTE: He's responsible for the missing duergars in the first part of the rebel quest. The player can take the assignment to 
"find the duergars" which, in other words, means covering up their murders before the police finds out.
// NOTE2: I drop the term BATMAN in here, and I feel like approximately 0% of the people who play this game will know that this is a military term.
// NOTE3: As of RIGHT NOW, the design of this is that at any point before reaching detectiveState=4, the player can evade the 
Coulombe arrest by doctoring the crime scene. State 4 is the detective arrest sequence. This is probably slightly inaccurate factually, 
since by state 4 Coulombe already knows for certain that the player is the murderer, and doctoring the crime scene does effectively nothing. 
Though Coulombe is a pretty smart guy, IN REALITY he has the player pegged with some measure of certainty by state 2, so Coulombe's internally 
solving the case probably shouldn't be permitted on our end to interfere with when the player can cover the murder up, as it would be too small 
a window for the player to meet up with Onslow. So this is a plot hole I'm living with, allowing the player to doctor a crime scene that, 
at that point, actually doesn't need to be doctored. It's cooler that way.
// IMPORTANT SCRIPTING NOTE: There are going to need to be subsequent location scripts needed for actually doctoring the crime scene and 
completing this quest. Activating those scripts will be needed to reach this conclusion of the quest. They need to build doctorcsQuest=2 
in order to officially finish the quest with Onslow.
*/

/*
if (argument0 == SCRIPT_START) {
    if (Quest("prisonQuest") >= 9) {
        scr_event_interactive_deactivate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    var onslow = id;
    var event = scr_event_create_main();
    with (event) {
        if (Quest("detectiveQuest") == 6) {
            scr_event_build_dialogue("Onslow", NULL, "Oho! You're still here, aren't you?\This is all frightfully embarrassing but we do not normally allow those of such questionable status the luxury of walking about without at least one leg shackle.\Now, if you'd just move away from my person......there's a good lad.");
            scr_event_build_end();
        } else if (Quest("detectiveQuest") == 5) {
            scr_event_build_dialogue("Onslow", NULL, "Oh bother. I've got some of their blood beneath my fingernails again. Back to the manicurist with me, I suppose......");
            scr_event_build_end();
        } else if (Quest("doctorcsQuest") == 2) {
            scr_event_build_dialogue("Onslow", NULL, "Hmm, yes.\Mr. Deveraux! Mr. Deveraux, can I have your attention for a moment, please?");
            Dialogue("Deveraux", "I'm not coming over there again. Just tell me what the fuck you want.");
            scr_event_build_dialogue("Onslow", NULL, "This undesirable seems to have lost its way. Would you mind ejecting this THING from the premises?");
            Dialogue(P_NAME, "Hey, pal, I work for you. You gave me a job.");
            scr_event_build_dialogue("Onslow", NULL, "I'm quite sure I wouldn't have done something like that. I try to show some discretion in who I bring into my employ.");
            Dialogue(P_NAME, "You called in a detective to look for your missing guys.");
            scr_event_build_dialogue("Onslow", NULL, "You're quite right, he's out looking for them now. Degenerate chap, I'm afraid. Quite unpolished. I doubt he'll survive.");
            Dialogue(P_NAME, "I'm that guy. I was out looking for them. It's me.");
            scr_event_build_dialogue("Onslow", NULL, "Ah, I see. You must excuse me, you miserable creatures do all look alike.\Mr. Deveraux, I believe I asked you to remove this thing from my presence? The sight of it is making me a trifle ill.");
            Dialogue(P_NAME, "I found all the missing duergars. I guess you don't want to know what happened to them?");
            scr_event_build_dialogue("Onslow", NULL, "Not as much as I'd enjoy seeing you leave. Immediately, if possible. Just tell the old boys to come on back here. There's quite a few tasks waiting for them.");
            Dialogue(P_NAME, "No can do, chief. They aren't coming back. They got really pissed off being sent into the mountains like that so they quit.");
            scr_event_build_dialogue("Onslow", NULL, "Quit? How ghastly.");
            Dialogue(P_NAME, "Yeah, that's what I said, but they were kinda angry about the whole thing. There's nothing out there in the mountains, just rocks and stuff.\I think rocks are kinda cool, but they don't I guess. I dunno.");
            scr_event_build_dialogue("Onslow", NULL, "Those rascals!! I'll show them!!!\Mr. Deveraux!! Call off the search parties!! Deploy our best assassins!! I just won't sit for duergars deserting on my watch.");
            Dialogue("Deveraux", "That's 38. I told you I'm counting. 38 times you told me to do something, 38 times I tell you that I'm not your fucking secretary.");
            scr_event_build_dialogue("Onslow", NULL, "Oh, bother. What does one have to do to get a decent batman nowadays? I had such high hopes for this Deveraux, but he's just proving to be a disappointment. Pity.");
            Dialogue("Deveraux", "I'M NOT YOUR FUCKING SECRETARY, I'M NOT YOUR FUCKING SECRETARY, I'M NOT YOUR FUCKING SECRETARY, I'M NOT YOUR FUCKING SECRETARY!!!!");
            scr_event_build_dialogue("Onslow", NULL, "Yes, quite.\As for you, it would be most agreeable if you'd leave. Immediately.");
            Dialogue(P_NAME, "You aren't even going to pay me? I got sunburned out there climbing the mountains all day.");
            scr_event_build_dialogue("Onslow", NULL, "Ah, indeed! Well, surely being able to provide such services to duergardom is its own reward. Quite generous of us to provide such an opportunity to someone of your nature.\Now, charge!! To greener pastures with you! Perhaps you've learned a thing or two about how civilized people behave. Cheerio.");
            Quest("doctorcsQuest", 3);
            Quest("detectiveQuest", 6);
            scr_event_build_end();
        } else if (Quest("doctorcsQuest") == 1) {
            scr_event_build_dialogue("Onslow", NULL, "Perhaps I haven't made myself sufficiently clear: You most certainly won't find my missing men here.\You could perhaps try the mountains. Or anyplace that isn't here, in fact.\In fact, I primarily just wish to see you leave my presence. You are the most revolting chap I've seen today, you know.");
            scr_event_build_end();
        } else if (Quest("detectiveQuest") >= 1) && (Quest("detectiveQuest") <= 4) {
            scr_event_build_dialogue("Onslow", NULL, "Ah, you must be Mr. Coulombe. How good of you to drop by at such short notice.");
            var impostor = Choice("Play along?", s_port_hoopz);
            with (ChoiceAdd(impostor, "No.")) {
                Dialogue(P_NAME, "Nah, that's not me. You've got the wrong party.");
                scr_event_build_dialogue("Onslow", NULL, "Hmmm, interesting. Then it's quite beyond me what someone of such a low status would be doing here.....");
                scr_event_build_end();
            }
            with (ChoiceAdd(impostor, "Yes.")) {
                Dialogue(P_NAME, "That's me, Coulombe. Nice to meet you.");
                scr_event_build_dialogue("Onslow", NULL, "Hmm, yes. I can see it now. You are quite repulsive, aren't you? I'm sure it must be nice, a mixed breed like yourself, allowed to walk through duergar domains without shackles.\Please do remember, despite your standing with the police, you are still a filthy degenerate and the mere sight of you has us all terribly ill.");
                Dialogue(P_NAME, "Understood.");
                scr_event_build_dialogue("Onslow", NULL, "Excellent. I'm going to assume you have the intellect to understand the words I'm speaking to you and shall continue.\You see Mr. Coulombe, recently we had a group of our finest footsoldiers go missing. On a top secret mission, you know, very hush-hush. I wouldn't otherwise be telling someone of such undesirable breeding if I knew you could not be discreet. You shall be able to keep your hands close to the vest during your investigation, I trust?");
                Dialogue(P_NAME, "Yes sir, nobody is going to look at these hands of mine while I have anything to say about it.");
                scr_event_build_dialogue("Onslow", NULL, "Yes, that should suffice, I suppose.\So, what we need from you is information of their whereabouts, if they've gotten lost, seriously hurt, dead, or just having a good time with the joneses, crippling rebels and the like, and couldn't be bothered to check in.");
                Dialogue(P_NAME, "Yep, that's probably it. What you just said is what I, Couloumbe, think is the probable reason. Maybe the case is already closed.");
                scr_event_build_dialogue("Onslow", NULL, "Yes, but I would be terribly appreciative if you went out and had a look to see if you spotted the lot. Though, I would suggest you don't get awfully close if you do encounter them, just report back to me.\It's frightfully embarassing given the circumstances, but they do have a standing order to murder all un-duergars on sight. Didn't foresee them getting lost, you know, and normally I do not need to stoop so low as to take a degenerate such as yourself into my employ. Alas, you're the best the agency could deliver, sorry to say.");
                Dialogue(P_NAME, "You know, I just thought of something. Maybe they just went AWOL. Maybe they just got sick of smashing dwarfs, felt like doing something else, just for fun.");
                scr_event_build_dialogue("Onslow", NULL, "I'm afraid this is quite impossible. You see, these duergars are devoted, DEVOTED to crippling dwarfs. It's what they live for.\I shouldn't think there could be the possibly of any credence in what you just said.");
                Dialogue(P_NAME, "Darn.");
                scr_event_build_dialogue("Onslow", NULL, "Yes, what you just said.\Now, if you please, I'm frightfully close to losing the entirety of my lunch at the mere thought of you, so if you could go on and just fuck off, I'd be most appreciative.");
                Dialogue(P_NAME, "I can go now?");
                scr_event_build_dialogue("Onslow", NULL, "Please do. Their last assignment was the mountains. Do make it brief, won't you?");
                Quest("doctorcsQuest", 1);
                scr_event_build_end();
            }
        } else if (Quest("onslowState") == 1) {
            scr_event_build_dialogue("Onslow", NULL, "It's probably a lost cause, but here goes:#Duergars missing. Mountains.\You find. Big reward.");
            scr_event_build_end();
        } else {
            scr_event_build_dialogue("Onslow", NULL, "You there, street urchin. Several of my finest units appear to have gone missing in the mountains. You haven't come across them in your travels, have you?");
            Dialogue(P_NAME, "Huh?");
            scr_event_build_dialogue("Onslow", NULL, "You'll beg my pardon, of course, I'm not as down with the argot as I once was.\Where the fuck they at? Or some such? I'm dreadfully sorry, I simply cannot communicate any better than that with someone so dreadfully bred.");
            Dialogue(P_NAME, "Are you looking for somebody?");
            scr_event_build_dialogue("Onslow", NULL, "Nope, nothing. I'm sorry, I just don't understand you. All I hear is a clicking noise when you talk.");
            Quest("onslowState", 1);
            scr_event_build_end();
        }
    }
    scr_event_advance(event);
}
