///Joad's Intoduction
external = 1; // Tells the cinema object not to do the linebreaks
script = "
IF joadState == 0 | GOTO | JOAD_GOOF

JOAD_GOOF
WAIT    | 1
SURPRISEAT | o_joad01
Emote   | build | exclamation | o_cts_hoopz | 0 | 0
WAIT    | 0.75
FRAME   | CAMERA_FAST | o_joad01
WAIT    |
PLAYSET | o_joad01 | cough | headup
SOUND   | sn_debug_two
WAIT    | 0
PLAYSET | o_joad01 | cough | headup
SOUND   | sn_debug_two
WAIT    | 0
WAIT    | 0.1
SET     | o_joad01 | default
DIALOG  | Dying Dwarf | Nnnh.. h-... help me... please, youngster.
PLAYSET | o_joad01 | cough | headup
WAIT    |
MOVETO  | o_cts_hoopz | o_cinema0 | MOVE_FAST
SET     | o_joad01 | default
WAIT    |
KNEELAT | o_joad01
DIALOG  | P_NAME = s_port_hoopzSurprise | Whoa, mister! Are you all right?
DIALOG  | Dying Dwarf | Nnnh... not quite youngster... I think this dwarf's days...
PLAYSET | o_joad01 | cough | headup
SOUND   | sn_debug_two
WAIT    |
SET     | o_joad01 | default
DIALOG  | Dying Dwarf | ... are numbered...
GOTO    | JOADSTART
" + o_joad01.script;
//Now go to Joad's Note Game
//
