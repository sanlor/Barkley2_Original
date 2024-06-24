/// TextSpecial()
if (argument[0] == "load") // Arg1 = font, Arg2 = width, Arg3 = text
{
    draw_set_font(argument[1]);
    var txtWid = argument[2];
    var txtRaw = argument[3];
    var str = txtRaw;
    // Color markers
    txtFnd[0] = "`mq`"; txtFndCol[0] = global.textcolorMainquest;   // Main Quest
    txtFnd[1] = "`sq`"; txtFndCol[1] = global.textcolorSidequest;   // Side Quest
    txtFnd[2] = "`rt`"; txtFndCol[2] = global.textcolorRegular;     // Regular text
    txtFnd[3] = "`w0`"; // Wave 0
    txtFnd[4] = "`w1`"; // Wave 1
    txtFnd[5] = "`w2`"; // Wave 2
    txtFnd[6] = "`s0`"; // Shake OFF
    txtFnd[7] = "`s1`"; // Shake ON
    txtFnd[8] = "`kw`"; txtFndCol[8] = global.textcolorKeyword;     // Keywords?
    // Al Bhed clones
    txtFnd[9] = "`sx`"; txtFndCol[9] = global.textcolorMainquest;   // Main Quest
    txtFnd[10] = "`cx`"; txtFndCol[10] = global.textcolorSidequest;   // Side Quest
    txtFnd[11] = "`nd`"; txtFndCol[11] = global.textcolorRegular;     // Regular text
    txtFnd[12] = "`f0`"; // Wave 0
    txtFnd[13] = "`f1`"; // Wave 1
    txtFnd[14] = "`f2`"; // Wave 2
    txtFnd[15] = "`c0`"; // Shake OFF
    txtFnd[16] = "`c1`"; // Shake ON
    txtFnd[17] = "`gf`"; txtFndCol[17] = global.textcolorKeyword;     // Keywords?
    txtFndAmt = 9 * 2; // * 2 because of al bhed
    // Get colors from shaky text
    var col = c_white;
    var shk = 0;
    var wav = 0;
    var ltr = ""; // Used in both loops
    var cut = 0;
    var drx = 0;
    var dry = 0;
    var ext = 0;
    var lin = 0;
    for (var i = 1; i <= string_length(str); i += 1)
    {
        ltr = string_char_at(str, i);
        if (ltr == "`")
        {
            cut = string_copy(str, i, 4); // show_debug_message(cut);
            for (f = 0; f < txtFndAmt; f += 1)
            {
                if (cut == txtFnd[f]) 
                {
                    if (cut == "`w0`" || cut == "`f0`") shk = 0;
                    else if (cut == "`w1`" || cut == "`f1`") shk = 1;
                    else if (cut == "`w2`" || cut == "`f2`") shk = 2;
                    else if (cut == "`s0`" || cut == "`c0`") wav = 0;
                    else if (cut == "`s1`" || cut == "`c1`") wav = 1;
                    else col = txtFndCol[f]; 
                    break; 
                }
                //if (pos != 0) { if (pos < son) { son = pos; sonInd = s; } }
            }
            str = string_delete(str, i, 4);
        }
        global.txtLtrCol[i - 1] = col;
        global.txtLtrShk[i - 1] = shk;
        global.txtLtrWav[i - 1] = wav;
        global.txtLtrWavCou[i - 1] = random(1);
        global.txtLtrWavInt[i - 1] = 20 + random(5);
        global.txtLtrWavY[i - 1] = -1 + irandom(2);
        if (ltr == "`") i -= 1;
    }
    // Full string
    // show_debug_message("FULL = " + str);
    // Get text characters
    global.txtLinLen[0] = 0;
    for (var i = 1; i <= string_length(str); i += 1)
    {
        ltr = string_char_at(str, i);
        global.txtLtrDly[i - 1] = 1;
        global.txtLtr[i - 1] = ltr;
        global.txtLtrX[i - 1] = drx;
        global.txtLtrY[i - 1] = dry;
        global.txtLtrLin[i - 1] = lin;
        drx += string_width(ltr);
        
        // Check to see if next word is over limit
        ext = 0;
        if (ltr == DIALOGUE_DELAY)
        {
            drx -= string_width(ltr);
            global.txtLtr[i - 1] = "";
            global.txtLtrDly[i - 1] = 0.05;
        }
        if (ltr == "." || ltr == "?" || ltr == "!")
        {
            global.txtLtrDly[i - 1] = 0.05;
        }
        if (ltr == ",") global.txtLtrDly[i - 1] = 0.1;
        
        if (ltr == " ")
        {
            for (var u = 1; u + i < string_length(str); u += 1)
            {
                if (string_char_at(str, i + u) == " ") break;
                ltr = string_char_at(str, i + u);
                if (ltr == DIALOGUE_DELAY) ltr = ""; // LETTER REASSIGNED
                ext += string_width(ltr);
            }
        }
        global.txtLinLen[lin] += 1;
        if (ltr == "#" || drx + ext > txtWid)
        {
            drx = 0;
            dry += string_height("g");
            lin += 1;
            global.txtLinLen[lin] = 0;
        }
        //else 
    }
    global.txtLtrAmt = i;
    global.txtNor = str;
    global.txtLin = lin; //dry / string_height("g");
}
else if (argument[0] == "strip")
{
    var str = argument[1];
    for (var i = 1; i <= string_length(str); i += 1)
    {
        ltr = string_char_at(str, i);
        if (ltr == "`") 
        {
            str = string_delete(str, i, 4);
            i -= 1;
        }
    }
    return str;
}
else if (argument[0] == "delay")
{
    if (argument[1] < 0) return 1;
    if (floor(argument[1]) >= global.txtLtrAmt) return 1;
    return global.txtLtrDly[floor(argument[1])];
}
else if (argument[0] == "line length") // Returns line length of unformatted text
{
    return global.txtLinLen[argument[1]];
}
else if (argument[0] == "line start") // Returns line start
{
    var lin = 0;
    for (var i = 0; i < argument[1]; i += 1) 
    {
        if (i < global.txtLin) lin += global.txtLinLen[i];
        else return TextSpecial("normal length");
    }
    return lin;
}
else if (argument[0] == "normal") // Returns loaded text without any formatting
{
    return global.txtNor;
}
else if (argument[0] == "normal length") // Returns length of unformatted text
{
    return string_length(global.txtNor);
}
else if (argument[0] == "lines")
{
    return global.txtLin;
}
else if (argument[0] == "draw") // Arg1 = x, Arg2 = y, Arg3 = linestart, Arg4 = lineend, Arg5 = pos
{
    var txtLtrDrw = global.txtLtrAmt - 1;
    var txtLtrSta = 0;
    if (argument_count > 3) 
    { 
        txtLtrSta = TextSpecial("line start", argument[3]); 
        argument[2] -= global.txtLtrY[txtLtrSta]; 
    }
    if (argument_count > 5) txtLtrDrw = argument[5];
    //if (argument_count > 3) { txtLtrSta = argument[4]; argument[2] -= global.txtLtrY[txtLtrSta]; }
    txtLtrDrw = clamp(txtLtrDrw, 0, global.txtLtrAmt - 1);
    for (var i = txtLtrSta; i < txtLtrDrw; i += 1)
    {
        draw_set_color(global.txtLtrCol[i]);
        var drx = argument[1] + global.txtLtrX[i];
        var dry = argument[2] + global.txtLtrY[i];
        if (global.txtLtrShk[i] != 0)
        {
            dry += lengthdir_y(1, ((((current_time / 2) * global.txtLtrShk[i]) mod 360) + (i * 30)));
        }
        if (global.txtLtrWav[i] != 0)
        {
            global.txtLtrWavCou[i] += dt_sec() * global.txtLtrWavInt[i];
            if (global.txtLtrWavCou[i] >= 1)
            {
                global.txtLtrWavCou[i] = 0;
                if (abs(global.txtLtrWavY[i]) == 1) global.txtLtrWavY[i] = 0;
                else global.txtLtrWavY[i] = -1 + irandom(2);
            }
            dry += global.txtLtrWavY[i];
        }
        draw_text(drx, round(dry), global.txtLtr[i]);
    }
}
