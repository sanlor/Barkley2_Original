/// Gunsmap(init / define / prevelence / generate / permute / shuffle / assign / potential / mean)
// dot to index / get dot / x / y / type to index / index to type / save / load / seed / draw
if (argument[0] == "init")
{
    // Editable values (gun definitions below 50 lines)
    global.gunsmapDebug = 0;
    global.gunsmapPermutations = 16;
    global.gunsmapWidth = 80;
    global.gunsmapHeight = 80;
    global.gunsmapEdge = 1; // Number of pixels to stay away from edge
    
    // Setup
    global.gunsmapRoundX = 0; // X of merged top / bottom
    global.gunsmapRoundY = 0; // Y of merged top / bottom
    global.gunsmapTopX = 0;
    global.gunsmapTopY = 0;
    global.gunsmapBottomX = 0;
    global.gunsmapBottomY = 0;
    global.gunsmapSeed = floor(random(1000000));
    global.gunsmapGroup = ds_list_create();
    global.gunsmapGroupList = ds_list_create();
    global.gunsmapGroupX = ds_list_create();
    global.gunsmapGroupY = ds_list_create();
    global.gunsmapType = ds_list_create();
    global.gunsmapTypeRarity = ds_list_create();
    global.gunsmapTypeGroup = ds_list_create();
    global.gunsmapTypeColor = ds_list_create();
    global.gunsmapTypeX = ds_list_create();
    global.gunsmapTypeY = ds_list_create();
    global.gunsmapTypePotentialX = ds_list_create();
    global.gunsmapTypePotentialY = ds_list_create();
    global.gunsmapPrevelence = ds_list_create();
    global.gunsmapGrid = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    global.gunsmapGridTaken = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    global.gunsmapGridPotential = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    
    // Queue
    global.gunsmapQueueX = ds_list_create();
    global.gunsmapQueueY = ds_list_create();
    global.gunsmapQueueT = ds_list_create();
    global.gunsmapQueueX2 = ds_list_create();
    global.gunsmapQueueY2 = ds_list_create();
    global.gunsmapQueueT2 = ds_list_create();
    
    // Shift
    global.gunsmapShiftX[0] = 00; global.gunsmapShiftY[0] = -1; 
    global.gunsmapShiftX[1] = -1; global.gunsmapShiftY[1] = 00; 
    global.gunsmapShiftX[2] = +1; global.gunsmapShiftY[2] = 00; 
    global.gunsmapShiftX[3] = 00; global.gunsmapShiftY[3] = +1; 
    global.gunsmapShiftX[4] = -1; global.gunsmapShiftY[4] = -1; 
    global.gunsmapShiftX[5] = +1; global.gunsmapShiftY[5] = -1; 
    global.gunsmapShiftX[6] = -1; global.gunsmapShiftY[6] = +1; 
    global.gunsmapShiftX[7] = -1; global.gunsmapShiftY[7] = +1; 
    
    // Gun definitions
    Gunsmap("define", "Null",          "Nulls",      00, c_black);
    
    Gunsmap("define", "Pistol",        "Pistols",    40, make_colour_hsv(000, 255, 255));
    Gunsmap("define", "Flintlock",     "Pistols",    20, make_colour_hsv(010, 255, 255));
    Gunsmap("define", "Revolver",      "Pistols",    28, make_colour_hsv(020, 255, 255));
    Gunsmap("define", "Magnum",        "Pistols",    08, make_colour_hsv(030, 255, 255));
    
    Gunsmap("define", "Rifle",         "Rifles",     30, make_colour_hsv(040, 128, 128));
    Gunsmap("define", "Musket",        "Rifles",     20, make_colour_hsv(050, 128, 128));
    Gunsmap("define", "Hunting Rifle", "Rifles",     18, make_colour_hsv(060, 128, 128));
    Gunsmap("define", "Sniper",        "Rifles",     06, make_colour_hsv(070, 128, 128));
    Gunsmap("define", "Tranq Rifle",   "Rifles",     10, make_colour_hsv(080, 128, 128));
    
    Gunsmap("define", "Shotgun",       "Shotguns",   25, make_colour_hsv(090, 255, 255));
    Gunsmap("define", "Elephant Gun",  "Shotguns",   15, make_colour_hsv(100, 255, 255));
    Gunsmap("define", "Dbl. Shotgun",  "Shotguns",   15, make_colour_hsv(110, 255, 255));
    Gunsmap("define", "Autoshotgun",   "Shotguns",   05, make_colour_hsv(120, 255, 255));
    
    Gunsmap("define", "SMG",           "Autos",      18, make_colour_hsv(130, 128, 128));
    Gunsmap("define", "Assault",       "Autos",      18, make_colour_hsv(140, 128, 128));
    Gunsmap("define", "Machinegun",    "Autos",      12, make_colour_hsv(150, 128, 128));
    Gunsmap("define", "Uzi",           "Autos",      12, make_colour_hsv(160, 128, 128));
    
    Gunsmap("define", "Gatling Gun",   "Mounted",    12, make_colour_hsv(170, 255, 255));
    Gunsmap("define", "Mitrailleuse",  "Mounted",    07, make_colour_hsv(180, 255, 255));
    Gunsmap("define", "Minigun",       "Mounted",    03, make_colour_hsv(190, 255, 255));
    Gunsmap("define", "BFG",           "Mounted",    01, make_colour_hsv(200, 255, 255));
    
    Gunsmap("define", "Crossbow",      "Projectile", 18, make_colour_hsv(210, 128, 128));
    Gunsmap("define", "Flare Gun",     "Projectile", 10, make_colour_hsv(220, 128, 128));
    Gunsmap("define", "Bazooka",       "Projectile", 04, make_colour_hsv(230, 128, 128));
    Gunsmap("define", "Flame",         "Projectile", 03, make_colour_hsv(240, 128, 128));
    
    Gunsmap("load");
    Gunsmap("prevelence");
    Gunsmap("generate");
}
else if (argument[0] == "define") // 1 = Type, 2 = Group, 3 = Rarity, 4 = Color
{
    var typInd = ds_list_size(global.gunsmapType);
    ds_list_add(global.gunsmapType, argument[1]);
    ds_list_add(global.gunsmapTypeGroup, argument[2]);
    ds_list_add(global.gunsmapTypeRarity, argument[3]);
    ds_list_add(global.gunsmapTypeColor, argument[4]);
    ds_list_add(global.gunsmapTypeX, ds_list_create());
    ds_list_add(global.gunsmapTypeY, ds_list_create());
    ds_list_add(global.gunsmapTypePotentialX, ds_list_create());
    ds_list_add(global.gunsmapTypePotentialY, ds_list_create());
    if (ds_list_find_index(global.gunsmapGroup, argument[2]) == -1)
    {
        ds_list_add(global.gunsmapGroup, argument[2]);
        ds_list_add(global.gunsmapGroupList, ds_list_create());
    }
}
else if (argument[0] == "prevelence")
{
    ds_list_clear(global.gunsmapPrevelence);
    for (i = 0; i < ds_list_size(global.gunsmapType); i += 1)
    {
        var dgi = ds_list_find_index(global.gunsmapGroup, global.gunsmapTypeGroup[| i]);
        var dgl = global.gunsmapGroupList[| dgi];
        repeat (global.gunsmapTypeRarity[| i]) 
        { 
            ds_list_add(dgl, global.gunsmapType[| i]); 
            ds_list_add(global.gunsmapPrevelence, i); 
        }
    }
}
else if (argument[0] == "generate")
{
    if (argument_count > 1) global.gunsmapSeed = argument[1];
    else global.gunsmapSeed = floor(random(1000000));
    Gunsmap("prevelence"); // So that shuffle works the same always
    random_set_seed(global.gunsmapSeed);
    // Clear essentials
    ds_list_clear(global.gunsmapGroupX);
    ds_list_clear(global.gunsmapGroupY);
    ds_list_clear(global.gunsmapQueueX);
    ds_list_clear(global.gunsmapQueueY);
    ds_list_clear(global.gunsmapQueueT);
    ds_list_clear(global.gunsmapQueueX2);
    ds_list_clear(global.gunsmapQueueY2);
    ds_list_clear(global.gunsmapQueueT2);
    ds_grid_destroy(global.gunsmapGrid);
    ds_grid_destroy(global.gunsmapGridTaken);
    ds_grid_destroy(global.gunsmapGridPotential);
    global.gunsmapGrid = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    global.gunsmapGridTaken = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    global.gunsmapGridPotential = ds_grid_create(global.gunsmapWidth, global.gunsmapHeight);
    for (i = 0; i < ds_list_size(global.gunsmapType); i += 1)
    {
        ds_list_clear(global.gunsmapTypeX[| i]);
        ds_list_clear(global.gunsmapTypeY[| i]);
        ds_list_clear(global.gunsmapTypePotentialX[| i]);
        ds_list_clear(global.gunsmapTypePotentialY[| i]);
    }
    // CLEAR TYPEX AND Y TOO
    // Start
    stb = 0.1 + random(0.1);
    atb = 1 - stb;
    // Create first 3 major groups
    cnx = (global.gunsmapWidth / 2);// - ((global.gunsmapWidth / 4) * stb) + random((global.gunsmapWidth / 2) * stb);
    cny = (global.gunsmapHeight / 2);// - ((global.gunsmapHeight / 4) * stb) + random((global.gunsmapHeight / 2) * stb);
    dir = random(360);
    dirAdd = 10;
    siz = (global.gunsmapHeight / 4); ///////////here
    psx = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 0 - dirAdd + random(dirAdd));
    psy = cny + lengthdir_y(siz * (atb + random(stb)), dir + 0 - dirAdd + random(dirAdd));
    shx = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 120 - dirAdd + random(dirAdd));
    shy = cny + lengthdir_y(siz * (atb + random(stb)), dir + 120 - dirAdd + random(dirAdd));
    rfx = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 240 - dirAdd + random(dirAdd));
    rfy = cny + lengthdir_y(siz * (atb + random(stb)), dir + 240 - dirAdd + random(dirAdd));
    // Make 3 subgroups
    siz = (global.gunsmapHeight / 4);
    dir += 60;
    mnx = (shx + rfx) / 2; mny = (shy + rfy) / 2;
    prx = (shx + psx) / 2; pry = (shy + psy) / 2;
    aux = (rfx + psx) / 2; auy = (rfy + psy) / 2;
    mnx = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 0 - dirAdd + random(dirAdd));
    mny = cny + lengthdir_y(siz * (atb + random(stb)), dir + 0 - dirAdd + random(dirAdd));
    prx = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 120 - dirAdd + random(dirAdd));
    pry = cny + lengthdir_y(siz * (atb + random(stb)), dir + 120 - dirAdd + random(dirAdd));
    aux = cnx + lengthdir_x(siz * (atb + random(stb)), dir + 240 - dirAdd + random(dirAdd));
    auy = cny + lengthdir_y(siz * (atb + random(stb)), dir + 240 - dirAdd + random(dirAdd));
    // Share
    ds_list_add(global.gunsmapGroupX, 000); ds_list_add(global.gunsmapGroupY, 000); // Null
    ds_list_add(global.gunsmapGroupX, psx); ds_list_add(global.gunsmapGroupY, psy);
    ds_list_add(global.gunsmapGroupX, rfx); ds_list_add(global.gunsmapGroupY, rfy);
    ds_list_add(global.gunsmapGroupX, shx); ds_list_add(global.gunsmapGroupY, shy);
    ds_list_add(global.gunsmapGroupX, aux); ds_list_add(global.gunsmapGroupY, auy);
    ds_list_add(global.gunsmapGroupX, mnx); ds_list_add(global.gunsmapGroupY, mny);
    ds_list_add(global.gunsmapGroupX, prx); ds_list_add(global.gunsmapGroupY, pry);
    
    // Make home bases
    siz = global.gunsmapHeight / 8;
    for (var i = 1; i < ds_list_size(global.gunsmapType); i += 1)
    {
        //var typ = global.gunsmapType[| i];
        var grp = global.gunsmapTypeGroup[| i]; //IE. Pistols
        var ind = ds_list_find_index(global.gunsmapGroup, grp); //IE. 0
        var plx = global.gunsmapGroupX[| ind];
        var ply = global.gunsmapGroupY[| ind];
        while (Gunsmap("assign", i, round(plx - siz + random(siz * 2)), round(ply - siz + random(siz * 2))) == 0) x = x;
    }
    
    // Now use rarity to draw others
    for (z = 0; z < global.gunsmapPermutations - 1; z += 1)
    {
        Gunsmap("permute");
    }
    Gunsmap("mean");
}
else if (argument[0] == "permute")
{
    ds_list_shuffle(global.gunsmapPrevelence);
    typ = choose(1, 0);
    if (typ) Gunsmap("shuffle");
    for (var i = 0; i < ds_list_size(global.gunsmapPrevelence); i += 1)
    {
        var typInd = global.gunsmapPrevelence[| i];
        var dss = ds_list_size(global.gunsmapTypePotentialX[| typInd]);
        if (dss > 0)
        {
            var rn2 = 0; 
            if (typ == 0) rn2 = floor(random(dss));
            var tmx = ds_list_find_value(global.gunsmapTypePotentialX[| typInd], rn2);
            var tmy = ds_list_find_value(global.gunsmapTypePotentialY[| typInd], rn2);
            ds_list_delete(global.gunsmapTypePotentialX[| typInd], rn2);
            ds_list_delete(global.gunsmapTypePotentialY[| typInd], rn2);
            //show_debug_message(string(typInd) + " = " + string(tmx) + "x" + string(tmy) + " | " + string(rn2));
            Gunsmap("assign", typInd, tmx, tmy);
        }
        else x = x; // Create debt
    }
}
else if (argument[0] == "shuffle")
{
    for (var i = 1; i < ds_list_size(global.gunsmapType); i += 1)
    {
        for (var h = 0; h < ds_list_size(global.gunsmapTypePotentialX[| i]); h += 1)
        {
            var pos = floor(random(ds_list_size(global.gunsmapTypePotentialX[| i])));
            var olx = ds_list_find_value(global.gunsmapTypePotentialX[| i], h);
            var nwx = ds_list_find_value(global.gunsmapTypePotentialX[| i], pos);
            var oly = ds_list_find_value(global.gunsmapTypePotentialY[| i], h);
            var nwy = ds_list_find_value(global.gunsmapTypePotentialY[| i], pos);
            ds_list_replace(global.gunsmapTypePotentialX[| i], h, nwx);
            ds_list_replace(global.gunsmapTypePotentialX[| i], pos, olx);
            ds_list_replace(global.gunsmapTypePotentialY[| i], h, nwy);
            ds_list_replace(global.gunsmapTypePotentialY[| i], pos, oly);
        }
    }
}
else if (argument[0] == "assign")
{
    var asx = clamp(argument[2], global.gunsmapEdge, global.gunsmapWidth - (global.gunsmapEdge + 1));
    var asy = clamp(argument[3], global.gunsmapEdge, global.gunsmapHeight - (global.gunsmapEdge + 1));
    if (global.gunsmapGrid[# asx, asy] == 0)
    {
        global.gunsmapGridTaken[# asx, asy] = 1;
        global.gunsmapGrid[# asx, asy] = argument[1];
        ds_list_add(global.gunsmapTypeX[| argument[1]], asx);
        ds_list_add(global.gunsmapTypeY[| argument[1]], asy);
        ds_list_add(global.gunsmapQueueX2, asx);
        ds_list_add(global.gunsmapQueueY2, asy);
        ds_list_add(global.gunsmapQueueT2, argument[1]);
        Gunsmap("potential", argument[1], argument[2], argument[3]);
        return 1;
    }
    return 0;
}
else if (argument[0] == "potential") // 0 = potential, 1 = type, 2 = x, 3 = y
{
    var asx = clamp(argument[2], 0, global.gunsmapWidth);
    var asy = clamp(argument[3], 0, global.gunsmapHeight);
    for (var dir = 0; dir < 4; dir += 1)
    {
        var psx = asx + global.gunsmapShiftX[dir];
        var psy = asy + global.gunsmapShiftY[dir];
        if (global.gunsmapGridPotential[# psx, psy] == 0)
        {
            ds_list_add(global.gunsmapTypePotentialX[| argument[1]], psx);
            ds_list_add(global.gunsmapTypePotentialY[| argument[1]], psy);
            global.gunsmapGridPotential[# psx, psy] = 1;
        }
    }
}
else if (argument[0] == "mean") // Gets mean X / Y
{
    for (i = 1; i < ds_list_size(global.gunsmapTypeX); i += 1)
    {
        global.gunsmapMeanX[i] = 0;
        global.gunsmapMeanY[i] = 0;
        for (g = 0; g < ds_list_size(global.gunsmapTypeX[| i]); g += 1)
        {
            global.gunsmapMeanX[i] += ds_list_find_value(global.gunsmapTypeX[| i], g);
            global.gunsmapMeanY[i] += ds_list_find_value(global.gunsmapTypeY[| i], g);
        }
        global.gunsmapMeanX[i] /= ds_list_size(global.gunsmapTypeX[| i]);
        global.gunsmapMeanY[i] /= ds_list_size(global.gunsmapTypeX[| i]);
    }
}
else if (argument[0] == "dot to index") // 0 = "dot to index", 1 = x, 2 = y
{
    if (global.gunsmapGrid[# argument[1], argument[2]] != 0) 
    {
        global.gunsmapRoundX = argument[1];
        global.gunsmapRoundY = argument[2];
        return global.gunsmapGrid[# argument[1], argument[2]];
    }
    // First see if the grid dot is occupied
    for (dis = 1; dis < 96; dis += 1)
    {
        if (ds_grid_value_disk_exists(global.gunsmapGridTaken, argument[1], argument[2], dis, 1))
        {
            global.gunsmapRoundX = ds_grid_value_disk_x(global.gunsmapGridTaken, argument[1], argument[2], dis, 1);
            global.gunsmapRoundY = ds_grid_value_disk_y(global.gunsmapGridTaken, argument[1], argument[2], dis, 1);
            return global.gunsmapGrid[# global.gunsmapRoundX, global.gunsmapRoundY];
        }
    }
}
else if (argument[0] == "get dot") // 0 = "get dot", 1 = type_real --- Returns a dot from a list
{
    return floor(random(ds_list_size(global.gunsmapTypeX[| argument[1]])));
}
else if (argument[0] == "x") // 0 = "x", 1 = real_type, 2 = real_index
{
    return ds_list_find_value(global.gunsmapTypeX[| argument[1]], argument[2]);
}
else if (argument[0] == "y") // 0 = "y", 1 = real_type, 2 =  real_index
{
    return ds_list_find_value(global.gunsmapTypeY[| argument[1]], argument[2]);
}
else if (argument[0] == "type to index")
{
    return ds_list_find_index(global.gunsmapType, argument[1]);
}
else if (argument[0] == "index to type")
{
    return ds_list_find_value(global.gunsmapType, argument[1]);
}
else if (argument[0] == "save")
{
    ini_open("gunsmap.ini");
    ini_write_real("GENERAL", "Resolution", global.gunsmapWidth);
    ini_write_real("GENERAL", "Permutations", global.gunsmapPermutations);
    for (i = 0; i < ds_list_size(global.gunsmapType); i += 1)
    {
        ini_write_real("GUNS", global.gunsmapType[| i], global.gunsmapTypeRarity[| i]);
    }
    ini_close();
}
else if (argument[0] == "load")
{
    if (file_exists("gunsmap.ini") == 0) return 0;
    ini_open("gunsmap.ini");
    global.gunsmapWidth = ini_read_real("GENERAL", "Resolution", 64);
    global.gunsmapHeight = global.gunsmapWidth;
    global.gunsmapPermutations = ini_read_real("GENERAL", "Permutations", 10);
    for (i = 0; i < ds_list_size(global.gunsmapType); i += 1)
    {
        global.gunsmapTypeRarity[| i] = ini_read_real("GUNS", global.gunsmapType[| i], 5);
    }
    ini_close();
}
else if (argument[0] == "seed")
{
    if (argument_count > 1)
    {
        global.gunsmapSeed = clamp(argument[1], 0, 100000000); //floor(random(100000000));
    }
    return global.gunsmapSeed;
}
else if (argument[0] == "draw") // 1 = x, 2 = y, 3 = power, 4 = topType, 5 = topPos, 6 = botType, 7 = botPos
{
    var top = -1;
    var bot = -1;
    if (argument_count > 4) { top = argument[4]; topPos = argument[5]; }
    if (argument_count > 6) { bot = argument[6]; botPos = argument[7]; }
    var drx = argument[1];
    var dry = argument[2];
    var scl = argument[3]; // gunspower
    var xxx = 0; 
    var yyy = 0;
    var wid = global.gunsmapWidth;
    var hei = global.gunsmapHeight;
    
    // Draw occupied
    for (yyy = 0; yyy < hei; yyy += 1)
    {
        for (xxx = 0; xxx < wid; xxx += 1)
        {
            //if (global.gunsmapGrid[# xxx, yyy] != 0)
            draw_sprite_ext(s1x1, 0, drx + (xxx * scl), dry + (yyy * scl), scl, scl, 0, global.gunsmapTypeColor[| global.gunsmapGrid[# xxx, yyy]], 1);
            //if (global.gunsmapGrid[# xxx, yyy] == 0 && global.gunsmapGridPotential[# xxx, yyy] == 1)
            //    draw_sprite_ext(s1x1, 0, drx + (xxx * scl), dry + (yyy * scl), scl, scl, 0, c_white, 1);
        }
    }
    for (i = 1; i < ds_list_size(global.gunsmapTypeX); i += 1)
    {
        tmx = global.gunsmapMeanX[i];
        tmy = global.gunsmapMeanY[i];
        col = merge_color(global.gunsmapTypeColor[| i], c_black, 0.5);
        sub = ds_list_find_index(global.gunTypeSub, global.gunsmapType[| i]) + 1;
        // @@@@@@@@@@@@@ if (keyboard_check(vk_shift) == 0) draw_sprite_ext(sMenuUtilityBlip, sub, drx + (tmx * scl) - 4, dry + (tmy * scl) - 8, scl / 3, scl / 3, 0, col, 1);
        //else draw_sprite_ext(s1x1, i, drx + (tmx * scl), dry + (tmy * scl), scl, scl, 0, c_white, 1);
    }
    
    // Draw line
    if (top != -1 && bot != -1)
    {
        gtx = (Gunsmap("x", top, topPos) * scl);
        gty = (Gunsmap("y", top, topPos) * scl);
        gbx = (Gunsmap("x", bot, botPos) * scl);
        gby = (Gunsmap("y", bot, botPos) * scl);
        draw_set_color(c_white);
        draw_line_width(drx + gtx, dry + gty, drx + gbx, dry + gby, scl / 2);
        // Gunspower
        dfx = (gbx - gtx) / 100;
        dfy = (gby - gty) / 100;
        draw_set_color(c_white);
        draw_circle(drx + gtx + (dfx * gunPow), dry + gty + (dfy * gunPow), scl, 0);
        // Get type
        chx = clamp(round((gtx + (dfx * gunPow)) / scl), 0, global.gunsmapWidth);
        chy = clamp(round((gty + (dfy * gunPow)) / scl), 0, global.gunsmapHeight);
        typ = Gunsmap("index to type", Gunsmap("dot to index", chx, chy));
        if (global.gunsmapDebug)
        {
            scr_font(global.fn_2c, c_red, 1, 1);
            draw_text(drx + gtx + (dfx * gunPow), dry + gty + (dfy * gunPow), typ);
            draw_set_color(make_color_hsv(random(255), 255, 255));
            draw_circle(drx + (scl / 2) + (global.gunsmapRoundX * scl), dry + (scl / 2) + (global.gunsmapRoundY * scl), scl / 3, 0);
        }
    }
    
    // Top
    mrkScl = 1; //scl / 2;
    if (top != -1)
    {
        gnx = (Gunsmap("x", top, topPos) * scl);
        gny = (Gunsmap("y", top, topPos) * scl);
        for (i = 0; i < 8; i += 1)
        {
            ldx = lengthdir_x(1, i * 45);
            ldy = lengthdir_y(1, i * 45);
            draw_sprite_ext(sMenuUtilityGunMapMarker, 0, drx + ldx + gnx, dry + ldy + gny, mrkScl, mrkScl, 0, c_black, 1);
        }
        draw_sprite_ext(sMenuUtilityGunMapMarker, 0, drx + gnx, dry + gny, mrkScl, mrkScl, 0, c_white, 1);
    }
    
    // Bottom
    if (bot != -1)
    {
        gnx = (Gunsmap("x", bot, botPos) * scl);
        gny = (Gunsmap("y", bot, botPos) * scl);
        for (i = 0; i < 8; i += 1)
        {
            ldx = lengthdir_x(1, i * 45);
            ldy = lengthdir_y(1, i * 45);
            draw_sprite_ext(sMenuUtilityGunMapMarker, 1, drx + ldx + gnx, dry + ldy + gny, mrkScl, mrkScl, 0, c_black, 1);
        }
        draw_sprite_ext(sMenuUtilityGunMapMarker, 1, drx + gnx, dry + gny, mrkScl, mrkScl, 0, c_white, 1);
    }
    
    
    // sMenuUtilityGunMapMarker
    return 1;
}
else show_debug_message("Gunsmap() - Unknown function " + argument[0]);
