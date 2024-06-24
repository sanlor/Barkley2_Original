///Irmingard's Conversion Quest and Info
///Sister Irmingard
/*
Variables
irmingardState
    0 - not talked
    1 - talked, routes to questions
    2 - talked and upset Irmingard, it'll take 2 hours for her to greet you again
    3 - routes back to 1 after you apologize
conversionQuest
    0 - haven't heard the quest
    1 - have heard it, haven't accepted
    2 - somehow upset Irmingard and she will no longer ask you to help
    3 = time ran out and quest is unavailable
    4 - accepted the quest
    5 = looking for Relics (Zenobia asks for them)
    8 = you've given them the cyberspear relic
    9 = you've returned and told Irmingard... quest complete
    10 = the quest ran out of time
conversionQuestActive
    0 - simple on/off for flavor questions
    1 - simple on/off for flavor questions
irmingardDenied
    0 - haven't denied the quest
    1 - denied once, gives a flavor response
*/
script = "
IF conversionQuest == 6 | GOTO | IRMING07
IF conversionQuest == 5 | GOTO | IRMING06
IF conversionQuest == 4 | GOTO | IRMING05
IF irmingardState == 3 | GOTO | IRMING04
IF irmingardState == 2 | GOTO | IRMING03
IF irmingardState == 1 | GOTO | IRMING02
IF irmingardState == 0 | GOTO | IRMING01

" +
//--------------------------------------------
//---------- MISSIONARY SNIPPET --------------
//--------------------------------------------
"
HEARQUESTAGAIN
DIALOG | P_NAME | Hey, what was that conversion thing you were talking about earlier? Something about Cybergremlins?
DIALOG | Sister Irmingard | That's correct, and I'm very glad you're interested! 'sq'There's a tribe of Cybergremlins to the south that I believe we can convert to Klispianity.'rt' Many people say the Cybergremlins are violent and uncivilized, but I believe we can tame their primitive souls with Clispaeth's soothing teachings. What do you say, 'sq'will you help me?'rt'
KNOW | knowCgremVillage | 1
GOTO | QUESTOPTION

HEARQUEST
DIALOG | P_NAME | How could little ol' me get the word out about Clispaeth?
DIALOG | Sister Irmingard | By 'sq'telling people about him,'rt' spreading his teachings and treating people in the way Clispaeth said we should. 'sq'Spread his message'rt' by being a good person. By helping the needy, by acting benevolently, by positively changing the world, you'll be spreading his message.
DIALOG | P_NAME | Sounds... valiant.
DIALOG | Sister Irmingard | I'm very happy you're interested in spreading the faith! In fact, there is something you could do right now. 'sq'There's a tribe of Cybergremlins to the south.'rt' The people here say that Cybergremlins are wild and primitive creatures, but I believe they have the capacity to love each other and Clispaeth just as we do. But most importantly, I believe it is imperative as good Klispins that we make every effort to 'sq'save their souls.'rt'_ Will you help me?
QUEST | conversionQuest = 1
IF zenobiaEncounter == 2 | GOTO | ALREADYBEENTHERE
GOTO | QUESTOPTION

ALREADYBEENTHERE
DIALOG | P_NAME = s_port_hoopzSurprise | The Cybergremlins?! `w1`No way, senorita!`w0` I was there earlier and they boiled my prized skelly right out of my meat-self.
DIALOG | Sister Irmingard | Oh Klisp-mercy,_ that sounds dreadful. The doctrines of Clispeath frown greatly on sous-vide, I can personally recall two such passages. It's okay, P_NAME_S, I understand if you cannot bring yourself to 'sq'forgive the Cybergremlins and teach them the true path to salvation.'rt' I suppose another_ /'braster-with-a-heart/' will darken this humble abbey's entrance. And maybe she will take up the charge.
DIALOG | P_NAME = s_port_hoopzSad | Well..._ uh...
CHOICE | Forgive and forget past boilings?
REPLY | FORGIVEBOILING | I'm ready to move on and help these Cybergremlins.
REPLY | CANTMOVEON | I don't think I can be the better person/gremlin just yet.

