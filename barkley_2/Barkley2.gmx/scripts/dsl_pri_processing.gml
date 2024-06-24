/// dsl_pri_processing()
/// Prison processing
script = "GOTO | MAIN

MAIN
QUEST  | prisonDoors = 1
Misc   | set | o_cts_hoopz | o_teleport_mark
LOOK   | o_cts_hoopz | NORTH
FRAME  | CAMERA_FAST | o_cts_hoopz | o_perry01
WAIT   | 1
DIALOG | Perry  | Well well well, what do we got here...
DIALOG | Oolon  | This youngster was caught robbing the Tir Na Nog bank with some other ne'er-do-well by the name of Gutterhound.
DIALOG | Perry  | Despicable. Let's see now... 1 count of intent to steal from Cuchu, 8 counts of Duergar bodily harm, 2 counts of conspiracy against the state, and 4 counts of being a dwarf.
DIALOG | Perry  | That amounts to... 1,293 years in hoosegow with no chance of parole. Get fucked pal.
DIALOG | P_NAME | Wha!!! But... But... 
WAIT   | 0.25
LOOK   | o_cts_hoopz | WEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTHWEST
WAIT   | 0.25
LOOK   | o_cts_hoopz | SOUTH
WAIT   | 0.25
PLAYSET | o_cts_hoopz | sad0 | sad1
WAIT   | 0
DIALOG | P_NAME | C-cyberdwarf... I'm sorry...
PLAYSET | o_cts_hoopz | sad2 | sad3
WAIT   | 0
DIALOG | Oolon  | Hyuck hyuck hyuck!
FADE   | 1 | 2
WAIT   | 2
Teleport | r_pri_prisonInside01 | 496 | 624 | 2
";
