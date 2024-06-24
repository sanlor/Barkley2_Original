/// DrawGunName(x, y, prefix1OrEmptyString, Prefix2OrEmptyString, Material, Type, suffix, halignOrNull, [1_if_unidentified])
//Draws gun name using fancy technique (for quickmenu2)
//Arg0 = X (note: draws from very top left)
//Arg1 = Y (note: draws from very top left)
//Arg2 = Prefix1 (blank if none)
//Arg3 = Prefix2 (blank if none)
//Arg4 = Material
//Arg5 = Type
//Arg6 = Suffix (blank if none)
//Arg7 = halign
//Arg8 = (Optional) 0 = Identified / 1 = Unidentified (default value is identified)
//NOTE: use draw_set_color to change what color is used for drawing
//NOTE FOR GZ: of the and of checker in this script?

//----------------------- USAGE -----------------------//
// DrawGunName(x, y, "Goofed", "Mortal", "Tin", GUN_TYPE_SUBMACHINEGUN, "from Heck", 0);
// DrawGunName(x, y, "prefix", "Afterburning");   // Prefix 1 and 2 are drawn the same
// DrawGunName(x, y, "prefix", "Disintegrating"); //
// DrawGunName(x, y, "type", "Frankincense", GUN_TYPE_HUNTINGRIFLE);
// DrawGunName(x, y, "suffix", "practicing the Triangle Defense");
//----------------------- USAGE -----------------------//

//These could be in an init event and done once to speed this script up
//but for simplicity I'm leaving them in the script
gunTextIdeal = 156; //if text is under 156 center here
gunSpc = 3 - 1; //Space between prefix text and material
gunSpc2 = 5 - 2; //Space between material and type
fontPrefix = global.fn_7ocs;
fontMaterial = global.fn_12ocs;
fontType = global.fn_12ocs;
fontSuffix0 = global.fn_5os;
fontSuffix1 = global.fn_7ocs;
fontUnidentified = global.fn_12oc;
fontColor = draw_get_color(); //make_color_rgb(255, 205, 15);

var _gx = argument[0]; //this is _gx and not _dx because _dx is set dynamically later
var _dy = argument[1];
var _textPre0 = argument[2];
var _textPre1 = argument[3];

var _textMat, _textTyp, _textSuf, _halign;
if (argument_count > 5)
{
    _textMat = argument[4];
    _textTyp = argument[5];
    _textSuf = argument[6];
    _halign = argument[7];
}
else
{
    _textMat = "";
    _textTyp = "";
    _textSuf = "";
    _halign = 0;
}

var drawPrefix = 1;
var drawPrefix = 1;
var drawMaterial = 1;
var drawType = 1;
var drawSuffix = 1;
if (_textPre0 == "prefix")
{
    drawPrefix = 1;
    drawType = 0;
    drawSuffix = 0;
    _textPre0 = _textPre1;
    _textPre1 = " ";
}
else if (_textPre0 == "type")
{
    drawPrefix = 0;
    drawType = 1;
    drawSuffix = 0;
    _textPre0 = "";
    _textPre1 = "";
    _textMat = argument[3];
    _textTyp = argument[4];
    gunSpc = 0;
}
else if (_textPre0 == "suffix")
{
    drawPrefix = 0;
    drawType = 0;
    drawSuffix = 1;
    _textSuf = _textPre1;
    _textPre0 = "";
    _textPre1 = "";
    _textMat = "";
    _textTyp = "";
    gunSpc = 0;
    gunSpc2 = 0;
}
if (drawType)
{
    var bfgNam = scr_combat_weapons_bfgNames(_textMat + " " + _textTyp);
    if (bfgNam != _textMat + " " + _textTyp) { gunSpc2 = 0; _textMat = bfgNam; _textTyp = ""; }
}

_textSuf0 = "";
_textSuf1 = "";
if (drawSuffix)
{
    if (string_count("practicing the ", _textSuf) > 0)
    {
        _textSuf0 = "practicing the";
        _textSuf1 = string_replace(_textSuf, "practicing the ", "");
    }
    else if (string_count("cursed by a ", _textSuf) > 0)
    {
        _textSuf0 = "cursed by a";
        _textSuf1 = string_replace(_textSuf, "cursed by a ", "");
    }
    else if (string_count("emanating a ", _textSuf) > 0)
    {
        _textSuf0 = "emanating a";
        _textSuf1 = string_replace(_textSuf, "emanating a ", "");
    }
    else if (string_count("replete with ", _textSuf) > 0)
    {
        _textSuf0 = "replete with";
        _textSuf1 = string_replace(_textSuf, "replete with ", "");
    }
    else if (string_count("that has ", _textSuf) > 0)
    {
        _textSuf0 = "that has";
        _textSuf1 = string_replace(_textSuf, "that has ", "");
    }
    else if (string_count("full of ", _textSuf) > 0)
    {
        _textSuf0 = "full of";
        _textSuf1 = string_replace(_textSuf, "full of ", "");
    }
    else if (string_count("pulling off a ", _textSuf) > 0)
    {
        _textSuf0 = "pulling off a";
        _textSuf1 = string_replace(_textSuf, "pulling off a ", "");
    }
    else if (string_count("with the Heart of a ", _textSuf) > 0)
    {
        _textSuf0 = "with the } of a";
        _textSuf1 = string_replace(_textSuf, "with the Heart of a ", "");
    }
    else if (string_count("of the ", _textSuf) > 0)
    {
        _textSuf0 = "of the";
        _textSuf1 = string_replace(_textSuf, "of the ", "");
    }
    else if (string_count("of ", _textSuf) > 0)
    {
        _textSuf0 = "of";
        _textSuf1 = string_replace(_textSuf, "of ", "");
    }
    else if (string_count("with a ", _textSuf) > 0)
    {
        _textSuf0 = "with a";
        _textSuf1 = string_replace(_textSuf, "with a ", "");
    }
    else if (string_count("with ", _textSuf) > 0)
    {
        _textSuf0 = "with";
        _textSuf1 = string_replace(_textSuf, "with ", "");
    }
    else if (string_count("from ", _textSuf) > 0)
    {
        _textSuf0 = "from";
        _textSuf1 = string_replace(_textSuf, "from ", "");
    }  
}
if (argument_count >= 9) _identified = !argument[8]; else _identified = 1;
//EG: DrawGunName(710, 380, "Orbiting", "Murder-slay", "Tin", GUN_TYPE_HEAVYMACHINEGUN, "of the duergar");