FORGIVEBOILING
DIALOG | P_NAME = s_port_hoopzSad | I_-I need to learn from the teachings of Clispaeth and_ /'forgive and forget./' (Even if they did boil out my skelly for pagan purposes...) Sister Irmingard...
WAIT | 0.5
DIALOG | P_NAME = s_port_hoopzHappy | I'll do it!
DIALOG | Sister Irmingard | You will?
GOTO | ACCEPTQUEST

CANTMOVEON
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry, Sister, but I think I need to do a little more soul-searching before I come face-to-face with those grems again... can you give me more time?
DIALOG | Sister Irmingard | Of course, dear... you come back when you are ready. Was there anything else, young stripling?
GOTO | QUESTIONS01

QUESTOPTION
CHOICE | Ready to be a missionary?
REPLY | ACCEPTQUEST | I think I'm ready.
IF irmingardDenied == 0 | REPLY | DENYQUEST01 | Not for me, sorry.
IF irmingardDenied == 1 | REPLY | DENYQUEST02 | I don't have the time.

DENYQUEST01
DIALOG | P_NAME | Well, I don't really know much about being a missionary...
DIALOG | Sister Irmingard | Being a missionary is about serving a higher purpose than ourselves, it's about serving others and Clispaeth. If you're willing to give of yourself to help others, then I would be happy to tell you more, but if you're not ready then you can come back later.
QUEST | irmingardDenied = 1
EXIT |

ACCEPTQUEST
DIALOG | P_NAME | Yeah, I think this is my calling. I think I'm ready to spread the word of Clispaeth.
DIALOG | Sister Irmingard | That's fantastic! I knew you were a true believer! Oh, I'm so proud of you right now.
DIALOG | P_NAME | Well, heh, gee... thanks... but I did have a few questions for you.
QUEST | conversionQuest = 4
QUEST | conversionQuestActive = 1
GOTO | CGREMQUESTIONS

DENYQUEST01
DIALOG | P_NAME | Hmm, I don't think I'm ready for it yet, I'm kind of busy right now. But I'll definitely think about it.
DIALOG | Sister Irmingard | I'm glad you're giving it thought but don't take too long or I may send someone else to do it. Was there anything else?
GOTO | QUESTIONS01

" +
//--------------------------------------------
//---------- CYBERGREM SNIPPET ---------------
//--------------------------------------------
"
CGREMQUESTIONS
CHOICE | About these Cybergremlins...
IF cgremQuest == 3 | REPLY | GETRELIC | The Cybergremlins say they want a relic of Clispaeth.
IF knowCgrems == 0 | REPLY | WHATARECGREMS | What are Cybergremlins?
IF knowCgremVillage != 2 | IF knowCgremVillage != 3 | REPLY | WHEREARECGREMS | Where are these Cybergremlins?
REPLY | THATSIT | I guess that's it.

GETRELIC
DIALOG | P_NAME | I met the Cybergremlin Chief and she's willing to convert, but she wants a relic to prove Clispaeth's power first.
DIALOG | Sister Irmingard | A relic of Clispaeth's power? Oh... oh dear...
DIALOG | P_NAME | I can do it, but there seems to be just trash everywhere.Can you give me a hint.
DIALOG | Sister Irmingard | Unfortunately not. My knowledge of the Necron 7 is limited to Tir na nOg and its surrounding areas. 'sq'You could always talk to Deacon Brimble'rt', my assistant here in the Industrial Park. Although his attempt to convert the Cybergremlins failed, he will surely have valuable insight.
DIALOG | P_NAME | Alright, thanks Sister Irmingard.
GOTO | CREMQUESTIONS

