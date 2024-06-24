///Fade In Toggle for Hoosegow
external = 1;
script = "
FADE     | 0 | 1.5
WAIT     | 1.5
QUEST | prisonFadeToggle = 0
IF prisonQuest == 6 | GOTO | CLOCK06
IF prisonQuest == 4 | GOTO | CLOCK04
IF prisonQuest == 2 | GOTO | CLOCK02

CLOCK06
WAIT   | 0.5
SOUND  | sn_debug_one
Emote  | ! | o_cts_hoopz | 0 | 0
WAIT   | 0.5
PLAYSET| o_cts_hoopz | stomach_start | stomach_end
WAIT   | 0
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | This is it... there's no turning back. My F.A.T.E. is about to be written on the bathroom walls...
WAIT   | 0.25
SOUND  | sn_debug_one
WAIT   | 1.0
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | I'll do whatever it takes, darn the public eye! `sq`I gotta talk to D'archimedes!`rt`
SET    | o_cts_hoopz | stand_DOWN
QUEST  | prisonQuest = 7

CLOCK04
WAIT   | 0.5
SOUND  | sn_debug_one
Emote  | ! | o_cts_hoopz | 0 | 0
WAIT   | 0.5
PLAYSET| o_cts_hoopz | stomach_start | stomach_end
WAIT   | 0
DIALOG | P_NAME = s_port_hoopzPrisonAngry | Ugh... ughhh...
WAIT   | 0.25
SOUND  | sn_debug_one
WAIT   | 1.0
DIALOG | P_NAME = s_port_hoopzPrisonSurprise | I don't know how much longer I can deal with this... `w1`distress!`w0`
SET    | o_cts_hoopz | stand_DOWN
WAIT   | 0.5
ClockTime | event | prisonQuest | 5 | 5

CLOCK02
ClockTime | event | prisonQuest | 3 | 5
";
