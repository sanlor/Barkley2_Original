// event_chu_crustEntrance01
/*
event_chu_crustEntrance01 - NOTES
Start, upon entering CuchuCrustacea's Room
*/
script = 
//TODO: The screen fades in as the player auto-walks up towards the screen on the top/corner of the map, similar to the Cyberdwarf cutscene.
//TODO: Cuchulainn needs a good soliloquy here. Something like Magus from Chrono Trigger maybe?
"
IF cuchuCrustTry == 4 | GOTO | CUCHUTRY05
IF cuchuCrustTry == 3 | GOTO | CUCHUTRY04
IF cuchuCrustTry == 2 | GOTO | CUCHUTRY03
IF cuchuCrustTry == 1 | GOTO | CUCHUTRY02
DIALOG | Cuchulainn = s_port_cuchuAI | Bwahahaha what have we here? Someone dares to enter my domain?
" +
//TODO: Crackles of electricity, weird screen effects, etc. occur on the screen.
//TODO: Forboding music plays.
//TODO: Eventually the greater effects stop: we have Cuchulainn's face, or some kind of static or looping screen effect going.
// Normal Cuchulainn taunt
// XXXplosions
// A flash of light, whatever
// Scanline-version appears just in front of the screen
"
IF csComplete == 1 | GOTO | CSCONFRONT
IF wiglafMission == 3 | GOTO | WIGLAFCONFRONT
GOTO | X1CONFRONT

CSCONFRONT
DIALOG | P_NAME | Cuchulainn! I come to stop you, once and for all!
DIALOG | Cuchulainn | Say's who?
IF rmVengeanceDecide == 1 | DIALOG | P_NAME | Says everydwarf you've ever wronged. Says every life you've snuffed out in pursuit of your sick agenda. Says your reckoning Cuchulainn!
IF rmBballDecide == 1 | DIALOG | P_NAME | Says the greatest bballer in the Universe. I'm here to make the cosmos safe again for the sport... and to dunk all over your sick agenda!
IF rmCandyDecide == 1 | DIALOG | P_NAME | Says a kids. A kid here to make the Universe safe again for not just dwarf youths, but youngsters everywhere whose parents just don't understand. We're kids... and the future is ours!
IF rmBrastDecide == 1 | DIALOG | P_NAME | Says a down and ditry gun'sbraster with an hair trigger and an itchy finger. I'm here to let bullet's fly and AIs fry!
IF rmVidconDecide == 1 | DIALOG | P_NAME | Says a rough and tumble gamer with a luck to lose. I've conquered my vidcons but now it's time to level up. And you're the FINAL BOSS, sucka!
IF rmClispaethDecide == 1 | DIALOG | P_NAME | Says Clispaeth. For I am His servant and His long arm. Our Lord demands your reign of heresy to end, and I am his disciple that will channel his Wrath!
DIALOG | Cuchulainn = s_port_cuchuAI | Kheehehehehe! You fool...
GOTO | ENDTHISVOYAGE

WIGLAFCONFRONT
DIALOG | P_NAME | Cuchulainn! I'm on orders to take you out! You're keeping me from the Cyberdwarf... and from finding out who I truly am...
DIALOG | Cuchulainn = s_port_cuchuAI | Take me out? Kwehehehe! I rule over the Necron 7, pipsqueak. How could you possibly think you could do such a thing?
GOTO | GOTTATRY

X1CONFRONT
DIALOG | P_NAME | Hey you! Where's the Cyberdwarf? I have to find the Cyberdwarf!
DIALOG | Cuchulainn = s_port_cuchuAI | Cyberdwarf?... Cyberdwarf? There's no Cyberdwarf here. This was the gravest mistake you've ever made, child. Kwehehehe!! 
GOTO | GOTTATRY

GOTTA
DIALOG | P_NAME | I may not know why I need to kill you, Cuchulainn, nor why I am on this ship in the first place... but I have to follow my heart, and my heart says I need to find The Cyberdwarf.
DIALOG | P_NAME | And you stand in my way!
QUEST | cuchuCrustSpar == 1
" +
//TODO: BEGIN BATTLE!
"

