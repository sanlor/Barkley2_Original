// Add, Type, Group, Material, Level
if (argument[0] == "group") // 1 = material
{
    var ind = ds_list_find_index(global.dslMaterialName, argument[1]);
    return global.dslMaterialGroup[| ind];
}
else if (argument[0] == "odds") // 1 = material
{
    var ind = ds_list_find_index(global.dslMaterialName, argument[1]);
    return global.dslMaterialOdds[| ind];
}
else if (argument[0] == "add")
{
    ds_list_add(global.dslMaterialGroup, argument[1]);
    ds_list_add(global.dslMaterialName, argument[2]);
    ds_list_add(global.dslMaterialOdds, argument[3]);
}
else if (argument[0] == "init")
{
    global.dslMaterialTimes = ds_list_create();
    ds_list_add(global.dslMaterialTimes, 11, 4, 12, 12, 12, 12, 12);
    global.dslMaterialGroups = ds_list_create();
    ds_list_add(global.dslMaterialGroups, "Generic");
    ds_list_add(global.dslMaterialGroups, "Synthetic");
    ds_list_add(global.dslMaterialGroups, "Bio");
    ds_list_add(global.dslMaterialGroups, "Cyber");
    ds_list_add(global.dslMaterialGroups, "Mental");
    ds_list_add(global.dslMaterialGroups, "Kosmic");
    ds_list_add(global.dslMaterialGroups, "Zauber");
    global.dslMaterialGroup = ds_list_create();
    global.dslMaterialName = ds_list_create();
    global.dslMaterialOdds = ds_list_create();
    Material("add", "Generic", "Soiled",    11);
    Material("add", "Generic", "Broken",    11);
    Material("add", "Generic", "Rusty",     11);
    Material("add", "Generic", "Junk",      11);
    Material("add", "Generic", "Aluminum",  10);
    Material("add", "Generic", "Aluminium", 10);
    Material("add", "Generic", "Titanium",  8);
    Material("add", "Generic", "Chrome",    8);
    Material("add", "Generic", "Iron",      8);
    Material("add", "Generic", "Cobalt",    7);
    Material("add", "Generic", "Steel",     5);
    
    Material("add", "Synthetic", "Candy",     0); // Generic? - Never
    Material("add", "Synthetic", "3D Printed", 0); // Never
    Material("add", "Synthetic", "Chobham", 0); // Never
    Material("add", "Synthetic", "Nanotube", 0); // Never
    Material("add", "Synthetic", "Untamonium", 0); // Never
    Material("add", "Synthetic", "Taxidermy", 0); // Bio - Never
    Material("add", "Synthetic", "Aerogel",    0); // Cyber - Never
    Material("add", "Synthetic", "Porcelain",  0); // Mental - Never
    Material("add", "Synthetic", "Anti-Matter",    0); // Kosmic - Never
    Material("add", "Synthetic", "Denim",        0); // Zauber - Never
    
    Material("add", "Bio", "Rotten",    28);
    Material("add", "Bio", "Carbon",    26);
    Material("add", "Bio", "Wood",      18);
    Material("add", "Bio", "Plantain",  12);
    Material("add", "Bio", "Grass",     7.5);
    Material("add", "Bio", "Soy",       6);
    Material("add", "Bio", "Silk",      1);
    Material("add", "Bio", "Rubber",    0.8);
    Material("add", "Bio", "Chitin",    0.5);
    Material("add", "Bio", "Fungus",    0.16);
    Material("add", "Bio", "Polenta",   0.03);
    Material("add", "Bio", "Yggdrasil", 0.01);
    
    Material("add", "Cyber", "Neon",       30);
    Material("add", "Cyber", "Plastic",    22);
    Material("add", "Cyber", "Dual",       20);
    Material("add", "Cyber", "Nickel",     9.5);
    Material("add", "Cyber", "Copper",     7.75);
    Material("add", "Cyber", "Fiberglass", 7.5);
    Material("add", "Cyber", "Adamantium", 1);
    Material("add", "Cyber", "Foil",       0.8);
    Material("add", "Cyber", "Tin",        0.8);
    Material("add", "Cyber", "Analog",     0.5);
    Material("add", "Cyber", "Digital",    0.1);
    Material("add", "Cyber", "Blaster",    0.05);
    
    Material("add", "Mental", "Glass",      28);
    Material("add", "Mental", "Leather",    21);
    Material("add", "Mental", "Studded",    17.54);
    Material("add", "Mental", "Bone",       16);
    Material("add", "Mental", "Orichalcum", 14);
    Material("add", "Mental", "Offal",      1.2);
    Material("add", "Mental", "Origami",    0.8);
    Material("add", "Mental", "Marble",     0.5);
    Material("add", "Mental", "Blood",      0.5);
    Material("add", "Mental", "Sinew",      0.4);
    Material("add", "Mental", "Brain",      0.05);
    Material("add", "Mental", "Pearl",      0.01);
    
    Material("add", "Kosmic", "Brass",          95);
    Material("add", "Kosmic", "Silver",         1.14);
    Material("add", "Kosmic", "Steel", 1);
    Material("add", "Kosmic", "Bronze",         0.5);
    Material("add", "Kosmic", "Tungsten",       0.5);
    Material("add", "Kosmic", "Itano",          0.5);
    Material("add", "Kosmic", "Platinum",       0.5);
    Material("add", "Kosmic", "Gold",           0.3);
    Material("add", "Kosmic", "Mercury",        0.3);
    Material("add", "Kosmic", "Lead",           0.2);
    Material("add", "Kosmic", "Diamond",        0.05);
    Material("add", "Kosmic", "Francium",       0.01);
    
    Material("add", "Zauber", "Mythril",      29);
    Material("add", "Zauber", "Salt",         20);
    Material("add", "Zauber", "Stone",        17);
    Material("add", "Zauber", "Frankincense", 16);
    Material("add", "Zauber", "Zinc",         15);
    Material("add", "Zauber", "Napalm",       1);
    Material("add", "Zauber", "Crystal",      0.8);
    Material("add", "Zauber", "Obsidian",     0.5);
    Material("add", "Zauber", "Myrrh",        0.3);
    Material("add", "Zauber", "Imaginary",    0.2);
    Material("add", "Zauber", "Pinata",       0.19);
    Material("add", "Zauber", "Orb",          0.01);
}
