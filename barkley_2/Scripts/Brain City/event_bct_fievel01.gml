// Event script for Fievel, a chip salesman in Brain City.
// event_bct_fievel01
/*
    Fievel is a chip salesman in Brain City. 
    get him to install malware on sold chips
    dwarf mayor advertisement bloatware
*/


if time == questtime {
    fievelMegaChip, 1
}



"Quit wasting time, get yourself a cyberspine!"


// fievelMegaChip == 1
    // scene will play one time
// fievelMegaChip == 2
    // rejected quest offer
// fievelMegaChip == 3
    // accepted quest offer
// fievelMegaChip == 4
    // 
 


// NO CHIP!
if (chipInstalled == 0) {
    if fievelState == 0 {
        Fievel
        "Hey there, is that an eligible customer? You've come to the right place! I've got CPUs, I've got GPUs, I've got... oh... dang. Come back when you've got some steel in your collar, kid."
        
        X114JAM9
        "What?"

        Fievel
        "I can't sell you chips when there's no place to put 'em. Come back when you've got a rig. No neckwork done here."
        fievelState, 1
    }
    else if fievelState == 1 {
        Fievel
        "Come back when you've got a rig."
        
        X114JAM9
        "Where do I get one of those?"
        
        Fievel
        "It's dangerous, kid. Whole lotta metal going in ya just to run a couple of these little gizmos. But if you've made your mind up, try the lower stacks. Then come back this way and we can get ya set with a decent config."
        fievelState, 2
    }
    else if fievelState == 3 {
        Fievel
        "Try a few floors down. That's all I can say."
    }
}
else if chipInstalled == 1 {
    else if fievelState >= 3 {
        Fievel
        "Hey there, what can I get for ya?"
        
        show choice
        var chip 
        with chip {
        
        }
        var talk
        with talk {
        
        }
    }
    if fievelState >= 1 {
        Fievel
        "A ballhardy move to say the least, but you're back, and with a sweet rig to boot! Now you're an eligible customer. Shop around a bit, and lemme know if you need some help."
        fievelState,3
    }
    else {
        Fievel
        "Look at that, an eligible customer. Take a look around, see if anything catches your eye, and of course just holler if you need help."
        fievelState,3
    }
}


// quest prompt / time
if (fievelMegaChip == 1) {
    if chipInstalled == 0 {
        Fievel
        "Hey, hey!... wait a sec, dang. You haven't even been laid for chip, there's no way you're interested in this."
        
        X114JAM9
        "Huh? You've got some kind of secret? Maybe I wanna take a look anyway!"
        
        Fievel
        "Yeah? Ok, well come on over."
        
    } else if chipInstalled == 1 {
        Fievel
        "Hey, hey! Come take a look at this?"
        
        X114JAM9
        "What, what?"
    
    }
    Fievel
    "Will you get a load of this? Look at this baby, an original Q-Barnabus Velocimaster 940ti. I love old console chips! Proprietary parts, obsolete components, zero documentation... a chip-tinkerer's dream!"
    
    X114JAM9
    "You're fixing it up?"
    
    Fievel
    "Sure am... need some parts though if I want to get it up to factory specs. I'm guessing this is for a restoration project, so I need to keep it legit. Say, are you looking for a job? I'm not so mobile nowadays, and I could get started on this project a lot faster if you could find some of these parts for me."
    
    choice chip
    var yes
    with yes {
        X114JAM9
        "Sure, I'll help you out. What do you need?"
        
        Fievel
        "All right! Well, I'm going to need a few things..."
        fievelMegaChip, 3
    }
    var no
    with no {
        X114JAM9
        "I don't think that's the job for me, sorry."
        fievelMegaChip, 2
    }
}
if (fievelMegaChip == 2) {
    Fievel
    "Hey, change your mind? Think you can help me out?"
    
    choice chip
    var yes
    with yes {
        Fievel
        "All right! Well, I'm going to need a few things..."
        fievelMegaChip, 3
    }
    var no
    with no {
        Fievel
        "Ah, oh well. Just like the proverbial dream of the chipsman... can I help you with anything else?"
        
        choice q
        var chips {
        
        }
        var talk {
        
        }
    }

}

