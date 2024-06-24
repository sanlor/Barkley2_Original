script = "
IF jeanmarcStateMines == 0 | GOTO | MINES0
IF jeanmarcStateMines == 1 | GOTO | MINES1
IF jeanmarcStateMines == 2 | GOTO | MINES2
IF jeanmarcStateMines == 3 | GOTO | DILEMMA

MINES0
DIALOG | Jean-Marc Pierre | *Yawn* Another lousy dwarf, huh? Alright, you fuck. Let's see your slave license.
DIALOG | P_NAME | Sorry, but I don't have one. I've got this ID card though...
DIALOG | Jean-Marc Pierre | What? What are you talking about you lousy piece of shit? Some shit dwarf like you ain't got no ID card.
DIALOG |P_NAME | Here, take a look for yourself.
    // ACTION POSE //
DIALOG | Jean-Marc Pierre | Klauust Mitsugiri? 
DIALOG |P_NAME | Yeah, uh, that's me. I'm Klauust Mitsugiri.
DIALOG | Jean-Marc Pierre | Clispdamnit! Who the fuck came up with these stupid rules? All I wanted was to beat the shit out of you... Go on, take your lousy ID card and get out of my sight.
DIALOG |P_NAME | (I can't believe that worked...)
QUEST | jeanmarcStateMines = 1 
QUEST | knowJeanmarc = 1 

MINES1
DIALOG | Jean-Marc Pierre | You again? What the hell do yo uwant?
DIALOG | P_NAME | Hey, take it easy. I was just wondering what are you guys doing down here in the mines.
DIALOG | Jean-Marc Pierre | What? What kind of a question is that? You some sorta dwarf spy or something? I ain't telling you anything. 
DIALOG | P_NAME | I'm not a spy. Honest! I'm just, uh, curious. That's all. 
DIALOG | Jean-Marc Pierre | Alright, I've had it up to my tumor with this circus. I don't know who's fudged up but you definetly shouldn't be allowed to be down here. But I can't mangle you because of the rules. This is so fucking frustrating! I need a break...
    // JEANMARC turns to face constantine (face right)
DIALOG | Jean-Marc Pierre | Constantine!
DIALOG | Constantine | What's up?
DIALOG | Jean-Marc Pierre | Cover for me for a bit, I need to take a small break.
DIALOG | Constantine | ...
DIALOG | Jean-Marc Pierre | Well? You gonna help me out or not?
DIALOG | Constantine | Heh, you're gonna owe me big time.
DIALOG | Jean-Marc Pierre | Whatever.
    // JEANMARC leaves to the tunnel  scr_event_build_move_to_point(o_jeanmarc01, 240, 320);
QUEST | jeanmarcStateMines = 2
    // JEANMARC DESTROYED scr_event_build_destroy_object(o_jeanmarc01);

MINES2
DIALOG | P_NAME | Huh? It's that rude Duergar, and it looks like he is sound asleep...
    WAIT 0.5
    // HOOPZ FACE WEST
    WAIT 0.5 
DIALOG | P_NAME | Hmm...
    WAIT 0.5
    // CAMERA 320 320 NORMAL SPEED
    WAIT FOR ACTIONS
    WAIT 1.5
    // CAMERA HOOPZ AND JEANMARC
    WAIT FOR ACTIONS 
    WAIT 0.5
DIALOG | P_NAME | I can't believe I'm saying this, but this is a prime opportunity to help the dwarfs by shoving one of their tormentors down into that pit.
GOTO | DILEMMA

DILEMMA
CHOICE | Push the cart into the pit?
REPLY | DOIT | I have to do it...
REPLY | DONT | No... I can't!

DOIT
DIALOG | P_NAME | You brought this on yourselves... It's time to pay the piper.
    scr_event_build_move_to_point(o_cts_hoopz, o_jeanmarc01.x + 24, o_jeanmarc01.y)
    scr_event_build_wait_for_actions();
    scr_event_build_look(o_cts_hoopz, WEST);
    scr_event_build_wait(0.25);
DIALOG | P_NAME | Adios.
    scr_event_build_wait(0.4);
    // TODO Hoopz action sprite pushes the cart // 528 328 
    scr_event_build_visible(o_jeanmarc01, false);
    scr_event_build_create_object(o_cts_jeanmarc_demise01, o_jeanmarc01.x, o_jeanmarc01.y);
    scr_event_build_camera_move_to_point(344, 300, MOVE_NORMAL);
    scr_event_build_wait_for_actions();
    scr_event_build_wait(2.5);
    scr_event_build_camera_frame(MOVE_NORMAL, o_cts_hoopz, o_jeanmarc01);
    scr_event_build_wait_for_actions();
DIALOG | P_NAME | ...
    scr_event_build_destroy_object(o_jeanmarc01);                

DONT
DIALOG | P_NAME | No, this isn't right. I know they are evil, everything I've seen and heard and felt has proved that much. But... I'm no executioner.                
QUEST | stateJeanmarcMines = 3
";
