/// Cyberspear(init / map)
if (argument[0] == "init")
{
    global.cyberspearRoomAmount = 0;
    Cyberspear("map", "r_wst_northRespawn01", 912, 512, 176 + 96 + 272, 0);
    Cyberspear("map", "r_wst_northPassage01", 912, 560, 176 + 96 + 272, 512);
    Cyberspear("map", "r_wst_donutDomain01", 1184, 1200, 176 + 96, 512 + 560);
    Cyberspear("map", "r_wst_westMaze01", 1280, 1024, 176, 512 + 560 + 1200);
    Cyberspear("map", "r_wst_wadingRace01", 800, 640, 0, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_wst_westJunction01", 480, 640, 800, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_wst_westOpenGrounds01", 1120, 1280, 800 + 480, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_wst_tnnEntrance01", 1280, 1280, 800 + 480 + 1120, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_est_difficultyFork01", 848, 1280, 800 + 480 + 1120 + 1280, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_est_cgremPath01", 1280, 1280, 800 + 480 + 1120 + 1280 + 848, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_est_swampZigzag01", 640, 1280, 800 + 480 + 1120 + 1280 + 848 + 1280, 512 + 560 + 1200 + 1024);
    Cyberspear("map", "r_est_tnnRespawn01", 848, 460, 800 + 480 + 1120 + 1280, 512 + 560 + 1200 + 1024 + 1280);
    Cyberspear("map", "r_est_southDeadend01", 1920, 480, 800 + 480 + 1120 + 848 + 1280, 512 + 560 + 1200 + 1024 + 1280);
    Cyberspear("map", "r_est_cgremArena01", 1920, 784, 800 + 480 + 1120 + 1280 + 848, 512 + 560 + 1200 + 1024 - 784);
    Cyberspear("map", "r_est_cgremVillage01", 640, 1120, 800 + 480 + 1120 + 1280 + 848 + (1920 - 720 - 640), 512 + 560 + 1200 + 1024 - 784 - 640 - 480);
    Cyberspear("map", "r_est_easternPaths01", 720, 1120, 800 + 480 + 1120 + 1280 + 848 + (1920 - 720), 512 + 560 + 1200 + 1024 - 784 - 1120);
    Cyberspear("map", "r_est_industrialPlaza01", 1360, 480, 800 + 480 + 1120 + 1280 + 848 + (1920 - 720 - 640), 512 + 560 + 1200 + 1024 - 784 - 1120 - 480);
    Cyberspear("map", "r_est_turretGauntlet01", 800, 1024, 800 + 480 + 1120 + 1280 + 848 + (1920 - 720 - 640) - 800, 512 + 560 + 1200 + 1024 - 784 - 1120 - 1024);
    Cyberspear("map", "r_est_snoozer01", 800, 608, 800 + 480 + 1120 + 1280 + 848 + (1920 - 720 - 640) - 800, 512 + 560 + 1200 + 1024 - 784 - 1120 - 1024 - 608);
    Cyberspear("map", "r_est_pythagoras01", 480, 384, 800 + 480 + 1120 + 1280 + 848 + 1920, 512 + 560 + 1200 + 1024 - 784 - 384);
    Cyberspear("map", "r_est_junkworms01", 1280, 512, 800 + 480 + 1120 + 1280 + 848 + 1920, 512 + 560 + 1200 + 1024 - 784 - 384 - 512);
    Cyberspear("map", "r_est_industrialRock01", 1280, 976, 800 + 480 + 1120 + 1280 + 848 + 1920, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976);
    Cyberspear("map", "r_est_factoryChicane01", 1280, 608, 800 + 480 + 1120 + 1280 + 848 + 1920, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608);
    Cyberspear("map", "r_fct_factoryParking01", 1280, 880, 800 + 480 + 1120 + 1280 + 848 + 1920, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608 - 880);
    Cyberspear("map", "r_fct_factoryStorage01", 480, 1040, 800 + 480 + 1120 + 1280 + 848 + 1920 - 480, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608 - 1040);
    Cyberspear("map", "r_fct_factoryOutpost01", 880, 1440, 800 + 480 + 1120 + 1280 + 848 + 1920 - 480 - 880, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608 - 1440); 
    Cyberspear("map", "r_est_mountainBase01", 512, 1936, 800 + 480 + 1120 + 1280 + 848 + 1920 + 1280, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608);
    Cyberspear("map", "r_est_mountainPath01", 512, 1280, 800 + 480 + 1120 + 1280 + 848 + 1920 + 1280 + 512, 512 + 560 + 1200 + 1024 - 784 - 384 - 512 - 976 - 608 + (1936 - 1280));
    Cyberspear("map", "r_wst_northRuins01", 2032, 912, 176 + 96 + 272 + 912, 0); // x was 2368
    Cyberspear("map", "r_wst_northCircle01", 800, 912, 176 + 96 + 272 + 912 + 2032, 0); // x was 464
    
    // Add piece locations
    /*
    global.cyberspearPieceAmount = 0;
    Cyberspear("piece", "r_wst_northRespawn01",    680,  272, 0, "The Iron Crown of Jackson");
    Cyberspear("piece", "r_est_cgremPath01",       1048, 664, 1, "The Veil of Valanciunas");
    // Village
    Cyberspear("piece", "r_est_snoozer01",         568,  280, 2, "The Blood of Klisp");
    Cyberspear("piece", "r_est_difficultyFork01",  288,  976, 3, "The Scala Iactus");
    Cyberspear("piece", "r_wst_donutDomain01",     784,  240, 4, "The Mandyblue");
    Cyberspear("piece", "r_est_easternPaths01",    528,  308, 5, "The Crown of Jalapenos");
    // factory backyard
    // factory chicane
    // factory outpost
    Cyberspear("piece", "r_wst_tnnEntrance01",     976,  272, 6, "The Shroud of Ballin'");
    // factory storage
    Cyberspear("piece", "r_est_mountainBase01",    336, 1896, 7, "The Grape-topped Grail");
    Cyberspear("piece", "r_est_industrialRock01",  1120, 440, 8, "The Cyberspear Piece");
    // USW access
    // industrial zone
    */
    
    // DEBUG locations - You can only have 1 piece per room
    // global.cyberspearPieceName[global.cyberspearPieceAmount]
    // How do you even get Boatloads of Trash as an option?
    // Get the list, remove the active one, shuffle, insert cyber
    // else if (argument[0] == "room start") <--- Has object
    // Quest - relicName has data on which relic you have
    global.cyberspearPieceAmount = 0;
    Cyberspear("piece", "r_est_cgremArena01",      832,  512, 0, "The Iron Crown of Jackson");
    Cyberspear("piece", "r_est_cgremPath01",       272,  256, 1, "The Veil of Valanciunas");
    Cyberspear("piece", "r_est_swampZigzag01",     480,  192, 2, "The Blood of Klisp");
    Cyberspear("piece", "r_est_easternPaths01",    336,  944, 3, "The Scala Iactus");
    Cyberspear("piece", "r_est_mountainPath01",    336,  712, 4, "The Mandyblue");
    Cyberspear("piece", "r_est_factoryChicane01",  1112, 312, 5, "The Crown of Jalapenos");
    Cyberspear("piece", "r_est_industrialPlaza01", 956,  232, 6, "The Shroud of Ballin'");
    Cyberspear("piece", "r_est_industrialRock01",  784,  528, 7, "The Grape-topped Grail");
    Cyberspear("piece", "r_est_junkworms01",       680,  272, 8, "The Cyberspear Piece");
    
    // Cyberspear("piece", "r_est_junkworms01",       408,  64);
    // Cyberspear("piece", "r_est_mountainBase01",    400,  1784);
    // Cyberspear("piece", "r_est_mountainBase01",    64,   688);
    // mountain path
    // Cyberspear("piece", "r_wst_northCircle01",     192,  152);
    // Cyberspear("piece", "r_est_southDeadend01",    160,  256);
    // Cyberspear("piece", "r_wst_northRuins01",      928,  560);
    // Cyberspear("piece", "r_est_pythagoras01",      384,  264);
    // Cyberspear("piece", "r_est_turretGauntlet01",  456,  432);
    
    // Cyberspear("piece", "r_wst_westJunction01",    200,  476);
    
    // Cyberspear("piece", "r_wst_wadingRace01",      640,  306);
    // Cyberspear("piece", "r_wst_westOpenGrounds01", 208,  732);
    
    // Cyberspear("piece", "", , );
}

