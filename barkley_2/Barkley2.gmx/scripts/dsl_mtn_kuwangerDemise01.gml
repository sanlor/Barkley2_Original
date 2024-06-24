// The Demise of Doppel Kuwanger //
/*
DIALOG | Doppel Kuwanger | `w1`Guh...`w0` Well done, soldier..._ You make an old warrior proud..._ `w1`Ugh..._`w0` But alas, we are both tainted by the disgrace of battle.
DIALOG | P_NAME          | ...?    
DIALOG | Doppel Kuwanger | On the `kw`battlefield`rt` there are no winners or losers, only survivors and the soldiers that are left behind. 
DIALOG | Doppel Kuwanger | On the battlefield, you either win... or you lose. 
DIALOG | Doppel Kuwanger | In the end, no one can survive the battlefield, but it is a place where all soldiers have a purpose._ The societies of the world may shun us for who we are and what we do, but the battlefield leaves no one behind.
DIALOG | P_NAME          | The battlefield...
DIALOG | Doppel Kuwanger | Yes... The battlefield. My long `kw`life of battle`rt` is finally coming to it's end. This battle... was my last. The winner will inherit the battlefield... and the loser will be left behind. Heed my words, soldier: The battlefield belongs to no man, and no man will be left behind.
WAIT   | 1
DIALOG | Doppel Kuwanger | Heh..._ We are not so different, you and I..._ Both of us share nothing in common.
DIALOG | P_NAME          | Who are you? Why did you do this? Why did you fight me?
DIALOG | Doppel Kuwanger | ... I was born in a small village in the old part of the world. Not long after my birth my parents were killed, and they abandoned me. The local tribesmen found me and carried me to their village. Following their culture and traditions, they took me in as one of their own. But... Their tradition did not take kindly to female specimen from other cultures. They were deemed unpure._ I was deemed unpure._ So my newfound parents `kw`raised me as a boy,`rt` hiding away my true identity.
DIALOG | P_NAME = s_port_hoopzSurprise | ...!
DIALOG | Doppel Kuwanger | Life was good, for a time._ But as we grow older, we all change, and I'm no different. Soon enough I realized I was not like the other boys in my village. I was different, but no one would tell me what was going on. On the eve of my 24th birthday I left the village to find answers. To find who I really was. I stayed in the village and questioned my parents and they told me everything. I wasn't a boy... and they weren't my parents.
WAIT   | 1
DIALOG | P_NAME = s_port_hoopzSurprise | W-what happened after that?
WAIT   | 1
DIALOG | Doppel Kuwanger | I drifted around the world, trying to find my place in the world. But everywhere I went in the world I was an outsider. When I went around the world, I finally found my place in the world... `sq`Quantum Atwoody.`rt`
KNOW   | knowQuantum | 1
IF knowQuantum >= 2 | DIALOG | P_NAME = s_port_hoopzShock | `w1`*Gasp*`w0`_ Quantum Atwoody...!
IF knowQuantum == 1 | DIALOG | P_NAME | Quantum Atwoody?
DIALOG | Doppel Kuwanger | Yes... The elite battlers guild under Cuchulainn's direct command. My true home and family. There are many members in Quantum Atwoody. Others like me... 
DIALOG | Doppel Kuwanger | `sq`Brast Candiw00t,`rt` with his powerful spindash abilities.
DIALOG | Doppel Kuwanger | `sq`Running Mantis,`rt` the beautiful and deadly long distance runner.
DIALOG | Doppel Kuwanger | `sq`Beef the Koala,`rt` master of juice.
DIALOG | Doppel Kuwanger | `sq`Jones the Leper,`rt` giant and a leper.
DIALOG | Doppel Kuwanger | And `sq`Doppel Kuwanger,`rt` specialist in interrogation and a formidable wilgifighter.
DIALOG | Doppel Kuwanger | And finally, in charge of them... Quantum-Atwoody's squad leader, `mq`Cuchulainn.`rt`
DIALOG | P_NAME = s_port_hoopzSurprise | (C-Cuchulainn?!)
WAIT   | 1
DIALOG | Doppel Kuwanger | `w1`*Cough*`w0` When gamers unite under a single console, they become stronger than the sum of their parts. Heh..._ Just an old indian saying._ I always thought it was a load of horse patoot but now I can see that I was wrong...
DIALOG | P_NAME = s_port_hoopzSurprise | What...?
WAIT   | 1
DIALOG | Doppel Kuwanger | `w1`*Cough*`w0` Ugh, my time is almost up... Listen carefully to what I'm about to say.
WAIT   | 1
DIALOG | Doppel Kuwanger | I've apologized for my white privilege, and so should you.
DIALOG | P_NAME = s_port_hoopzSad | M-my white privilege? B-but...!
DIALOG | Doppel Kuwanger | You are a soldier! Be honest to yourself! Be true to yourself! We all sin, back at home and on the battlefield! Say it, P_NAME! Say that you are sorry for your white privilege! Apologize!
DIALOG | P_NAME = s_port_hoopzSad | I...
WAIT   | 1
DIALOG | P_NAME = s_port_hoopzSad | I'm sorry for my white privilege!!!
WAIT   | 1
DIALOG | Doppel Kuwanger | `w1`*Cough*`w0` T-that was good... I could feel the honesty in your voice.
DIALOG | Doppel Kuwanger | It..._ It is time for me to go..._ Please..._ after I'm gone, take my wilgi and..._ throw it into the sunset. It will..._ carry my spirit..._ to the fatherland.
DIALOG | P_NAME = s_port_hoopzSad | ... O-okay... I will...
DIALOG | Doppel Kuwanger | Thank you... You are a... true... hero...
WAIT   | 1
DIALOG | Doppel Kuwanger | ... I... I can finally return home... 
WAIT   | 1
DIALOG | Doppel Kuwanger | Will they... accept me this time...?
DIALOG | Doppel Kuwanger | ... 
// TODO HOOPZ PICKS UP THE WILGI //
DIALOG | P_NAME = s_port_hoopzSad | ... Auf Wiedersehen, Mitspieler...
// Throws it... Beetleborg follows
FADE   | 1 | 3
WAIT   | 3
