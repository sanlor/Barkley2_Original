///Scripts for the TNN Posters
//Stop the animation
image_speed = 0;
if (argument[0] == "dankness") {
script = "
DIALOG | Poster | The Sewers are closed due to dankness. Turn around or be punished at the discretion of the nearest Duergar.
EXIT |
";
}

//Bullying in the Blockhouse
if (argument[0] == "bullying") {
image_index = 3;
script = "
IF body == governor | GOTO | GOVERNOR
GOTO | POSTER

GOVERNOR
DIALOG | Governor Elagabalus | (No time for Public Announcements. I have a job to do!)
EXIT |

POSTER
DIALOG | P_NAME | Hmm, an old looking poster...
DIALOG | Poster | Announcement to all dwarfs and duergars: Bullying is NOT cool. Don't give in to peer pressure, stand up for yourself and for others. You have the power in your hands. Only YOU can stop the vicious cycle. Take these words of wisdom to your heart:
DIALOG | Poster | Don't take me down with a punch, take me out to lunch. Stop the slander, increase the candor.
DIALOG | Poster | So remember, the next time you want to give someone a swirlie, give it to yourself.
DIALOG | P_NAME | Whoa... These words are so powerful. I think I should give myself a swirlie to even the odds.
KNOW | knowBullying | 2
EXIT |
";
}

//Chocomallow Notice
if (argument[0] == "chocomallow") {
image_index = 2;
script = "
DIALOG | Poster | Cuchulainn reminds you idiots that Price Fixing of Choco-Mallows is a serious crime. If any dwarf has information regarding the supply manipulation of contraband Choco-Mallows, they are required to report the activity to the nearest Duergar.
EXIT |
"
}

//GovSpeech is Mandatory
if (argument[0] == "govspeech") {
image_index = 1;
script = "
DIALOG | Poster | The incumbent Governor's Speech is Mandatory.
EXIT |
"
}

//GovSpeech is Mandatory
if (argument[0] == "escape") {
image_index = 1;
script = "
DIALOG | Poster | Don't even think about trying to escape.
EXIT |
"
}

// Industrial Park, Figbottom //
if (argument[0] == "figbottom") {
image_index = 2;
script = "
DIALOG | HELP WANTED | A local resident who goes by the name Figbottom has gone missing. Any and all clues, tips and tricks about his current whereabouts are to be reported to Marshal Masego. Talk to his friend Suresh for more information.
IF figbottomQuest == 0 | QUEST | figbottomQuest = 3
EXIT |
"
}

// Industrial Park, Community Rules //
if (argument[0] == "industrialRules") {
image_index =4;
script = "
DIALOG | COMMUNITY RULES | Attention! Killing, stealing, begging, playing music and selling chups are VERBOTEN. Any violations of these rules are to be reported to Marshal Masego immediately.
QUEST  | industrialRules = 1
";
}

// Industrial Park, Clispmas Ham Thieves //
if (argument[0] == "clispmasHam") {
image_index =3;
script = "
DIALOG | ATTENTION | Hear ye, hear ye! The pantry has been broken into and all of the `kw`Clispmas Hams`rt` have been stolen! If you have any information about their mysterious disappearance, please talk to either Sepideh or Masego.
";
}

// Triskelion
if (argument[0] == "gallows")
{
script = "
DIALOG | POSTER | Gallows under repairs due to overuse.
DIALOG | P_NAME = s_port_hoopzSmirk | Heh. Typical.
";
}

// Set the image //
scr_entity_animation_setFrame(ANIMATION_DEFAULT, image_index);