else if (argument[0] == "name to sub")
{
    if (argument[1] == "The Iron Crown of Jackson") return 0;
    if (argument[1] == "The Veil of Valanciunas") return 1;
    if (argument[1] == "The Blood of Klisp") return 2;
    if (argument[1] == "The Scala Iactus") return 3;
    if (argument[1] == "The Mandyblue") return 4;
    if (argument[1] == "The Crown of Jalapenos") return 5;
    if (argument[1] == "The Shroud of Ballin'") return 6;
    if (argument[1] == "The Grape-topped Grail") return 7;
    if (argument[1] == "The Cyberspear Piece") return 8;
}

else if (argument[0] == "piece next") // Arg1 = piece to get
{
    var dsl = ds_list_create();
    if (Quest("relicName") != "The Iron Crown of Jackson") ds_list_add(dsl, "The Iron Crown of Jackson");
    if (Quest("relicName") != "The Veil of Valanciunas") ds_list_add(dsl, "The Veil of Valanciunas");
    if (Quest("relicName") != "The Blood of Klisp") ds_list_add(dsl, "The Blood of Klisp");
    if (Quest("relicName") != "The Scala Iactus") ds_list_add(dsl, "The Scala Iactus");
    if (Quest("relicName") != "The Cyberspear Piece") ds_list_add(dsl, "The Cyberspear Piece");
    if (Quest("relicName") != "The Mandyblue") ds_list_add(dsl, "The Mandyblue");
    if (Quest("relicName") != "The Crown of Jalapenos") ds_list_add(dsl, "The Crown of Jalapenos");
    if (Quest("relicName") != "The Shroud of Ballin'") ds_list_add(dsl, "The Shroud of Ballin'");
    if (Quest("relicName") != "The Grape-topped Grail") ds_list_add(dsl, "The Grape-topped Grail");
    ds_list_add(dsl, Quest("relicName"));
    var relNam = dsl[| argument[1]];
    ds_list_destroy(dsl);
    return relNam;
}