WHATARECGREMS
DIALOG | P_NAME | So what are Cybergremlins?
DIALOG | Sister Irmingard | Cybergremlins are warlike, tribal creatures that live all over the Necron 7. They are wild and primitive, bellicose and deceitful... but I believe we can civilize them through Clispaeth. More importantly, I believe it's our responsibility as Klispins to save their souls. This is why it is imperative to convert them, even if it means putting our lives at risk.
DIALOG | P_NAME | Well, `w1`my`w0` life...
DIALOG | Sister Irmingard | Yes,_ was there anything else?
KNOW | knowCgrems | 1
GOTO | CGREMQUESTIONS

WHEREARECGREMS
DIALOG | P_NAME | How am I supposed to get there again?
DIALOG | Sister Irmingard | 'sq'They're just south of this Industrial Park closer to the swamp.'rt' If you start heading down, 'sq'stay to West and you'll find the route to their village, guarded by a large gate.'rt' Getting inside the village is another issue altogether. Was there anything else?
KNOW | knowCgremVillage | 1
GOTO | CGREMQUESTIONS

THATSIT
DIALOG | P_NAME | Well, I guess that's it.
DIALOG | Sister Irmingard | Great, just remember that time is of the essence here. If I don't receive word that the Cybergremlins have converted in a few hours, I'll send another missionary to do the job. Was there anything else?
GOTO | QUESTIONS01

" +
//--------------------------------------------
//---------- CLISPAETH SNIPPET ---------------
//--------------------------------------------
"
QUESTIONSCLISP
CHOICE | Got some Clispaeth Qs...
IF knowClispaeth >= 2 | REPLY | HEARQUEST | How can I spread the news of Clispaeth?
REPLY | CLISPMESSAGE | What's Clispaeth's message?
REPLY | WHATBELIEFS | What do Klispins believe?
IF knowClispaeth >= 1 | REPLY | WHOISCLISP | Who is Clispaeth, really?
REPLY | HOWTOBEGOOD | How can I be a good Klispin?
IF knowJudas == 1 | REPLY | WHOWASJUDAS | Tell me more about Judas.
IF knowCyberpocalypse == 1 | REPLY | CYBERPOCALYPSE | What's the Cyberpocalypse?
REPLY | BUNKEM | Sounds like a bunch of bunkum.
REPLY | THATSIT | That's all I need.

WHOISCLISP
DIALOG | P_NAME | Who's this Clispaeth character I keep hearing about?
DIALOG | Sister Irmingard | Historically, `kw`Clispaeth Ryuji Atuck`rt` was a freedom fighter in the Holy Land who fought against the Roman Empire. He was killed in the `kw`Boston Massacre`rt` when his apostle `kw`Judas`rt` betrayed him to Emperor Constantine. But more importantly, he was a prophet, the person who brought the holy word to the people. His death heralded the `mq`Cyberpocalypse...`rt` but also salvation for all people and his message of Klispianity has since spread across the galaxy.
KNOW | knowJudas | 1
KNOW | knowCyberpocalypse | 1
KNOW | knowClispaeth | 3
GOTO | QUESTIONSCLISP

WHATBELIEFS
DIALOG | P_NAME | So what exactly do Klispins believe?
DIALOG | Sister Irmingard | Clispaeth's message was twofold. First, it was a lifestyle, a way to treat other people. It's complex but can ultimately be boiled down to treating others with kindness and compassion. His other message was that he would one day return and bring his followers salvation. By following his lifestyle of compassion, you can be saved when Clispaeth returns.
KNOW | knowClispaeth | 2
GOTO | QUESTIONSCLISP

HOWTOBEGOOD
DIALOG | P_NAME | So how am I supposed to be a good Klispin?
DIALOG | Sister Irmingard | Well, the most important way is by treating people with compassion and kindness. Help people in need, be honest with them and always do what you promise to do. That's the Klispin way. You can also spread the good news of Clispaeth to people who haven't heard it. That is my life's work and I am wholly dedicated to it. Is there anything else?
GOTO | QUESTIONSCLISP

