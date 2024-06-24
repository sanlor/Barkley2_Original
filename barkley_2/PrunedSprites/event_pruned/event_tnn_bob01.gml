// event_tnn_bob01
// Event for Bob, the little kobold lying uncomfortably in a tank in the back of Cuthbert's pet shop.

if (argument0 == SCRIPT_INTERACT)
{
    var bob = id
    var event = scr_event_create_main();
    with (event)
    {
        //-------------------------------------------
        // Body Swap States
        //-------------------------------------------
        if (BodySwap() == "matthias")
        {
            scr_event_build_dialogue("Bob", NULL, "Hi there!! Would you like to buy a......\Uh_._._.nevermind_._._.");
        } 
        else if (BodySwap() == "governor")
        {
            scr_event_build_dialogue("Bob", NULL, "Sorry but somebody already bought me. I'm not for sale at all. Not one bit!!");
        }
        // State 0 - First interaction
        else if (scr_quest_get_state("bobState") == 0)
        {
            scr_event_build_dialogue("Bob", NULL, "Hi. I'm Bob.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh. Hi. I didn't know you could talk.");
            scr_event_build_dialogue("Bob", NULL, "Yep, I can talk. Cuthbert taught me. Business isn't so good so he has plenty of free time.\Cuthbert tells me I should talk to all the customers, ask how they're doing.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh._._._. Well, that's nice of him.");
            scr_event_build_dialogue("Bob", NULL, "Yeah, he's a pretty nice guy.");
            scr_event_build_dialogue("Bob", NULL, "So.___.___.___.\ how are you doing?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I'm fine, I guess.");
            scr_event_build_dialogue("Bob", NULL, "Good, good, great.....\So.___.___.___want to buy a kobold?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't think I should. I don't have a home or anything. It'd probably be a bad idea to buy a pet without a home.");
            scr_event_build_dialogue("Bob", NULL, "Yeah... well... thanks for stopping by the shop I guess.");
            scr_event_build_quest_state("bobState", 1);
        } 
        // State 1 - Second interaction
        if (scr_quest_get_state("bobState") == 1)
        {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "It doesn't look really comfortable in there.");
            scr_event_build_dialogue("Bob", NULL, "It's not so bad. Cuthbert said he'd get me a bigger tank if business wasn't so bad, but I'm used to it. You ever been in a tank before?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Well I woke up in an egg.");
            scr_event_build_dialogue("Bob", NULL, "Why?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I don't know. But I don't think I really want to go back.");
            scr_event_build_dialogue("Bob", NULL, "Yeah, probably not. But you never know I guess.___.___.___.Hey! Do you want to try it out? I can get out and you can give it a try. I don't know anything about you, maybe you'll really like being in a tank.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Uh... I don't think so. I'm too big I think. I don't want to break it.");
            scr_event_build_dialogue("Bob", NULL, "Yeah, I guess you're right... It'd be really bad if my tank got broken. It's the only thing I've got. I think Cuthbert would be really upset with me if I let somebody break the tank.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, I-");
            scr_event_build_dialogue("Bob", NULL, "Oh! The tank is extra! It's not included when you buy me. Did I say that already?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No, you didn't.");
            scr_event_build_dialogue("Bob", NULL, "Yeah, it's extra, I'm supposed to say that. They're kinda expensive, a lot more expensive than a kobold. I can kinda see why, they're pretty cool. This one is pretty small, but you can put all kinds of things in them. They're pretty great. I like tanks a lot.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I can see th-");
            scr_event_build_dialogue("Bob", NULL, "I hope Cuthbert doesn't decide to just sell my tank. That would really stink. It wouldn't be his fault, business just isn't good, but I'd really miss my tank. I hope he doesn't sell it.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, ok! It's been nice talking to you Bob but I need to go.");
            scr_event_build_dialogue("Bob", NULL, "Oh, ok! Thanks for the talk. I didn't realize how much I like my tank until we talked about it for a while. Something about you really gets me thinking about stuff.");
            scr_event_build_quest_state("bobState", 2);
        } 
        // State 2 - Third interaction
        if (scr_quest_get_state("bobState") == 2)
        {
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Don't you get tired of being stuck here? Have you ever thought of escaping?");
            scr_event_build_dialogue("Bob", NULL, "I don't know. Not really, I guess. I don't know where else I'd go.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "You could go back to where you came from, I guess. Where are you from?");
            scr_event_build_dialogue("Bob", NULL, "The sewers. Cuthbert told me he saved me from there when I was a baby. He says I was getting kicked around by some Duergars down there, so he stepped in and rescued me.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Wow! I wouldn't have thought it by looking at him. He doesn't look like much of a fighter.");
            scr_event_build_dialogue("Bob", NULL, "I wouldn't know. He said there were twenty of them all huddled around, hitting and kicking me.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Twenty, huh?");
            scr_event_build_dialogue("Bob", NULL, "That's what Cuthbert always said.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Do you think that's how it really happened?");
            scr_event_build_dialogue("Bob", NULL, "No, not really. He probably killed my parents to get to me.____________ But it makes for a nicer story, don't you think?");
            scr_event_build_quest_state("bobState", 3);
        } 
        // State 3.5 - Plays after state 3 if the player has gotten Eric the job.
        if (scr_quest_get_state("bobState") == 3) && (scr_quest_get_state("ericQuest") == 9)
        {
            scr_event_build_dialogue("Bob", NULL, "There was some loud guy here earlier talking about you.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Oh, that was Eric. He works here now, I got him a job.");
            scr_event_build_dialogue("Bob", NULL, "Oh... So he'll be back?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, probably.");
            scr_event_build_dialogue("Bob", NULL, "That's a shame. He's not a very nice guy. He said something about there being no bounds of your remarkable vapidity. I don't know what all that means, but he didn't say it in a particularly nice way.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "Yeah, he's like that.");
            scr_event_build_dialogue("Bob", NULL, "I don't like Eric. He smells funny. He brought all his stupid pets with him. I'm glad Cuthbert doesn't have pets as rotten as Eric's pets. One of his ferrets bit me. Oh, can you do me a favor?");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "I guess.");
            scr_event_build_dialogue("Bob", NULL, "When you leave, can you make sure you close the door all the way? He keeps walking by the shop yelling about his manifesto. I won't be able to hear him as well if the door is closed all the way. I'd rather not be able to hear him.");
            scr_event_build_dialogue(P_NAME, s_port_hoopz, "No problem.");
            scr_event_build_quest_state("bobState", 4);
            scr_event_build_end();
        }
        // State 3 - Looping final statement
        if (scr_quest_get_state("bobState") == 3)
        {
            scr_event_build_dialogue("Bob", NULL, "I'll be here if you change your mind about buying a kobold. We make good pets I think.\Actually I don't really know but I'll try hard to be a good pet.");
        } 
        // State 4 - Looping final statement
        if (scr_quest_get_state("bobState") == 4)
        {
            scr_event_build_dialogue("Bob", NULL, "I'll be here if you change your mind about buying a kobold. We make good pets I think.\Actually I don't really know but I'll try hard to be a good pet.");
        }
    }
    scr_event_advance(event);
}