else if (argument[0] == "reset")
{
    // 1 means the quest is active
    Quest("cgremQuest", 0);
    // Tallies how many pieces you have
    Quest("cyberspearGremlinPieces", 0);
    // Individual pieces
    for (var i = 0; i < global.cyberspearPieceAmount; i += 1)
    {
        Quest("cyberspearGremlinPiece" + string(i), 0);
    }
    // Total
    Quest("cyberspearGremlinPiecesTotal", global.cyberspearPieceAmount);
}
else if (argument[0] == "room start")
{
    if (Quest("cgremQuest") == 0) return 0;
    for (var i = 0; i < global.cyberspearPieceAmount; i += 1)
    {
        if (asset_get_index(global.cyberspearPieceRoom[i]) == room)
        {
            if (Quest("cyberspearGremlinPiece" + string(i)) == 0)
            {
                var obj = instance_create(global.cyberspearPieceX[i], global.cyberspearPieceY[i], o_wst_piece01);
                //obj.sub = global.cyberspearPieceSub[i];
                //obj.name = global.cyberspearPieceName[i];
                obj.pid = i;
                with (obj) event_user(0);
            }
        }
    }
}
else if (argument[0] == "distance") // 1 = Room, 2 = X, 3 = Y, 4 = Piece Index
{
    /*if (Quest("cgremQuest") == 0) return 0;
    Cyberspear("position", room_get_name(room), PlayerCombatActor.x, PlayerCombatActor.y);
    var hpx = pcx;
    var hpy = pcy;
    for (var i = 0; i < global.cyberspearPieceAmount; i += 1)
    {
        Cyberspear("position", global.cyberspearPieceRoom[i], global.cyberspearPieceX, PlayerCombatActor.y);
    }
    dsx = */
}
else if (argument[0] == "position") // 1 = Room, 2 = X, 3 = Y
{
    for (var i = 0; i < global.cyberspearRoomAmount; i += 1)
    {
        if (argument[1] == global.cyberspearRoom[i]) rmi = i;
    }
    pcx = global.cyberspearRoomX[rmi] + argument[2];
    pcy = global.cyberspearRoomY[rmi] + argument[3];
}
else if (argument[0] == "draw")
{
    if (Quest("cgremQuest") == 0 or Quest("cgremQuest") == 2 or Quest("cgremQuest") == 6) return 0;
    // Check if in piece room
    var inr = 0;
    for (var i = 0; i < global.cyberspearRoomAmount; i += 1)
    {
        if (room_get_name(room) == global.cyberspearRoom[i]) { inr = 1; break; }
    }
    if (inr == 0) return 0;
    var vmx = view_xview[0] + (SCREEN_WIDTH / 2);
    var vmy = view_yview[0] + (SCREEN_HEIGHT / 2) - 20;
    Cyberspear("position", room_get_name(room), vmx, vmy);
    var hpx = pcx;
    var hpy = pcy;
    var mxx = (SCREEN_WIDTH / 2) - 16;
    var mxy = (SCREEN_HEIGHT / 2) - 32;
    var arrAmt = 0;
    for (var i = 0; i < global.cyberspearPieceAmount; i += 1)
    {
        var dsx = clamp(global.cyberspearPieceXTotal[i] - hpx, -mxx, mxx);
        var dsy = clamp(global.cyberspearPieceYTotal[i] - hpy, -mxy, mxy);
        var acx = vmx + dsx;
        var acy = vmy + dsy;
        var totDis = point_distance(0, 0, global.cyberspearPieceXTotal[i], global.cyberspearPieceYTotal[i]); // extra
        var col = make_color_hsv(i * 24, 255, 255);
        if (Quest("cyberspearGremlinPiece" + string(i)) == 0)
        {
            if (abs(dsx) >= mxx || abs(dsy) >= mxy)
            {
                //draw_sprite_ext(sPointer, 0, acx, acy, 1, 1, point_direction(vmx, vmy, acx, acy), col, 0.5);
                arrX[arrAmt] = acx;
                arrY[arrAmt] = acy;
                arrDSX[arrAmt] = dsx;
                arrDSY[arrAmt] = dsy;
                arrRot[arrAmt] = point_direction(vmx, vmy, arrX[arrAmt], arrY[arrAmt]);
                arrOns[arrAmt] = 0;
                //arrInd[arrAmt] = i;
                arrAmt += 1;
            }
            else
            {
                arrX[arrAmt] = acx;
                arrY[arrAmt] = acy - 32;
                arrDSX[arrAmt] = dsx;
                arrDSY[arrAmt] = dsy;
                arrRot[arrAmt] = 270; //point_direction(vmx, vmy, arrX[arrAmt], arrY[arrAmt]);
                arrOns[arrAmt] = 1;
                //arrInd[arrAmt] = i;
                arrAmt += 1;
            }
        }
    }
    // Don't allow arrows to be in same spot
    var alt = 0;
    for (var h = 0; h < arrAmt; h += 1)
    {
        for (var i = 0; i < arrAmt; i += 1)
        {
            if (i != h)
            {
                if (arrDSX[h] == arrDSX[i] && arrDSY[h] == arrDSY[i])
                {
                    var xsn = -sign(arrDSX[h]);
                    var ysn = -sign(arrDSY[h]);
                    if (alt == 0) arrDSX[h] += 32 * xsn;
                    else arrDSY[h] += 32 * ysn;
                    h = -1;
                    alt = !alt;
                    break;
                }
            }
        }
    }
    // Draw queue
    for (var i = 0; i < arrAmt; i += 1)
    {
        var olx = arrX[i];
        var oly = arrY[i];
        arrX[i] = vmx + arrDSX[i];
        arrY[i] = vmy + arrDSY[i];
        scr_font(global.fn_smallc, c_yellow, 1, 1);
        if (arrOns[i] == 0)
        {
            draw_sprite_ext(sPointer, (global.DELTA_TOTAL / 250) mod 4, arrX[i], arrY[i], 1, 1, arrRot[i], c_white, 1.0);
            var txx = arrX[i] + lengthdir_x(26, point_direction(arrX[i], arrY[i], vmx, vmy));
            var txy = arrY[i] + lengthdir_y(26, point_direction(arrX[i], arrY[i], vmx, vmy));
            draw_text(txx, txy, "QUEST!");
        }
        else
        {
            draw_sprite_ext(sPointer, (global.DELTA_TOTAL / 250) mod 4, olx, oly, 1, 1, arrRot[i], c_white, 1.0);
            draw_text(olx, oly + 48, "QUEST!");
        }
    }
}
else if (argument[0] == "map")
{
    global.cyberspearRoom[global.cyberspearRoomAmount] = argument[1];
    global.cyberspearRoomWidth[global.cyberspearRoomAmount] = argument[2];
    global.cyberspearRoomHeight[global.cyberspearRoomAmount] = argument[3];
    global.cyberspearRoomX[global.cyberspearRoomAmount] = argument[4];
    global.cyberspearRoomY[global.cyberspearRoomAmount] = argument[5];
    global.cyberspearRoomAmount += 1;
}
// Cyberspear("piece", room, x, y, sub, name)
else if (argument[0] == "piece")
{
    global.cyberspearPieceRoom[global.cyberspearPieceAmount] = argument[1];
    global.cyberspearPieceX[global.cyberspearPieceAmount] = argument[2];
    global.cyberspearPieceY[global.cyberspearPieceAmount] = argument[3];
    global.cyberspearPieceSub[global.cyberspearPieceAmount] = argument[4]; // subimage is from s_relic01
    global.cyberspearPieceName[global.cyberspearPieceAmount] = argument[5];
    Cyberspear("position", argument[1], argument[2], argument[3]);
    global.cyberspearPieceXTotal[global.cyberspearPieceAmount] = pcx;
    global.cyberspearPieceYTotal[global.cyberspearPieceAmount] = pcy;
    global.cyberspearPieceAmount += 1;
}
else if (argument[0] == "draw debug")
{
    for (var i = 0; i < global.cyberspearRoomAmount; i += 1)
    {
        var wid = global.cyberspearRoomWidth[i] / 8;
        var hei = global.cyberspearRoomHeight[i] / 8;
        var lef = global.cyberspearRoomX[i] / 8;
        var top = 192 + (global.cyberspearRoomY[i] / 8);
        draw_sprite_ext(s1x1, 0, lef, top, wid, hei, 0, c_black, 1);
        draw_sprite_ext(s1x1, 0, lef + 1, top + 1, wid - 2, hei - 2, 0, c_white, 1);
        scr_font(global.fn_small, c_black);
        draw_text(lef + 2, top + 2, string_replace(global.cyberspearRoom[i], "r_wst_", ""));
    }
}