CLISPMESSAGE
DIALOG | P_NAME | What was Clispaeth's message?
DIALOG | Sister Irmingard | Clispaeth's message was complex and multi-faceted, but it was ultimately a message of peace, compassion and empathy. It was a message of kindness, that we should respect and help our fellow man and dwarf and by doing so, we will be rewarded in the next life.
GOTO | QUESTIONSCLISP

WHOWASJUDAS
DIALOG | P_NAME | Who was this Judas guy?
DIALOG | Sister Irmingard | Judas was Clispaeth's chief disciple and best friend. And sadly, also his betrayer. Judas tried to usurp Clispaeth's position as the head of the Klispin movement and when he failed, sold Clispaeth to the Romans, who killed him in an event known as the Boston Massacre. 
DIALOG | P_NAME | He sounds like a real rat.
KNOW | knowJudas | 2
DIALOG | Sister Irmingard | It's likely that he was a Roman spy all along, planted to weaken and sow dissension within the burgeoning Klispin movement. Clispaeth's death was bittersweet; it brought hardship to all Klispins and heralded the Cyberpocalypse, but it also brought redemption to all of his followers. Someday soon, Clispaeth will return and deliver all of his followers unto salvation.
KNOW | knowCyberpocalypse | 1
DIALOG | P_NAME | Wow, can't wait!
GOTO | QUESTIONSCLISP

CYBERPOCALYPSE
DIALOG | P_NAME | Hey, that 'mq'Cyberpocalypse'rt' thing sounds familiar. What is that?
DIALOG | Sister Irmingard | When Clispaeth died, the Klispins and Romans fought for 666 years in a battle that devastated all that it touched. It ended when the Romans, under Emperor Constantine, finally adopted Klispianity, but by then it was too late. The galaxy was destroyed and we are living in the consequences of that war: the Post-Cyberpocalypse.
DIALOG | P_NAME | But what about b-ball?
DIALOG | Sister Irmingard | It's said that during this period, basketballs didn't work.
DIALOG | P_NAME = s_port_hoopzSad | (Aw shiggs...)
GOTO | QUESTIONSCLISP

BUNKEM
DIALOG | P_NAME | Wow. This sounds like a bunch of baloney. I can't believe you buy this bunk.
DIALOG | Sister Irmingard | A lot of people have doubts about their faith and it's perfectly normal. Even if you don't believe that Clispaeth will return and bring his followers salvation, I believe his message of compassion and empathy is universal, not exclusive to Klispins. There is room for improvement in all of us; if we can accomplish it through Clispaeth, whether or not we believe in the theological component of his teachings, I believe we can become better people.
CHOICE | Response?
REPLY | BUNKREBUTT | Maybe there's something to what you say.
REPLY | BUNKREBUNK | Cram it, granny.

BUNKREBUTT
DIALOG | P_NAME | Hmm, I hadn't looked at it that way before. I'll think about it.
DIALOG | Sister Irmingard | Yes, please do. Why don't we talk about something else for now?
GOTO | QUESTIONSCLISP

BUNKREBUNK
DIALOG | P_NAME = s_port_hoopzSmirk | `w2`FROOOP! FROOOP! TOOOT! FLUUUMP!`w0` That's the sound of the hot air coming out your gob. Give it a rest, grandma, you're not impressing anyone.
DIALOG | Sister Irmingard | P-please don't talk like that here. I don't mind if you don't believe in Clispaeth, but the others here... they depend very much on Clispaeth and your behavior isn't helping them.
DIALOG | P_NAME = s_port_hoopzSmirk | `w2`TOOOT! TOOOT! FROOOP!`w0` You're still doing it!
DIALOG | Sister Irmingard | Clispaeth taught us to put others before ourselves. Please be considerate of the people around you...
DIALOG | P_NAME = s_port_hoopzSmirk | `w2`FROOOP! TOOOT! FLOOOP!`w0` I can do this all day.
DIALOG | Sister Irmingard | Sigh... I suppose this conversation is over. Goodbye, wayward jugend.
QUEST | conversionQuest = 3
EXIT |

