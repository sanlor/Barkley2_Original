/// DialogSprites(frame, corner, return, edge, BG)
// Calling with no arguments sets back to default
if (argument_count == 0)
{
    global.dialogFrame = s_diag_frame;
    global.dialogCorner = s_diag_corner;
    global.dialogReturn = s_return;
    global.dialogEdge = s_diag_edge;
    global.dialogBG = s_diag_bg;
}
else
{
    global.dialogFrame = argument[0];
    global.dialogCorner = argument[1];
    global.dialogReturn = argument[2];
    global.dialogEdge = argument[3];
    global.dialogBG = argument[4];
}
