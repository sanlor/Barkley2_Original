/// TextSpecial()
if (argument[0] == "load") // Arg1 = font, Arg2 = width, Arg3 = text
{
    draw_set_font(argument[1]);
    var txtWid = argument[2];
    var txtRaw = argument[3];
    var str = txtRaw;
    // Color markers
    txtFnd[0] = "`mq`"; txtFndCol[0] = c_red;
    txtFnd[1] = "`sq`"; txtFndCol[1] = c_lime;
    txtFnd[2] = "`rt`"; txtFndCol[2] = c_white;
    txtFnd[3] = "`w0`";
    txtFnd[4] = "`w1`";
    txtFnd[5] = "`w2`";
    txtFnd[6] = "`s0`";
    txtFnd[7] = "`s1`";
    txtFndAmt = 8;
    // Get colors from shaky text
    var col = c_white;
    var shk = 0;
    var wav = 0;
    var ltr = ""; // Used in both loops
    var cut = 0;
    var drx = 0;
    var dry = 0;
    var ext = 0;
    for (var i = 1; i < string_length(str); i += 1)
    {
        ltr = string_char_at(str, i);
        if (ltr == "`")
        {
            cut = string_copy(str, i, 4); // show_debug_message(cut);
            for (f = 0; f < txtFndAmt; f += 1)
            {
                if (cut == txtFnd[f]) 
                {
                    if (cut == "`w0`") shk = 0;
                    else if (cut == "`w1`") shk = 1;
                    else if (cut == "`w2`") shk = 2;
                    else if (cut == "`s0`") wav = 0;
                    else if (cut == "`s1`") wav = 1;
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
    for (var i = 1; i <= string_length(str); i += 1)
    {
        ltr = string_char_at(str, i);
        global.txtLtr[i - 1] = ltr;
        global.txtLtrX[i - 1] = drx;
        global.txtLtrY[i - 1] = dry;
        drx += string_width(ltr);
        
        // Check to see if next word is over limit
        ext = 0;
        if (ltr == " ")
        {
            for (var u = 1; u + i < string_length(str); u += 1)
            {
                if (string_char_at(str, i + u) == " ") break;
                ext += string_width(string_char_at(str, i + u));
            }
        }
        if (drx + ext > txtWid)
        {
            drx = 0;
            dry += string_height("g");
        }
    }
    global.txtLtrAmt = i;
    global.txtNor = str;
}
else if (argument[0] == "normal") // Returns loaded text without any formatting
{
    return global.txtNor;
}
else if (argument[0] == "draw") // Arg1 = x, Arg2 = y, Arg3? = how many characters to draw
{
    var txtLtrDrw = global.txtLtrAmt - 1;
    if (argument_count > 3) txtLtrDrw = argument[3];
    txtLtrDrw = clamp(txtLtrDrw, 0, global.txtLtrAmt - 1);
    for (var i = 0; i < txtLtrDrw; i += 1)
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