THATSIT
DIALOG | P_NAME | Think that's all I wanted to know about that.
DIALOG | Sister Irmingard | Please let me know if you ever have more questions. Was there anything else?
GOTO | QUESTIONS01

//--------------------------------------------
//---------- QUESTIONS SNIPPET ---------------
//--------------------------------------------      
QUESTIONS01
CHOICE | Got a question?
REPLY | CANIASKCLISP | About your faith, Sister...
IF cgremQuest == 1 | REPLY | GETRELIC | Any help with finding a relic?
IF zenobiaEncounter == 2 | IF conversionQuestActive == 0 | REPLY | HELPWITHCGREMS | Could you help me with this Cybergremlins?
IF conversionQuestActive == 1 | REPLY | MOREABOUTCLISP | Let me ask you about Clispaeth.
IF conversionQuestActive == 1 | REPLY | MOREABOUTCGREM | Let me ask you about Cybergremlins.
IF irmingardDenied == 1 | REPLY | HEARQUESTAGAIN | What was that missionary job you were talking about?
REPLY | BBALLLOCATION | Where can I shoot some hoops around here?
REPLY | NARYYEMIND | Nary ye mind.

HELPWITHCGREMS
DIALOG | P_NAME | I tell ya what, sister. I just met some oddly respectable Cybergremlins out in the Wastelands.
DIALOG | P_NAME = s_port_hoopzSad | Respectable that is, until they boiled my skelly clean off my bod...
DIALOG | Sister Irmingard | Oh you must have met those piteous followers of Zenobia.
DIALOG | P_NAME | Yeah that's them! What's their beef?
DIALOG | Sister Irmingard | Their beef, youngster, is that they haven't found Klisp. They don't yet know the salvation that can be found at the end of His glorious path. One would think that if they found meaningful worship in one of His many holy relics.
DIALOG | P_NAME = s_port_hoopzHappy | Yeah! That's actually exactly what Zanobia was saying... she needs a relic of some kind.
DIALOG | Sister Irmingard | Well maybe you could find one for them?
QUEST | conversionQuest = 1
GOTO | QUESTOPTION

CANIASKCLISP
DIALOG | P_NAME | About Clispaeth, Sister...
DIALOG | Sister Irmingard | Yes, P_NAME_S?
GOTO | QUESTIONSCLISP

MOREABOUTCLISP
DIALOG | P_NAME | Sister Irmingard, I had a few questions about the tenets of Klispianity...
DIALOG | Sister Irmingard | Yes? Please ask, I'm glad to offer my advice.
GOTO | CGREMQUESTIONS

MOREABOUTCGREM
DIALOG | P_NAME | Sister Irmingard, I had a few questions about converting the Cybergremlins...
DIALOG | Sister Irmingard | Yes? Please ask, I'm glad to offer my advice.
GOTO | CGREMQUESTIONS

BBALLLOCATION
DIALOG | P_NAME | Hey lady, where can I shoot hoops around here?
DIALOG | Sister Irmingard | Shoot hoops?
DIALOG | P_NAME | Yeah, shoot some hoops, sling some rubber, jam the rock, alleyoop some gourds, take it to the hole, break the glass, swoosh some net, wamp the boards, chuck some boulders, dipsy doo the orange orb.
DIALOG | Sister Irmingard | Um, you mean... basketball?
DIALOG | P_NAME | Yeah!
" +
//TODO: add proper directions to the BBALL COURT
"
DIALOG | Sister Irmingard | Well, I don't really know much about that... but I believe there's a basketball court south of here in the junkyard if that's what you're looking for. Is there anything else?
GOTO | QUESTIONS01