if (fievelMegaChip == 3) {
    Fievel
    "Hey, you're back. Any luck yet? Need some help?"
    
    choice q
    var what
    with what {
    
    }
    var where
    with where {
    
    }
    var chips {
    
    }
    var talk {
    
    }

}

if (fievelMegaChip == 3) && (fievelIngredients) { fievelMegaChip == 4) }

if (fievelMegaChip == 4) {
// after repair
    Fievel
    "Check it out, why don't ya?"
    
    *hands you a gleaming chip*
    
    X114JAM9
    "Wh... I can barely believe my pupils... it's perfect."
    
    Fievel
    "Haha, there's a reason they used to call me /'Chipslord/'! Better than new! Now, just gotta find the client's address... "
    
    *gleam of light*

    Fievel
    "The previous chipsmaster, my former teacher, had a /'bargain bin/' where you're standing right now. My first task every morning was to stock the bin with new bargains. Old chips, new chips, vintage chips, retro chips, knockoff chips and forgotten chips... Here are three I selected during those years as a collection of /'unforgettable bargains./' I couldn't bear to part with them, and so I hid them away, until now."
    
    *gleaming chips, 3x*
    
    Fievel
    "That project was more than I ever thought I could do when I started in this biz. I tell you what..."
    
    // after giving chip for otaku dwarf
    Fievel
    "A really sweet guy, he's working on a vidcon restoration project it seems? This chip used to be in the old U-Soft Ulimiter 198II. Can you believe 38 QBUOPS used to be considered cutting edge? Heh heh heh... anyway better get this to him soon. Now where's that address..."
}
if (fievelMegaChip == 5) {
    Fievel
    "Where's that address, where's that address..."
}


//////////// SCRIPT FOR FIEVEL'S OUTGOING DOOR!
if (fievelMegaChip == 5) {
    Fievel
    
    
    X114JAM9
    
    
    Fievel
    
    
    X114JAM9
    "Can you tell my why you can't?"
    
    Fievel
    "What? You're gonna make me say it? I'm an oldtimer, all right? I'm a has-been oldtimer..."
    
    X114JAM9
    "Nooo! I didn't mean it!"
    
    Fievel
    "It's ok, you're right. It's true. If I can get this last sale, I'll finally be able to retire. The chips, the infodecks, the cyberdeks, the nanodeks, the wind sprints down to Al-Akiwhatsit... I've been too old for this game for awhile now."

    X114JAM9
    "I hope I never get old..."
    
    Fievel
    "Ok, found it! The Q-Barnabus came with a hand-written note in the package about the delivery instructions. The order is extremely urgent and from an estate called... hmm, let's see here. Yeah, /'Al-Akihabara/'. I've heard something about that somewhere. Anyway, it's got some directions. Got a pen or pencil?"
    
    choice
    var no
    with no {
        Fievel
        "Hmm... then I guess listen close. Here we go:"
    }
    var yes
    with yes {
        Fievel
        "Then you'll wanna jot this all down. Here we go:"
    }
    Fievel
    "directions"
    
    X114JAM9
    "Whew... okay. I'll be back!"
}





// handing you the chip
Wendy
"You know those socketjock types... ready to risk their britches and their PR score for jaunts of high-wire infobatics through mainframe security that'll render you ICEd micro-moments before you can even say /'I'm in./'"

"My tech's gotten me out of some jams, to be sure..."
. When you slip up... *sigh*... when you slip up, it isn't worth it." 



//// other stuff
Wendy
"I mean bits and bytes! A good chip is one that can move 'em, and fast. Your brainpan up there is looking for that good data crude. And if your chip isn't pumping it, well, it's doing nothing for ya."

X114JAM9
"Right, power!" 

Wendy
"But wait a minute, hold on there! These chips need a lot of guts to keep running... and if they don't get it, a starved chip can up and goose a whole system. That means you and your b'pan kid. You're the system!"

X114JAM9
"Yikes... I'll be careful then!"

Wendy
"Pearls before swine... *Sigh*"

// When offering him to install Malware
Fievel
"You want me to infect the compsdwarfs of Necron 7 with this bullware? I won't have it!"


// Afterwards
Fievel
"Have I truly become a /'Chipdevil/'?"