//DRAW GUN NAME
//Determine y center
if (_textPre0 == "empty") _textPre0 = "";
if (_textPre1 == "empty") _textPre1 = "";
if ((_textPre0 != "" || _textPre0 != "empty") && (_textPre1 == "" || _textPre1 == "empty")) yPush0 = 5; else yPush0 = 0;
if ((_textPre0 == "" || _textPre0 == "empty") && (_textPre1 != "" || _textPre1 != "empty")) yPush1 = -5; else yPush1 = 0;

//Get width of individual name components
if (_identified == 1)
{
    scr_font(fontPrefix, c_white, 0, 0);
    textPreWid = max(string_width(_textPre0), string_width(_textPre1));
}
else
{
    scr_font(fontUnidentified, c_white, 0, 0);
    textPreWid = string_width("???");
}
scr_font(fontMaterial, c_white, 0, 0);
textMatWid = string_width(_textMat);
scr_font(fontType, c_white, 0, 0);
textTypWid = string_width(_textTyp);
if (_identified == 1)
{
    scr_font(fontSuffix0, c_white, 0, 0);
    textSuf0Wid = string_width(_textSuf0);
    scr_font(fontSuffix1, c_white, 0, 0);
    textSuf1Wid = string_width(_textSuf1);
    textSufWid = max(textSuf0Wid, textSuf1Wid);
}
else
{
    scr_font(fontUnidentified, c_white, 0, 0);
    textSufWid = string_width("???");
}
lineWid = textMatWid + gunSpc2 + textTypWid + 1;

//GET TOTAL WIDTH
if (_identified == 1)
{
    textFullWidth = 0;
    if ((_textPre0 != "" || _textPre0 != "empty") && (_textPre1 != "" || _textPre1 != "empty")) textFullWidth += textPreWid + gunSpc;
    textFullWidth += lineWid;
    if (_textSuf0 != "" || _textSuf0 != "empty") textFullWidth += gunSpc + textSufWid;
    //if (_textSuf0 != "") textFullWidth += gunSpc + textSufWid;
}
else
{
    textFullWidth = textPreWid + gunSpc + lineWid + gunSpc + textSufWid;
}

//Set _dx based on the length of the name of the gun
var _dx;
if (_halign == NULL) {
    // Auto-adjust in quickmenu2
    if (textFullWidth < gunTextIdeal) _dx = _gx + round((gunTextIdeal - textFullWidth) / 2); 
    else _dx = _gx; 
}
else if (_halign == fa_left) {
    _dx = _gx; 
}
else if (_halign == fa_center) {
    _dx = _gx - textFullWidth / 2;
}
else if (_halign == fa_right) {
    _dx = _gx - textFullWidth;
}
_dx = round(_dx);


//Draw prefix1 / behavior and prefix2 / periodic
if (_identified == 1)
{
    scr_font(fontPrefix, fontColor, 2, 0);
    draw_text(_dx + textPreWid, _dy + yPush0, _textPre0);
    draw_text(_dx + textPreWid, _dy + 9 + yPush1, _textPre1);
}
else
{
    scr_font(fontUnidentified, fontColor, 2, 0);
    draw_text(_dx + textPreWid, _dy + 0, "???");
}

if (drawType)
{
    //Draw line under material and type
    scr_draw_rect(_dx + textPreWid + gunSpc, _dy + 14 + 0, lineWid, 4, c_black, draw_get_alpha());
    scr_draw_rect(_dx + textPreWid + gunSpc + 1, _dy + 14 + 1 + 0, lineWid - 2, 4 - 3, fontColor, draw_get_alpha());
    
    //Draw material and type text
    scr_font(fontMaterial, -1, 0, 0);
    draw_text(_dx + textPreWid + gunSpc, _dy - 2, _textMat); //Material
    scr_font(fontType, -1, 0, 0);
    draw_text(_dx + textPreWid + gunSpc + textMatWid + gunSpc2, _dy - 2, _textTyp); //Type
}

//Draw suffix text
if (drawSuffix)
{
    if (_identified == 1)
    {
        scr_font(fontSuffix0, -1, 0, 0);
        draw_text(_dx + textPreWid + gunSpc + textMatWid + gunSpc2 + textTypWid + gunSpc, _dy + 1, _textSuf0);
        scr_font(fontSuffix1, -1, 0, 0);
        draw_text(_dx + textPreWid + gunSpc + textMatWid + gunSpc2 + textTypWid + gunSpc, _dy + 9, _textSuf1);
    }
    else
    {
        scr_font(fontUnidentified, -1, 0, 0);
        draw_text(_dx + textPreWid + gunSpc + textMatWid + gunSpc2 + textTypWid + gunSpc, _dy + 0, "???");
    }
}
draw_set_halign(0);
draw_set_valign(0);