NARYYEMIND
DIALOG | P_NAME | Nary ye mind... so long.
DIALOG | Sister Irmingard | Klisp be with you.
EXIT |

" +
//////////////////////////////////
//  IRMINGGARD STATE RESPONSES ///
//////////////////////////////////
"
IRMING07
DIALOG | Sister Irmingard | It's good to see you, P_NAME_S. Still out there bringing the wayward into the light of Clispaeth's love?
DIALOG | P_NAME | Uhh... yep. Yes, I'm definitely doing that.
DIALOG | Sister Irmingard | I'm so proud of you, P_NAME_F, and I'm sure Clispaeth is smiling down on you right now. He reserves a special place beside him for those that spread the faith.
DIALOG | P_NAME = s_port_hoopzHappy | Haha, yep... that's definitely true... well, I think I'll be heading out. Have a_ blessed..._ time.
EXIT |

IRMING06
DIALOG | Sister Irmingard | P_NAME, I've already heard the news - the Cybergremlins converted! You did it! You're amazing! To think that a fresh missionary could convert a tribe of Cybergremlins so quickly! You must be truly filled with the spirit of Clispaeth.
DIALOG | P_NAME = s_port_hoopzHappy | Heh, uh... I guess I feel something...
DIALOG | Sister Irmingard | Oh, I hope you told them about how loving and caring Clispaeth is. And I hear you even got them an 'mq'artifact of Clispaeth's'rt'! Which one was it?
DIALOG | P_NAME | It was, uh... a great one... yep, definitely a good Clispaeth_ thing...
DIALOG | Sister Irmingard | Well as Clispaeth promised, no good deed should go unrewarded. For your dedication to the faith, I'd like to give you this time-honored recipe.
USEAT | o_irmingard01
" +
//TODO: Give 'communion wafer recipe' to Hoopz
"
DIALOG | P_NAME = s_port_hoopzSurprise | Wow, I uh, REALLY don't feel like I deserve this.
DIALOG | Sister Irmingard | Such modesty. Your humility proves you're a true servant of Clispaeth. I'm sure you will go far in this world, noble jugend. Thank you for all you've done for the Klispin community! We here at the Industrial Park will never forget your heroic accomplishment!
" +
//TODO: advance time 1
"
QUEST | conversionQuest = 5
EXIT |

IRMING05
DIALOG | Sister Irmingard | Klisp walk with you, P_NAME_S. Is there something I can help you with?
GOTO | QUESTIONS01

IRMING04
DIALOG | Sister Irmingard | I'm surprised you've returned after our previous conversation. Perhaps you've come around to Clispaeth? I too struggled with faith in my youth. Is there something you'd like to talk about?
DIALOG | P_NAME | Well, maybe I have a couple...
QUEST | irmingardState = 1
GOTO | QUESTIONS01

IRMING03
DIALOG | Sister Irmingard | I feel sorry for the non-believers such as yourself that walk blindly in the darkness away from the big stadium lights of Clispaeths love... I'll pray for you.
EXIT |

IRMING02
DIALOG | Sister Irmingard | You're back! It makes me happy to know you're truly interested in Clispaeth! I'd be glad to talk about whatever you'd like.
GOTO | QUESTIONS01

IRMING01
DIALOG | Sister Irmingard | I know it's not impressive, but the Industrial Park Church of Clispaeth welcomes you. Holding mass out here in the junk and muck can be taxing on our followers, but I firmly believe that Clispaeth appreciates even our humble accommodations. It's not often that travellers visit our little shrine and it makes me truly happy. Are you also a follower of Clispaeth?
QUEST | irmingardState = 1
CHOICE | Am I a Klispin?
REPLY | BELEIVE | Yeah, I believe in Clispaeth.
REPLY | NOTSURE | I'm not really sure. I'm still looking.
REPLY | NOTAKLISPIN | Nope, not a Klispin.

