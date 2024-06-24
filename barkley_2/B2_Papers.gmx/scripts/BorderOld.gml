/// Border(generate, id, x, y)
if (argument[0] == "init")
{
    global.borderCount = 0;
    // Make weights
    // 8 = 1, 16 = 4, 24 = 4, 32 = 4, 48 = 1      - 14 total
    global.borderPiece[0] = 00; global.borderSize[0] = 08;
    global.borderPiece[1] = 01; global.borderSize[1] = 16;
    global.borderPiece[2] = 02; global.borderSize[2] = 16;
    global.borderPiece[3] = 03; global.borderSize[3] = 16;
    global.borderPiece[4] = 04; global.borderSize[4] = 16;
    global.borderPiece[5] = 05; global.borderSize[5] = 24;
    global.borderPiece[6] = 06; global.borderSize[6] = 24;
    global.borderPiece[7] = 07; global.borderSize[7] = 24;
    global.borderPiece[8] = 08; global.borderSize[8] = 24;
    global.borderPiece[9] = 09; global.borderSize[9] = 32;
    global.borderPiece[10] = 10; global.borderSize[10] = 32;
    global.borderPiece[11] = 11; global.borderSize[11] = 32;
    global.borderPiece[12] = 12; global.borderSize[12] = 32;
    global.borderPiece[13] = 13; global.borderSize[13] = 48;
    // Step 1 - Determine size of blocks for given side
    // Step 2 - Randomly assign from peices, trying to give until it doesn't fit or needs 8
}
else if (argument[0] == "generate") // Border("generate", id, width, height);
{
    var ind = argument[1];
    var wid = argument[2];
    var hei = argument[3];
    global.borderAmount[ind] = 0;
    global.borderWidth[ind] = wid;
    global.borderHeight[ind] = hei;
    Border("que", ind, sBorderCorner, (0 * 4) + choose(0, 1, 2, 3), - 1, - 1);
    Border("que", ind, sBorderCorner, (1 * 4) + choose(0, 1, 2, 3), -1, hei - 24 - 1);
    Border("que", ind, sBorderCorner, (2 * 4) + choose(0, 1, 2, 3), wid - 24 - 1, hei - 24 - 1);
    Border("que", ind, sBorderCorner, (3 * 4) + choose(0, 1, 2, 3), wid - 24 - 1, -1);
    // Top
    h = wid - 48; xxx = 24;
    while (h > 0)
    {
        if (h <= 8) { Border("que", ind, sBorderTop, 0, xxx, - 1); break; }
        iii = floor(random(14));
        siz = global.borderSize[iii];
        if (h - siz >= 0)
        {
            Border("que", ind, sBorderTop, iii, xxx, - 1);
            xxx += siz;
            h -= siz;
        }
    }
    // Bot
    h = wid - 48; xxx = 24;
    while (h > 0)
    {
        if (h <= 8) { Border("que", ind, sBorderBottom, 0, xxx, hei - 8 - 1); break; }
        iii = floor(random(14));
        siz = global.borderSize[iii];
        if (h - siz >= 0)
        {
            Border("que", ind, sBorderBottom, iii, xxx, hei - 8 - 1);
            xxx += siz;
            h -= siz;
        }
    }
    // Left
    h = hei - 48; xxx = 24;
    while (h > 0)
    {
        if (h <= 8) { Border("que", ind, sBorderLeft, 0, -1, xxx); break; }
        iii = floor(random(14));
        siz = global.borderSize[iii];
        if (h - siz >= 0)
        {
            Border("que", ind, sBorderLeft, iii, -1, xxx);
            xxx += siz;
            h -= siz;
        }
    }
    // Right
    h = hei - 48; xxx = 24;
    while (h > 0)
    {
        if (h <= 8) { Border("que", ind, sBorderRight, 0, wid - 8 - 2, xxx); break; }
        iii = floor(random(14));
        siz = global.borderSize[iii];
        if (h - siz >= 0)
        {
            Border("que", ind, sBorderRight, iii, wid - 8 - 2, xxx);
            xxx += siz;
            h -= siz;
        }
    }
}
else if (argument[0] == "que") // Border("que", border_id, sprite_index, sub, x, y)
{
    var ind = argument[1];
    var cou = global.borderAmount[ind];
    var spr = argument[2];
    var sub = argument[3];
    global.borderSprite[ind, cou] = spr;
    global.borderSub[ind, cou] = sub;
    global.borderX[ind, cou] = argument[4];
    global.borderY[ind, cou] = argument[5];
    global.borderAmount[ind] += 1;
}
else if (argument[0] == "draw back") // Border("draw back", id, x, y);
{
    var ind = argument[1];
    var xxx = argument[2];
    var yyy = argument[3];
    draw_spr_tiled(xxx + 4, yyy + 4, xxx + global.borderWidth[ind] - 4, yyy + global.borderHeight[ind] - 4, sBorderBG, 0, 0.75);
}
else if (argument[0] == "draw border") // Border("draw border", id, x, y);
{
    var ind = argument[1];
    var xxx = argument[2];
    var yyy = argument[3];
    for (var i = 0; i < global.borderAmount[ind]; i += 1)
    {
        draw_sprite(global.borderSprite[ind, i], global.borderSub[ind, i], xxx + global.borderX[ind, i], yyy + global.borderY[ind, i]);
    }
}
else if (argument[0] == "draw") // Border("draw", id, x, y);
{
    BorderOld("draw back", argument[1], argument[2], argument[3]);
    BorderOld("draw border", argument[1], argument[2], argument[3]);
}
