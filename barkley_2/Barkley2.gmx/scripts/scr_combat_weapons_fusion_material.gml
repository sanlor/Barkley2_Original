/// scr_combat_weapons_fusion_material(material1,material2)
/// Return: String value of material
if (argument[0] != "init")
{
    var ind0, ind1, r0, c0, r1, c1, n0, n1, vvv2; //global.materialB
    var meanR, meanC, elecC, elecR, finalR, finalC;
    var electrons, didSelf;
    ind0 = ds_list_find_index(global.materialName, argument[0]);
    ind1 = ds_list_find_index(global.materialName, argument[1]);
    r0 = ds_list_find_value(global.materialRow, ind0);
    c0 = ds_list_find_value(global.materialCol, ind0);
    r1 = ds_list_find_value(global.materialRow, ind1);
    c1 = ds_list_find_value(global.materialCol, ind1);
    
    vvv2 = mean(global.materialBoxV[r0, c0], global.materialBoxV[r1, c1]);
    
    meanR = -1;
    meanC = -1;
    elecR = -1;
    elecC = -1;
    finalR = -1; 
    finalC = -1;
    didSelf = 0;
    
    //Check for same material merge
    if (r0 == r1 && c0 == c1)
    {
        finalR = r0;
        finalC = c0;
        didSelf = 1;
    }
    
    //Exceptions table
    if (finalR == -1)
    {
        n0 = global.materialBoxN[r0, c0];
        n1 = global.materialBoxN[r1, c1];
        for (i = 0; i < ds_list_size(global.materialExceptionA); i += 1)
        {
            v0 = ds_list_find_value(global.materialExceptionA, i);
            v1 = ds_list_find_value(global.materialExceptionB, i);
            if ((n0 == v0 && n1 == v1) || (n0 == v1 && n1 == v0))
            {
                v2 = ds_list_find_value(global.materialExceptionResult, i);
                ind = ds_list_find_index(global.materialName, v2);
                rowNew = ds_list_find_value(global.materialRow, ind);
                colNew = ds_list_find_value(global.materialCol, ind);
                elecR = rowNew; elecC = colNew;
                finalR = rowNew; finalC = colNew;
                didSelf = 1;
            }
        }
    }
    
    //Get mean value
    if (finalR == -1)
    {
        for (i = 0; i < ds_list_size(global.materialValue); i += 1)
        {
            int0 = ds_list_find_value(global.materialValue, i);
            if (vvv2 >= int0)
            {
                meanR = ds_list_find_value(global.materialRow, i);
                meanC = ds_list_find_value(global.materialCol, i);
            }
        }
        
        //If you have enough electrons, drop down
        if (meanR + 1 < 7)
        {
            if (global.materialBoxV[meanR + 1, meanC] != -999)
            {
                v = global.materialVolatility[meanR]; //volitility level
                electrons = global.materialBoxE[r0, c0] + global.materialBoxE[r1, c1];
                if ((electrons / v) != round(electrons / v))
                {
                    elecR = meanR + 1;
                    elecC = meanC;
                }
            }
        }
        
        if (elecR == -1) { finalR = meanR; finalC = meanC; }
        else { finalR = elecR; finalC = elecC; }
    }
    
    //If it's diatomic, go to heaviest non diatomic material that weighs less than the target
    if (didSelf == 0)
    {
        if (global.materialBoxDiatomic[finalR, finalC] == 1)
        {
            while (global.materialBoxDiatomic[finalR, finalC] == 1)
            {
                ind = ds_list_find_index(global.materialName, global.materialBoxN[finalR, finalC]);
                finalR = ds_list_find_value(global.materialRow, ind - 1);
                finalC = ds_list_find_value(global.materialCol, ind - 1);
            }
        }
    }
    
    return global.materialBoxN[finalR, finalC];
}
else //Run init ONCE before using this script
{
    var i, ind, nam, file, row, col, gridWidth, gridHeight;
    file = file_text_open_read(working_directory + "\materials.csv");
    file_text_readln(file);
    for (i = 0; i < 14; i += 1) //14 == 7
    {
        fileLine[i] = file_text_read_string(file);
        file_text_readln(file);
    }
    file_text_close(file);
    
    //Set volatility levels so electrons drop
    global.materialVolatility[0] = 2; //2
    global.materialVolatility[1] = 2; //2
    global.materialVolatility[2] = 3; //5
    global.materialVolatility[3] = 1; //1
    global.materialVolatility[4] = 1; //3
    global.materialVolatility[5] = 2; //2
    global.materialVolatility[6] = 1; //1
    
    //Init all then populate
    gridWidth = 18;
    gridHeight = 7;
    for (row = 0; row < gridHeight; row += 1)
    {
        for (col = 0; col < gridWidth; col += 1)
        {
            global.materialBoxV[row, col] = -999;
            global.materialBoxN[row, col] = "";
        }
    }
    
    //Loop through file list
    cou = 0;
    for (row = 0; row < gridHeight; row += 1)
    {
        scr_combat_weapons_fusion_delimit(fileLine[(row * 2)], ",");
        ind = 1;
        for (col = 0; col < gridWidth; col += 1)
        {
            if (art[ind + 1] != "")
            {
                global.materialBoxE[row, col] = real(art[ind + 0]); //electron
                global.materialBoxV[row, col] = real(art[ind + 1]);
                global.materialBoxD[row, col] = cou;
                global.materialBoxDiatomic[row, col] = 0;
                cou += 1;
            }
            ind += 2;
        }
        scr_combat_weapons_fusion_delimit(fileLine[(row * 2) + 1], ",");
        ind = 1;
        for (col = 0; col < gridWidth; col += 1)
        {
            if (art[ind + 0] != "")
            {
                global.materialBoxN[row, col] = art[ind + 0];
            }
            ind += 2;
        }
    }
    
    //Make lists so I can search by index
    global.materialName = ds_list_create(); //Name of material
    global.materialValue = ds_list_create(); //Atomic weight of material
    global.materialElectron = ds_list_create(); //Number of electron shells
    global.materialRow = ds_list_create(); //Row of material on table
    global.materialCol = ds_list_create(); //Column of material on table
    global.materialDiatomic = ds_list_create(); //diatomic
    for (row = 0; row < gridHeight; row += 1)
    {
        for (col = 0; col < gridWidth; col += 1)
        {
            if (global.materialBoxV[row, col] != -999)
            {
                ds_list_add(global.materialName, global.materialBoxN[row, col]);
                ds_list_add(global.materialValue, global.materialBoxV[row, col]);
                ds_list_add(global.materialElectron, global.materialBoxE[row, col]);
                ds_list_add(global.materialRow, row);
                ds_list_add(global.materialCol, col);
                ds_list_add(global.materialDiatomic, 0); //not diatomic by default
            }
        }
    }
    
    //Exceptions table - Add exceptions below
    global.materialExceptionA = ds_list_create();
    global.materialExceptionB = ds_list_create();
    global.materialExceptionResult = ds_list_create();
    //Studded Leather
    ds_list_add(global.materialExceptionA, "Studded"); ds_list_add(global.materialExceptionB, "Studded"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Soiled"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Broken"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Rusty"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Aluminum"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Aluminium"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Titanium"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Chrome"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Iron"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Cobalt"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Nickel"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Copper"); ds_list_add(global.materialExceptionResult, "Studded");
    ds_list_add(global.materialExceptionA, "Leather"); ds_list_add(global.materialExceptionB, "Zinc"); ds_list_add(global.materialExceptionResult, "Studded");
    //Other
    ds_list_add(global.materialExceptionA, "Carbon"); ds_list_add(global.materialExceptionB, "Nanotube"); ds_list_add(global.materialExceptionResult, "Damascus");
    ds_list_add(global.materialExceptionA, "Copper"); ds_list_add(global.materialExceptionB, "Zinc"); ds_list_add(global.materialExceptionResult, "Brass");
    ds_list_add(global.materialExceptionA, "Broken"); ds_list_add(global.materialExceptionB, "Junk"); ds_list_add(global.materialExceptionResult, "Mythril");
    
    //List of diatomic materials
    global.materialDiatomicList = ds_list_create();
    ds_list_add(global.materialDiatomicList, "Candy");
    ds_list_add(global.materialDiatomicList, "Mythril");
    ds_list_add(global.materialDiatomicList, "Rusty");
    ds_list_add(global.materialDiatomicList, "Junk");
    ds_list_add(global.materialDiatomicList, "Studded");
    ds_list_add(global.materialDiatomicList, "Brass");
    ds_list_add(global.materialDiatomicList, "Damascus");
    
    //Set all diatomic flags
    for (i = 0; i < ds_list_size(global.materialDiatomicList); i += 1)
    {
        nam = ds_list_find_value(global.materialDiatomicList, i);
        ind = ds_list_find_index(global.materialName, nam);
        ds_list_replace(global.materialDiatomic, ind, 1); //Set diatomic in list form
        row = ds_list_find_value(global.materialRow, ind);
        col = ds_list_find_value(global.materialCol, ind);
        global.materialBoxDiatomic[row, col] = 1;
    }
}