BELEIVE
DIALOG | P_NAME | Yep, I'm a Klispin.
DIALOG | Sister Irmingard | In times like these, sometimes the best thing we can do is turn to prayer. If you're here to pray, please don't let me stop you.
DIALOG | P_NAME | No, you're not bothering me. I'm just sort of looking around right now.
DIALOG | Sister Irmingard | You know, it makes me very happy to see jugends in a house of Clispaeth. If you have any questions, whether it's about faith or anything else, I'd be glad to help you.
" +
//TODO: increase Clispaeth roundmound by 1
"
GOTO | QUESTIONS01

NOTSURE
DIALOG | P_NAME | To be honest, I'm not really sure if I believe in Clispaeth. I guess I'm looking for my own truth right now.
DIALOG | Sister Irmingard | I also struggled with my faith when I was younger. It can sometimes be hard to reconcile this cruel, hurtful world with a just and loving God. But there is a lot of good that perhaps can be best explained by Clispaeth as well. Whether or not Clispaeth is the conclusion you come to, I would be glad to answer any questions you might have and perhaps help you along the way.
DIALOG | P_NAME | Thanks. Actually, I do have some questions.
DIALOG | Sister Irmingard | Of course...
GOTO | QUESTIONS01

NOTAKLISPIN
DIALOG | P_NAME | Nope, I don't believe in Clispaeth.
DIALOG | Sister Irmingard | I understand. It can sometimes be hard to believe that a just and loving god could create such a cruel and hurtful world. Know that no matter what you believe, you're always welcome at our little church. I'm always willing to help in any way I can.
CHOICE | What to say?
REPLY | THANKYOU | Thanks, I appreciate you.
REPLY | DONTPATRONIZE | Don't patronize me, granny.

THANKYOU
DIALOG | P_NAME | Thank you, I appreciate it. I actually do have a few questions.
DIALOG | Sister Irmingard | Of course...
QUEST | irmingardState = 1
GOTO | QUESTIONS01

DONTPATRONIZE
DIALOG | P_NAME | Thanks for the bull puck, granny. But if Clispaeth is really all-powerful, could he make a rock so heavy he couldn't lift it? A-ha, got you there you old biddy.
DIALOG | Sister Irmingard | Please don't speak like that in a house of Clispaeth... there are worshippers present...
DIALOG | P_NAME = s_port_hoopzSmirk | Hey rubes! Open your eyes and Bing /'Flying Spaghetti Monster!/' Peace, suckers!
QUEST | irmingardState = 2
ClockTime | event | irmingardState | 3 | 120
" +
//TODO: reduce RoundMound Clispaeth value.
"
EXIT |
";

/* 

" +
//TODO: get this to check chups properly
"
REPLY | WANTCHUPS | Hey... you want any chups?

WANTCHUPS
DIALOG | P_NAME | Hey Sister Irmingard, why do you always seem so prim and uptight? Maybe you need to relax a little, let loose and kick back.
DIALOG | Sister Irmingard | To serve Clispaeth is to always be on guard. The shepherd must remain ever vigilant, lest something befall her flock.
DIALOG | P_NAME | That's what people who've never tried chups before always say. Hey, try this, it's the good stuff, mined in the Sombrero Galaxy and hydroponically enhanced in boogaloo sauce for 100 days.
DIALOG | Sister Irmingard | Ch-chups?! Th-that's un-Klispin! Oh Heavens! Those have no place in a house of Clispaeth. There are members of my congregation who find reprieve from the sin of chups in Clispaeth - I will NOT allow you to tempt them! I am informing Marshal Masego of this transgression! Please leave at once!
DIALOG | P_NAME | (Hmmm, maybe it wasn't a good idea to try to sell chups to a nun.)
" +
//TODO: increase these values properly
//scr_event_build_quest_state("irmingardChup", 1
//scr_event_build_quest_state_add("chupSuspicion", 1
//scr_event_build_quest_state("irmingardHandler", 5
//scr_event_build_execute_event_script(event_dz1_irmingard01
"
