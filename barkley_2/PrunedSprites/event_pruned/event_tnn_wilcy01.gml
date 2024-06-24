// Event for Wilcy, lost astronaut. From my design document, verbatim: "A sickly-looking person, wearing tattered and dirty clothing. He is of no quest consequence and gives no items. It's pretty clear he isn't a dwarf, but I don't necessarily have any expectation for what race he is, outside of the fact that his race is reasonably intelligent and has the capacity to look sickly. I guess I should apologize in advance for this, but I had just watched Herzog's Lessons of Darkness, it popped into my head, and I needed to write it. ALSO I was asked for "artsy" and "post-apocalypse" which is not something anybody should ever, ever, ever say to me. That said, I do think this is pretty good stuff, something I'm pretty seriously proud of, even if it does drag on."
// Script note: I don't have the profile data for Matthias, so it's NULL here. I'm assuming there will be a Matthias profile, so I'll change it when it's available.

if (argument0 == SCRIPT_STEP) {
    if (visible and !scr_event_etc_instance_on_screen(id) and scr_time_get() == 3) {
        scr_event_interactive_deactivate();
    }
    else if (scr_time_get() == 4) {
        scr_event_interactive_activate();
    }
}
else if (argument0 == SCRIPT_INTERACT) {
    var wilcy = id;
    var event = scr_event_create_main();
    with (event) {
        if (BodySwap() == "matthias") {
        //if you're controlling Matthias/Dead Son.
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "You don't look so good. Maybe it's best if you rest somewhere.");
            scr_event_build_dialogue("Matthias", s_port_matthias, "No way Jose!! Who needs to rest when you're as alive and well as me, Matthias!!!");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Could have fooled me.");
        } else if (BodySwap() == "governor") {
        //if you're controlling the Governor.
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "You again. I don't give a damn what the rules say, I'm going to keep sitting here. You'd be doing me a favor by putting a bullet in my head and having one of your goons drag me away.");
            scr_event_build_dialogue("Governor Elagabalus", s_port_governor, "Hmm, yes, these are interesting ideas. I am the governor, so I am very interested in these ideas. Keep up the good work!");
        } else if (scr_quest_get_state("wilcyState") == 0) {
        //never spoken
            scr_event_build_dialogue("Wilcy", s_port_wilcy, ".....");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Hey, are you ok? You look pretty depressed.");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Do I?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah. Are you sick?");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yes.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Maybe you should take some medicine.");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Medicine won't cure my sickness.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "What's the matter? Can I get you anything?");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "No, nothing like that. It's just another stupid story. Everyone here's got a story. You can even get some of them to prattle on about it if you ask them nice enough.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I bet your story isn't as stupid as you say it is. Everyone's story is kinda cool if they tell it right.");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Not mine.");
            var choice = scr_event_build_choice("Maybe I can cheer him up?", s_port_hoopz);
            with (scr_event_build_add_choice(choice, "I guess you don't want to tell it...")) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess you don't want to tell it, then. That's all right.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "Thank you. I'm just not in a very talkative mood.");
                scr_event_build_quest_state("wilcyState", 1);
            }
            with (scr_event_build_add_choice(choice, "Let's hear it!")) {
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well, let's hear it. I bet it's cool. Does it have spaceships and gun's in it?");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah...");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well now I need to hear it!");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah. I lived on.....well, where doesn't matter. I was a geologist. At least that's what I told myself most days.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "I got into the field through my hero, Lotte Bergmann. Have you ever heard of her?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't think so.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "She was a pretty big deal where I was from. Scientists don't make the headlines no matter where you are, but she was special.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Was she pretty?");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "No, not really. Not in the way you mean. They made a couple documentaries about her when I was a kid. She was different. An adventurer, I guess. Trying to conquer the greatest mysteries of my planet, stuff nobody really thinks about.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "I guess the average person wouldn't think there was a lot you could do with geology, but if you can think laterally enough it can really tell you a lot about where you came from, maybe even where you're going. You know what I mean?");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "Not really.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah, I'd expect not. I don't really want to get into the science of it, but I guess I was inspired by her. Watching her fashion little cameras and survey equipment out of a toy helicopter, fly it down into an active volcano to take early rock samples. There was one where she cracked the tar caps and piloted a submarine into Rubio's Cauldron. Dig into the heart of the planet, find out what it all meant.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "It was wild stuff, a wild life. I guess I wanted that life.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "So I became a Geologist. I even got a job as a research assistant at the University where she operated, just like a couple other hopeless fans did. Most of us were even able to tell ourselves that it was the science, not about just blindly following our hero.");
                scr_event_build_dialogue(P_NAME, s_port_hoopz, "As long as you were happy, that's all that mattered!");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah, I guess. Not as simple as that for me.");
                scr_event_build_dialogue("Wilcy", s_port_wilcy, "A couple years ago they detected an asteroid headed on a collision course for our planet. Not one of those close-call asteroids, this was going to hit, and it was a planet killer. When everyone stopped shitting their pants they decided to put together a research team to fly out to it, find some way to change its trajectory.");
                var choice = scr_event_build_choice(".....", s_port_hoopz);
                with (scr_event_build_add_choice(choice, "Is this going to be a long story? I have other things I need to do.")) {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Is this going to be a long story? I have other things I need to do.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah, I guess. Look, I didn't say it was an interesting story. You said you wanted to hear it.");
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "I know, but I have a lot of stuff I need to do.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "Fine, whatever.");
                    scr_event_build_quest_state("wilcyState", 3);
                }
                with (scr_event_build_add_choice(choice, "Wow!")) {
                    scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wow!!");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "Yeah, tell me about it. Naturally they picked Lotte to lead the whole thing. She was the best there was anyway, and they needed a recognizable face to put on the whole expedition. But somehow they chose me to lead the Mineralogy department. I still don't really understand why. I wasn't some prominent, or even useful name in the field. Just a lab tech.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "But I took it, you know? What was I going to say? No, I don't want to follow my dream. No, I don't want to do something important with my miserable existence. Anybody would have taken it.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "Enough time has passed that I don't even remember much about what happened in the early days, just Lotte. She was everything I hoped she'd be. Intelligent, brave, whenever you'd have a problem you couldn't solve, she'd always have that one angle you didn't see. I think she knew how much I looked up to her, and I guess she felt some sort of obligation to humor me. Some of the best nights of my life were just the two of us up all night talking in the asteroid camp.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "So anyway, time passes and we figure out how to set off a couple of magnetic charges to change the trajectory enough to push it out of harm's way, but this was around when they started picking up all these Dwarfs for whatever fucking reason. We had some backup plans in place in case anybody stopped by, since that was a pretty big thing going on in the system at the time, but I don't think anybody really took the threat seriously.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "We were in the field doing some last-minute tests, a couple days away from detonation and a few weeks away from the asteroid impact when we picked them up on our orbital sensors. I dismissed it as some rogue static at first before one of the others did a scan. Maybe if I had just paid more attention I would have seen it coming, but it was too late by the time we figured out who it was and what they wanted.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "We may have gotten back to the ship in time if we had just gotten to the transport shuttle, but we were moving around a lot that day and it was parked a couple hundred yards away from where it should be. Even when we saw them descending on us, some of us were skeptical that they were really there for us, a couple scattered scientists in the middle of nowhere, but we did have a couple Dwarfs working with us. I guess that's why they picked us all up. I don't really know.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "A couple tried to outrun the cruiser on foot. Maybe some of them even made it pretty close to the transport, I couldn't tell. There was so much gunfire, pieces of rock kicked up.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "I don't really remember much of anything until we found ourselves inside the space probe that took me here, most of us bleeding from wounds or dying from exposure to the atmosphere when our suits were punctured from the attack.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "Maybe we could have been all right if there were proper medical supplies to tend to the wounded, or if the food dispensers were properly stocked, or if the heating units didn't short the first day. But they were only concerned with catching us, dead or alive, and whoever put together that probe didn't try to make sure it could safely transport two dozen people through space for four months.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "So it didn't. One by one they died. My friends, dying right before me of starvation, the cold, infection.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "The worst were the ones who grew despondent from the pains of realizing what our absence on that asteroid meant. The reality that there wasn't enough time to get another team up there. That would take outsiders months, even though I'm sure they tried. Just a few more days and we could have changed the trajectory.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "But there were no more days. We saw our ship and campsite melting as the asteroid fell out of view from the probe. No one was left, no notes to go through, no picking up where we left off. We failed.");
                    scr_event_build_dialogue("Wilcy", s_port_wilcy, "I feel as though the lucky ones were those who got to see their world in flames for one last moment than five months of staring at the last hope of my people systematically losing the will to live.");
                    var choice = scr_event_build_choice(".....", s_port_hoopz);
                    with (scr_event_build_add_choice(choice, "I don't think I want to hear any more of this story.")) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't think I want to hear any more of this story.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Then why the fuck did you ask me to tell it?");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know. I guess I wanted to cheer you up.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Well you fucking blew it.\Just leave me alone. That's all I ever wanted you to do in the first place.");
                        scr_event_build_quest_state("wilcyState", 4);
                    }
                    with (scr_event_build_add_choice(choice, ".....")) {
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, ".....");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "And so, two weeks ago I was the only person to walk out of that probe alive. The last of my people. Me.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "It's a miracle you made it alive...");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "A miracle. I don't know where you're from, but that word has a more positive connotation where I'm from. The fact that I'm alive does not feel positive. This is a curse.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, ".....");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "All I think about now is Lotte. She was the last to go, the last to give up. For a long time it was just the two of us left, holding each other in the darkness, too afraid to say anything, think anything.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "These arms are where she died. Right here. I held her for so long after.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "I can almost still feel her if I close my eyes.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Do you know what that's like? To watch the one you admire most, the one you love the most, waste away and die in your arms? To feel their last breath on your arm as you hold them. Someone so full of life.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "But she's gone now. They're all gone.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Now I'm all that's left.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, ".....");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Have you ever lost anything that important to you? Something so enormous that....that just not having it anymore makes you feel less like you? Makes you feel like something else. Something horrible.");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't really know. I have amnesia.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Do you really?");
                        scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yes.");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Wow....");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "You don't know how envious of you I am. To forget...");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "Maybe in another life you could call that a curse. In this one...");
                        scr_event_build_dialogue("Wilcy", s_port_wilcy, "...it's a gift.");
                        scr_event_build_quest_state("wilcyState", 2);
                    }
                }
            }
        }
        if (scr_quest_get_state("wilcyState") == 1) {
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "This wasn't supposed to happen.....");
        }
        if (scr_quest_get_state("wilcyState") == 2) {
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "This wasn't supposed to happen.");
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Be grateful that you have nothing. Makes it harder for anybody to take anything away from you.");
        }
        if (scr_quest_get_state("wilcyState") == 3) {
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Just leave me alone.");
        }
        if (scr_quest_get_state("wilcyState") == 4) {
            scr_event_build_dialogue("Wilcy", s_port_wilcy, "Fuck off. I'm through talking to you.");
        }
    }
    scr_event_advance(event);
}