ENDTHISVOYAGE
WAIT | 
DIALOG | P_NAME | Cuchulainn, your fun is over! Prepare yourself!
" +
//TODO: SCREENSHAKE
//TODO: Animate the "Nexus Crystal" and have it start to spin.
" 
DIALOG | Cuchulainn = s_port_cuchuAI | What it this? The Nexus Crystal! It's powering up! What is causing this anomaly?!
" +
//TODO: Hoopz Levitates (facing down) (same as roundmound)
"
DIALOG | Cuchulainn = s_port_cuchuAI | It's you!_ The crystal is responding to high levels of slamicite in your body... could it be?!
WAIT | 1.0
DIALOG | Cuchulainn = s_port_cuchuAI | Could you be_ the one those L.O.N.G.I.N.U.S. turds took from my power array? It was you all along?!
DIALOG | P_NAME = s_port_hoopzShock | I-_ I'm not doing this! I don't know what's going on!
" +
//TODO: SOUND | helluvalot of effects!
//TODO: SOUND | power ramp up indicating Nexus Crystal charge
"
DIALOG | Cuchulainn = s_port_cuchuAI | The cystal is channeling your bball energies! I here I though it would only work with icesports on the Necron 7! Bball continues to amaze me!
" +
//TODO: Hoopz floats toward the cystal, seemingly paralyzed
//TODO: Suddenly something happens and a power surge explodes the Cystal!
//TODO: SOUND | cystal explosion
//TODO: PLAYSET | crystal explosion
//TODO: PLAYSET | hoopz fall to ground
"
DIALOG | P_NAME | Ugh... the Crystal... is destroyed...
" +
//TODO: Hoopz getting up
"
WAIT |
DIALOG | P_NAME | There's not much you can do now without your precious crystal is there Cuchulainn?
DIALOG | Cuchulainn = s_port_cuchuAI | Bwahahahaha! You really think that stopped me? The Nexus Crystal was merely a conduit for your energies, and it served its purpose well! Your power levels have charged this ship to maximum output and sent us hurtling towards my original destination, HELL! The best thing you could have done was prolong your worthless life and never set foot on this floor of the ship! Teeheehee! Now the chosen time has come... to take this wretched ship, heavily laden with these despicable dwarfs... and exchange it for the void!
DIALOG | Cuchulainn = s_port_cuchuAI | Kohohoho... full speed ahead! To S_H_E_O_L!
" +
//TODO: SOUND | power at maximum
//TODO: Screen shake!
//TODO: Some weird ripple goes up and down the screen, maybe slightly transparent Dolge effects pass over the screens.
//WARNING: NOW ENTERING SHEOL, NOW ENTERING SHEOL
//TODO: It possibly even says WARNING: NOW ENTERING SHEOL on the screens?
"
DIALOG | Cuchulainn = s_port_cuchuAI | The Necron 7 has entered Sheol! The intermediary zone that separates the universe from your future home, Hell's Inferno! Here, in the terminal resting place of souls, the laws that dictate your reality are bent and broken. In Sheol, what was fiction becomes truth! What was once incorporeal becomes corporeal! What was once AI becomes C_R_U_S_T_A_C_E_A_N!
" +
//TODO: The lobster form disappears in scanlines down the screen and reappears in front of the player. It's now the boss CuchuCrustacea enemy object.
"
GOTO | CUCHUTRY01

CUCHUTRY01
DIALOG | Cuchulainn = s_port_cuchuAI | Ever tangle with a Malevolent AI, here, in the /'End Zone/' of the Universe? Prepare to face your final judgment!
QUEST | cuchuCrustTry += 1
" +
//TODO: BATTLE BEGINS!
"
CUCHUTRY02
DIALOG | Cuchulainn = s_port_cuchuAI | How pathetic... back for more?
QUEST | cuchuCrustTry += 1
" +
//TODO: BATTLE BEGINS!
"

CUCHUTRY03
DIALOG | Cuchulainn = s_port_cuchuAI | You just don't quit... give up!
DIALOG | P_NAME | I'll never give up, Cuchulainn! Take this!
QUEST | cuchuCrustTry += 1
" +
//TODO: BATTLE BEGINS!
"

CUCHUTRY04
DIALOG | Cuchulainn = s_port_cuchuAI | What are you?!
DIALOG | P_NAME | I'm not stopping until you're dead...
QUEST | cuchuCrustTry += 1
" +
//TODO: BATTLE BEGINS!
"

CUCHUTRY05
DIALOG | Cuchulainn = s_port_cuchuAI | You just don't quit... give up!
QUEST | cuchuCrustTry += 1
"
//TODO: BATTLE BEGINS!
